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
        <a href="customized" style="text-emphasis:none;">
            <span>产品定制</span>
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
                url: "addToCusPayment",
                data: { paymentObj: JSON.stringify(v) },
                success: function (json) {
                    if (json === "1") {
                        window.location.href="customized";
                    }else{
                        $("#Info").text("付款失败");
                        $("#myModalInfo").modal("show");
                    }
                }
            });
        });
    });
</script>

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

<%@ include file="../public/alertdialog.jsp" %>
<%@ include file="../public/footer.jsp" %>