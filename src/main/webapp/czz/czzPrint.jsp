<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit"  />
    <title>处置证</title>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/LodopFuncs.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/DateUtil.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/SL.easyUI.js" type="text/javascript"></script>
    <style type="text/css" id="styleCzz">

        .table1 {
            border: 1px solid #000000;
            border-width: 1px 0px 0px 1px;
            height: 170px;
            margin-top: 20px;
        }

        .table1 tr td {
            height: 60px;
            border: 1px solid #000000;
            border-width: 0px 1px 1px 0px;
            font-size: 16px;
            font-family: '黑体'
        }

        .L_table {
            padding: 0px 0px 0px 0px;
            border-spacing: 5px;
            font-size: 16px;
            font-family: '宋体';
            /* 	border-collapse: separate; */
        }

        /* .L_table tr  td {height: 40px;} */
        .L_table tr th {
            text-align: right;
        }

        .R_table {
            border-collapse: separate;
            border-spacing: 15px;
            font-size: 16px;
            font-family: '黑体';
            /* 	border-collapse: collapse; */
        }

        /* .L_table tr  td {height: 40px;} */
        .R_table tr th {
            text-align: right;
        }

        p {
            margin: 10px 0;
            line-height: 20px
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

                        var hdEntryTime = DateUtil.dateToStr("yyyy年MM月dd日",
                            DateUtil.strToDate(data.hdEntryTime));

                        if (data.cqtype != null && data.cqtype != ""
                            && data.cqtype != "null") {
                            $("#P_cqtype").html(data.gcType + "-" + data.cqtype);
                        } else {
                            $("#P_cqtype").html(data.gcType);
                        }
                        $("#P_jsUnit").html(data.jsUnit);
                        $("#P_jsContact").html(data.jsContact);
                        $("#P_jsTelephone").html(data.jsTelephone);
                        $("#P_gcName").html(data.gcName);
                        $("#P_site").html(data.site);
                        $("#P_sgUnit").html(data.sgUnit);
                        $("#P_sgContact").html(data.sgContact);
                        $("#P_sgTelephone").html(data.sgTelephone);
                        $("#P_tonnage").html(data.tonnage + "  吨");
                        $("#P_groupName").html(data.groupName);
                        $("#P_czArea").html(data.czArea);
                        $("#P_remark").html(data.remark);
                        $("#P_hdManager").html(data.hdManager);
                        $("#P_hdEntryTime").html(hdEntryTime);
                        $("#P_zNumber").html(data.zNumber);
                        $("#L_jsUnit").html(data.jsUnit);
                        $("#L_jsContact").html(data.jsContact);
                        $("#L_jsTelephone").html(data.jsTelephone);
                        $("#L_gcName").html(data.gcName);
                        $("#L_site").html(data.site);
                        $("#L_sgUnit").html(data.sgUnit);
                        $("#L_sgContact").html(data.sgContact);
                        $("#L_sgTelephone").html(data.sgTelephone);
                        $("#L_tonnage").html(data.tonnage + "  吨");
                        $("#L_groupName").html(data.groupName);
                        $("#L_czArea").html(data.czArea);
                        $("#L_hdManager").html(data.hdManager);
                        $("#L_hdEntryTime").html(hdEntryTime);
                        $("#L_zNumber").html(data.zNumber);

                    }
                }
            });
        });
        var LODOP;
        function print() {
            LODOP = getLodop();
            var strBodyStyle = "<style>"
                + document.getElementById("styleCzz").innerHTML + "</style>";
            var strFormHtml = strBodyStyle + "<body>"
                + document.getElementById("content").innerHTML + "</body>";
            LODOP.SET_PRINT_PAGESIZE(2, 2100, 4200, "打印处置证");
            LODOP.ADD_PRINT_HTM("0mm", "0mm", "RightMargin:0.9cm",
                "BottomMargin:9mm", strFormHtml);
//            LODOP.PREVIEW();
            LODOP.PRINTA();
            // 		    		LODOP.PRINT_DESIGN();
        }
    </script>
