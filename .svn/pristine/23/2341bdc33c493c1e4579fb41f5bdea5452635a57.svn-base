<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>角色管理</title>
    <%@ include file="../../common/taglibs.jsp" %>

    <script type="text/javascript">
        var $grid;
        $(function () {
            loadDataGrid();
        });
        function loadDataGrid() {
            $grid = $('#listGrid')
                .datagrid(
                    {
                        method: 'post',
                        url: '../../role/list.htmls',
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
                        columns: [[
                            {title: '角色名称', field: 'name', width: 120},
                            {title: '资源描述', field: 'dscript', width: 200},
                            {
                                field: 'opt', title: '操作', align: 'center',
                                formatter: function (value, row, index) {
                                    var s = "";
                                    s += "<a href=\"javascript:void(0)\"><span onclick=\"javaScript:delRow('" + row.id + "');\">删除</span></a>";
                                    s += "&nbsp;|&nbsp;";
                                    s += "<a href=\"javascript:void(0)\"><span onclick=\"javaScript:loadUser('" + row.name + "','" + row.id + "');\">用户</span></a>";
                                    s += "&nbsp;|&nbsp;";
                                    s += "<a href=\"javascript:void(0)\"><span onclick=\"javaScript:loadModlue('" + row.name + "','" + row.id + "');\">设置权限</span></a>";
                                    return s;
                                }
                            }]],
                        onLoadSuccess: function () {
                            $grid.datagrid('clearSelections');
                        }
                    });
        }
        /*弹出入库窗口*/
        function openWin() {
            SL.showWindow({
                title: '添加角色信息',
                width: 390,
                height: 180,
                top: 60,
                url: 'roleInfo.jsp',
                onLoad: function () {
                    $('#roleId').combobox({
                        url: '../../role/queryAll',
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
        /* 加载角色下用户列表 */
        function loadUser(name, id) {
            $('#right-panel').panel({
                title: "[" + name + "]-用户列表",
                href: 'allotUser.jsp',
                onLoad: function () {
                    $('#userdg').datagrid({
                        url: '../../user/listByRole?id=' + id,
                        loadMsg: '数据加载中....',
                        fit: true,
                        rownumbers: true, // 行号
                        pagination: true,
                        pageSize: 10,
                        pageList: [10, 20, 30, 50],
                        columns: [[
                            {field: 'username', title: '用户名', width: 120},
                            {
                                field: 'realname', title: '姓名', width: 120
                            }]]
                    });
                }
            });
        }
        /* 加载角色功能权限列表 */
        function loadModlue(name, id) {
            $("#roleId").val(id);
            $('#right-panel').panel({
                title: "[" + name + "]-当前权限",
                href: 'allotRes.jsp',
                onLoad: function () {
                    $('#reslist').tree({
                        url: '../../module/role2Module.htmls?roleId=' + id,
                        loadMsg: '数据加载中....',
                        lines: true,
                        checkbox: true
                    });
                }
            });
        }
        /* 删除角色 */
        function delRow(id) {
            if (confirm("请检查该角色下用户,删除后将无法恢复数据。")) {
                $.ajax({
                    url: "../../role/delete?id=" + id,
                    success: function (data) {
                        if (data) {
                            $grid.datagrid('reload');
                        } else {
                            $.messager.alert('信息提示', '操作失败！', 'info');
                        }
                    }
                });
            }
        }
        /* 保存权限设置 */
        function roleModule() {
            var nodes = $('#reslist').tree('getChecked', ['checked', 'indeterminate']);
            var ids = [];
            for (var i = 0; i < nodes.length; i++) {
                ids.push(nodes[i].id);
            }
            if (ids.length > 0) {
                var param = {
                    roleid: $("#roleId").val(),
                    ids: ids
                };
                $.ajax({
                    url: "../../module/saveRoleRes.htmls",
                    type: "POST",
                    data: param,
                    async: false,
                    dataType: "json",
                    cache: false,
                    success: function (data) {
                        if (data.success) {
                            $.messager.alert('信息提示', '设置成功！', 'info');
                        } else {
                            $.messager.alert('信息提示', '操作失败！', 'info');
                        }
                    }
                });
            } else {
                $.messager.alert('信息提示', '请选择分配资源！', 'info');
            }
        }
        /**
         将form转为AJAX提交
         **/
        function ajaxSubmit() {
            if ($("#postForm").form('enableValidation').form('validate')) {

                var url = "";
                if ($("#id").val().length <= 0) {
                    url = '../../role/save.htmls';
                } else {
                    url = '../../user/edit.htmls';
                }
                $.ajax({
                    url: url,
                    type: "POST",
                    data: $('#postForm').serialize(),
                    dataType: "json",
                    success: function (data) {
                        if (data.success) {
                            SL.closeWindow();
                            $grid.datagrid('load');
                        } else {
                            $.messager.alert('信息提示', '操作失败！', 'info');
                        }
                    }
                });
            }
        }
    </script>

</head>
<body class="easyui-layout" data-options="fit:true">
<input id="roleId" type="hidden"/>
<div id="grid-toolbar">
    <div class="wu-toolbar-button">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin()" plain="true">添加</a>
    </div>
</div>
<div data-options="region:'west',split:true" style="width:520px;">
    <table id="listGrid" class="easyui-datagrid" toolbar="#grid-toolbar"></table>
</div>
<div data-options="region:'center'" style="background:#eee;">
    <div id="right-panel" class="easyui-panel" title=" " data-options="fit:true,border:false"></div>
</div>

</body>
</html>