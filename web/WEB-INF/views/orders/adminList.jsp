<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../public/adminPrefix.jsp" %>

<link href="css/orders.css" rel="stylesheet" type="text/css"/>

<div class="main-table">
    <table class="table table-bordered mytable">
        <tr>
            <th>订单编号</th>
            <th>订单明细</th>
            <th style="width:30%;">操作</th>
        </tr>
        <c:forEach items="${orders}" var="o" varStatus="st">
            <tr>
                <td>${o.code}</td>
                <td>
                    <table class="table">
                        <c:forEach items="${o.ordersItems}" var="c" varStatus="st">
                            <tr>
                                <td>
                                    <img class="imageStyle" style="width:40px;height:40px;" src="${c.product.imageurl}"/>
                                </td>
                                <td>${c.product.name}</td>
                                <td>${c.product.price}(元)</td>
                                <td>${c.number}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </td>
                <td>
                    ￥${o.total}<br/>
                    <c:choose>
                        <c:when test="${o.status=='待发货'}">
                            <a href="adminAddSend?id=${o.code}&total=${o.total}&status=${o.status}&uid=${o.uid}" class="btn btnSet">${o.status}</a>
                        </c:when>
                        <c:when test="${o.status=='待确认'}">
                            ${o.status}<br>
                            <a href="adminOrdLogistics?oid=${o.id}" class="btn btnSet">物流详情</a>
                        </c:when>
                        <c:otherwise>
                            ${o.status}
                        </c:otherwise>
                    </c:choose>

                </td>
            </tr>
        </c:forEach>
        <c:forEach items="${osOK}" var="o" varStatus="st">
            <tr>
                <td>${o.code}</td>
                <td>
                    <table class="table">
                        <c:forEach items="${o.ordersItems}" var="c" varStatus="st">
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
                    ￥${o.total}<br/>
                    <a href="adminCheckOrders?id=${o.id}" class="btn btnSet">${o.status}</a>
                </td>
            </tr>
        </c:forEach>

    </table>

</div>
<%@ include file="../public/footer.jsp" %>
<%@ include file="../public/alertdialog.jsp" %>