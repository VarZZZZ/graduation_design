<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../public/prefix.jsp"%>

<link href="css/product.css" rel="stylesheet" type="text/css">
<div class="productList">
    <div class="productListTop">
        <span>
            <a href="home">首页</a>
        </span>
        <span> ></span>
        <span>全部产品</span>
        <c:if test="${not empty categoryA}">
            <span> ></span>
            <span><a href="#">${categoryA}</a></span>
            <c:if test="${not empty categoryB}">
                <span> ></span>
                <span><a href="#">${categoryB}</a></span>
            </c:if>
        </c:if>
    </div>
</div>
<div class="probg">
    <table class="proclasstable">
        <c:forEach items="${categoryAs}" var="ca" varStatus="st">
            <tr>
                <td class="table_td">
                    <span class="span_td">${ca.name}</span>
                </td>
                <td class="table_td2">
                    <c:forEach items="${ca.categoryBs}" var="cb" varStatus="st2">
                        <a class="a_td" href="#" style="text-decoration: none;">${cb.name}</a>
                        <span class="ca_split">|</span>
                    </c:forEach>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="wpline-wrapper horizontal-solid" style="width:1200px;border:none;border-top: 2px solid #cccccc;height: 0;margin:20px auto;"></div>
<script type="text/javascript">
    $(document).ready(function () {
        var v = {};
        var info="";

        $(".ToAddCart").on("click", function () {
            v.pid = $(this).attr("data1");
            $.ajax({
                type: "POST",
                url: "addCart",
                data: { cartObj: JSON.stringify(v) },
                success: function (json) {
                    if (json === "1") {
                        $("#Info").text("已添加到购物车");
                        $("#myModalInfo").modal("show");
                    }else{
                        $("#Info").text("添加失败");
                        $("#myModalInfo").modal("show");
                    }
                }
            });
        });
    });
</script>
<div class="product-container">
   <div class="product-titles">
       <h1 style="font-size:1.5em;">${theProduct.name}</h1>
   </div>
    <div class="product-side" style="float:left;width:302px;">
        <div class="product-img" style="border:1px solid #ddd">
            <a class="pimg" href="#">
                <img class="pic" src="${theProduct.imageurl}" style="width:300px;height:300px;">
            </a>
        </div>
    </div>
    <dic class="product-main" style="width:600px;float:left;margin-left:20px;">
        <div class="product-information" style="line-height:2;float:left;width:100%;">
            <div class="product-price" style="border-bottom:1px dotted #ddd;padding-bottom: 5px;margin-bottom: 5px;">
                <span class="label" style="float:left;width:5em;">销售价:</span>
                <span class="pprice" style="color:red;font-size: 166.66667%;line-height: 1.2;text-decoration: none;">
                   ￥${theProduct.price}
                </span>
            </div>
            <div class="product-params" style="height:30px;">
                <span class="label" style="float:left;width:5em;">产品编号:</span>
                <span class="code" style="float:left;width:5em;">${theProduct.code}</span>

            </div>
            <div class="product-params" style="height:30px;margin-top:6px;">
                <span class="label" style="float:left;width:5em;">颜色 :</span>
                <span class="color" style="float:left;width:5em;">红色</span>
            </div>
            <div class="product-params" style="height:30px;margin-top:6px;">
                <span class="label" style="float:left;width:5em;">产品描述 :</span>
                <span class="color" style="float:left;width:5em;">${theProduct.description}</span>
            </div>
            <div class="goods-action" style="margin-top:100px;">
                <a class="btn btn-major ToAddCart" href="javascript:void(0);" data1="${theProduct.id}" style="color:white;cursor:pointer;width:104px;height:40px;" rel="nofollow">
                            <span>
                                <span style="font-size:18px;">加入购物车</span>
                            </span>
                </a>
            </div>
        </div>
    </dic>
</div>



<%@ include file="../public/footer.jsp" %>
<%@ include file="../public/alertdialog.jsp" %>