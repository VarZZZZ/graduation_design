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
        <c:forEach items="${constructList}" var="o" varStatus="st">
            <tr>
                <td>${o.orders.code}</td>
                <td>
                    <table class="table">
                        <c:forEach items="${o.orders.ordersItems}" var="c" varStatus="st">
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
                    ￥${o.orders.total}<br/>
                    <a href="adminCheckConstruct?id=${o.id}" class="btn btnSet">${o.status}</a>
                </td>
            </tr>
        </c:forEach>


    </table>

</div>
<%@ include file="../public/footer.jsp" %>
<%@ include file="../public/alertdialog.jsp" %>