<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>单位违章</title>
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
                    // 				url : '../../devices/list',
                    queryParams: {
                        gcName: $('#s_gcName').val(),
                        feeEntryTime: $('#s_feeEntryTime').val(),
                        feeEntryTime1: $('#s_feeEntryTime1').val(),
                        regNumber: $('#s_regNumber').val(),
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
                                url: '../qyz/list.htmls',
                                fit: true,
                                height: 390,
                                nowrap: true, // false:折行
                                rownumbers: true, // 行号
                                striped: true, // 隔行变色
                                singleSelect: true,// 是否单选
                                sortOrder: "desc",
                                sortName: "entryTime", //初始化时按Id升序排序
                                pagination: true,
                                pageSize: 20,
                                pageList: [10, 20, 30, 50, 100],
                                loadMsg: '数据加载中,请稍后……',
                                columns: [[
                                    {
                                        field: 'state',
                                        title: '收费状态',
                                        align: 'center',
                                        formatter: function (value, row) {
                                            var s = "";
                                            if (value == "0") {
                                                s = "<div  style='background-color:#999999;text-align:center;margin:0px;padding:0px;color:#FFFFFF;'>待缴费</div>";
                                            } else if (value == "1") {
                                                s = "<div  style='background-color:green;text-align:center;margin:0px;padding:0px;color:#FFFFFF;'>已缴费</div>";
                                            }
                                            return s;
                                        }
                                    },
                                    {
                                        field: 'regNumber',
                                        title: '收费单号',
                                        sortable: true,
                                        order: 'desc'
                                    },
                                    {
                                        field: 'gcType',
                                        title: '工程类型',
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
                                        field: 'gcName',
                                        title: '工程名称'
                                    },
                                    {
                                        field: 'jsUnit',
                                        title: '建设单位'
                                    },
                                    {
                                        field: 'site',
                                        title: '施工地点'
                                    },
                                    {
                                        field: 'flat',
                                        title: '层数/造价',
                                        width: 70,
                                        align: 'right'
                                    },
                                    {
                                        field: 'tonnage',
                                        title: '吨数',
                                        width: 50,
                                        align: 'right'

                                    },
                                    {
                                        field: 'price',
                                        title: '处置费',
                                        width: 70,
                                        align: 'right',
                                        styler: function (value, row, index) {
                                            return 'color:red;';
                                        }
                                    },
                                    {
                                        field: 'manager',
                                        title: '登记人'
                                    },
                                    {
                                        field: 'entryTime',
                                        title: '登记时间'
                                    },
                                    {
                                        field: 'feeManager',
                                        title: '收费审核人'
                                    },
                                    {
                                        field: 'feeEntryTime',
                                        title: '收费时间',
                                        sortable: true,
                                        order: 'desc'
                                    },
                                    {
                                        field: '_operate',
                                        title: '收费审核 ',
                                        align: 'center',
                                        width: 90,
                                        formatter: function (val, row, index) {
                                            return '<a class="editcls" href="#" onclick="feeOK('
                                                    + index + ')">审核</a>';
                                        }
                                    }]],
                                onLoadSuccess: function () {
                                    $('.editcls').linkbutton({
                                        text: '审核',
                                        plain: true,
                                        iconCls: 'icon-edit'
                                    });
                                    grid.datagrid('clearSelections');
                                    $(this).datagrid("fixRownumber");
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
                alert("该项目已经缴费。");
                return;
            }
            if (row) {
                SL.showWindow({
                    title: '工程信息登记',
                    // 			iconCls : 'icon-add',
                    width: 520,
                    height: 410,
                    top: 40,
                    left: 150,
                    url: 'audit.jsp',
                    onLoad: function () {

                        $('#sfdjForm').form('load', row);
                        $("#pop_feeEntryTime").val(
                                new Date().format("yyyy-MM-dd hh:mm:ss"));
                        $("#pop_feeManager").val($("#pop_uname").val());

                    },
                    buttons: [{
                        text: '收费',
                        handler: function () {
                            postFeeOK(row.id, 1);
                        }
                    }, {
                        text: '关闭',
                        handler: function () {
                            SL.closeWindow();
                        }
                    }]
                });
            }
        }
        /*弹出窗口*/
        function openWin() {
            SL.showWindow({
                title: '工程信息登记',
                // 			iconCls : 'icon-add',
                width: 520,
                height: 410,
                top: 40,
                left: 150,
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
                        "onChange": function () {
                            var fee = $("#feeInput").val();
                            var feeType = $("input[name='feeType'][checked]").val();
                            var tonnage = $('#tonnageInput').numberbox('getValue');
                            $("#priceInput").val(fee * feeType * tonnage);
                        }
                    });
                    $("input:radio[name='feeType']").click(function () {
                        var tonnage = $('#tonnageInput').numberbox('getValue');
                        if (tonnage.length > 0) {
                            var fee = $("#feeInput").val();
                            var feeType = $(this).val();
                            $("#priceInput").val(fee * feeType * tonnage);
                        }
                    });
                    $("#environment_endtime").val(
                            new Date().format("yyyy-MM-dd hh:mm:ss"));
                },
                buttons: [{
                    text: '确定',
                    iconCls: 'icon-add',
                    handler: function () {
                        saveData();
                    }
                }, {
                    text: '关闭',
                    handler: function () {
                        SL.closeWindow();
                    }
                }]
            });
        }
        function saveData() {

            if ($("#sfdjForm").form('enableValidation').form('validate')) {
                top.$(".loading_area").fadeIn();
                var data = $('#sfdjForm').serialize();
                $.ajax({
                    type: "POST",
                    url: "../qyz/save.htmls",
                    data: data,
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        if (data.success) {
                            top.$(".loading_area").fadeOut(1000);
                            SL.closeWindow();
                            alert("登记成功，等待审核。");
                            grid.datagrid('load');
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        top.$(".loading_area").fadeOut(1000);
                    }
                });
            }
        }
        function postFeeOK(id, state) {
            top.$(".loading_area").fadeIn();
            $.ajax({
                type: "POST",
                url: "../qyz/feeOK.htmls",
                data: {
                    id: id,
                    state: state,
                    feeEntryTime: $("#pop_feeEntryTime").val(),
                    feeManager: $("#pop_feeManager").val()
                },
                dataType: "json",
                async: false,
                success: function (data) {
                    if (data.success) {
                        top.$(".loading_area").fadeOut(1000);
                        SL.closeWindow();
                        alert("操作成功。");
                        grid.datagrid('load');
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    top.$(".loading_area").fadeOut(1000);
                }
            });
        }
    </script>
</head>
<body class="easyui-layout" data-options="fit:true">
<div id="grid-toolbar">
    <form id="gridForm">
            <div class="wu-toolbar-search">
                <label>工程名称：</label> <input id="s_gcName" class="easyui-textbox" style="width:150px"/>
                <label>收费单号：</label> <input id="s_regNumber" class="easyui-textbox" style="width:150px"/>
                <label>违章时间：</label><input id="s_feeEntryTime" class="Wdate"
                                           onFocus="WdatePicker({isShowClear:false,readOnly:true})"/>
                - <input id="s_feeEntryTime1" class="Wdate" onFocus="WdatePicker({isShowClear:false,readOnly:true})"/>
                <label>是否处理：</label><select id="s_state" class="easyui-combobox" style="width:150px;">
                <option value=""></option>
                <option value="0">待处理</option>
                <option value="1">已处理</option>
            </select>
                <a id="search_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">检索</a>
            </div>
            <div class="wu-toolbar-search">
                <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin()" plain="true">违章登记</a>
            </div>
    </form>
</div>
<!-- End of toolbar -->
<table id="listGrid" class="easyui-datagrid" toolbar="#grid-toolbar"></table>

</body>
</html>