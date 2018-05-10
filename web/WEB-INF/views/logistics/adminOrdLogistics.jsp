<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../public/adminPrefix.jsp" %>

<link href="css/orders.css" rel="stylesheet" type="text/css"/>

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

    <div style="border-bottom: 1px solid rgba(0,0,0,.1); width:890px; margin:0 auto;">
        <span style="font-size: 21px; float:left;">物流信息</span>
        <span style="float: right;" class="btn btn-primary">添加物流信息</span>
    </div>
    <c:forEach items="${logistics.logisticsItemList}" var="lo" varStatus="st">
            <div class="logistics">
                <span>${lo.date} :</span>
                <span>${lo.info}</span>
            </div>
    </c:forEach>

</div>

<%@ include file="../public/footer.jsp" %>
<%@ include file="../public/alertdialog.jsp" %>