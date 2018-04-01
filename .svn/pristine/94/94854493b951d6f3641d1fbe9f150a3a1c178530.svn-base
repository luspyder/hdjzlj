<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>建设单位查询</title>
    <%@ include file="../common/taglibs.jsp" %>

    <script type="text/javascript">
        var grid;
        $(function () {
            loadDataGrid();
            $("#search_btn").click(function () {
                $('#jsdw_listGrid').datagrid({
                    queryParams: {
                        name: $('#s_dwName').textbox('getValue')
                    }
                });
            });
        });
        /*加载数据*/
        function loadDataGrid() {
            grid = $('#jsdw_listGrid').datagrid({
                url: '../dep/queryListPage.htmls?type=2',
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
                columns: [[{field: 'd_name', title: '单位名称', width: 150},
                    {field: 'd_fuzeren', title: '负责人', width: 80},
                    {field: 'd_tel', title: '联系电话', width: 80},
                    {field: 'd_fax', title: '传真', width: 80},
                    {field: 'd_email', title: '邮箱', width: 80}
                ]]
            });
            // 设置分页控件
            grid.datagrid('getPager').pagination({
                beforePageText: '第',
                // 页数文本框前显示的汉字
                afterPageText: '页    共 {pages} 页',
                displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
            });
        }
        /**
         * Name 打开添加窗口
         */
        function openAdd() {
            $('#sjwh-jsdw-form').form('clear');
            $('#d_type').val('2');
            $('#sjwh-jsdw-dialog').dialog({
                closed: false,
                modal: true,
                title: "添加信息",
                buttons: [{
                    text: '确定',
                    iconCls: 'icon-ok',
                    handler: add
                }, {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $('#sjwh-jsdw-dialog').dialog('close');
                    }
                }]
            });
        }
        /**
         * Name 添加记录
         */
        function add() {
            if ($("#sjwh-jsdw-form").form('enableValidation').form('validate')) {
                var data = $('#sjwh-jsdw-form').serialize();
                $.ajax({
                    type: "POST",
                    url: "../dep/saveDep.htmls",
                    data: data,
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        if (data.success) {
                            $.messager.alert('信息提示', '提交成功！', 'info');
                            $('#sjwh-jsdw-dialog').dialog('close');
                            $('#jsdw_listGrid').datagrid('load');
                        } else {
                            $.messager.alert('信息提示', '提交失败！', 'info');
                        }
                    }
                });
            }
        }
        /**
         * Name 删除记录
         */
        function remove() {
            $.messager.confirm('信息提示', '确定要删除该记录？', function (result) {
                if (result) {
                    var items = $('#jsdw_listGrid').datagrid('getSelected');
                    $.ajax({
                        url: '../dep/delDep.htmls',
                        data: {id: items.id},
                        success: function (data) {
                            if (data.success) {
                                $.messager.alert('信息提示', '删除成功！', 'info');
                                $('#jsdw_listGrid').datagrid('load');
                            }
                            else {
                                $.messager.alert('信息提示', '删除失败！', 'info');
                            }
                        }
                    });
                }
            });
        }
        /**
         * Name 打开修改窗口
         */
        function openEdit() {
            $('#sjwh-jsdw-form').form('clear');
            var item = $('#jsdw_listGrid').datagrid('getSelected');
            $('#sjwh-jsdw-form').form('load', item)
            $('#sjwh-jsdw-dialog').dialog({
                closed: false,
                modal: true,
                title: "修改信息",
                buttons: [{
                    text: '确定',
                    iconCls: 'icon-ok',
                    handler: edit
                }, {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $('#sjwh-jsdw-dialog').dialog('close');
                    }
                }]
            });
        }
        /**
         * Name 修改记录
         */
        function edit() {
            if ($("#sjwh-jsdw-form").form('enableValidation').form('validate')) {
                var data = $('#sjwh-jsdw-form').serialize();
                $.ajax({
                    type: "POST",
                    url: "../dep/editDep.htmls",
                    data: data,
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        if (data.success) {
                            $.messager.alert('信息提示', '提交成功！', 'info');
                            $('#sjwh-jsdw-dialog').dialog('close');
                            $('#jsdw_listGrid').datagrid('load');
                        } else {
                            $.messager.alert('信息提示', '提交失败！', 'info');
                        }
                    }
                });
            }
        }
    </script>
</head>
<body class="easyui-layout" data-options="fit:true">
<div id="jsdw-toolbar">
    <div class="wu-toolbar-button">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAdd()" plain="true">添加</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEdit()" plain="true">修改</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="remove()" plain="true">删除</a>
    </div>
    <div class="wu-toolbar-search">
        <label>单位名称：</label><input id="s_dwName" class="easyui-textbox" style="width:200px">
        <a id="search_btn" href="#" class="easyui-linkbutton" iconCls="icon-search">检索</a>
    </div>
</div>
<!-- End of toolbar -->
<table id="jsdw_listGrid" class="easyui-datagrid" toolbar="#jsdw-toolbar"></table>
<!-- 单位明细弹窗开始 -->
<div id="sjwh-jsdw-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'"
     style="width:400px; padding:10px;">
    <form id="sjwh-jsdw-form" method="post">
        <input type="hidden" id="d_type" name="d_type" value="2"/>
        <input type="hidden" name="id"/>
        <table>
            <tr>
                <td width="60" align="right">单位名称:</td>
                <td><input type="text" name="d_name" class="easyui-validatebox wu-text" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td align="right">负 责 人:</td>
                <td><input type="text" name="d_fuzeren" class="wu-text"/></td>
            </tr>
            <tr>
                <td align="right">电 话:</td>
                <td><input type="text" name="d_tel" class="wu-text"/></td>
            </tr>
            <tr>
                <td valign="top" align="right">传 真:</td>
                <td><input type="text" name="d_fax" class="wu-text"></input></td>
            </tr>
            <tr>
                <td valign="top" align="right">邮 箱:</td>
                <td><input type="text" name="d_email" class="wu-text"></input></td>
            </tr>
        </table>
    </form>
</div>
<!-- 单位明细弹窗结束 -->
</body>
</html>