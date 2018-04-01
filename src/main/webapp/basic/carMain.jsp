<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					str += "<a href=\"javascript:void(0)\"><span  onclick=\"javaScript:edit('" + index+ "');\">编辑 </span></a>"; 
					return str;
				}
			} ] ],
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
			onLoadSuccess : function() {
				$(this).datagrid("fixRowHeight");
			},
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
							type: "POST",
			                url: "../basicData/editVeh.htmls",
			                dataType: "json",
			                async: false,
			            	data : param,
			                success: function (data) {
			                	if (data.success) {
									SL.closeWindow();
									grid.datagrid('reload');
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
</script>

</head>
<body class="easyui-layout" data-options="fit:true">

	<div data-options="region:'west',split:true" style="width: 520px;">
		<table id="dwListGrid"></table>
	</div>
	<div data-options="region:'center'" style="background: #eee;">
		<table id="carListGrid"></table>
	</div>

</body>
</html>