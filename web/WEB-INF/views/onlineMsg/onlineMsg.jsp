<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../public/prefix.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="css/onlineMsg.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
    $(document).ready(function(){
        var v={};
        var info = "";
        $(".ToCreate").on("click",function () {
            $("#myModalCreate").modal("show");
        });
        $(".Create").on("click",function(){
            v.theme=$("#themeCreate").val();
            v.content=$("#contentCreate").val();
            $.ajax({
                type: "POST",
                url:  "addOnlineMsg",
                data: { onlineMsgObj: JSON.stringify(v) },
                success: function (json) {
                    if (json === "1") {
                        window.location.href="listOnlineMsg";
                    }else{
                        $("#Info").text("留言失败");
                        $("#myModalInfo").modal("show");
                    }
                }
            })
        });


    });
</script>
<div class="bgTop">
    <div class="bgTop2">
        <span>
            <a href="home">首页</a>
        </span>
        <span> ></span>
        <span>在线留言</span>
    </div>
</div>

<div class="sub-title">
    <h1 class="title-name">在线留言</h1>
    <p>我们以科技和品质为起点，为您提供更优质的服务，更有保障的管道产品，不止是PE，还有更多</p>
    <span>
        Online-Message
    </span>
</div>
<div class="btnMsg">
    <button type="submit" class="btn btn-primary ToCreate" >添加留言</button>
</div>

<c:forEach items="${onlineMsgList}" var="o" varStatus="st" >
    <div class="Allbg">
        <div class="user-info">
           用户名： ${o.user.username}
        </div>
        <div class="comment">
            <p class="theme">
               <span style="color:blue">主题：</span>  ${o.onlineMsg.theme}
            </p>
            <p class="onlineMsg">
                ${o.onlineMsg.content}
            </p>
            <div class="comment-message" style="height:18px;">
                <div class="date">
                    <span>${o.onlineMsg.date}</span>
                </div>
            </div>
            <c:if test="${not empty o.onlineMsg.olReply}">
                <p class="onlineReply" style="color:#b34949">
                       管理员回复： ${o.onlineMsg.olReply.recontent}
                </p>
                <div class="comment-message" style="height:18px;">
                    <div class="date">
                        <span>${o.onlineMsg.olReply.redate}</span>
                    </div>
                </div>
            </c:if>
        </div>
    </div>

</c:forEach>


<div class="modal fade" id="myModalCreate" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-title-background">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    添加对话框
                </h4>
            </div>
            <form id="formMsgCreate">
                <div class="modal-body">
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>留言主题</label>
                        </div>
                        <div class="col-lg-9">
                            <input type="text" id="themeCreate" name="themeCreate" class="form-control"/>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>留言内容</label>
                        </div>
                        <textarea class="textareaStyle" name="contentCreate" style="margin-left: 15px;"
                                  cols="" rows="" id="contentCreate">

                        </textarea>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="Create btn btn-primary">
                        添加
                    </button>
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">
                        关闭
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<%@include file="../public/suffix.jsp"%>