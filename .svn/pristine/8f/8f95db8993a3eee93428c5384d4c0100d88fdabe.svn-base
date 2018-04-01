<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工程登记</title>
</head>
<body>
	<div class="pop_cont">
		<div class="pop_cont_input">
			<form id="sfdjForm">
				<ul class="ulColumn2">
					<input name="id" type="hidden" />
					<!-- 					<li><span class="item_name" style="width: 80px;">登记单号：</span> <input name="regNumber" type="text" class="textbox_355" placeholder="后台获取单号" /></li> -->
					<li><span class="item_name" style="width: 80px;">工程类型：</span><label class="single_selection"><input id="gctype1" type="radio"
							name="gcType" checked="checked" value="新建" />新建</label> <label class="single_selection"><input id="gctype2" type="radio" name="gcType"
							value="市政" />市政</label> <label class="single_selection"><input id="gctype3" type="radio" name="gcType" value="拆迁" />拆迁</label> <select id="cqtype"
						name="cqtype" class="select" style="width: 130px">
							<option value="">请选择</option>
							<option value="旧城/城中村">旧城/城中村</option>
							<option value="拆迁">拆迁</option>
							<option value="拆违">拆违</option>
					</select></li>
					<li><span class="item_name" style="width: 80px;">建设单位：</span> <input name="jsUnit" type="text" class="easyui-textbox textbox_355"
						data-options="required:true" /></li>
					<li><span class="item_name" style="width: 80px;">施工单位：</span> <input name="sgUnit" type="text" class="easyui-textbox textbox_355"
						data-options="required:true" /></li>
					<li><span class="item_name" style="width: 80px;">工程名称：</span> <input name="gcName" type="text" class="easyui-textbox textbox_355"
						data-options="required:true" /></li>
					<li><span class="item_name" style="width: 80px;">施工地点：</span> <input name="site" type="text" class="easyui-textbox textbox_355"
						data-options="required:true" /></li>
					<li><span class="item_name" style="width: 80px;">处置费标准：</span> <input id="feeInput" name="fee" type="text" class="textbox_125" value="3.50"
						readonly="readonly" /> 元/吨 <label class="single_selection"><input type="radio" name="feeType" value="1" checked="checked" />正常</label> <label
						class="single_selection"><input type="radio" name="feeType" value="0.5" />减半</label> <label class="single_selection"><input
							type="radio" name="feeType" value="0" />免收</label></li>
					<li><span class="item_name" style="width: 80px;"> 建筑面积：</span> <input name="area" type="text" class="easyui-numberbox textbox_125" value="0" />平<span
						class="item_name" style="width: 70px;">层数：</span><input name="flat" type="text" class="easyui-numberbox textbox_125" /></li>
					<li><span class="item_name" style="width: 80px;">吨数：</span> <input id="tonnageInput" name="tonnage" type="text" class="easyui-numberbox textbox_125"  data-options="precision:2,required:true"/><span
						class="item_name" style="width: 80px;">处置费：</span> <input id="priceInput" name="price" type="text" class="textbox_125" readonly="readonly" /></li>
					<li><span class="item_name" style="width: 80px;">备注：</span> <input name="remark" type="text" class="textbox_355" /></li>
					<li><span class="item_name" style="width: 80px;">经办人：</span> <input name="managerId" value="${userSession.id }" type="hidden" /> <input
						name="manager" type="text" class="textbox_125" value="${userSession.realname }" /><span class="item_name" style="width: 80px;">录入时间：</span> <input
						id="environment_endtime" name="entryTime" class="Wdate textbox_125" type="text"
						onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" style="width: 140px" /></li>
					<!-- 					<li><span class="item_name" style="width: 80px;"></span> <input id="loading" type="submit" class="link_btn" value="登记" /></li> -->
				</ul>
			</form>
		</div>
	</div>
</body>
</html>