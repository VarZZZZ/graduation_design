<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../public/adminPrefix.jsp" %>

<link href="css/customization.css" rel="stylesheet" type="text/css">
<script>
    $(document).ready(function () {
        var id;
        var orPrice;
        $(".produce").on("click",function () {
            $("#myModalCreate").modal("show");
            id=$(this).attr("data");
            $("#id").val(id);
            orPrice=$(this).attr("data1");
            $("#orPrice").val(orPrice);
        });
        $(".Create").on("click",function(){
            $(".Create").attr("type","submit");
            $("formAdminCusCreate").submit();

        });

    })
</script>

<div class="bgTop">
    <div class="bgTop2">
        <span>
            <a href="home">首页</a>
        </span>
        <span> ></span>
        <span>产品定制</span>
    </div>
</div>


<div class="main-table">
    <table class="table table-bordered mytable">
        <tr>
            <th style="width:70px">定制编号</th>
            <th>定制用户</th>
            <th>定制明细</th>
            <th style="width:18%;">操作</th>
        </tr>
        <c:forEach items="${customizationVMList}" var="o" varStatus="st">
            <tr>
                <td>${o.customization.id}</td>
                <td>${o.user.username}</td>
                <td>
                    <table class="table">

                        <tr>
                            <td>
                                <img class="imageStyle" src="${o.product.imageurl}"/>
                            </td>
                            <td>${o.product.name}</td>
                            <c:choose>
                                <c:when test="${o.customization.price!=0.0}">
                                    <td>${o.customization.price}(元)</td>
                                </c:when>
                                <c:otherwise>
                                    <td>价格未定</td>
                                </c:otherwise>
                            </c:choose>
                            <td>${o.customization.number}</td>
                            <td>${o.customization.demand}</td>
                        </tr>

                    </table>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${o.customization.total!=0.0}">
                            ￥${o.customization.total}<br/>
                        </c:when>
                        <c:otherwise>
                            未定<br/>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${o.customization.status=='待发货'}">
                            <a href="adminAddCusSend?id=${o.customization.id}&total=${o.customization.total}&status=${o.customization.status}&uid=${o.user.id}" class="btn btnSet ">${o.customization.status}</a>
                        </c:when>
                        <c:when test="${o.customization.status=='待生产'}">
                            <a href="#" class="btn btnSet produce" data="${o.customization.id}" data1=" ${o.product.price}" >${o.customization.status}</a>
                        </c:when>
                        <c:otherwise>
                            ${o.customization.status}
                        </c:otherwise>
                    </c:choose>

                </td>
            </tr>
        </c:forEach>

    </table>

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
                    待生产对话框
                </h4>
            </div>
            <form id="formAdminCusCreate" action="CusProduce" method="post">
                <div class="modal-body">
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>产品原价</label>
                        </div>
                        <div class="col-lg-9 orPrice">
                            <input type="text" id="orPrice" name="orPrice" class="form-control" readonly="readonly" />
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>产品单价</label>
                        </div>
                        <div class="col-lg-9">
                            <input type="text" id=priceCreate" name="priceCreate" class="form-control"/>
                            <input type="text" id="id" name="id" hidden="hidden"/>
                        </div>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="Create btn btn-primary">
                        确定
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


<%@include file="../public/adminSuffix.jsp"%>