<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>同步数据</title>
    <%@ include file="../../common/taglibs.jsp" %>

    <script type="text/javascript">
        var carGrid;
        var dwGrid;
        $(function () {
            laodDw();
            laodCar();
        });
        function laodCar() {
            carGrid = $('#carListGrid').datagrid({
                height: 550,
                nowrap: true,
                fit: true,
                rownumbers: true,
                striped: true,
                singleSelect: true,
                loadMsg: '数据加载中,请稍后……',
                columns: [[ {field: 'selfNumber', title: '自编号'},
                    {field: 'carName', title: '车牌号'},
                    {
                        field: 'cpys', title: '车牌颜色', align: 'center',
                        formatter: function (value, row) {
                            var s = "";
                            switch (value) {
                                case 0:
                                    s = "<div  style='background-color:#0000EE;text-align:center;margin:0px;padding:0px;color:#FFFFFF;'>蓝色</div>";
                                    break;

                                case 1:
                                    s = "<div  style='background-color:#FFD700;text-align:center;margin:0px;padding:0px;color:#000000;'>黄色</div>";
                                    break;
                                case 2:
                                    s = "<div  style='background-color:#000000;text-align:center;margin:0px;padding:0px;color:#FFFFFF;'>黑色</div>";
                                    break;
                                case 3:
                                    s = "<div  style='background-color:#FFFFFF;text-align:center;margin:0px;padding:0px;color:#000000;'>白色</div>";
                                    break;
                            }
                            return s;
                        }
                    },
                    {field: 'sim', title: 'SIM号码'},
                    {field: 'gprs', title: '设备ID'},
                    {
                        field: '_opt', title: '操作', align: 'center', width: 90,
                        formatter: function (val, row, index) {
                            return '<a class="gpscls" href="#" onclick="seeCarGPS()">定位</a>';
                        }
                    }]],
                onLoadSuccess: function () {
                    carGrid.datagrid("fixRowHeight");
                },
            });
        }
        function laodDw() {
            dwGrid = $('#dwListGrid')
                .datagrid(
                    {
                        url: '../../group/list.htmls',
                        height: 390,
                        nowrap: true,
                        fit: true,
                        striped: true,
                        singleSelect: true,
                        rownumbers: true,
                        loadMsg: '数据加载中,请稍后……',
                        columns: [[{field: 'name', title: '单位名称'},
                            {
                                field: '_opt', title: '操作', align: 'center', width: 90,
                                formatter: function (val, row, index) {
                                    return '<a class="editcls" href="#" onclick="seeCar(' + row.id + ')">查看</a>';
                                }
                            }]],
                        toolbar:'#grid-toolbar',
                        onLoadSuccess: function () {
                            $(this).datagrid("fixRowHeight");
                        },
                    });
        }
        function seeCar(id) {
            carGrid.datagrid({
                url: '../../vehicle/getAll.htmls',
                queryParams: {
                    cid: id
                }
            });
        }
        function syncData() {
            $.ajax({
                url: "../../vehicle/syncDW.htmls",
                dataType: "json",
                async: false,
                success: function (data) {
                    dwGrid.datagrid('load');
                }
            });
        }
        function seeCarGPS() {
            var row = $('#carListGrid').datagrid('getSelected');
//            window.open ('http://hbslkj.com:89/Interface/findPosition.action?carNum='+row.carName);
            var href = 'http://hbslkj.com:89/Interface/findPosition.action?carNum=' +row.selfNumber + row.carName;
            var content = '<iframe scrolling="auto" frameborder="0"  src="' + href + '" style="width:100%;height:100%;"></iframe>';
            SL.showWindow({
                title: '车辆位置详细信息',
                width: 520,
                height: 410,
                top: 40,
                left: 150,
                content: content
            });
        }
    </script>

</head>
<body class="easyui-layout" data-options="fit:true">
<div id="grid-toolbar">
    <div class="wu-toolbar-button">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="syncData()" plain="true">同步</a>
    </div>
</div>
<div data-options="region:'west',split:true" style="width:520px;">
    <table id="dwListGrid"></table>
</div>
<div data-options="region:'center'" style="background:#eee;">
    <table id="carListGrid"></table>
</div>

</body>
</html>