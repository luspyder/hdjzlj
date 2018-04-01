<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>收费处理</title>
    <%@ include file="../common/taglibs.jsp" %>


    <script type="text/javascript">
        var grid;
        $(function () {
            loadDataGrid();
            $("#search_btn").click(function () {
                $('#listGrid').datagrid({
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
            grid = $('#listGrid').datagrid({
                url: '../qyz/list.htmls',
                sortOrder: "desc",
                sortName: "entryTime", //初始化时按Id升序排序
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
                columns: [[{
                    field: 'state', title: '收费状态', align: 'center',
                    formatter: function (val, row, index) {
                        if (val == "0") {
                            return '<a class="feeChenkBtn" href="#" onclick="feeOK(' + index + ')">审核</a>';
                        } else if (val == "1") {
                            return "<div  style='background-color:green;text-align:center;margin:0px;padding:0px;color:#FFFFFF;'>已缴费</div>";
                        }
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
                                return "<a  href=\"javascript:void(0)\"  onclick=\"javaScript:showImg('" + index + "');\"><img  src=\"../images/img_inc.png\" />" + val + "</a>";
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
                    {field: 'entryTime', title: '登记时间'},
                    {
                        field: 'opt', title: '操作', width: 50, align: 'center',
                        formatter: function (value, row,index) {
                            var btn = '<a class="searchcls" onclick="oppenInfo(' + index + ')" href="javascript:void(0)">查看</a>';
                            return btn;
                        }
                    }]],
                onDblClickRow: function (rowIndex, rowData) {
                    oppenInfo(rowIndex);
                },
                onLoadSuccess:function(data){
                    $('.feeChenkBtn').linkbutton({text:'审核',plain:true,iconCls:'icon-edit'});
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
        //弹出处置证详细信息窗口
        function oppenInfo(index) {
            var row = grid.datagrid('getData').rows[index];
            if (row) {
                SL.showWindow({
                    title: '建筑垃圾处置证',
                    width: 500,
                    height: 370,
                    url: 'sbczzInfo.jsp',
                    onLoad: function () {
                        $('#sfdjForm').form('load', row);
                        if (row.handle == 0) {
                            $('#print_btnview').hide();
                        }
                    },
                    buttons: [{
                        text: '关闭',
                        iconCls: 'icon-cancel',
                        handler: function () {
                            SL.closeWindow();
                        }
                    }]
                });
            }
        }
        function feeOK(index) {
            var row = grid.datagrid('getData').rows[index];
            if (row.state == '1') {
                $.messager.alert('信息提示', '该项目已经缴费！', 'info');
                return;
            }
            if (row) {
                SL.showWindow({
                    title: '工程信息',
                    width: 520,
                    height: 410,
                    top: 40,
                    url: 'audit.jsp',
                    onLoad: function () {
                        $('#sfdjForm').form('load', row);
                        $("#gctype_text").textbox('setValue',(row.gcType+row.cqtype).replace("null",""));
                        $("#pop_feeManager").textbox('setValue',$("#pop_uname").val());
                        $("#pop_feeEntryTime").val(  new Date().format("yyyy-MM-dd hh:mm:ss"));

                    },
                    buttons: [{
                        text: '确定',
                        iconCls: 'icon-ok',
                        handler: function () {
                            postFeeOK(row.id, 1);
                        }
                    }, {
                        text: '关闭',
                        iconCls: 'icon-cancel',
                        handler: function () {
                            SL.closeWindow();
                        }
                    }]
                });
            }
        }

        function postFeeOK(id, state) {
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
                        $.messager.alert('信息提示', '项目缴费审核成功！', 'info');
                        SL.closeWindow();
                        grid.datagrid('load');
                    }
                }
            });
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
</div>
<!-- End of toolbar -->
<table id="listGrid" class="easyui-datagrid" toolbar="#grid-toolbar"></table>
</body>
</html>

