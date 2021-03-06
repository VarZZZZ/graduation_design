<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../public/prefix.jsp" %>

<link href="css/orders.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
    $(document).ready(function () {
        var v = {};
        var info = "";
        $(".btnReply").on("click", function () {
            $("#myModalCreate").modal("show");
        });

        $(".Create").on("click", function () {
            info = "";
            var browserCfg = {};
            var ua = window.navigator.userAgent;
            if (ua.indexOf("MSIE") >= 1) {
                browserCfg.ie = true;
            } else if (ua.indexOf("Firefox") >= 1) {
                browserCfg.firefox = true;
            } else if (ua.indexOf("Chrome") >= 1) {
                browserCfg.chrome = true;
            }
            if ($("#replyContent").val() === "") {
                info = "请填写回复内容";
            }

            if (info === "") {
                $("#formReplyCreate").submit();
//                v.code = $("#code").val();
//                v.content = $("#replyContent").val();
//                $.ajax({
//                    type: "POST",
//                    url: "addReply",
//                    data: {replyObj: JSON.stringify(v)},
//                    success: function (json) {
//                        if (json === "1") {
//                            window.location.href = "checkOrders";
//                        } else {
//                            $("#Info").text("修改失败");
//                            $("#myModalInfo").modal("show");
//                        }
//                    }
            }
//            } else {
//                $("#Info").text(info);
//                $("#myModalInfo").modal("show");
//            }
        });
        $(".btnUpdate").on("click", function () {
            $("#myModalUpdate").modal("show");
        });
        $(".Update").on("click", function () {
            info = "";
            var browserCfg = {};
            var ua = window.navigator.userAgent;
            if (ua.indexOf("MSIE") >= 1) {
                browserCfg.ie = true;
            } else if (ua.indexOf("Firefox") >= 1) {
                browserCfg.firefox = true;
            } else if (ua.indexOf("Chrome") >= 1) {
                browserCfg.chrome = true;
            }
            if ($("#replyUpdate").val() == "") {
                info = "请填写回复内容";
            }

        });

        $(".btnAddAfterSale").click(function(){
            $("#myModalCreate").modal("show");
        });
        $(".AFCreate").click(function(){
            $(".AFCreate").attr("type", "submit");
            $("formAfterSaleCreate").submit();
        })

    });
</script>

<div class="main-table">
    <table class="table table-bordered mytable">
        <tr>
            <th style="width:250px">订单编号</th>
            <th>订单明细</th>
            <th style="width:18%;">订单状态</th>
        </tr>
        <tr>
            <td>${order.code}</td>
            <td>
                <table class="table">
                    <c:forEach items="${order.ordersItems}" var="c" varStatus="st">
                        <tr>
                            <td>
                                <img class="imageStyle" style="width:40px;height: 40px;" src="${c.product.imageurl}"/>
                            </td>
                            <td>${c.product.name}</td>
                            <td>${c.product.price}(元)</td>
                            <td>${c.number}</td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
            <td>
                ￥${order.total}<br/>
                <c:if test="${empty construct}">
                    <c:if test="${not empty afterSale}">
                        售后状态：${afterSale.status}
                    </c:if>
                    <c:if test="${empty afterSale}">
                        <a class="btn btnSet btnAddAfterSale" style="cursor: pointer;" >申请售后</a><br>
                    </c:if>
                </c:if>

                <c:if test="${not empty construct}">
                    <c:if test="${construct.status=='施工安装服务已申请'}">
                        <a class="btn btnSet" style="border: solid 1px #806161;">${construct.status}</a>
                    </c:if>
                    <c:if test="${construct.status=='正在施工安装'}">
                        <a href="checkConstruct?id=${construct.id}"
                           class="btn btnSet">${construct.status}</a>
                    </c:if>
                    <c:if test="${construct.status=='施工安装已完成'}">
                        <a href="checkConstruct?id=${construct.id}"
                           class="btn btnSet">${construct.status}</a></br>
                        <c:if test="${not empty afterSale}">
                            售后状态：${afterSale.status}
                        </c:if>
                        <c:if test="${empty afterSale}">
                            <a class="btn btnSet btnAddAfterSale" style="cursor: pointer;" >申请售后</a><br>
                        </c:if>
                    </c:if>
                </c:if>

            </td>
        </tr>

    </table>

    <input id="code" value="${order.code}" hidden="hidden"/>

    <div style="border-bottom: 1px solid rgba(0,0,0,.1);">
        <div style="border-bottom: 1px solid rgba(0,0,0,.1); width:890px; margin:0 auto;height: 41px;">
            <span style="font-size: 21px; float:left;">物流信息</span>
        </div>
        <c:forEach items="${logistics.logisticsItemList}" var="lo" varStatus="st">
            <div class="logistics" style="width:800px;margin:0 auto;font-size:17px;padding-bottom:7px;">
                <span style="padding-left:50px;">${lo.date} :</span>
                <span style="padding-left:88px;">${lo.info}</span>
            </div>
        </c:forEach>
    </div>

    <div class="form-content">
        <div class="row rowStyle">
            <div class="col-lg-2">
                <label>具体评价</label>
            </div>
            <div class="col-lg-9">
                <input id="id" value="${order.id}" hidden="hidden"/>
                <textarea class="textareaStyle"
                          cols="" rows="" id="evacontent" name="evacontent" readonly style="cursor:default">
                    ${evaluation.evacontent}
                </textarea>
            </div>
        </div>
        <c:choose>
            <c:when test="${empty reply}">

            </c:when>
            <c:otherwise>
                <div class="row rowStyle">
                    <div class="col-lg-2">
                        <label>回复内容</label>
                    </div>
                    <div class="col-lg-9">
        <textarea class="textareaStyle"
                  cols="" rows="" id="reply" name="reply" readonly style="cursor:default">
                ${reply.content}
        </textarea>
                    </div>
                </div>

            </c:otherwise>
        </c:choose>


    </div>

</div>


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
                    售后申请
                </h4>
            </div>
            <form id="formAfterSaleCreate" action="addAfterSale" method="post">
                <div class="modal-body">

                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>申请原因</label>
                        </div>
                        <input id="oid" value="${order.id}" name="oid" type="text" hidden="hidden"/>
                        <input id="ocode" value="${order.code}" name="ocode" type="text" hidden="hidden" />
                        <textarea class="textareaStyle" name="infoCreate" style="margin-left: 15px;"
                                  cols="" rows="" id="infoCreateCreate">

                        </textarea>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="AFCreate btn btn-primary">
                        确认申请
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




<%@ include file="../public/suffix.jsp" %>



