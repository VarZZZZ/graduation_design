<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../public/prefix.jsp" %>

<link href="css/orders.css" rel="stylesheet" type="text/css"/>

<div class="main-table">
    <table class="table table-bordered mytable">
        <tr>
            <th style="width:250px">订单编号</th>
            <th>订单明细</th>
            <th style="width:18%;">订单状态</th>
        </tr>
        <tr>
            <td>${construct.orders.code}</td>
            <td>
                <table class="table">
                    <c:forEach items="${construct.orders.ordersItems}" var="c" varStatus="st">
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
                ￥${construct.orders.total}<br/>
                订单状态：
                <c:if test="${construct.orders.status!='查看详情'}">
                    ${construct.orders.status}
                </c:if>
                <c:if test="${construct.orders.status=='查看详情'}">
                    <a href="viewOrder?id=${construct.orders.code}" class="btn btnSet">${construct.orders.status}</a>
                </c:if>
                </br>
                </br>
                施工状态：${construct.status}
            </td>
        </tr>

    </table>


    <style>
        label{
            font-size:20px;
        }
    </style>
    <div style="border-bottom: 1px solid rgba(0,0,0,.1);">
        <div style="border-bottom: 1px solid rgba(0,0,0,.1); width:890px; margin:0 auto;height: 41px;">
            <span style="font-size: 21px; float:left;">施工进度</span>
        </div>
        <c:forEach items="${construct.constructItems}" var="c">
            <div class="construct" style="border-bottom: 1px solid rgba(0,0,0,.1); width:890px;margin:0 auto;padding-top: 10px;">
                <div class="con_date" style="height:40px;">
                    <label style="float:left;padding-right:20px;">施工时间:</label>
                    <div class="date" style="float:left;padding-top:6px;">
                            ${c.date}
                    </div>
                </div>
                <div class="con_img" style="width:350px;height:350px;">
                    <label>施工现场照片：</label>
                    <div class="img" style="width:300px;height:300px;">
                        <img class="imageStyle" style="width:300px;height:300px;" src="${c.imageurl}" />
                    </div>
                </div>
                <div class="con_info" style="height:40px;">
                    <label style="float:left;">施工情况：</label>
                    <div class="info" style="float:left;padding-top:6px;" >
                            ${c.info}
                    </div>
                </div>
            </div>
        </c:forEach>


    </div>

</div>







<%@ include file="../public/suffix.jsp" %>



