<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="../public/adminPrefix.jsp" %>

<link href="css/onlineMsg.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
    $(document).ready(function(){
        var mid;
        var info = "";
        $(".ToCreate").on("click",function () {
            $("#myModalCreate").modal("show");
            mid=$(this).attr("data1");
            $("#mid").val(mid);
        });
        $(".Create").on("click",function(){
            $(".Create").attr("type", "submit");
            $("formReplyCreate").submit();
        });


    });
</script>
<div class="bgTop">
    <div class="bgTop2">
        <span>
            <a href="home">首页</a>
        </span>
        <span> ></span>
        <span>留言回复</span>
    </div>
</div>
<div class="reply">
    <span>留言回复</span>
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
            <c:choose>
                <c:when test="${not empty o.onlineMsg.olReply}">
                    <p class="onlineReply" style="color:#b34949">
                        管理员回复： ${o.onlineMsg.olReply.recontent}
                    </p>
                    <div class="comment-message" style="height:18px;">
                        <div class="date">
                            <span>${o.onlineMsg.olReply.redate}</span>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="btnReply" style="height: 40px;">

                        <a type="button" class="btn btn-primary ToCreate"  data1="${o.onlineMsg.id}" style="color:white;">添加回复</a>

                    </div>

                </c:otherwise>
            </c:choose>

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
            <form id="formReplyCreate" action="addOnlineReply" method="post">
                <div class="modal-body">

                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>回复内容</label>
                        </div>
                        <input id="mid" name="mid" type="text" hidden="hidden"/>
                        <textarea class="textareaStyle" name="recontentCreate" style="margin-left: 15px;"
                                  cols="" rows="" id="recontentCreate">

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

<%@include file="../public/adminSuffix.jsp"%>