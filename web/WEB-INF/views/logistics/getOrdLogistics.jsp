<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../public/prefix.jsp" %>

<link href="css/orders.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
    $(document).ready(function () {
        var v = {};
        $(".btnConfirm").on("click", function () {
            v.id = $("#conf").val();
            $("#idConfirm").val(v.id);
            $("#myModalConfirm").modal("show");
        });
        $(".Confirm").on("click", function () {
            var id;
            v.id = $("#idConfirm").val();
            $.ajax({
                type: "POST",
                url: "addConfirm",
                data: {confirmObj: JSON.stringify(v)},
                success: function (json) {
                    if (json === "1") {
                        window.location.href = "listOrders";
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
                <input id="conf" value="${order.id}" type="hidden"/>
                <a class="btn btnSet btnConfirm" style="cursor: pointer;">${order.status}</a><br>
            </td>
        </tr>

    </table>

    <div>
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
</div>


<div class="modal fade" id="myModalConfirm" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-title-background">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    确认对话框
                </h4>
            </div>
            <div class="modal-body">
                您确认收到货吗?
            </div>
            <div class="modal-footer">
                <input id="idConfirm" hidden="hidden"/>
                <button type="button" class="Confirm btn btn-primary">
                    确认收货
                </button>
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">
                    关闭
                </button>
            </div>
        </div>
    </div>
</div>

<%@ include file="../public/footer.jsp" %>
<%@ include file="../public/alertdialog.jsp" %>