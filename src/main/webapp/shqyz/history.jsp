<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>清运证审核历史查询</title>
    <%@ include file="../common/taglibs.jsp" %>
    <script src="../js/DateUtil.js" type="text/javascript"></script>
    <script type="text/javascript">
        var carGrid;
        var dwGrid;

        $(function () {
            laodDw();
            laodCar();
        });

        $(function () {
            laodCar();

            $("#search_btn").click(function () {
                $('#carlistGrid').datagrid({
                    queryParams: {
                        gcName: $('#s_gcName').val(),
                        vdTimeStart: $("#s_vdTimeStart").val(),
                        vdTimeEend: $("#s_vdTimeEend").val(),
                        jsUnit: $("#s_jsUnit").val(),
                        zNumber: $("#s_zNumber").val(),
                        groupId: $('#groupName').val()
                    }
                });
                //清空查询条件
//                $('#gridForm').form('clear');
            });
        });
        /*右边*/
        /*加载数据*/
        function laodCar() {
            carGrid = $('#carlistGrid').datagrid(
                    {
                        url: '../tran/getList.htmls',
                        nowrap: true,
                        fit: true,
                        rownumbers: true,
                        striped: true,
                        singleSelect: false,
                        pagination: true,
                        pageSize: 20,
                        pageList: [10, 20, 30, 50, 100],
                        loadMsg: '数据加载中,请稍后……',
                        columns: [[{field: 'ck', checkbox: true},
                            {
                                field: 'approved', title: '核准', width: 60, align: 'center',
                                formatter: function (value, row) {
                                    var s = "";
                                    if (value == "1") {

                                        s = "<div  style='background-color:green;text-align:center;margin:0px;padding:0px;color:#FFFFFF;'>已核准</div>";
                                    } else {
                                        s = "<div  style='background-color:#999999;text-align:center;margin:0px;padding:0px;color:#FFFFFF;'>待核准</div>";
                                    }
                                    return s;
                                }
                            },
                            {
                                field: 'carNumber', title: '车牌号',
                                formatter: function (val, row, index) {
                                    if (row.groupId != row.jdGroupId) {
                                        return "借●" + row.carNumber;
                                    }
                                    return row.carNumber;
                                }
                            },
                            {field: 'groupName', title: '所属单位'},
                            {field: 'gcName', title: '工程名称'},
                            {field: 'jsUnit', title: '建设单位'},
                            {field: 'site', title: '施工地点'},
                            {field: 'line', title: '路线'},
                            {
                                field: 'vdTime', title: '有效期',
                                formatter: function (val, row, index) {
                                    if (row.vdTimeEend != null
                                            || row.vdTimeEend != undefined) {
                                        return row.vdTimeStart+"/"+row.vdTimeEend;
                                    }

                                }
                            },
                            {field: 'managers', title: '办理人'},
                            {field: 'entryTime', title: '办理时间'},
                            {field: 'avTime', title: '审核时间'}
                        ]],
                        toolbar: '#grid-toolbar',
                        onLoadSuccess: function () {
                            $('.editcls').linkbutton({text: '核准', plain: true, iconCls: 'icon-edit'});
                            carGrid.datagrid('fixRowHeight');
                        }
                    });
            // 设置分页控件
            carGrid.datagrid('getPager').pagination({
                beforePageText: '第',
                // 页数文本框前显示的汉字
                afterPageText: '页    共 {pages} 页',
                displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
            });
        }
        /*左边*/
        function laodDw() {
            dwGrid = $('#dwListGrid')
                    .datagrid(
                            {
                                url: '../group/list.htmls',
                                height: 390,
                                nowrap: true,
                                fit: true,
                                striped: true,
                                singleSelect: true,
                                rownumbers: true,
                                loadMsg: '数据加载中,请稍后……',
                                columns: [[{field: 'name', title: '单位名称'},
                                    {
                                        field: '_opt', title: '操作', align: 'center', width: 90,
                                        formatter: function (val, row, index) {
                                            return '<a class="editclses" href="#" onclick="seeCar(' + row.id + ')">查看</a>';
                                        }
                                    }]],
                                onLoadSuccess: function () {
                                    $(this).datagrid("fixRowHeight");
                                },
                            });
        }
        function seeCar(id) {
            //获取从gridForm中传过来的id
            $("#groupName").val(id);
            carGrid.datagrid({
                queryParams: {
                    groupId: id
                }
            });
        }
        // 导出excel
        function outExcel() {
            // 获取条件
            var param = $("#gridForm").serialize();// form序列化
            window.location.href = encodeURI("../tran/exporzm?" + param);
        }
    </script>
</head>
<body class="easyui-layout" data-options="fit:true">
<input id="czyid" type="hidden" value="${userSession.id }">
<input id="czy" type="hidden" value="${userSession.realname }">


<%--左边--%>
<div data-options="region:'west',split:true" style="width:350px;">
    <table id="dwListGrid"></table>
</div>


<%--右边--%>
<div data-options="region:'center'" style="background:#eee;">
    <table id="carlistGrid"></table>
</div>


<div id="grid-toolbar">
    <div class="wu-toolbar-button">
        <form id="gridForm">
            <input type="hidden" id="groupName" name="groupId">
            &nbsp;&nbsp;<label>工程名称：</label>&nbsp;&nbsp;<input id="s_gcName" name="gcName" class="easyui-textbox" style="width:130px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>字&nbsp;&nbsp;号：</label>&nbsp;&nbsp;<input id="s_zNumber" name="zNumber" class="easyui-textbox"
                                                                                                 style="width:130px">
            <label>办理时间：</label><input id="s_vdTimeStart" name="vdTimeStart" class="Wdate" type="text"
                                       onFocus="WdatePicker({isShowClear:false,readOnly:true})"/>
            - <input id="s_vdTimeEend" name="vdTimeEend" class="Wdate" type="text"
                     onFocus="WdatePicker({isShowClear:false,readOnly:true})"/>
            <br>&nbsp;&nbsp;<label>建设单位：</label>&nbsp;&nbsp;<input id="s_jsUnit" name="jsUnit" type="text" class="easyui-textbox"
                                                                   style="width:130px"/>
            &nbsp;&nbsp;<a id="search_btn" href="#" class="easyui-linkbutton" iconCls="icon-search">检索</a><br/>
        </form>
    </div>
    <div class="wu-toolbar-search">
        &nbsp;&nbsp;<a href="#" class="easyui-linkbutton" iconCls="icon-edit"
           onclick="outExcel()">导出</a>
    </div>
</div>
<!-- End of toolbar -->
<table toolbar="#grid-toolbar"></table>
</body>
</html>