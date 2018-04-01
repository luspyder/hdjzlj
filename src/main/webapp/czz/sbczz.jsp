<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=8">
    <title>工程登记</title>
    <%@ include file="../common/taglibs.jsp" %>
    <script src="../js/LodopFuncs.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/DateUtil.js" type="text/javascript"></script>
    <style type="text/css">

        .table {
            clear: both;
            margin: 10px auto 5px auto;
            width: 100%;
            border: 1px solid #d6d6d6;
            border-collapse: collapse;

        }

        .table th {
            text-align: left;
            border-top: 1px solid #dfdfdf;
            padding: 2px;
            background: #f1f1f1;
            padding-left: 15px;
        }

        .table td {
            border: 1px solid #dfdfdf;
            padding: 2px;
            padding-left: 15px;
            /*background:#fff;*/
        }
    </style>
    <script type="text/javascript">
        var grid;
        $(function () {
            loadDataGrid();
            $("#search_btn").click(function () {
                $('#listGrid').datagrid({
                    queryParams: {
                        state: '1',
                        gcName: $('#s_gcName').val(),
                        feeEntryTime: $('#s_feeEntryTime').val(),
                        feeEntryTime1: $('#s_feeEntryTime1').val(),
                        jsUnit: $('#s_jsUnit').val(),
                        zNumber: $("#s_theNo").val(),
                        handle: $("#s_state").combobox("getValue")
                    }
                });
                $('#gridForm').form('clear');
            });
        });
        /*加载数据*/
        function loadDataGrid() {
            grid = $('#listGrid').datagrid({
                url: '../qyz/list.htmls',
                queryParams: {state: '1'},
                sortOrder: "desc",
                sortName: "feeEntryTime", //初始化时按Id升序排序
                nowrap: true,
                rownumbers: true,
                singleSelect: true,
                pagination: true,
                multiSort: true,
                fitColumns: false,
                fit: true,
                pagination: true,
                pageSize: 20,
                pageList: [10, 20, 30, 50, 100],
                loadMsg: '数据加载中,请稍后……',
                frozenColumns: [[
                    {
                        field: '_ope22', title: '打印', width: 120,align: 'center',
                        formatter: function (val, row, index) {
                            var btn = '<a href="#" onclick="printCzzWin(' + index + ')">处置证</a>';
                            btn += ' | <a href="#" onclick="printSBBWin(' + index + ')">申报表</a>';
                            return btn;
                        }
                    }
                ]],
//                frozenColumns:[{
//                    field: '_ope', title: '打印', width: 130, align: 'center',
//                    formatter: function (val, row, index) {
//                        var btn = '<a href="#" onclick="printCzzWin(' + index + ')">处置证</a>';
//                        btn += ' | <a href="#" onclick="printSBBWin(' + index + ')">申报表</a>';
//                        return btn;
//                    }
//                }],
                columns: [[{
                    field: 'handle', title: '办理状态', align: 'center',
                    formatter: function (value, row, index) {

                        if (value == "0") {
                            return '<a class="handleChenkBtn" href="#" onclick="handleWin(' + index + ')">办理</a>';
                        } else if (value == "1") {
                            return "<div  style='background-color:green;text-align:center;margin:0px;padding:0px;color:#FFFFFF;'>已办理</div>";
                        }
                    }
                },
                    {field: 'regNumber', title: '收费单号'},
                    {
                        field: 'gcType', title: '工程类型', align: 'center',
                        formatter: function (value, row, index) {
                            if (row.cqtype != null
                                && row.cqtype != ""
                                && row.cqtype != "null") {
                                return row.gcType + "-"
                                    + row.cqtype;
                            } else {
                                return row.gcType
                            }

                        }
                    },
                    {field: 'gcName', title: '工程名称'},
                    {field: 'jsUnit', title: '建设单位'},
                    {field: 'site', title: '施工地点'},
                    {field: 'tonnage', title: '吨数', width: 70, align: 'right'},
                    {
                        field: 'price', title: '处置费', width: 70, align: 'right',
                        styler: function (value, row, index) {
                            return 'color:red;';
                        },
                        formatter: function (val, row, index) {
                            return '&yen; ' + row.price;
                        }
                    },
                    {field: 'feeManager', title: '收费审核人'},
                    {field: 'feeEntryTime', title: '收费时间'},
                    {field: 'hdManager', title: '办理人', sortable: true, order: 'desc'},
                    {field: 'hdEntryTime', title: '办理时间', sortable: true, order: 'desc'},
                    {field: 'zNumber', title: '字号'},
                    {
                        field: '_operate', title: '操作', width: 70, align: 'center',
                        formatter: function (val, row, index) {
                            return '<a class="searchcls" href="#" onclick="oppenInfo(' + index + ')">详细</a>';
                        }
                    }]],
                onDblClickRow: function (rowIndex, rowData) {
                    oppenInfo(rowIndex);
                },
                onLoadSuccess: function () {
                    $('.handleChenkBtn').linkbutton({text: '办理', plain: true, iconCls: 'icon-edit'});
                    $('.searchcls').linkbutton({text: '查看', plain: true, iconCls: 'icon-search'});
                    grid.datagrid('fixRowHeight');
                },
            });
            // 设置分页控件
            grid.datagrid('getPager').pagination({
                beforePageText: '第',
                // 页数文本框前显示的汉字
                afterPageText: '页    共 {pages} 页',
                displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
            });
        }
        //弹出处置证详细信息窗口
        function oppenInfo(index) {
            var row = grid.datagrid('getData').rows[index];
// 		loadCzz(row.id);
            if (row) {
                SL.showWindow({
                    title: '建筑垃圾处置证',
                    width: 520,
                    height: 410,
                    top: 40,
                    url: 'sbczzInfo.jsp',
                    onLoad: function () {
                        $('#czzPostForm').form('load', row);
                        if (row.handle == 0) {
                            $('#print_btnview').hide();
                        }
                    },
                    buttons: [{
//                        text: '打印',
//                        iconCls: 'icon-print',
//                        handler: printCzz
//                    }, {
                        text: '关闭',
                        iconCls: 'icon-cancel',
                        handler: function () {
                            SL.closeWindow();
                        }
                    }]
                });
            }
        }
        function printCzzWin(index) {
            var row = grid.datagrid('getData').rows[index];
            window.open("czzPrint.jsp?id=" + row.id);
        }
        function printSBBWin(index) {
            var row = grid.datagrid('getData').rows[index];
            window.open("sbb.jsp?id=" + row.id);
        }


        function printCzz() {
            window.open("czzPrint.jsp?id=" + $("#fid").val());
        }
        function printSBB() {
            window.open("sbb.jsp?id=" + $("#fid").val());
        }
        function toHendl(t) {
            switch (t) {
                case 1:
                    $("#spyj")
                        .html(
                            "<b>同意全部外运，必须保证工地出入口防污地排及冲洗设施有效，不污染城市道路；按指定时间、路线、方式行驶和倾倒。否则，按照有关规定予以处罚。</b>");
                    break;
                case 2:
                    $("#spyj")
                        .html(
                            "<b>同意全部原地堆放,但必须采取苫盖防尘措施，不得私自外运，回填时通知我处管理人员现场勘查。否则，按照有关规定予以处罚。</b>");
                    break;
                case 3:
                    $("#spyj")
                        .html(
                            "<b>同意建设（施工）单位意见，中转（施工）建筑必须采取苫盖防尘措施，回填时通知我处管理人员现场勘查。否则，按照有关规定予以处罚。</b>");
                    break;
                case 4:
                    $("#spyj")
                        .html(
                            "<b>同意建设（施工）单位意见,外运建筑垃圾，必须保证工地出入口防污地排及冲洗设施有效，不污染城市道路；堆放建筑垃圾必须采取苫盖防尘措施，回填时通知我处管理人员现场勘查。否则，按照有关规定予以处罚。</b>");
                    break;
                case 5:
                    $("#spyj")
                        .html(
                            "<b>同意建设（施工）单位意见,外运建筑垃圾，必须保证工地出入口防污地排及冲洗设施有效，不污染城市道路；中转（内倒）后必须采取有效措施，不得扬尘，防止污染城市环境，回填时通知我处管理人员现场勘查。否则，按照有关规定予以处罚。</b>");
                    break;
            }
        }
        //办理处置证窗口
        function handleWin(index) {
            var row = grid.datagrid('getData').rows[index];
            if (row.handle == "0") {
                SL.showWindow({
                    title: '建筑垃圾处置证',
                    width: 520,
                    height: 410,
                    top: 40,
                    url: 'sbczzAdd.jsp',
                    onLoad: function () {
                        $('#czzPostForm').form('load', row);

                        $('#czArea').textbox('setValue', "建筑垃圾处置场");
                        $("#pop_hdEntryTime").val(new Date().format("yyyy-MM-dd hh:mm:ss"));
                        $("#pop_hdManager").textbox('setValue', $("#pop_uname").val());
                    },
                    buttons: [{
                        text: '确定',
                        iconCls: 'icon-ok',
                        handler: toHandle
                    }, {
                        text: '关闭',
                        iconCls: 'icon-cancel',
                        handler: function () {
                            SL.closeWindow();
                        }
                    }]
                });
            } else {
                $.messager.alert('信息提示', '项目已经办理成功！', 'info');
            }
        }
        //确定办理
        function toHandle() {
            var formData = {
                id: $("#fid").val(),
                handle: 1,
                hdManager: $("#pop_hdManager").textbox('getValue'),
                hdEntryTime: $("#pop_hdEntryTime").val(),
                czArea: $("#czArea").textbox('getValue'),
                jsContact: $("#jsContact").textbox('getValue'),
                jsTelephone: $("#jsTelephone").textbox('getValue'),
                sgContact: $("#sgContact").textbox('getValue'),
                sgTelephone: $("#sgTelephone").textbox('getValue')
            }
            $.ajax({
                type: "POST",
                url: "../qyz/handle.htmls",
                data: formData,
                dataType: "json",
                async: false,
                success: function (data) {
                    if (data.success) {
                        $.messager.alert('信息提示', '项目办理成功！', 'info');
                        SL.closeWindow();
                        grid.datagrid('load');
                    }
                }
            });
        }
        var LODOP; //声明为全局变量
        function CreateOneFormPage(p) {
            if (p == 1) {
                $("#right_Text").innerHTML("第一联<br><br><br><br>管理部门存留");
            } else if (p == 2) {
                $("#right_Text").html("第二联<br><br><br><br>管理部门存留");
            } else if (p == 3) {
                $("#right_Text").innerHTML("第三联<br><br><br><br>管理部门存留");
            }
            LODOP = getLodop();
            var strBodyStyle = "<style>"
                + document.getElementById("style1").innerHTML + "</style>";
            var strFormHtml = strBodyStyle + "<body>"
                + document.getElementById("print_div").innerHTML + "</body>";
            LODOP.ADD_PRINT_HTM(0, 0, "100%", "100%", strFormHtml);
            LODOP.PREVIEW();
            SL.closeWindow();
        }
        function saveData() {
            if ($("#czzPostForm").form('enableValidation').form('validate')) {
                var data = $('#czzPostForm').serialize();
                $.ajax({
                    type: "POST",
                    url: "../qyz/save.htmls",
                    data: data,
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        if (data.success) {
                            SL.closeWindow();
                            grid.datagrid('load');
                        }
                    }
                });
            }
        }
    </script>
