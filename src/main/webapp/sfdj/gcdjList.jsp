<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>收费处理</title>
    <%@ include file="../common/taglibs.jsp" %>
    <script language="javascript" src="../js/LodopFuncs.js"></script>


    <script type="text/javascript">
        var grid;
        $(function () {
            loadDataGrid();
            $("#search_btn").click(function () {
                $('#listGrid').datagrid({
                    queryParams: {
                        gcName: $('#s_gcName').textbox('getValue'),
                        feeEntryTime: $('#s_feeEntryTime').val(),
                        feeEntryTime1: $('#s_feeEntryTime1').val(),
                        regNumber: $('#s_regNumber').textbox('getValue'),
                        state: $("#s_state").combobox("getValue")
                    }
                });
                $('#gridForm').form('clear');
            });
        });

        /*加载数据*/
        function loadDataGrid() {
            grid = $('#listGrid').datagrid({
                url: '../qyz/list.htmls',
                sortOrder: "desc",
                sortName: "entryTime", //初始化时按Id升序排序
                rownumbers: true,
                singleSelect: true,
                pagination: true,
                multiSort: true,
                fitColumns: true,
                fit: true,
                pagination: true,
                pageSize: 20,
                pageList: [10, 20, 30, 50, 100],
                loadMsg: '数据加载中,请稍后……',
                columns: [[{
                    field: 'state', title: '收费状态', align: 'center',
                    formatter: function (val, row, index) {
                        var s = "";
                        if (val == "0") {
                            s = "<div  style='background-color: red;text-align:center;margin:0px;padding:0px;color:#FFFFFF;'>待缴费</div>";
                        } else if (val == "1") {
                            s = "<div  style='background-color:green;text-align:center;margin:0px;padding:0px;color:#FFFFFF;'>已缴费</div>";
                        }
                        return s;
                    }
                },
                    {field: 'regNumber', title: '收费单号', sortable: true, order: 'desc'},
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
                    {
                        field: 'gcName', title: '工程名称',
                        formatter: function (val, row, index) {
                            if (row.photo != null && row.photo.length > 0) {
                                return  "<a  href=\"javascript:void(0)\"  onclick=\"javaScript:showImg('" + index + "');\">" + val + "</a>";
                            }
                            return val;
                        }
                    },
                    {field: 'jsUnit', title: '建设单位'},
                    {field: 'site', title: '施工地点'},
                    {field: 'tonnage', title: '吨数', width: 50, align: 'right'},
                    {
                        field: 'price', title: '处置费', width: 70, align: 'right',
                        styler: function (value, row, index) {
                            return 'color:red;';
                        },
                        formatter: function (val, row, index) {
                            return '&yen; ' + row.price;
                        }
                    },
                    {field: 'manager', title: '登记人'},
                    {field: 'entryTime', title: '登记时间'}]],
                onLoadSuccess:function(data){
                    $('.searchcls').linkbutton({text:'查看',plain:true,iconCls:'icon-search'});
                    grid.datagrid('fixRowHeight');
                }
            });
            // 设置分页控件
            grid.datagrid('getPager').pagination({
                beforePageText: '第',// 页数文本框前显示的汉字
                afterPageText: '页    共 {pages} 页',
                displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
            });
        }
        //打开施工地图
        function showImg(index) {
            var data = grid.datagrid('getData').rows[index];
            if (data == null) {
                return;
            }
            var newwin = window.open()
            newwin.document.write("<img src=../download/qyzsgy/" + data.photo + " width=\"1024px\"/>")

        }
        //弹出窗口
        function openWin() {
            SL.showWindow({
                title: '工程信息登记',
                width: 520,
                height: 410,
                url: 'register.jsp',
                onLoad: function () {
                    $("#cqtype").attr("disabled", "disabled");
                    $(":radio[name='gcType']").click(function () {
                        switch ($(":radio[name='gcType']:checked").attr("id")) {
                            case "gctype1":
                                $("#cqtype").attr("disabled", "disabled");
                                break;
                            case "gctype2":
                                $("#cqtype").attr("disabled", "disabled");
                                break;
                            case "gctype3":
                                $("#cqtype").removeAttr("disabled");
                                break;
                        }
                    });
                    //处置费=收费标准x吨数x优惠政策
                    $("#tonnageInput").numberbox({
                        "onChange": function (newValue, oldValue) {
                            var fee = $("#feeInput").textbox('getValue');
                            var feeType = $("input[name='feeType'][checked]").val();
                            var tonnage = $('#tonnageInput').numberbox('getValue');
                            $("#priceInput").textbox('setValue', fee * feeType * tonnage);
                        }
                    });
                    $("input:radio[name='feeType']").click(function () {
                        $("input[name='feeType']").removeAttr('checked');
                        $(this).attr("checked", 'checked');
                        var tonnage = $('#tonnageInput').numberbox('getValue');
                        if (tonnage.length > 0) {
                            var fee = $("#feeInput").textbox('getValue');
                            var feeType = $(this).val();
                            $("#priceInput").textbox('setValue', fee * feeType * tonnage);
                        }
                    });
                    $("#environment_endtime").val(new Date().format("yyyy-MM-dd hh:mm:ss"));
                    //加载建设单位
                    $('#t_jsUnit').combobox({
                        url: '../dep/queryList.htmls?type=2',
                        valueField: 'd_name',
                        textField: 'd_name',
                        required: true,
                        onSelect: function (rec) {
                            $("#jsContact").val(rec.d_fuzeren);
                            $("#jsTelephone").val(rec.d_tel);
                        }
                    });
                    //加载施工单位
                    $('#t_sgUnit').combobox({
                        url: '../dep/queryList.htmls?type=1',
                        valueField: 'd_name',
                        textField: 'd_name'
                    });
                },
                buttons: [{
                    text: '确定',
                    iconCls: 'icon-ok',
                    handler: saveData
                }, {
                    text: '关闭',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        SL.closeWindow();
                    }
                }]
            });
        }
        function saveData() {

            if ($("#sfdjForm").form('enableValidation').form('validate')) {
                var data = $('#sfdjForm').serialize();
                $('#sfdjForm').ajaxSubmit({
                    type: "POST",
                    url: "../qyz/save.htmls",
                    data: data,
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        if (data.success) {
                            $.messager.alert('信息提示', '提交成功！', 'info');
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
            <label>收费单号：</label><input id="s_regNumber" class="easyui-textbox" style="width:150px">
            <label>收费时间：</label><input id="s_feeEntryTime" class="Wdate" type="text"
                                       onFocus="WdatePicker({isShowClear:false,readOnly:true})"/>
            - <input id="s_feeEntryTime1" class="Wdate" type="text"
                     onFocus="WdatePicker({isShowClear:false,readOnly:true})"/>
            <label>缴费状态：</label><select id="s_state" class="easyui-combobox" style="width: 100px;">
            <option value=""></option>
            <option value="0">待缴费</option>
            <option value="1">已缴费</option>
        </select>
            <a id="search_btn" href="#" class="easyui-linkbutton" iconCls="icon-search">检索</a>
        </form>
    </div>
    <div class="wu-toolbar-search">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin()" plain="true">工程登记</a>
    </div>
</div>
<!-- End of toolbar -->
<table id="listGrid" class="easyui-datagrid" toolbar="#grid-toolbar"></table>

</body>
</html>

