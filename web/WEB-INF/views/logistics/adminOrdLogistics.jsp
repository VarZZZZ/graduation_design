<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../public/adminPrefix.jsp" %>

<link href="css/orders.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
    $(document).ready(function () {
            var v = {};
            var info = "";

            $(".addOrdLog").on("click", function () {
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
                if ($("#info").val() === "") {
                    info = "请填写物流信息";
                }

                if (info === "") {
                    $(".Create").attr("type", "submit");
                    $("formLogisticsAdd").submit();
                } else {
                    $("#Info").text(info);
                    $("#myModalInfo").modal("show");
                }
            });

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
            </td>
        </tr>

    </table>

    <div style="border-bottom: 1px solid rgba(0,0,0,.1); width:890px; margin:0 auto;height: 41px;">
        <span style="font-size: 21px; float:left;">物流信息</span>
        <span style="float: right;" class="btn btn-primary addOrdLog">添加物流信息</span>
    </div>
    <c:forEach items="${logistics.logisticsItemList}" var="lo" varStatus="st">
            <div class="logistics" style="width:800px;margin:0 auto;font-size:17px;padding-bottom:7px;">
                <span style="padding-left:50px;">${lo.date} :</span>
                <span style="padding-left:88px;">${lo.info}</span>
            </div>
    </c:forEach>

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
                    添加对话框
                </h4>
            </div>
            <form id="formLogisticsAdd"
                  action="addLogistics"
                  method="post"
                  enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>订单现在到达地</label>
                        </div>
                        <div class="col-lg-9">
                            <input hidden="hidden" id="oid" name="oid" value="${order.id}"/>
                            <input hidden="hidden" id="cusid" name="cusid" value="0" />
                            <input type="text" id="info" name="info" class="form-control"/>
                        </div>
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

<%@ include file="../public/footer.jsp" %>
<%@ include file="../public/alertdialog.jsp" %>