<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户信息</title>
</head>
<body>
<form id="postForm">
    <input id="id" name="id" type="hidden"/>
    <table width="370px;">
        <tr>
            <td align="right">账号名称:</td>
            <td><input type="text" name="username" class="easyui-textbox" style="width:300px;;"></input></td>
        </tr>
        <tr>
            <td align="right">真实姓名:</td>
            <td><input type="text" name="realname" class="easyui-textbox" style="width:300px;;"></input></td>
        </tr>
        <tr>
            <td align="right">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色:</td>
            <td><input type="text" id="roleId" name="roleId" class="easyui-textbox" style="width:300px;;"></input></td>
        </tr>
        <tr>
            <td align="right">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</td>
            <td><label> <input name="sex" type="radio" value="男" checked="checked"/>男 </label>
                <label><input name="sex" type="radio" value="女"/>女</label></td>
        </tr>
        <tr>
            <td align="right">联系电话:</td>
            <td><input type="text" name="phone" class="easyui-textbox" style="width:300px;;"></input></td>
        </tr>
        <tr>
            <td align="right">电子邮件:</td>
            <td><input type="text" name="email" class="easyui-textbox" style="width:300px;;"></input></td>
        </tr>
    </table>
</form>
</body>
</html>