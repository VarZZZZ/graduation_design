<%@ page language="java"
         pageEncoding="UTF-8" import="java.util.*" %>

<%@ include file="../public/header.jsp" %>
<link href="css/register.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
    $(document).ready(function () {
        var v = {};
        $(".btnRegister").on("click", function () {
            var info = ""

            if ($("#username").val() == "") {
                info = "请填写姓名";
            }
            if ($("#mobile").val() == "") {
                info = "请填写手机号";
            }
            if ($("#password").val() == "") {
                info = "请填写密码";
            }
            if ($("#passwordConfirm").val() == "") {
                info = "请填写确认密码";
            }
            if ($("#password").val() != $("#passwordConfirm").val()) {
                info = "密码与确认密码应一致";
            }
            if (info == "") {
                v.username = $("#username").val();
                v.mobile = $("#mobile").val();
                v.password = $("#password").val();
                $.ajax({
                    type: "POST",
                    url: "addUser",
                    data: {userObj: JSON.stringify(v)},
                    success: function (json) {
                        if (json === "1") {
                            window.location.href = "home";
                        } else {
                            $("#Info").text("注册失败");
                            $("#myModalInfo").modal("show");
                        }
                    }
                });
            } else {
                $("#Info").text(info);
                $("#myModalInfo").modal("show");
            }
        });
    });
</script>

<div class="register-boxtitle">
    <a href=""><img alt="logo" src="images/logo.png"/></a>
</div>

<div class="register-banner">
    <div class="register-main">
        <img src="images/pe.jpg"/>
        <div class="register-box">
            <h6 class="title">注册系统</h6>
            <form action="addMyUser" method="post">
                <div class="register-form">
                    <div class="user-name">
                        <i class="fa fa-user"></i>
                        <input type="text" name="username" id="username" placeholder="请输入用户名" readonly
                               onfocus="this.removeAttribute('readonly');">
                    </div>
                    <div class="user-mobile">
                        <i class="fa fa-mobile"></i>
                        <input type="text" name="mobile" id="mobile" placeholder="请输入手机号" readonly
                               onfocus="this.removeAttribute('readonly');">
                    </div>
                    <div class="user-pass">
                        <i class="fa fa-lock"></i>
                        <input type="password" name="password" id="password" placeholder="设置密码" readonly
                               onfocus="this.removeAttribute('readonly');">
                    </div>
                    <div class="user-pass">
                        <i class="fa fa-lock"></i>
                        <input type="password" name="passwordConfirm" id="passwordConfirm" placeholder="确认密码" readonly
                               onfocus="this.removeAttribute('readonly');">
                    </div>
                    <div class="readme">
                        <input class="cbReaderme" name="cb" type="checkbox"> 点击表示您同意网站的《服务协议》
                    </div>

                </div>

                <br/>
                <br/>
                <input type="button" value="注 册" class="btnRegister btn btn-primary btn-block">
            </form>
        </div>
    </div>
</div>

<%@ include file="../public/alertdialog.jsp" %>
<%@ include file="../public/footer.jsp" %> 