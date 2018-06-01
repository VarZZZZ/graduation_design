<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../public/prefix.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="css/orders.css" rel="stylesheet" type="text/css">

<div class="bgTop">
    <div class="btTop2">
        <span>
            <a href="home">首页</a>
        </span>
        <span> ></span>
        <span>施工订单</span>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        var v={};
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
            <th style="width:18%;">操作</th>
        </tr>
        <c:forEach items="${constructList}" var="o" varStatus="st">
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
                <td>
                    ￥${o.orders.total}<br/>
                    <c:if test="${o.status=='施工安装服务已申请'}">
                        <a class="btn btnSet" style="border: solid 1px #806161;">${o.status}</a>
                    </c:if>
                    <c:if test="${o.status!='施工安装服务已申请'}">
                        <a href="checkConstruct?id=${o.id}"
                           class="btn btnSet">${o.status}</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>

    </table>

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
<%@ include file="../public/alertdialog.jsp" %>
<%@ include file="../public/footer.jsp" %>