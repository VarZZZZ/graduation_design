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
        <span><a href="listProduct">全部产品</a></span>
        <c:if test="${not empty categoryA}">
            <span> ></span>
            <span><a href="listProduct?categoryA=${categoryA}">${categoryA}</a></span>
            <c:if test="${not empty categoryB}">
                <span> ></span>
                <span><a href="listProduct?categoryA=${categoryA}&&categoryB=${categoryB}">${categoryB}</a></span>
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
                        <a class="a_td" href="listProduct?categoryA=${ca.name}&&categoryB=${cb.name}" style="text-decoration: none;">${cb.name}</a>
                        <span class="ca_split">|</span>
                    </c:forEach>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="wpline-wrapper horizontal-solid" style="width:1200px;border:none;border-top: 2px solid #cccccc;height: 0;margin:20px auto;"/>
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
<div class="gallery-show">
    <div class="gallery-grid">
        <ul class="clearfix">
            <c:forEach items="${products}" var="p" varStatus="st">
                <li class="goods-item" style="width:300px;">
                    <div class="goods-pic" style="width:200px;height:200px;line-height:198px;">
                        <a href="theProduct?pid=${p.id}">
                            <img class="action-goods-img" style="width:200px;height:200px" src="${p.imageurl}"/>
                        </a>
                    </div>
                    <div class="goods-info" style="height:50px;margin-top:5px;">
                        <h3 class="goods-name">
                            <a href="theProduct?pid=${p.id}" style="text-decoration: none;">${p.name}</a>
                        </h3>
                        <div class="goods-price">
                            <ins class="price">￥${p.price}</ins>
                        </div>
                    </div>
                    <div class="goods-action">
                        <a class="btn btn-major ToAddCart" href="javascript:void(0);" data1="${p.id}" style="color:white;cursor:pointer" rel="nofollow">
                            <span>
                                <span style="font-size:12px;">加入购物车</span>
                            </span>
                        </a>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

<%@ include file="../public/footer.jsp" %>
<%@ include file="../public/alertdialog.jsp" %>
