<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>工程登记</title>
    <%@ include file="../common/taglibs.jsp" %>
    <script type="text/javascript">
        var grid;
        $(function () {
            loadDataGrid();
            $("#search_btn").click(function () {
                $('#listGrid').datagrid({
                    queryParams: {
                        gcName: $('#s_gcName').val(),
                        apEntryTime: $('#s_apEntryTime').val(),
                        apEntryTime1: $('#s_apEntryTime1').val(),
                        jsUnit: $('#s_jsUnit').val(),
                        groupName: $("#s_groupName").val(),
                        zNumber: $("#s_zNumber").val()
                    }
                });
                $('#gridForm').form('clear');
            });
        });

        /*加载数据*/
        function loadDataGrid() {
            grid = $('#listGrid').datagrid({
                url: '../qyz/list.htmls',
                queryParams: {handle: '1', state: '1'},
                nowrap: true,
                rownumbers: true,
                singleSelect: true,
                pagination: true,
                multiSort: true,
                fitColumns: false,
                fit: true,
                sortOrder: "desc",
                sortName: "hdEntryTime",
                pagination: true,
                pageSize: 20,
                pageList: [10, 20, 30, 50, 100],
                loadMsg: '数据加载中,请稍后……',
                columns: [[
                    {
                        field: 'approved', title: '核准', width: 60, align: 'center',
                        formatter: function (value, row, index) {
                            var s = "";
                            if (value == "0") {
                                return '<a class="approvedChenkBtn" href="#" onclick="approvedOK(' + index + ')">核准</a>';
                            } else if (value == "1") {
                                return "<div  style='background-color:green;text-align:center;margin:0px;padding:0px;color:#FFFFFF;'>已核准</div>";
                            }
                        }
                    },
                    {
                        field: '_operate', title: '申报表', align: 'center', width: 90,
                        formatter: function (val, row, index) {
                            return '<a class="searchcls" href="#"  onclick="printView(' + index + ')">打印</a>';
                        }
                    },
                    {field: 'zNumber', title: '字号'},
                    {
                        field: 'gcType', title: '工程类型',
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
                    {field: 'hdEntryTime', title: '办理时间'},
                    {field: 'groupName', title: '清运单位'}]],
                onDblClickRow: function (rowIndex, rowData) {
//                    oppenInfo(rowIndex);
                },
                onLoadSuccess: function () {
                    $('.approvedChenkBtn').linkbutton({text: '核准', plain: true, iconCls: 'icon-edit'});
                    $('.searchcls').linkbutton({text: '打印', plain: true, iconCls: 'icon-print'});

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
        function printView(index) {
            var row = grid.datagrid('getData').rows[index];
            if (row.approved == "0") {
                $.messager.alert('信息提示', '该项目未经核准，请选重新选择。', 'info');
                return;
            }
            window.open("sbb2Print.jsp?id=" + row.id);
        }

        //弹出处置证详细信息窗口
        function oppenInfo(index) {
            var row = grid.datagrid('getData').rows[index];
            if (row) {
                SL.showWindow({
                    title: '建筑垃圾处置证',
                    width: 820,
                    height: 490,
                    top: 4,
                    url: 'qysbInfo.jsp',
                    onLoad: function () {
                        $('#P_jsUnit').html(row.jsUnit);
                        $('#P_gcName').html(row.gcName);
                        $('#P_site').html(row.site);
                        $('#P_sgUnit').html(row.sgUnit);
                        $('#P_cqtype').html(row.gcType);
                        $('#P_tonnage').html(row.tonnage);
                    },
                });
            }
        }
        //办理处置证
        function approvedOK(index) {
            var row = grid.datagrid('getData').rows[index];
            if (row.approved == 1) {
                $.messager.alert('信息提示', '该工程已经核准，请选重新选择。', 'info');
                return;
            }
            if (row) {
                SL.showWindow({
                    title: '建筑垃圾处置证',
                    width: 600,
                    height: 400,
                    top:40,
                    url: 'qysb.jsp',
                    onLoad: function () {
                        //这是判断复选框是否被选中,选中传1,没被选中传0
                        $('#promiseValue').click(function () {
                            if ($(this).is(':checked')) {
                                $(this).val('1');
                            } else {
                                $(this).val('0');
                            }

                        });
                        $('#polluteValue').click(function () {
                            if ($(this).is(':checked')) {
                                $(this).val('1');
                            } else {
                                $(this).val('0');
                            }

                        });
                        $('#roadValue').click(function () {
                            if ($(this).is(':checked')) {
                                $(this).val('1');
                            } else {
                                $(this).val('0');
                            }

                        });


                        $('#fid').val(row.id);
                        $('#carListGrid').datagrid({
                            height: 390,
                            fit: true,
                            nowrap: true,
                            rownumbers: true,
                            striped: true,
                            singleSelect: true,
                            loadMsg: '数据加载中,请稍后……',
                            columns: [[{field: 'selfNumber', title: '自编号',width: 100},
                                {field: 'carName', title: '车牌号'},
                                {
                                    field: 'wzCount', title: '违章情况', align: 'center',
                                    formatter: function (val, row, index) {
                                        if (row.wzCount > 0) {
                                            return "<div  style='background-color:#FFFF00;text-align:center;margin:0px;padding:0px;color:#000000;'>异常(" + row.wzCount + ")起</div>";
                                        }
                                        return "<div  style='background-color:green;text-align:center;margin:0px;padding:0px;color:#FFFFFF;'>正常</div>";
                                    }
                                },
                                {
                                    field: 'state2', title: '状态', width: 80, align: 'center',
                                    formatter: function (val, row, index) {
                                        // 第一步、根据gps时间和服务器时间是否相同，判断是 在线 还是 离线。
                                        // 第二步、判断是否有速度，没有速度显示静止
                                        if (row.av == 0) {
                                            return "<div  style='background-color: #333;text-align:center;margin:0px;padding:0px;color:#FFFFFF;'>无效定位</div>";
                                        } else {
                                            if (!row.state2) {
                                                return "<div  style='background-color:red;text-align:center;margin:0px;padding:0px;color:#FFFFFF;'>离线</div>";
                                            } else {
                                                return "<div  style='background-color:green;text-align:center;margin:0px;padding:0px;color:#FFFFFF;'>在线</div>";
                                            }
                                        }
                                    }
                                }]],
                            onLoadSuccess: function (data) {
                                if (data.total == 0) {
                                    var body = $(this).data().datagrid.dc.body2;
                                    body.find('table tbody').append('<tr><td width="' + body.width() + '" style="height: 35px; text-align: center;"><h1>暂无数据</h1></td></tr>');
                                }
                            }
                        });
                        $('#qydwBox').combobox({
                            url: '../group/list.htmls',
                            valueField: 'id',
                            textField: 'name',
                            required: true,
                            onSelect: function (record) {
                                $('#carListGrid').datagrid({
                                    url: '../vehicle/getAllGps.htmls',
                                    queryParams: {
                                        cid: record.id
                                    }
                                });
                            }
                        });

                    },
                });
            }
        }

        // 审核通过
        function hzOK() {
            var ccValue = $('#qydwBox').combobox('getValue');
            if (ccValue.length <= 0) {
                $.messager.alert('信息提示', '清运单位不能为空，请选择一个清运单位', 'info');
            } else {
                var data = {
                    //向后台传递参数
                    id: $('#fid').val(),
                    approved: '1',
                    apManager: $('#apManager').val(),
                    promiseValue: $('#promiseValue').val(),
                    polluteValue: $('#polluteValue').val(),
                    roadValue: $('#roadValue').val(),
                    promiseFileName: $('#promiseFileName').val(),
                    polluteFileName: $('#polluteFileName').val(),
                    roadFileName: $('#roadFileName').val(),
                    groupId: $('#qydwBox').combobox('getValue')
                };
                $('#czzPostForm').ajaxSubmit({
                    type: "POST",
                    url: "../qyz/zyzhz.htmls",
                    data: data,
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        if (data.success) {
                            SL.closeWindow();
                            grid.datagrid('load');
                            $.messager.alert('信息提示', '同意核准！', 'info');
                        }
                    }
                });
//
            }
        }
        function printSBB(page) {
            window
                .open(
                    "sbb.jsp",
                    "newwindow",
                    "height=500,width=600,,top=50,left=100,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no");
        }
        function printSBB(page) {
            parent.SL.showWindow({
                title: '建筑垃圾处置证',
                width: 820,
                height: 580,
                top: 30,
                url: 'czz/sbb.jsp',
                onLoad: function () {
                    // 				$('#czzPostForm').form('load', row);
                    // 				$("#bztime").val(new Date().format("yyyy-MM-dd hh:mm:ss"));
                },
            });
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
            <label>字&nbsp;&nbsp;号：</label><input id="s_zNumber" class="easyui-textbox" style="width:150px">
            <label>办理时间：</label><input id="s_apEntryTime" class="Wdate" type="text"
                                       onFocus="WdatePicker({isShowClear:false,readOnly:true})"/>
            - <input id="s_apEntryTime1" class="Wdate" type="text"
                     onFocus="WdatePicker({isShowClear:false,readOnly:true})"/>
            <label>建设单位：</label><input id="s_jsUnit" type="text" class="easyui-textbox" style="width:150px"/>
            <a id="search_btn" href="#" class="easyui-linkbutton" iconCls="icon-search">检索</a>
        </form>
    </div>
</div>
<!-- End of toolbar -->
<table id="listGrid" class="easyui-datagrid" toolbar="#grid-toolbar"></table>
</body>
</html>