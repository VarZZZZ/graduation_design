<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ include file="../public/header.jsp" %>
<link href="css/login.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
    $(document).ready(function () {
        var v = {};
        $(".btnLogin").on("click", function () {
            var info="";

            if($("#password").val()==""){
                info="请填写密码";
            }
            if($("#code").val()==""){
                info="请填写工号";
            }

            if(info==""){
                v.code=$("#code").val();
                v.password=$("#password").val();
                $.ajax({
                    type: "POST",
                    url: "adminLoginIn",
                    data: { userObj: JSON.stringify(v) },
                    success: function (json) {
                        if (json === "1") {
                            window.location.href="adminHome";
                        }else{
                            $("#Info").text("登录工号与密码不一致");
                            $("#myModalInfo").modal("show");
                        }
                    }
                });
            }else{
                $("#Info").text(info);
                $("#myModalInfo").modal("show");
            }
        });
    });
</script>

<div class="login-boxtitle">
    <a href=""><img alt="logo" src="images/logo.png" /></a>
</div>

<div class="login-banner">
    <div class="login-main">
        <img src="images/pe.jpg" />
        <div class="login-box">
            <h6 class="title">管理员登录系统</h6>

            <form action="login" method="post">
                <div class="login-form">
                    <div class="user-name">
                        <i class="fa fa-user"></i>
                        <input type="text" name="code" id="code" placeholder="请输入工号" readonly onfocus="this.removeAttribute('readonly');">
                    </div>
                    <div class="user-pass">
                        <i class="fa fa-lock"></i>
                        <input type="password" name="password" id="password" placeholder="请输入密码" readonly onfocus="this.removeAttribute('readonly');">
                    </div>
                </div>

                <br/>
                <br/>
                <input type="button" name="" value="登 录" class="btnLogin btn btn-primary">

            </form>

            <br/>
            <br/>
        </div>
    </div>
</div>

<%@ include file="../public/alertdialog.jsp" %>
<%@ include file="../public/footer.jsp" %>