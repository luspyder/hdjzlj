<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="carMainForm" method="post">
		<input type="hidden" id="id" name="id" />
		<table id="dwListGrid" style="width: 100%; padding: 20px">
			<tr>
				<td style="width: 20%">自编号:</td>
				<td><input id="selfNumber" name="selfNumber" type="text"
					class="easyui-textbox" style="width: 85%" /></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td>车牌号:</td>
				<td><input id ="carName" name="carName" type="text"
						class="easyui-textbox" style="width: 85%" /></td>
			</tr>
		</table>
	</form>
</body>
</html>