</head>
<body class="easyui-layout" data-options="fit:true">
<div id="grid-toolbar">
    <div class="wu-toolbar-button">
        <form id="gridForm">
            <label>工程名称：</label><input id="s_gcName" class="easyui-textbox" style="width:150px">
            <label>字&nbsp;&nbsp;号：</label><input id="s_theNo" class="easyui-textbox" style="width:150px">
            <label>收费时间：</label><input id="s_feeEntryTime" class="Wdate" type="text"
                                       onFocus="WdatePicker({isShowClear:false,readOnly:true})"/>
            - <input id="s_feeEntryTime1" class="Wdate" type="text"
                     onFocus="WdatePicker({isShowClear:false,readOnly:true})"/>
            <label>建设单位：</label><input id="s_jsUnit" type="text" class="easyui-textbox" style="width:150px"/>
            <label>缴费状态：</label><select id="s_state" class="easyui-combobox" style="width: 100px;">
            <option value=""></option>
            <option value="0">待办理</option>
            <option value="1">已办理</option>
        </select>
            <a id="search_btn" href="#" class="easyui-linkbutton" iconCls="icon-search">检索</a>
        </form>
    </div>
</div>
<!-- End of toolbar -->
<table id="listGrid" class="easyui-datagrid" toolbar="#grid-toolbar"></table>
</body>
</html>