<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../public/prefix.jsp" %>
<link href="css/evaluation.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
    $(document).ready(function () {
        var v = {};
        var info = "";
        $(".btnSubmit").on("click", function () {
            v.id = $("#id").val();
            v.evacontent = $("#evacontent").val();

            $.ajax({
                type: "POST",
                url: "addToEvaluation",
                data: {evaluationObj: JSON.stringify(v)},
                success: function (json) {
                    if (json === "1") {
                        window.location.href = "listOrders";
                    } else {
                        $("#Info").text("评论失败");
                        $("#myModalInfo").modal("show");
                    }
                }
            })
        })
    })
</script>
<div class="bgTop" style="margin:5px auto;width:1200px;">
    <div class="btTop2">
        <span>
            <a href="home" style="text-emphasis:none;">首页</a>
        </span>
        <span> ></span>
        <a href="listOrders" style="text-emphasis:none;">
            <span>我的订单</span>
        </a>
        <span> ></span>
        <span>评价订单</span>
    </div>
</div>
<div class="main-table-send" style="margin:10px auto;width:1200px;">
    <table class="table table-bordered mytable">
        <tr>
            <th style="width:250px">订单编号</th>
            <th>订单明细</th>
            <th style="width:18%;">总价</th>
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
                    </c:if>
                </c:if>

            </td>
        </tr>

    </table>
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
    <div class="form-content" style="margin-top:25px;width:100%">
        <div class="formtitle" style="font-size:22px;float:left;">
            <span>订单评价</span>
        </div>

    </div>
    <div class="row rowStyle" style="width:500px;">
        <div class="col-lg-2">
            <input id="id" value="${id}" hidden="hidden"/>
            <textarea class="textareaStyle"
                      cols="" rows="" id="evacontent" name="evacontent"></textarea>
        </div>
        <div class="col-lg-9" style="width: 20px;margin-top: 202px;margin-left: 0px;">
            <button type="submit" class="btn btn-primary Create btnSubmit">评论</button>
        </div>
    </div>
</div>

</div>


<%@ include file="../public/suffix.jsp" %>