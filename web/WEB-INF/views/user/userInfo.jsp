<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../public/prefix.jsp" %>

<link href="css/user.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
    var v={};
    $(document).ready(function(){
        $(".ToUpdate").on("click", function () {
            v.username = $(this).attr("data1");
            v.mobile = $(this).attr("data2");
            v.address = $(this).attr("data3");
            v.password = $(this).attr("data4");
            v.id=$(this).attr("data6");
            $("#nameUpdate").val(v.username);
            $("#mobileUpdate").val(v.mobile);
            $("#userId").val(v.id);
            $("#addressUpdate").val(v.address);
            $("#passwordUpdate").val(v.password);
            $("#myModalUpdate").modal("show");
        });
        $(".Update").on("click", function () {
            var info="";
            var  browserCfg = {};
            var ua = window.navigator.userAgent;
            if (ua.indexOf("MSIE")>=1){
                browserCfg.ie = true;
            }else if(ua.indexOf("Firefox")>=1){
                browserCfg.firefox = true;
            }else if(ua.indexOf("Chrome")>=1){
                browserCfg.chrome = true;
            }
            if($("#nameUpdate").val()===""){
                info="请填写用户名";
            }

            if($("#mobileUpdate").val()===""){
                info="请填写手机号";
            }


            if(info===""){
                $(".Update").attr("type","submit");
                $("formUpdate").submit();
            }else{
                $("#Info").text(info);
                $("#myModalInfo").modal("show");
            }
        });
    });

</script>
<div class="bgTop">
    <div class="bgTop2">
        <span>
            <a href="home">首页</a>
        </span>
        <span> ></span>
        <span>个人信息</span>
    </div>
</div>

<div class="sub-title">
    <h1 class="title-name">个人信息</h1>
    <p>我们以科技和品质为起点，为您提供更优质的服务，更有保障的管道产品，不止是PE，还有更多</p>
    <span>
        USER INFO
    </span>
</div>
<style>
    .info{
        padding-top:9px;
    }
</style>

<div class="userInfo" style="width:800px;margin:0 auto;font-size:20px;">
    <div class="user" style="padding-left:80px;">
        <div class="info">
            用户名：    ${user.username}
        </div>
        <div class="info">
            手机号：${user.mobile}
        </div>
        <div class="info">
            地址： ${user.address}
        </div>
        <div class="info">
            密码:   ${user.password}
        </div>
    </div>
    <div style="padding-right:198px;float:right;">
    <button type="submit" class="btn btn-primary ToUpdate" data1="${user.username}" data2="${user.mobile}" data3="${user.address}" data4="${user.password}" data6="${user.id}">
        修改信息
    </button>
    </div>
</div>



<div class="modal fade" id="myModalUpdate" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-title-background">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改对话框
                </h4>
            </div>
            <form id="formUpdate"
                  action="updateUserInfo"
                  method="post"
                  >
                <div class="modal-body">
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>用户名：</label>
                        </div>
                        <div class="col-lg-9">
                            <input hidden="hidden" id="userId" name="userId" />
                            <input type="text" id="nameUpdate" name="nameUpdate" class="form-control"/>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>手机号：</label>
                        </div>
                        <div class="col-lg-9">
                            <input type="text" id="mobileUpdate" name="mobileUpdate" class="form-control"/>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>地址：</label>
                        </div>
                        <div class="col-lg-9">
                            <input type="text" id="addressUpdate" name="addressUpdate" class="form-control"/>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>密码：</label>
                        </div>
                        <div class="col-lg-9">
                            <input type="text" id="passwordUpdate" name="passwordUpdate" class="form-control"/>
                        </div>
                    </div>

                <div class="modal-footer">
                    <button type="button" class="Update btn btn-primary">
                        修改
                    </button>
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">
                        关闭
                    </button>
                </div>
                </div>
            </form>
        </div>
    </div>
</div>



<%@ include file="../public/suffix.jsp" %>