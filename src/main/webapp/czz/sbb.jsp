<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit"  />
    <title>处置证申报表</title>

    <!--系统样式 -->


    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/LodopFuncs.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/DateUtil.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/SL.easyUI.js" type="text/javascript"></script>
    <%-- <script src="${pageContext.request.contextPath}/js/SL.EasyUIJquery.js" type="text/javascript"></script> --%>


    <style type="text/css" id="style1">
        li {
            list-style-type: none;
        }

        .table {
            border: solid black;
            border-width: 0px 0px 0px 0px;
            font－size: 11px;
        }

        .table td {
            border: solid black;
            border-width: 1px 0px 0px 1px;
            padding: 5px 5px;
        }

        body {
            height: 1123px;
            width: 740px;
            /* to centre page on screen*/
            margin-left: auto;
            margin-right: auto;
        }
    </style>
    <script type="text/javascript">
        var Request = new Object();
        Request = GetRequest();
        $(function () {
            $.ajax({
                type: "POST",
                url: "../qyz/selectOne.htmls",
                data: {
                    id: Request["id"],
                },
                dataType: "json",
                async: false,
                success: function (data) {
                    if (data) {
                        if (data.cqtype != null && data.cqtype != ""
                            && data.cqtype != "null") {
                            $("#P_cqtype").html(data.gcType + "-" + data.cqtype);
                        } else {
                            $("#P_cqtype").html(data.gcType);
                        }

                        $("#P_jsUnit").html(data.jsUnit);
                        $("#P_gcName").html(data.gcName);
                        $("#P_site").html(data.site);
                        $("#P_sgUnit").html(data.sgUnit);

                        $("#P_tonnage").html(data.tonnage);
                    }
                }
            });
        });

        var LODOP; //声明为全局变量
        function CreateOneFormPage(p) {

            if (p == 1) {
                $("#right_Text").html("第一联<br><br><br><br>管理部门<br><br存留");
            } else if (p == 2) {
                $("#right_Text").html("第二联<br><br><br><br>建设单位<br><br存留");
            } else if (p == 3) {
                $("#right_Text").html("第三联<br><br><br><br>承运单位<br><br存留");
            }
            LODOP = getLodop();
            // 		LODOP.PRINT_INITA(0, 0, 800, 982, "第一次申报表");
            LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A4"); //规定纸张大小；使用A4纸。
            var strBodyStyle = "<style>"
                + document.getElementById("style1").innerHTML + "</style>";
            var strFormHtml = strBodyStyle + "<body>"
                + document.getElementById("print_div").innerHTML + "</body>";
            LODOP.ADD_PRINT_HTM("10mm", 34, "RightMargin:0.9cm",
                "BottomMargin:9mm", strFormHtml);
//            LODOP.PREVIEW();
            LODOP.PRINTA();
            // 		LODOP.PRINT_DESIGN();


        }
    </script>
</head>
<body>

<!--     <input type="button" value="处置证打印" onclick=""/> -->
<input type="button" value="打印第一联" onclick="CreateOneFormPage(1)"/>
<input type="button" value="打印第二联" onclick="CreateOneFormPage(2)"/>
<input type="button" value="打印第三联" onclick="CreateOneFormPage(3)"/>
<div id="print_div">
    <div style="line-height: 40px; margin-bottom: 30px; text-align: center; font-size: 28px; font-weight: bold; font-family: '宋体'">
        建筑垃圾处置申报表
    </div>
    <table class="table" id="table">
        <tr>
            <td style="height: 30px;; width: 90px;" nowrap="nowrap">建设单位</td>
            <td style="height: 30px; width: 430px"><span id="P_jsUnit"></span></td>
            <td style="height: 30px; width: 90px;" nowrap="nowrap">工程名称</td>
            <td style="height: 30px; width: 430px"><span id="P_gcName"></span></td>
            <td
                    style="height: 100%; width: 5px; border-right: none; border-bottom: none; border-top: none; vertical-align: middle; margin: 0 auto; width: 20px; line-height: 24px;"
                    rowspan="14"><span id="right_Text"></span></td>
        </tr>
        <tr>
            <td height="30px">施工地点</td>
            <td height="30px"><span id="P_site"></span></td>
            <td height="30px">施工单位</td>
            <td height="30px"><span id="P_sgUnit"></span></td>
        </tr>
        <tr>
            <td height="30px">垃圾种类</td>
            <td height="30px"><span id="P_cqtype"></span></td>
            <td height="30px" nowrap="nowrap">垃圾产量（T）</td>
            <td height="30px"><span id="P_tonnage"></span></td>
        </tr>
        <tr>
            <td rowspan="5" style="text-align: center;">申<br>报<br>处<br>置<br>方<br>式
            </td>
            <td height="30px"><label>1 、全部外运 </label></td>
            <td rowspan="5" colspan="2" height="35px">
                <ul>
                    <li style="float: left; padding-left: 10px">建<br>设<br>单<br>位
                    </li>
                    <li style="float: right; padding-right: 5px; padding-top: 60px">（盖章）<br>年 &nbsp;&nbsp; 月&nbsp;&nbsp;
                        &nbsp;日
                    </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td height="30px"><label> 2、全部原地堆放 </label></td>
        </tr>
        <tr>
            <td height="30px"><label>3、全部中转（内倒） </label></td>
        </tr>
        <tr>
            <td height="30px"><label>4、部分外运，部分堆放 </label></td>
        </tr>
        <tr>
            <td height="30px"><label>5、部分外运，部分中转 （内倒） </label></td>
        </tr>
        <tr>
            <td height="30px">承运单位</td>
            <td height="30px" colspan="3"></td>
        </tr>
        <tr align="center">
            <td height="30px" colspan="4"><b>以下由管理部门填写</b></td>
        </tr>
        <tr>
            <td height="30px">处置地点</td>
            <td height="30px" colspan="3"></td>
        </tr>
        <tr>
            <td style="text-align: center;"><br> <br>管<br>理<br>部<br>门<br>审<br>批<br>意<br>见<br> <br>
                <br></td>
            <td colspan="3"><span id="spyj"></span></td>
        </tr>
        <tr>
            <td style="text-align: center;">备<br> <br> <br> <br> <br> <br> <br> <br>注
            </td>
            <td colspan="3" style="padding: 20px 10px 20px 10px;">
                1、建设、施工单位在需要处置（倾倒、运输、中转、回填、消纳、利用）建筑垃圾时，应提前五日按照申报表要求到邯郸市建筑垃圾管理处申报。 <br> <br>2、管理部门在接到申报表后，三日内核实以上内容进行审批，经核实审批后，申请单位不得变更审批内容，否则按有关规定予以处罚。
                <br> <br>3、建设或施工单位应安装要求围帐施工，硬化施工场地，工地出入口设置防污冲洗设施，保持周围环境整洁卫生。 <br> <br>4、承运单位必须按照《清运证》规定的时间、路线、地点进行行驶和倾倒，不得带泥行驶污染路面。否则，将依据有关规定予以处罚。
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center; border-bottom-width: 1px">
                邯郸市建筑垃圾管理处地址:&nbsp;&nbsp;邯郸市高开区诚信路4号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：7021769
            </td>
        </tr>
    </table>
</div>
</body>
</html>