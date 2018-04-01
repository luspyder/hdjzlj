<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>个人违章</title>
    <%@ include file="../common/taglibs.jsp" %>


    <script type="text/javascript">
        Date.prototype.format = function (format) {
            var args = {
                "M+": this.getMonth() + 1,
                "d+": this.getDate(),
                "h+": this.getHours(),
                "m+": this.getMinutes(),
                "s+": this.getSeconds(),
                "q+": Math.floor((this.getMonth() + 3) / 3), //quarter
                "S": this.getMilliseconds()
            };
            if (/(y+)/.test(format))
                format = format.replace(RegExp.$1, (this.getFullYear() + "")
                    .substr(4 - RegExp.$1.length));
            for (var i in args) {
                var n = args[i];
                if (new RegExp("(" + i + ")").test(format))
                    format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? n
                        : ("00" + n).substr(("" + n).length));
            }
            return format;
        };
        var grid;
        $(function () {
            loadDataGrid();
            $("#search_btn").click(function () {
                $('#listGrid').datagrid({
                    queryParams: {
                        carNumber: $('#s_carNumber').val(),
                        pecTimeStart: $('#s_pecTimeStart').val(),
                        pecTimeEend: $('#s_pecTimeEend').val(),
                        state: $("#s_state").combobox("getValue")
                    }
                });
                $('#gridForm').form('clear');
            });
        });

        /*加载数据*/
        function loadDataGrid() {
            grid = $('#listGrid')
                .datagrid(
                    {
                        url: '../peccancy/getAllPP.htmls',
                        rownumbers: true,
                        singleSelect: true,
                        multiSort: true,
                        fitColumns: false,
                        fit: true,
                        sortOrder: "desc",
                        sortName: "djTime", //初始化时按Id升序排序
                        pagination: true,
                        pageSize: 20,
                        pageList: [10, 20, 30, 50, 100],
                        loadMsg: '数据加载中,请稍后……',
                        columns: [[
                            {
                                field: 'state', title: '状态', align: 'center', width: 60,
                                formatter: function (val, row, index) {
                                    var s = "";
                                    if (val == "0") {
                                        s = "<div  style='background-color: red;text-align:center;margin:0px;padding:0px;color:#FFFFFF;'>未处理</div>";
                                    } else if (val == "1") {
                                        s = "<div  style='background-color:green;text-align:center;margin:0px;padding:0px;color:#FFFFFF;'>已处理</div>";
                                    }
                                    return s;
                                }
                            },
                            {field: 'selfNumber', title: '自编号', width: 70},
                            {field: 'carNumber', title: '车牌号'},
                            {field: 'behavior', title: '违章行为'},
                            {field: 'place', title: '违章地点'},
                            {field: 'pecType', title: '违章类型'},
                            {field: 'pecTime', title: '违章时间'},
                            {field: 'name', title: '登记人'},
                            {
                                field: '_operate', title: '操作 ', align: 'center', width: 90,
                                formatter: function (val, row, index) {
                                    return '<a href="#" onclick="feeOK(' + index + ')">处理</a>';
                                }
                            }]],
//                        toolbar: [{
//                            text: '违章登记',
//                            iconCls: 'icon-add',
//                            handler: function () {
//                                openWin();
//                            }
//                        }],
                        onLoadSuccess: function () {
                            grid.datagrid('clearSelections');
                        },
                    });
            // 设置分页控件
            grid.datagrid('getPager').pagination({
                beforePageText: '第',// 页数文本框前显示的汉字
                afterPageText: '页    共 {pages} 页',
                displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
            });
        }
        function feeOK(index) {
            var row = grid.datagrid('getData').rows[index];
            if (row.state == '1') {
                $.messager.alert('信息提示', '该项违章经处理！', 'info');
                return;
            }

            if (row) {
                var data = {
                    id: row.id,
                    state: '1'
                };
                $.ajax({
                    type: "POST",
                    url: "../peccancy/PPHandle.htmls",
                    data: data,
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        if (data.success) {
                            $.messager.alert('信息提示', '处理成功！', 'info');
                            grid.datagrid('load');
                        }
                    }
                });
            }
        }
        /*弹出窗口*/
        function openWin() {
            SL.showWindow({
                title: '违章信息登记',
                width: 520,
                height: 310,
                url: 'personalAdd.jsp',
                onLoad: function () {
                    $('#carNumber').combobox({
                        url: '../vehicle/getAll.htmls',
                        valueField: 'carName',
                        textField: 'carName',
                        onSelect: function (rec) {
                            $("#h_carId").val(rec.id);
                            $("#h_selfNumber").val(rec.selfNumber);

                        }
                    });
                    $("#environment_endtime").val(new Date().format("yyyy-MM-dd hh:mm:ss"));
                    $('#qydwBox').combobox({
                        url: '../group/list.htmls',
                        valueField: 'id',
                        textField: 'name',
                        onSelect: function (record) {

                            $('#carNumber').combobox({
                                url: '../vehicle/getAllGps.htmls',
                                queryParams: {
                                    cid: record.id
                                },
                                valueField: 'carName',
                                textField: 'carName',
                                onSelect: function (rec) {
                                    $("#h_carId").val(rec.id);
                                    $("#h_selfNumber").val(rec.selfNumber);

                                }
                            });
                        }
                    });
                },
                buttons: [{
                    text: '确定',
                    iconCls: 'icon-ok',
                    handler: saveData
                }, {
                    text: '取消',
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
                $.ajax({
                    type: "POST",
                    url: "../peccancy/savePPersonal.htmls",
                    data: data,
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        if (data.success) {
                            SL.closeWindow();
                            $.messager.alert('信息提示', '登记成功！', 'info');
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
            <label>状态：</label><select id="s_stata" class="easyui-combobox" name="dept" style="width: 200px;">
            <option value="" selected="selected">请选择</option>
            <option value="1">已处理</option>
            <option value="0">未处理</option>
        </select>
            <label>车牌号：</label><input id="s_carNumber" class="easyui-textbox" style="width:200px">
            <label>违章时间：</label><input id="s_pecTimeStart" class="Wdate" type="text"
                                       onFocus="WdatePicker({isShowClear:false,readOnly:true})"/> -
            <input id="s_pecTimeEend" class="Wdate" type="text"
                   onFocus="WdatePicker({isShowClear:false,readOnly:true})"/>
            <a id="search_btn" href="#" class="easyui-linkbutton" iconCls="icon-search">检索</a>
        </form>
    </div>
    <div class="wu-toolbar-search">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin()" plain="true">违章登记</a>
    </div>

</div>
<!-- End of toolbar -->
<table id="listGrid" class="easyui-datagrid" toolbar="#grid-toolbar"></table>

</body>
</html>