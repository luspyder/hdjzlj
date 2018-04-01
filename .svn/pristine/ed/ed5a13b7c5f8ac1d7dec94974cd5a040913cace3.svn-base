<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>申办清运证</title>
    <%@ include file="../common/taglibs.jsp" %>
</head>
<body>
<div class="easyui-layout" data-options="fit:true">
    <div id="blgrid-toolbar">
        <div class="wu-toolbar-button">
            借调： <input id="qydwBox" name="groupId" class="select" style="width: 270px">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="reloadCar()">刷新</a>
        </div>
    </div>
    <div data-options="region:'west'" style="width:400px;">
        <table id="carListGrid" class="easyui-datagrid" toolbar="#blgrid-toolbar"></table>
    </div>
    <div data-options="region:'center'" style="width:270px;">
        <form id="czzPostForm">
            <input type="hidden" id="carId">
            <input type="hidden" id="groupId" name="groupId">
            <input type="hidden" id="jdGroupId" name="jdGroupId">
            <input type="hidden" id="managers" name="managers" value="${userSession.realname}" >
            <table>
                <tr>
                    <td>建设单位:</td>
                    <td><input id="jsUnit" name="jsUnit" type="text" class="easyui-textbox" style="width: 90%"
                               readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <td>清运单位:</td>
                    <td>
                        <input name="groupName" id="groupName" type="text" class="easyui-textbox"
                               style="width: 90%" readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <td>工程名称:</td>
                    <td>
                        <input id="gcName" name="gcName" type="text" class="easyui-textbox" style="width: 90%"
                               readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <td>施工地点:</td>
                    <td>
                        <input id="site" name="site" type="text" class="easyui-textbox" style="width: 90%"
                               readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <td>处置场地:</td>
                    <td>
                        <input id="czArea" name="czArea" type="text" class="easyui-textbox" style="width: 90%"
                               readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <td>路&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;线:</td>
                    <td>
                        <input id="line" name="line" type="text" class="easyui-textbox" data-options="multiline:true"
                               style="width: 90%;height: 100px"/>
                    </td>
                </tr>
                <tr>
                    <td>有效期:</td>
                    <td>
                        <input id="vdTimeStart" name="vdTimeStart" class="Wdate" style="width: 40%"
                               type="text" onFocus="startTimeFocus()"/>
                        -
                        <input id="vdTimeEend" name="vdTimeEend" class="Wdate" style="width: 40%"
                               type="text" onFocus="endTimeFocus()"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveTranspot()">办理</a>
                    </td>
                </tr>

            </table>
        </form>
    </div>
</div>
</body>
</html>