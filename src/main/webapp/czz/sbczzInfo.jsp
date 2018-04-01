<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>处置证办理</title>

</head>
<body>

<form id="czzPostForm">
	<input id="fid" type="hidden" name="id" />
	<input type="hidden" id="pop_uname" value="${userSession.realname }"/>
	<table style="width: 100%;align-content: center;margin-top: 10px;">
		<tr>
			<td align="right" style="width:60px;">建设单位:</td>
			<td colspan="3">
				<input name="jsUnit" type="text" class="easyui-textbox" disabled="false" style="width: 400px"/>
			</td>
		</tr>
		<tr>
			<td align="right">联 系人:</td>
			<td>
				<input id="jsContact" name="jsContact" type="text" class="easyui-textbox" style="width: 160px"
					   data-options="required:true"/>
			</td>
			<td align="right">联系电话:</td>
			<td>
				<input id="jsTelephone" name="jsTelephone" type="text" class="easyui-textbox" style="width: 150px"
					   data-options="required:true"/>
			</td>
		</tr>
		<tr>
			<td align="right" style="width:60px;">施工单位:</td>
			<td colspan="3">
				<input name="sgUnit" type="text" class="easyui-textbox" disabled="false" style="width: 400px"/>
			</td>
		</tr>
		<tr>
			<td align="right">联 系人:</td>
			<td>
				<input id="sgContact" name="sgContact" type="text" class="easyui-textbox" style="width: 160px"/>
			</td>
			<td align="right">联系电话:</td>
			<td>
				<input id="sgTelephone" name="sgTelephone" type="text" class="easyui-textbox" style="width: 150px"/>
			</td>
		</tr>
		<tr>
			<td align="right">备注:</td>
			<td colspan="3">
				<input type="text" name="remark" class="easyui-textbox" style="width: 410px;height: 40px;"/>
			</td>
		</tr>

		<tr>
			<td colspan="4">
				<table class="table">
					<tr>
						<th width="130px">生产建筑垃圾数量</th>
						<td><input name="tonnage" type="text" class="easyui-textbox" style="width:200px"  disabled="false"/> 吨</td>
					</tr>
					<tr>
						<th>种类</th>
						<td><input name="gcType" type="text" class="easyui-textbox" style="width: 200px" disabled="false"/></td>
					</tr>
					<tr>
						<th>建筑垃圾处置场地</th>
						<td><input id="czArea" name="czArea" type="text" class="easyui-textbox" style="width: 200px" /></td>
					</tr>
				</table>
			</td>
		</tr>

		<tr>
			<td align="right">经办人:</td>
			<td>
				<input id="pop_hdManager" name="hdManager" type="text" class="easyui-textbox" style="width:160px;"
					   value="${userSession.realname }"/>
			</td>
			<td align="right">办理时间:</td>
			<td>
				<input id="pop_hdEntryTime" name="hdEntryTime" class="Wdate" type="text" style="width: 150px"
					   onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
			</td>
		</tr>

	</table>
</form>
</body>
</html>
