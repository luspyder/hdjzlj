<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.o../html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆列表</title>
<%@ include file="../common/taglibs.jsp"%>

<script type="text/javascript">
	var carGrid;
	var dwGrid;
	$(function() {
		laodDw();
		laodCar();
	});
	function laodCar() {
		carGrid = $('#carListGrid').datagrid({
			height : 550,
			nowrap : true,
			fit : true,
			rownumbers : true,
			striped : true,
			singleSelect : true,
			loadMsg : '数据加载中,请稍后……',
			columns : [ [ {
				field : 'selfNumber',
				title : '自编号'
			}, {
				field : 'carName',
				title : '车牌号'
			}, {
				field : '_opt',
				title : '操作',
				align : 'center',
				width : 90,
				formatter : function(value, row, index) {
					var str = "";
					str += "<a href=\"javascript:void(0)\"><span  onclick=\"javaScript:edit('" + index + "');\">编辑 </span></a>";
					return str;
				}
			} ] ],
			toolbar : [ {
				text : '添加',
				iconCls : 'icon-add',
				handler : function() {
					saveCarData();
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-delete',
				handler : function() {
					var row = carGrid.datagrid('getSelected');
					if (row != null) {
						$.messager.confirm('提示', '删除后车辆将不再显示', function(r) {
							if (r) {
								var param = {
									id : row.id
								};
								$.ajax({
									type : "POST",
									url : "../basicData/delete.htmls",
									dataType : "json",
									async : false,
									data : param,
									success : function(data) {
										if (data.success) {
											carGrid.datagrid('reload');
										}
									}
								});
							}
						});
					} else {
						$.messager.alert('Warning', '请选择一行数据');
					}

				}
			} ],
			onLoadSuccess : function() {
				carGrid.datagrid("fixRowHeight");
			},
		});
	}
	function laodDw() {
		dwGrid = $('#dwListGrid').datagrid({
			url : '../group/list.htmls',
			height : 390,
			nowrap : true,
			fit : true,
			striped : true,
			singleSelect : true,
			rownumbers : true,
			loadMsg : '数据加载中,请稍后……',
			columns : [ [ {
				field : 'name',
				title : '单位名称'
			}, {
				field : '_opt',
				title : '操作',
				align : 'center',
				width : 90,
				formatter : function(val, row, index) {
					return '<a class="editcls" href="#" onclick="seeCar(' + row.id + ')">查看</a>';
				}
			} ] ],
			toolbar : [ {
				text : '添加',
				iconCls : 'icon-add',
				handler : function() {
					$("#standardWindow").window('open');
					$("#cdForm").form('clear');
				}
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : function() {
					var row = dwGrid.datagrid('getSelected');
					if (row != null) {
						$("#standardWindow").window('open');
						$("#cdname").val("");
						$('#cdForm').form('load', row);

					} else {
						// 						$.messager.alert('Warning', '请选择一行数据');
						$.messager.show({
							title : '提示',
							msg : '请选择一行数据',
							showType : 'fade', //设置显示类型
							style : {
								left : 100,
								top : 100
							}, //设置弹框的位置
							timeout : 3000
						});

					}
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-delete',
				handler : function() {
					var row = dwGrid.datagrid('getSelected');
					if (row != null) {
						$.messager.confirm('提示', '删除后将不再显示', function(r) {
							if (r) {
								var param = {
									id : row.id
								};
								$.ajax({
									type : "POST",
									url : "../group/delete.htmls",
									dataType : "json",
									async : false,
									data : param,
									success : function(data) {
										if (data.success) {
											dwGrid.datagrid('reload');
										}
									}
								});
							}
						});
					} else {
						$.messager.alert('Warning', '请选择一行数据');
					}

				}
			} ],
			onLoadSuccess : function() {
				$(this).datagrid("fixRowHeight");
			}
		});
	}
	function seeCar(id) {
		carGrid.datagrid({
			url : '../vehicle/getAll.htmls',
			queryParams : {
				cid : id
			}
		});
	}

	function saveCarData() {
		var row = dwGrid.datagrid('getSelected');
		SL.showWindow({
			title : '车辆详细信息',
			width : 320,
			height : 210,
			top : 120,
			left : 380,
			url : 'carInfo.jsp',
			buttons : [ {
				text : '确定',
				iconCls : 'icon-ok',
				handler : function() {
					if ($("#carMainForm").form('enableValidation').form('validate')) {
						var param = {
							groupid : row.id,
							selfNumber : $('#selfNumber').val(),
							carName : $('#carName').val(),
						};
						$.ajax({
							type : "POST",
							url : "../basicData/saveVeh.htmls",
							dataType : "json",
							async : false,
							data : param,
							success : function(data) {
								if (data.success) {
									SL.closeWindow();
									carGrid.datagrid('reload');
								}
							}
						});

					}
				}
			}, {
				text : '关闭',
				iconCls : 'icon-cancel',
				handler : function() {
					SL.closeWindow();
				}
			} ]
		});
	}
	/**
	 * 编辑
	 */
	function edit(index) {
		var row = carGrid.datagrid('getData').rows[index];
		SL.showWindow({
			title : '车辆详细信息',
			width : 320,
			height : 210,
			top : 120,
			left : 380,
			url : 'carInfo.jsp',
			onLoad : function() {
				$('#carMainForm').form('load', row);
			},
			buttons : [ {
				text : '确定',
				iconCls : 'icon-ok',
				handler : function() {
					if ($("#carMainForm").form('enableValidation').form('validate')) {
						var param = {
							id : row.id,
							selfNumber : $('#selfNumber').val(),
							carName : $('#carName').val(),
						};
						$.ajax({
							type : "POST",
							url : "../basicData/editVeh.htmls",
							dataType : "json",
							async : false,
							data : param,
							success : function(data) {
								if (data.success) {
									SL.closeWindow();
									carGrid.datagrid('reload');
								}
							}
						});

					}
				}
			}, {
				text : '关闭',
				iconCls : 'icon-cancel',
				handler : function() {
					SL.closeWindow();
				}
			} ]
		});
	}

	function saveCdData() {
		if ($("#cdForm").form('enableValidation').form('validate')) {
			var gid = $('#gid').val();
			var url = "../group/save.htmls";
			var param = {};
			if (gid.length > 0) {
				url = "../group/edit.htmls";
				param.id = $('#gid').val();
				param.name = $('#cdname').val()
			} else {
				param.name = $('#cdname').val()
			}

			$.ajax({
				type : "POST",
				url : url,
				dataType : "json",
				async : false,
				data : param,
				success : function(data) {
					if (data.success) {
						dwGrid.datagrid('reload');
						$('#standardWindow').window('close');
					}
				}
			});
		}
	}
</script>

</head>
<body class="easyui-layout" data-options="fit:true">

	<div data-options="region:'west',split:true" style="width: 520px;">
		<table id="dwListGrid"></table>
	</div>
	<div data-options="region:'center'" style="background: #eee;">
		<table id="carListGrid"></table>
	</div>
	<div class="easyui-window" title="添加车队信息" id="standardWindow" collapsible="false" minimizable="false" maximizable="false" modal="true" closed="true" style="width: 350px; top: 50px; left: 200px; height: 130px;">
		<form id="cdForm" method="post">
			<input type="hidden" id="gid" name="id">
			<div style="padding: 10px">
				车队名称：
				<input id="cdname" type="text" class="easyui-textbox" name="name" style="width: 200px;" />
				<br>
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" onclick="saveCdData()">保存</a>
			</div>
		</form>
	</div>
</body>
</html>