</head>
<body>
<input type="button" value="打印处置证" onclick="print()" style="margin-left: 300px;margin-top: 20px"/>
<div id="content" style="margin: 0px auto;">
    <div style="height: auto; float: left;">
        <table width="370px" class="L_table" cellspacing="0">
            <tr>
                <td colspan="2" height="119"
                    style="line-height: 40px; text-align: center; font-size: 22px; font-weight: bold; font-family: '黑体'">
                    邯郸市城市管理和综合行政执法局<br/>建筑垃圾处置证（存根）
                </td>
            </tr>
            <tr></tr><tr></tr><tr></tr>
            <tr>
                <td colspan="2" style="text-align: center; font-size: 20px; font-weight: bold;">邯城管<span id="L_zNumber"
                                                                                                         style="padding: 0px 10px 0px 10px"></span>号
                </td>
            </tr>
            <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>

            <tr>
                <th>建设单位：</th>
                <td style="border: 1px solid #000000; border-width: 0px 0px 1px 0px;"><span id="L_jsUnit"></span></td>
            </tr>
            <tr></tr><tr></tr>
            <tr>
                <th>工程名称：</th>
                <td style="border: 1px solid #000000; border-width: 0px 0px 1px 0px;"><span id="L_gcName"></span></td>
            </tr>
            <tr></tr><tr></tr>
            <tr>
                <th>施工单位：</th>
                <td style="border: 1px solid #000000; border-width: 0px 0px 1px 0px;"><span id="L_sgUnit"></span></td>
            </tr>
            <tr></tr><tr></tr>
            <tr>
                <th>施工地点：</th>
                <td style="border: 1px solid #000000; border-width: 0px 0px 1px 0px;"><span id="L_site"></span></td>
            </tr>
            <tr></tr><tr></tr>
            <tr>
                <th width="120px">建筑垃圾数量：</th>

                <td style="border: 1px solid #000000; border-width: 0px 0px 1px 0px;"><span id="L_tonnage"></span></td>
            </tr>
            <tr></tr><tr></tr>
            <tr>
                <th>处置场地：</th>
                <td style="border: 1px solid #000000; border-width: 0px 0px 1px 0px;"><span id="L_czArea"></span></td>
            </tr>
            <tr></tr><tr></tr>
            <tr>
                <th>联系人：</th>
                <td style="border: 1px solid #000000; border-width: 0px 0px 1px 0px;"><span id="L_jsContact"></span>
                </td>
            </tr>
            <tr></tr><tr></tr>
            <tr>
                <th>联系电话：</th>
                <td style="border: 1px solid #000000; border-width: 0px 0px 1px 0px;"><span id="L_jsTelephone"></span>
                </td>
            </tr>
            <tr></tr><tr></tr>
            <tr>
                <td colspan="2" style="text-align: right; padding-right: 55px;"><span id="L_hdEntryTime"></span></td>
            </tr>
        </table>
    </div>
    <div id="content_inner" style="height: auto; margin-left: 450px; width: 840px;">
        <table class="R_table">
            <tr>
                <td colspan="6" height="119" width="800px"
                    style="line-height: 40px; text-align: center; font-size: 28px; font-weight: bold; font-family: '黑体'">
                    邯郸市城市管理和综合行政执法局<br/>建筑垃圾处置证
                </td>
            </tr>
            <tr>
                <td colspan="6" style="text-align: right; padding-right: 150px; font-size: 20px; font-weight: bold;">邯城管<span
                        id="P_zNumber"
                        style="padding: 0px 10px 0px 10px"></span>号
                </td>
            </tr>
            <tr>
                <th nowrap="nowrap">建设单位：</th>
                <td style="border: 1px solid #000000; border-width: 0px 0px 1px 0px;"><span id="P_jsUnit"></span></td>
                <th nowrap="nowrap">联系人：</th>
                <td style="border: 1px solid #000000; border-width: 0px 0px 1px 0px;"><span id="P_jsContact"></span>
                </td>
                <th nowrap="nowrap">联系电话：</th>
                <td style="border: 1px solid #000000; border-width: 0px 0px 1px 0px;"><span id="P_jsTelephone"></span>
                </td>
            </tr>
            <tr>
                <th nowrap="nowrap">施工单位：</th>
                <td style="border: 1px solid #000000; border-width: 0px 0px 1px 0px;"><span id="P_sgUnit"></span></td>
                <th nowrap="nowrap">联系人：</th>
                <td style="border: 1px solid #000000; border-width: 0px 0px 1px 0px;"><span id="P_sgContact"></span>
                </td>
                <th nowrap="nowrap">联系电话：</th>
                <td style="border: 1px solid #000000; border-width: 0px 0px 1px 0px;"><span id="P_sgTelephone"></span>
                </td>
            </tr>
            <tr>
                <th nowrap="nowrap">工程名称：</th>
                <td colspan="2" style="border: 1px solid #000000; border-width: 0px 0px 1px 0px;"><span
                        id="P_gcName"></span></td>
                <th nowrap="nowrap">施工地点：</th>
                <td colspan="2" style="border: 1px solid #000000; border-width: 0px 0px 1px 0px;"><span
                        id="P_site"></span></td>
            </tr>
            <tr>
                <td height="120" colspan="6" align="left" valign="top">
                    <div align="center">
                        <table width="90%" height="100%" class="table1"
                               style="border: 1px solid #000000; border-width: 1px 0px 0px 1px; height: 170px; margin-top: 20px;">
                            <tr>
                                <td colspan="2">
                                    <div align="center">产生建筑垃圾数量</div>
                                </td>
                                <td width="40%">
                                    <div align="center">种类</div>
                                </td>
                                <td width="25%">
                                    <div align="center">建筑垃圾处置场地</div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div align="center" id="P_tonnage"></div>
                                </td>
                                <td>
                                    <div align="center" id="P_cqtype"></div>
                                </td>
                                <td>
                                    <div align="center" id="P_czArea"></div>
                                </td>
                            </tr>
                            <tr>
                                <td width="7%">
                                    <div align="center">备注</div>
                                </td>
                                <td colspan="3">
                                    <div align="center" id="P_remark"></div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="72" colspan="6" align="left" valign="top"><p style="font-weight: bold;">注意事项：</p>
                    <p>一、未经发证机关许可，本证的各项内容不得变更。</p>
                    <p>二、取得本证后，方可办理建筑垃圾清运手续。凡擅自处置建筑垃圾的属于违法行为，将按有关法律法规的规定予以处罚。</p>
                    <p>三、建筑垃圾需处置（倾倒、运输、中转、回填、消纳、利用）时，应提前五日凭此证和《建筑垃圾处置申报表》到邯郸市政务服务中心二楼城管局窗口办理建筑垃圾处置《车辆清运证》</p>
                    <p>
                        四、邯郸市建筑垃圾管理处地址： 邯郸市高开区诚信路4号<label style="margin-left: 150px">联系电话：7028386</label>
                    </p></td>
            </tr>
            <tr>
                <td height="20px"></td>
            </tr>
            <tr>
                <td height="62" colspan="5" style="padding-left: 180px">经办人：<span id="P_hdManager"></span></td>
                <td height="62" width="200px"><p>发证机关</p>
                    <p>
                        <span id="P_hdEntryTime"></span>
                    </p></td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>