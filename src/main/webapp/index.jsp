<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<title>邯郸市建筑垃圾处置审批系统</title>
<link rel="stylesheet" type="text/css" href="easyui/1.4.5/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="css/wu.css" />
<link rel="stylesheet" type="text/css" href="css/icon.css" />
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="easyui/1.4.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/1.4.5/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/echarts.common.min.js"></script>
<script type="text/javascript">
	// 指定图表的配置项和数据
	var option2 = {
		title : {
			text : '收费统计'
		},
		tooltip : {},
		legend : {
			data : [ '元' ]
		},
		xAxis : {
			data : [ "衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子" ]
		},
		yAxis : {},
		series : [ {
			name : '元',
			type : 'bar',
			data : [ 5, 20, 36, 10, 10, 20 ]
		} ]
	};
	 

	$(function() {
		//获取菜单数据
		loadModuleData();
		//退出按钮
		$('#loginOut').click(function() {
			$.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {
				if (r) {
					location.href = 'login.jsp';
				}
			});
		})
		$('#openJSZC').click(function() {
			$('#dd').dialog('open');
		})
		loadGcTypeTJ();
		loadzzTJ(); 

		var myChart2 = echarts.init(document.getElementById('main2'));
		myChart2.setOption(option2);
	})
	/*ajax获取菜单数据*/
	function loadModuleData() {
		$.ajax({
			url : "module/getModuleByRoleId",
			async : false,
			dataType : "json",
			cache : false,
			success : function(data) {
				if (data.length > 0) {
					addNav(data[0].children);
				}
			}
		});
	}
	//资质队有效证件柱状统计
	function loadzzTJ() {
		var xdata=new Array();
		var ydata =new Array();
		$.ajax({
			url : "tran/getCountZZ",
			async : false,
			dataType : "json",
			cache : false,
			success : function(data) {
				if (data.length > 0) {
					for (var i = 0; i < data.length; i++) {
						xdata[i] = data[i].name;
						ydata[i] = data[i].value;
					}
				}
			}
		});
		var option1 = {
				title : {
					text : '有效清运证'
				},
				tooltip : {},
				legend : {
					data : [ '数量' ]
				},
				xAxis : {
					data : xdata
				},
				yAxis : {},
				series : [ {
					name : '数量',
					type : 'bar',
					data : ydata
				} ]
			};
		var myChart1 = echarts.init(document.getElementById('main1'));
		myChart1.setOption(option1);
	}
	//工程类型饼状图
	function loadGcTypeTJ() {
		var ledata=new Array();
		var sedata ;
		$.ajax({
			url : "qyz/getCountType",
			async : false,
			dataType : "json",
			cache : false,
			success : function(data) {
				if (data.length > 0) {
					for (var i = 0; i < data.length; i++) {
						ledata[i] = data[i].name;
					}
					sedata = data;
				}
			}
		});
		option = {
			title : {
				text : '工程类型统计',
				subtext : '已登记项目数量',
				x : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : "{a} <br/>{b} : {c} ({d}%)"
			},
			legend : {
				orient : 'vertical',
				left : 'left',
				data : ledata
			},
			series : [ {
				name : '访问来源',
				type : 'pie',
				radius : '55%',
				center : [ '50%', '60%' ],
				data :sedata,
				itemStyle : {
					emphasis : {
						shadowBlur : 10,
						shadowOffsetX : 0,
						shadowColor : 'rgba(0, 0, 0, 0.5)'
					}
				}
			} ]
		};

		//基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	}
</script>
</head>
<body class="easyui-layout">
	<!-- begin of header -->
	<div class="wu-header" data-options="region:'north',border:false,split:true">
		<div class="wu-header-left">
			<h1>邯郸市建筑垃圾处置审批系统</h1>
		</div>
		<div class="wu-header-right">
			<p>
				<strong class="easyui-tooltip" title="2条未读消息">${userSession.realname }</strong>，欢迎您！
			</p>
			<p>
				<a href="http://hbslkj.com:89/mygpsonline/" target="_blank">网上查车</a>|<a id="openJSZC" href="#">技术支持</a> |<a id="loginOut" href="#">安全退出</a>
			</p>
		</div>
	</div>
	<!-- end of header -->
	<!-- begin of sidebar -->
	<div class="wu-sidebar" data-options="region:'west',split:true,border:true,title:'导航菜单'">
		<div id='wnav' class="easyui-accordion" fit="true" border="false">
			<!--  导航内容 -->
		</div>
	</div>
	<!-- end of sidebar -->
	<!-- begin of main -->
	<div class="wu-main" data-options="region:'center'">
		<div id="wu-tabs" class="easyui-tabs" data-options="border:false,fit:true">
			<div title="首页" data-options="href:'',closable:false,iconCls:'icon-tip',cls:'pd3'">
				<div style="width: 500px; height: 300px; margin: 10px; float: left;">
					<div class="easyui-panel" style="width: 500px; height: 300px; float: left;">
						<div id="main" style="width: 100%; height: 100%;"></div>
					</div>
				</div>
				<div style="width: 500px; height: 300px; margin: 10px; float: left;">
					<div class="easyui-panel" style="width: 500px; height: 300px; float: left;">
						<div id="main1" style="width: 100%; height: 100%;"></div>
					</div>
				</div>
				<div style="width: 500px; height: 300px; margin: 10px; float: left;">
					<div class="easyui-panel" style="width: 500px; height: 300px; float: left;">
						<div id="main2" style="width: 100%; height: 100%;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end of main -->
	<!-- begin of footer -->
	<div class="wu-footer" data-options="region:'south',border:true,split:true">Copyright &copy; 2017 神龙科技 All Rights Reserved</div>
	<div id="dd" class="easyui-dialog" title="技术支持" style="width: 550px; height: 330px; text-align: center" data-options="iconCls:'icon-tip',resizable:true,modal:false,closed:true">


		<table style="width: 100%;" cellpadding="2" cellspacing="0" border="0">
			<tr>
				<td><pre>24<span style="font-family: 宋体;">小时监控</span>:0310-5101568  0310-5101568 </pre> <pre>
						<span style="font-family: 宋体;">售后服务：</span>0310-5101509 </pre> <pre>
						<span style="font-family: 宋体;">审批系统技术支持：</span>18132242203</pre> <pre>
						<span style="font-family: 宋体; font-size: 14px; color: red">关注左侧微信公众号，实时监控车辆动态</span>
					</pre></td>
				<td><img src="images/slwx_258.jpg" alt="" /></td>
			</tr>
			</tbody>
		</table>
	</div>
</body>
<!-- end of footer -->
</html>
