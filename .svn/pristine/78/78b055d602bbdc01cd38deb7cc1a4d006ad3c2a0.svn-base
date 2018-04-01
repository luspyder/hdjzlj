<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>工程登记</title>
</head>
<body>
<form id="sfdjForm">
    <input name="name" type="hidden" value="${userSession.realname }"/>
    <input name="state" type="hidden" value="0"/>
    <input id="h_carId" name="carId" type="hidden" value=""/>
    <input id="h_selfNumber" name="selfNumber" type="hidden" value=""/>
    <table>
        <tr>
            <td align="right">所属单位:</td>
            <td><input id="qydwBox" name="groupId"  style="width: 340px">
            </td>
        </tr>
        <tr>
            <td align="right">车牌号:</td>
            <td><input type="text" id="carNumber" name="carNumber" class="easyui-validatebox" style="width:340px;"/>
            </td>
        </tr>
        <tr>
            <td align="right">违章行为:</td>
            <td><input type="text" name="behavior" class="easyui-validatebox" style="width:340px;"/></td>
        </tr>
        <tr>
            <td align="right">违章地点:</td>
            <td><input type="text" name="place" class="easyui-validatebox" style="width:340px;"/></td>
        </tr>
        <tr>
            <td align="right">违章时间:</td>
            <td><input
                    id="environment_endtime" name="pecTime" class="Wdate" type="text" style="width: 180px"
                    onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"/></td>
        </tr>
    </table>
</form>
</body>
</html>