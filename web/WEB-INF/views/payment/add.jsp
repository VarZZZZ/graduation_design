<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../public/prefix.jsp" %>
<link href="css/payment.css" rel="stylesheet" type="text/css"/>
<div class="bgTop">
    <div class="btTop2">
        <span>
            <a href="home" style="text-emphasis:none;">首页</a>
        </span>
        <span> ></span>
        <a href="listOrders" style="text-emphasis:none;">
            <span>我的订单</span>
        </a>
        <span> ></span>
        <span>付款</span>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function () {
        var v = {};
        var info="";
        $(".Create").on("click", function () {
            v.id=$("#id").val();
            v.total=$("#total").val();
            v.accountid=$("#accountid").val();
            v.type=$("#type option:selected").val();

            $.ajax({
                type: "POST",
                url: "addToPayment",
                data: { paymentObj: JSON.stringify(v) },
                success: function (json) {
                    if (json == "1") {
                        window.location.href="listOrders";
                    }else{
                        $("#Info").text("付款失败");
                        $("#myModalInfo").modal("show");
                    }
                }
            });
        });

        var z={};
        $(".btnService").on("click", function () {
            z.id = $(this).attr("data1");
            z.code=$(this).attr("data2");
            z.total=$(this).attr("data3");
            $("#myModalService").modal("show");
        });
        $(".Confirm").on("click", function () {
            var id;
            v.id = $("#idConfirm").val();
            $.ajax({
                type: "POST",
                url: "addConfirm",
                data: {"oid":z.id,"ocode":z.code,"ototal":z.total},
                success: function (json) {
                    if (json === "1") {
                        window.location.href = "addPayment?id="+z.code+"total="+z.total;
                    } else if (json === "0") {
                        $("#Info").text("确认失败");
                        $("#myModalInfo").modal("show");
                    }
                }
            });
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
        <td>${orders.code}</td>
        <td>
            <table class="table">
                <c:forEach items="${orders.ordersItems}" var="c" varStatus="st">
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
            ￥${orders.total}<br/>
            <c:if test="${empty construct}">
                <a class="btn btnSet btnService" data1="${orders.id}" data2="${orders.code}" data3="${orders.total}" style="cursor: pointer;">施工安装服务</a><br>
            </c:if>
            <c:if test="${not empty construct}">
                <a class="btn btnSet" style="border: solid 1px #806161;">${construct.status}</a>
            </c:if>
        </td>
    </tr>

</table>
</div>

<div class="form-content">
    <div class="formtitle">
        <span>付款信息</span>
    </div>

    <div class="row rowStyle">
        <div class="col-lg-2">
            <label>付款方式</label>
        </div>
        <div class="col-lg-9">
            <input id="id" value="${id}" hidden="hidden"/>
            <select id="type" class="form-control">
                <option>支付宝支付</option>
                <option>微信支付</option>
                <option>中国农业银行</option>
                <option>中国建设银行</option>
                <option>中国工商银行</option>
                <option>中国银行</option>
                <option>浦发银行</option>
                <option>交通银行</option>
                <option>民生银行</option>
            </select>
        </div>
    </div>

    <div class="row rowStyle">
        <div class="col-lg-2">
            <label>付款账号</label>
        </div>
        <div class="col-lg-9">
            <input class="form-control" id="accountid"/>
        </div>
    </div>
    <div class="row rowStyle">
        <div class="col-lg-2">
            <label>付款金额</label>
        </div>
        <div class="col-lg-9">
            <input class="form-control" id="total" value="${total}" readonly="readonly"/>
        </div>
    </div>

    <div class="row rowStyle">
        <div class="col-lg-2">
        </div>
        <div class="col-lg-9">
            <button type="submit" class="btn btn-primary Create" >付款</button>
        </div>
    </div>
</div>

<div class="modal fade" id="myModalService" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-title-background">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    施工安装服务对话框
                </h4>
            </div>
            <div class="modal-body">
                确定需要施工安装服务吗？</br>
                <span style="font-size:9px;">提示：安装价格面议</span>
            </div>
            <div class="modal-footer">
                <input id="idConfirm" hidden="hidden"/>
                <button type="button" class="Confirm btn btn-primary">
                    确认
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