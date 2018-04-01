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
            <td><label><input id="gctype1" type="radio" name="gcType" checked="checked" value="新建"/>新建</label>
                <label><input id="gctype2" type="radio" name="gcType" value="市政"/>市政</label>
                <label> <input id="gctype3" type="radio" name="gcType" value="拆迁"/>拆迁</label>
                <select id="cqtype" name="cqtype" class="select" style="width: 130px">
                    <option value="">请选择</option>
                    <option value="旧城/城中村">旧城/城中村</option>
                    <option value="拆迁">拆迁</option>
                    <option value="拆违">拆违</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="right" width="80px">建设单位:</td>
            <td><input type="text" id="t_jsUnit" name="jsUnit" class="easyui-validatebox" style="width:340px;"/></td>
        </tr>
        <tr>
            <td align="right">施工单位:</td>
            <td><input type="text" id="t_sgUnit" name="sgUnit" class="easyui-textbox" style="width:340px;"></input></td>
        </tr>
        <tr>
            <td align="right">工程名称:</td>
            <td><input type="text" name="gcName" class="easyui-textbox" style="width:340px;"></input></td>
        </tr>
        <tr>
            <td align="right">施工地点:</td>
            <td><input i name="site" type="text" class="easyui-textbox"  style="width:340px;" data-options="precision:4,required:true"/></td>
        </tr>
        <tr>
            <td align="right">施工地图:</td>
            <td><input type="file" id="file1" name="myfiles" style="width: 350px; height: 25px;" value="上 传"/></td>
        </tr>
        <tr>
            <td align="right">处置费标准:</td>
            <td><input id="feeInput" name="fee" type="text" class="easyui-textbox" value="3.50" readonly="readonly"/>
                元/吨
                <label><input type="radio" name="feeType" value="1" checked="checked"/>正常</label>
                <label><input type="radio" name="feeType" value="0.5"/>减半</label>
                <label><input type="radio" name="feeType" value="0"/>免收</label>
            </td>
        </tr>
        <tr>
            <td align="right">建筑面积:</td>
            <td><input name="area" type="text" class="easyui-numberbox" value="0"/>平
                <span style="width: 70px;">层数：</span><input name="flat" type="text" class="easyui-numberbox"/>
            </td>
        </tr>
        <tr>
            <td align="right">吨数:</td>
            <td><input id="tonnageInput" name="tonnage" type="text" class="easyui-numberbox"
                       data-options="precision:4,required:true"/>
                <span style="width: 80px;">处置费：</span><input id="priceInput" name="price" type="text"
                                                             class="easyui-numberbox"
                                                             data-options="precision:4,required:true"/>
            </td>
        </tr>
        <tr>
            <td align="right">备注:</td>
            <td><input type="text" name="remark" class="easyui-textbox" style="width:340px;height: 40px;"></input></td>
        </tr>
        <tr>
            <td align="right">经办人:</td>
            <td>
                <input name="managerId" value="${userSession.id }" type="hidden"/>
                <input name="manager" type="text" class="easyui-textbox" style="width:125px;"
                       value="${userSession.realname }"/>
                录入时间:<input id="environment_endtime" name="entryTime" class="Wdate" type="text"
                            onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                            style="width: 150px"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>