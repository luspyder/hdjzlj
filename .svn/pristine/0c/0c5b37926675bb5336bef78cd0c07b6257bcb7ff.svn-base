<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>准运证信息核准</title>
	<%@ include file="../common/taglibs.jsp" %>
</head>
<body>
<div class="easyui-layout" data-options="fit:true">
	<div id="hzgrid-toolbar">
		<div class="wu-toolbar-button">
			<label>选择清运单位：</label> <input id="qydwBox" name="groupId" class="select" style="width: 270px">
		</div>
	</div>
	<div data-options="region:'west'" style="width:400px;">
		<table id="carListGrid" class="easyui-datagrid" toolbar="#hzgrid-toolbar"></table>

	</div>
	<div data-options="region:'center'" style="width:270px;">

		<form id="czzPostForm" enctype="multipart/form-data" method="post">
			<input id="fid" type="hidden" name="pid"/>
			<input id="apManager" type="hidden" value="${userSession.realname }"/>
			<table>
				<tr>
					<td><label><input id="promiseValue" type="checkbox" value="0"/>1、承诺书</label>
						<input type="file" id="promiseFileName" name="myfiles" style="width: 100%; height: 30px;"/>
					</td>
				</tr>
				<tr>
					<td><label><input id="polluteValue" type="checkbox" value="0"/>2、防污地</label>
						<input type="file" id="polluteFileName" name="myfiles" style="width: 100%; height: 30px;"/>
					</td>
				</tr>
				<tr>
					<td><label><input id="roadValue" type="checkbox" value="0"/>3、道路硬化</label>
						<input type="file" id="roadFileName" name="myfiles" style="width: 100%; height: 30px;"/>
					</td>
				</tr>
				<tr>
					<td>
						<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="hzOK()">审核通过</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

</body>
</html>