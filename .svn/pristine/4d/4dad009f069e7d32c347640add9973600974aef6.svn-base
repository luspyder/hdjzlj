<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="renderer" content="webkit">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>邯郸市建筑垃圾处置管理系统</title>
    <link href="css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.0.0" rel="stylesheet">
    <script src="js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="js/jquery.tips.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.js"></script>
    <script>
        //        点击回车时登录
        document.onkeydown = function (e) {
            if ($("#password").val() == "") {
                return;
            }
            var event = e || window.event;
            var code = event.keyCode || event.which || event.charCode;
            if (code == 13) {
                severCheck();
            }
        };
        if (window != top) {
            top.location.href = location.href;
        }


        //服务器校验
        function severCheck() {
            if (check()) {
                var username = $("#username").val();
                var password = $("#password").val();
                $.ajax({
                    type: "POST",
                    url: "user/login",
                    data: {
                        username: username,
                        password: password
                    },
                    dataType: 'json',
                    cache: false,
                    success: function (data) {
                        if (data.success) {
                            saveCookie();
                            window.location.href = "index.jsp";
                        } else {
                            $("#username").tips({
                                side: 1,
                                msg: "用户名或密码有误",
                                bg: '#FF5080',
                                time: 15
                            });
                            $("#username").focus();
                        }
                    }
                });
            }
        }
        //客户端校验
        function check() {
            if ($("#username").val() == "") {
                $("#username").tips({
                    side: 2,
                    msg: '用户名不得为空',
                    bg: '#AE81FF',
                    time: 3
                });
                $("#username").focus();
                return false;
            } else {
                $("#username").val(jQuery.trim($('#username').val()));
            }
            if ($("#password").val() == "") {
                $("#password").tips({
                    side: 2,
                    msg: '密码不得为空',
                    bg: '#AE81FF',
                    time: 3
                });
                $("#password").focus();
                return false;
            }
            return true;
        }
        function savePaw() {
            if (!$("#saveid").attr("checked")) {
                $.cookie('username', '', {
                    expires: -1
                });
                $.cookie('password', '', {
                    expires: -1
                });
                $("#username").val('');
                $("#password").val('');
            }
        }
        function saveCookie() {
            if ($("#saveid").attr("checked")) {
                $.cookie('username', $("#username").val(), {
                    expires: 7
                });
                $.cookie('password', $("#password").val(), {
                    expires: 7
                });
            }
        }
        //回车时，默认是登陆
        function on_return() {
            if (window.event.keyCode == 13) {
                if (document.all('join') != null) {
                    document.all('join').severCheck();
                }
            }
        }
    </script>
</head>
<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">
                <img src="images/kache.png">
            </h1>

        </div>
        <h3>邯郸市建筑垃圾处置管理系统</h3>
        <div class="form-group">
            <input name="username" id="username" type="text" class="form-control" placeholder="用户名"
                   required="">
        </div>
        <div class="form-group">
            <input name="password" id="password" type="password" class="form-control" placeholder="密码"
                   required="">
        </div>
        <%--<div class="form-group">--%>
        <%--<div style="float: left; margin-top: 3px; margin-right: 2px;">--%>
        <%--<font>记住密码</font>--%>
        <%--</div>--%>
        <%--<div style="float: left;">--%>
        <%--<input name="form-field-checkbox" id="saveid" type="checkbox" onclick="savePaw();"--%>
        <%--style="padding-top: 0px;" />--%>
        <%--</div>--%>
        <%--</div>--%>
        <button type="submit" id="join" class="btn btn-primary block full-width m-b" onclick="severCheck()">登
            录
        </button>
    </div>
</div>
</body>
</html>
