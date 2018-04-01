<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户查询</title>
    <%@ include file="../../common/taglibs.jsp" %>

    <script type="text/javascript">
        var grid;
        $(function () {
            loadDataGrid();
            $("#search_btn").click(function () {
                $('#listGrid').datagrid({
                    queryParams: {
                        username: $('#s_name').val(),
                        realname: $('#s_realname').val()
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
                        method: 'post',
                        url: '../../user/list.htmls',
                        rownumbers: true,
                        singleSelect: true,
                        pagination: true,
                        multiSort: true,
                        fitColumns: false,
                        fit: true,
                        pagination: true,
                        pageSize: 10,
                        pageList: [10, 20, 30, 50, 100],
                        loadMsg: '数据加载中,请稍后……',
                        columns: [[{
                                title: '状态', field: 'status',
                                formatter: function (value, rec) {
                                    return value == 'enabled' ? '启用' : '<span style="color:red">禁用</span>';
                                }
                            },
                            {title: '用户名', field: 'username', width: 100},
                            {title: '姓名', field: 'realname', width: 150},
                            {title: '联系方式', field: 'phone'},
                            {title: '邮箱', field: 'email'},
                            {title: '创建时间', field: 'create_time'},
                            {
                                title: '操作', field: '_opt', width: 170, align: 'center',
                                formatter: function (value, row, index) {
                                    var btn = '<a class="editcls" onclick="editRow(' + row.id + ')" href="javascript:void(0)">编辑</a>';
                                    btn += "&nbsp;|&nbsp;";
                                    btn += '<a class="delcls" onclick="removeIt(' + row.id + ')" href="javascript:void(0)">删除</a>';
                                    return btn;
                                }
                            }]],
                        onLoadSuccess: function () {
                            $('.editcls').linkbutton({text:'编辑',plain:true,iconCls:'icon-edit'});
                            $('.delcls').linkbutton({text:'删除',plain:true,iconCls:'icon-no'});
                            grid.datagrid('fixRowHeight');
                        },
                    });
            // 设置分页控件
            grid.datagrid('getPager').pagination({
                beforePageText: '第',// 页数文本框前显示的汉字
                afterPageText: '页    共 {pages} 页',
                displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
            });
        }
        /*弹出窗口*/
        function openWin() {
            SL.showWindow({
                title: '用户信息',
                iconCls: 'icon-add',
                width: 390,
                height: 280,
                top: 60,
                url: 'userInfo.jsp',
                onLoad: function () {
                    $('#roleId').combobox({
                        url: '../../role/queryAll.htmls',
                        valueField: 'id',
                        textField: 'name',
                        required: true
                    });
                },
                buttons: [{
                    text: '确定',
                    iconCls: 'icon-ok',
                    handler: ajaxSubmit
                }, {
                    text: '关闭',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        SL.closeWindow();
                    }
                }]
            });
        }
        /**
         编辑用户新
         **/
        function editRow(id) {
            SL.showWindow({
                title: '用户信息',
                iconCls: 'icon-add',
                width: 390,
                height: 280,
                top: 60,
                url: 'userInfo.jsp',
                onLoad: function () {
                    $('#roleId').combobox({
                        url: '../../role/queryAll.htmls',
                        valueField: 'id',
                        textField: 'name',
                        required: true
                    });
                    $("#postForm").form('load', '../../user/queryOne.htmls?id=' + id);
                },
                buttons: [{
                    text: '确定',
                    iconCls: 'icon-ok',
                    handler: ajaxSubmit
                }, {
                    text: '关闭',
                    iconCls: 'icon-cancel',
                    handler: function () {
                        SL.closeWindow();
                    }
                }]
            });
        }
        /**
         将form转为AJAX提交
         **/
        function ajaxSubmit() {
            if ($("#postForm").form('enableValidation').form('validate')) {
                var url = "";
                if ($("#id").val().length <= 0) {
                    url = '../../user/save.htmls';
                } else {
                    url = '../../user/editUser.htmls';
                }
                $.ajax({
                    url: url,
                    type: "POST",
                    data: $('#postForm').serialize(),
                    dataType: "json",
                    success: function (data) {
                        if (data.success) {
                            SL.closeWindow();
                            grid.datagrid('load');
                        } else {
                            $.messager.alert('信息提示', '操作失败！', 'info');
                        }
                    }
                });
            }
        }
        //打开施工地图
        function removeIt(id) {
            $.messager.confirm('Confirm', '确定删除该用户吗？', function(r){
                if (r){
                    $.ajax({
                        url: '../../user/delete.htmls?id='+id,
                        type: "POST",
                        data: $('#postForm').serialize(),
                        dataType: "json",
                        success: function (data) {
                            if (data.success) {
                                grid.datagrid('load');
                            } else {
                                $.messager.alert('信息提示', '操作失败！', 'info');
                            }
                        }
                    });
                }
            });

        }
    </script>
</head>
<body class="easyui-layout" data-options="fit:true">
<div id="grid-toolbar">
    <div class="wu-toolbar-button">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin()" plain="true">添加</a>
    </div>
    <div class="wu-toolbar-search">
        <form id="gridForm">
            <label>账号：</label><input id="s_name" class="easyui-textbox" style="width:150px">
            <label>姓名：</label><input id="s_realname" class="easyui-textbox" style="width:150px">

            <a id="search_btn" href="#" class="easyui-linkbutton" iconCls="icon-search">检索</a>
        </form>
    </div>
</div>
<!-- End of toolbar -->
<table id="listGrid" class="easyui-datagrid" toolbar="#grid-toolbar"></table>
</body>
</html>