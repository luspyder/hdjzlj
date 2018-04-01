<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处置证申报表</title>
</head>
<body>
	<center>
		<input type="button" value="处置证打印" onclick="CreateOneFormPage()" />
		<input type="button" value="打印第一联" onclick="CreateOneFormPage()" />
		<input type="button" value="打印第二联" onclick="CreateOneFormPage()" />
		<input type="button" value="打印第三联" onclick="CreateOneFormPage()" />
		<div id="print_div">
			<div style="line-height: 40px; padding: 10px; text-align: center; font-size: 28px; font-weight: bold; font-family: '宋体'">建筑垃圾处置申报表</div>
			<table class="table" id="table">
				<tr>
					<td style="height: 20px;; width: 110px;">建设单位</td>
					<td style="height: 20px; width: 350px;"><span id="P_jsUnit"></span></td>
					<td style="height: 20px; width: 110px;">工程名称</td>
					<td style="height: 20px; width: 350px;"><span id="P_gcName"></span></td>
					<!-- 					<td rowspan="15" style="width: 10px; border-width: 0px 0px 0px 0px; vertical-align: middle">第<br>一<br>联 <br> &nbsp;&nbsp; -->
					<!-- 						&nbsp;&nbsp;<br>管<br>理<br>部<br>门<br>存<br>留 -->
					<!-- 					</td> -->
				</tr>
				<tr>
					<td>施工地点</td>
					<td><span id="P_site"></span></td>
					<td>施工单位</td>
					<td><span id="P_sgUnit"></span></td>
				</tr>
				<tr>
					<td>垃圾种类</td>
					<td><span id="P_cqtype"></span></td>
					<td>垃圾产量（T）</td>
					<td><span id="P_tonnage"></span></td>
				</tr>
				<tr>
					<td rowspan="5" style="text-align: center;">申<br>报<br>处<br>置<br>方<br>式
					</td>
					<td><label><input type="radio" name="types" onclick="toHendl(1)"/>1、全部外运 </label></td>
					<td rowspan="5" colspan="2">
						<ul>
							<li style="float: left; padding-left: 10px">施<br>工<br>单<br>位
							</li>
							<li style="float: right; padding-right: 5px; padding-top: 60px">（盖章）<br>年 &nbsp;&nbsp; 月&nbsp;&nbsp; &nbsp;日
							</li>
						</ul>
						</div>
					</td>
				</tr>
				<tr>
					<td><label><input type="radio" name="types" onclick="toHendl(2)"/> 2、全部原地堆放 </label></td>
				</tr>
				<tr>
					<td><label> <input type="radio" name="types" onclick="toHendl(3)"/>3、全部中转（内倒） </label></td>
				</tr>
				<tr>
					<td><label> <input type="radio" name="types" onclick="toHendl(4)"/>4、部分外运，部分堆放 </label></td>
				</tr>
				<tr>
					<td><label> <input type="radio" name="types" onclick="toHendl(5)"/>5、部分外运，部分中转 （内倒）</label></td>
				</tr>
				<tr>
					<td>承运单位</td>
					<td colspan="3"></td>
				</tr>
				<tr align="center">
					<td colspan="4"><b>以下由管理部门填写</b></td>
				</tr>
				<tr>
					<td>处置地点</td>
					<td colspan="3"></td>
				</tr>
				<tr>
					<td style="text-align: center;"><br> <br>管<br>理<br>部<br>门<br>审<br>批<br>意<br>见<br> <br>
						<br></td>
					<td colspan="3">
						<span id="spyj" ></span>
					</td>
				</tr>
				<tr>
					<td style="text-align: center;">备<br> <br> <br> <br> <br> <br> <br> <br>注
					</td>
					<td colspan="3">1、建设、施工单位在需要处置（倾倒、运输、中转、回填、消纳、利用）建筑垃圾时，应提前五日按照申报表要求到邯郸市建筑垃圾管理处申报。 <br> <br>2、管理部门在接到申报表后，三日内核实以上内容进行审批，经核实审批后，申请单位不得变更审批内容，否则按有关规定予以处罚。
						<br> <br>3、建设或施工单位应安装要求围帐施工，硬化施工场地，工地出入口设置防污冲洗设施，保持周围环境整洁卫生。 <br> <br>4、承运单位必须安装《准运证》规定的时间、路线、地点进行行驶和倾倒，不得带泥行驶污染路面。否则，将依据有关规定予以处罚。
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: center;">
						邯郸市建筑垃圾管理处地址:邯郸市高开区诚信路4号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：7021769</td>
				</tr>
			</table>
		</div>
	</center>
</body>
</html>