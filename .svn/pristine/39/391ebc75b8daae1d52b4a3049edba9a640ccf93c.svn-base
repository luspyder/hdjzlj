<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>工程登记</title>
    <%@ include file="../common/taglibs.jsp" %>
</head>
<body>
<form id="sfdjForm" enctype="multipart/form-data" method="post">
    <input type="hidden" id="pop_uname" value="${userSession.realname }" />
    <table style="width: 100%">
        <tr>
            <td align="right">工程类型:</td>
            <td>
                <input type="text" id="gctype_text" class="easyui-textbox" style="width:340px;" editable="false"/>
            </td>
        </tr>
        <tr>
            <td align="right" width="80px">建设单位:</td>
            <td><input type="text" name="jsUnit" class="easyui-textbox" style="width:340px;" editable="false"/></td>
        </tr>
        <tr>
            <td align="right">施工单位:</td>
            <td><input type="text" name="sgUnit" class="easyui-textbox" style="width:340px;" editable="false"/></td>
        </tr>
        <tr>
            <td align="right">工程名称:</td>
            <td><input type="text" name="gcName" class="easyui-textbox" style="width:340px;" editable="false"/></td>
        </tr>
        <tr>
            <td align="right">施工地点:</td>
            <td><input name="site" type="text" class="easyui-textbox" style="width:340px;" editable="false"/></td>
        </tr>
        <tr>
            <td align="right">处置费标准:</td>
            <td><input name="fee" type="text" class="easyui-textbox" value="3.50" editable="false"/>
                元/吨
                <label><input type="radio" name="feeType" value="1" disabled/>正常</label>
                <label><input type="radio" name="feeType" value="0.5" disabled/>减半</label>
                <label><input type="radio" name="feeType" value="0" disabled/>免收</label>
            </td>
        </tr>
        <tr>
            <td align="right">建筑面积:</td>
            <td><input name="area" type="text" class="easyui-textbox" value="0" editable="false"/>平
                <span style="width: 70px;">层数：</span><input name="flat" type="text" class="easyui-textbox" editable="false"/>
            </td>
        </tr>
        <tr>
            <td align="right">吨数:</td>
            <td><input name="tonnage" type="text" class="easyui-textbox"/>
                <span style="width: 80px;">处置费：</span><input name="price" type="text" class="easyui-textbox" editable="false"/>
            </td>
        </tr>
        <tr>
            <td align="right">备注:</td>
            <td><input type="text" name="remark" class="easyui-textbox" style="width:340px;height: 40px;" editable="false"/></td>
        </tr>
        <tr>
            <td align="right">登记员:</td>
            <td>
                <input name="manager" type="text" class="easyui-textbox" style="width:140px;" editable="false"/>
                登记时间: <input name="entryTime" class="easyui-textbox" type="text" style="width: 140px" editable="false"/>
            </td>
        </tr>
        <tr>
           <td colspan="2"><hr></td>
        </tr>
        <tr>
            <td align="right">经办人:</td>
            <td>
                <input name="feeManagerId" value="${userSession.id }" type="hidden" />
                <input id="pop_feeManager" name="feeManager" type="text" class="easyui-textbox" style="width:140px;"/>
                录入时间: <input id="pop_feeEntryTime" name="feeEntryTime" class="Wdate textbox_125" type="text"
                             onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                             style="width: 140px"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>