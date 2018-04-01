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
    <input name="id" type="hidden"/>
    <input id="jsContact" name="jsContact" type="hidden"/>
    <input id="jsTelephone" name="jsTelephone" type="hidden"/>
    <input id="sgContact" name="sgContact" type="hidden"/>
    <input id="sgTelephone" name="sgTelephone" type="hidden"/>
    <table>
        <tr>
            <td align="right">工程类型:</td>
            <td>
                <input id="gctype1" type="text" name="gcType" class="easyui-textbox" disabled="false"
                       style="width:340px;"/>
            </td>
        </tr>
        <tr>
            <td align="right" width="80px">建设单位:</td>
            <td><input type="text" id="t_jsUnit" name="jsUnit" class="easyui-textbox" disabled="false"
                       style="width:340px;"/></td>
        </tr>
        <tr>
            <td align="right">施工单位:</td>
            <td><input type="text" id="t_sgUnit" name="sgUnit" class="easyui-textbox" disabled="false"
                       style="width:340px;"></td>
        </tr>
        <tr>
            <td align="right">工程名称:</td>
            <td><input type="text" name="gcName" class="easyui-textbox" disabled="false" style="width:340px;"></td>
        </tr>
        <tr>
            <td align="right">施工地点:</td>
            <td><input i name="site" type="text" class="easyui-textbox" disabled="false" style="width:340px;"
                       data-options="precision:4,required:true"/></td>
        </tr>
        <tr>
            <td align="right">处置费标准:</td>
            <td>
                <input id="feeInput" name="fee" type="text" class="easyui-textbox" disabled="false"/>元/吨
            </td>
        </tr>
        <tr>
            <td align="right">建筑面积:</td>
            <td><input name="area" type="text" class="easyui-textbox" disabled="false"/>平
                <span style="width: 70px;">&nbsp&nbsp&nbsp&nbsp&nbsp层数：</span><input name="flat" type="text"
                                                                                     class="easyui-textbox"
                                                                                     disabled="false"/>
            </td>
        </tr>
        <tr>
            <td align="right">吨数:</td>
            <td><input id="tonnageInput" name="tonnage" type="text" class="easyui-textbox" disabled="false"
                       data-options="precision:4,required:true"/>
                <span style="width: 80px;">&nbsp&nbsp&nbsp&nbsp&nbsp处置费：</span><input id="priceInput" name="price"
                                                                                      type="text" disabled="false"
                                                                                      class="easyui-textbox"
                                                                                      data-options="precision:4,required:true"/>
            </td>
        </tr>
        <tr>
            <td align="right">经办人:</td>
            <td>
                <input name="managerId" value="${userSession.id }" type="hidden"/>
                <input name="manager" type="text" class="easyui-textbox" disabled="false" style="width:125px;"
                       value="${userSession.realname }"/>
                录入时间:<input id="environment_endtime" name="entryTime" class="Wdate" type="text" disabled="false"
                            onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                            style="width: 150px"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>