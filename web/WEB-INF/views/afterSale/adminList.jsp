<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../public/adminPrefix.jsp" %>

<link href="css/orders.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
    $(document).ready(function () {
        var v={};
        $(".btnApplied").on("click", function () {
            v.id = $(this).attr("data1");
            v.status = $(this).attr("data2");
            $("#myModalApplied").modal("show");
        });
        $(".btnServicing").on("click",function () {
            v.id = $(this).attr("data1");
            v.status = $(this).attr("data2");
            $("#myModalServicing").modal("show");
        });
        $(".Confirm").on("click", function () {
            $.ajax({
                type: "POST",
                url: "statusAfterSale",
                data: {afterSaleObj: JSON.stringify(v)},
                success: function (json) {
                    if (json === "1") {
                        window.location.href = "listAdminAfterSale";
                    } else if (json === "0") {
                        $("#Info").text("确认失败");
                        $("#myModalInfo").modal("show");
                    }
                }
            });
        });
    })
</script>

<div class="main-table">
    <table class="table table-bordered mytable">
        <tr>
            <th>订单编号</th>
            <th>订单明细</th>
            <th>售后原因</th>
            <th style="width:30%;">操作</th>
        </tr>
        <c:forEach items="${afterSaleOrdersVMS}" var="o" varStatus="st">
            <tr>
                <td>${o.orders.code}</td>

                <td>
                    <table class="table">
                        <c:forEach items="${o.orders.ordersItems}" var="c" varStatus="st">
                            <tr>
                                <td>
                                    <img class="imageStyle" src="${c.product.imageurl}"/>
                                </td>
                                <td>${c.product.name}</td>
                                <td>${c.product.price}(元)</td>
                                <td>${c.number}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </td>
                <td>${o.afterSale.info}</td>
                <td>
                    ￥${o.orders.total}<br/>
                    <c:if test="${o.afterSale.status=='已完成'}">
                        <a class="btn btnSet"  style="border: solid 1px #806161;">${o.afterSale.status}</a>
                    </c:if>
                    <c:if test="${o.afterSale.status=='已申请'}">
                        <a class="btn btnSet btnApplied" data1="${o.afterSale.id}" data2="${o.afterSale.status}"  style="cursor: pointer;">${o.afterSale.status}</a><br>
                        <%--<a href="statusAfterSale?id=${o.afterSale.id}&status=${o.afterSale.status}" class="btn btnSet">${o.afterSale.status}</a>--%>
                    </c:if>
                    <c:if test="${o.afterSale.status=='正在维修'}">
                        <a class="btn btnSet btnServicing" data1="${o.afterSale.id}" data2="${o.afterSale.status}" style="cursor: pointer;">${o.afterSale.status}</a><br>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>

</div>


<div class="modal fade" id="myModalApplied" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-title-background">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    维修对话框
                </h4>
            </div>
            <div class="modal-body">
                是否进行售后维修
            </div>
            <div class="modal-footer">
                <button type="button" class="Confirm btn btn-primary">
                    是
                </button>
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">
                    否
                </button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModalServicing" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-title-background">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModal">
                    维修完成对话框
                </h4>
            </div>
            <div class="modal-body">
                售后维修是否完成
            </div>
            <div class="modal-footer">
                <button type="button" class="Confirm btn btn-primary">
                    是
                </button>
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">
                    否
                </button>
            </div>
        </div>
    </div>
</div>
<%@ include file="../public/footer.jsp" %>
<%@ include file="../public/alertdialog.jsp" %>