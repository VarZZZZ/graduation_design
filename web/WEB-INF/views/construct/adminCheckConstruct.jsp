<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../public/adminPrefix.jsp" %>

<link href="css/orders.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
    $(document).ready(function(){
        var v = {};
        var info="";

        $(".ToAdd").on("click", function () {
            $("#myModalCreate").modal("show");
        });

        $(".Create").on("click", function () {
            info = "";
            var browserCfg = {};
            var ua = window.navigator.userAgent;
            if (ua.indexOf("MSIE") >= 1) {
                browserCfg.ie = true;
            } else if (ua.indexOf("Firefox") >= 1) {
                browserCfg.firefox = true;
            } else if (ua.indexOf("Chrome") >= 1) {
                browserCfg.chrome = true;
            }
            if ($("#info").val() === "") {
                info = "请填写施工详情";
            }
            var imageurl = $("#imageurl").val();
            if (imageurl ==="") {
                info = "请选择商品图片";
            }


            if (info === "") {
                $(".Create").attr("type", "submit");
                $("formConstructAdd").submit();
            } else {
                $("#Info").text(info);
                $("#myModalInfo").modal("show");
            }
        });

        var z={};
        $(".ToComplete").on("click", function () {
            z.id = $("#id").val();
            $("#myModalConfirm").modal("show");
        });
        $(".Confirm").on("click", function () {
            $.ajax({
                type: "POST",
                url: "adminConstructDone",
                data: {"id":z.id},
                success: function (json) {
                    if (json === "1") {
                        window.location.href = "adminCheckConstruct?id="+z.id;
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
            <th style="width:25%;">订单状态</th>
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
                    <a href="adminCheckOrders?id=${construct.orders.id}" class="btn btnSet">${construct.orders.status}</a>
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
            <c:if test="${construct.status!='施工安装已完成'}">
                <button class="btn btn-primary ToAdd" style="float:right;">添加施工进度</button>
                <button class="btn btn-primary ToComplete"  style="float:right;">施工完成</button>
            </c:if>

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


<div class="modal fade" id="myModalCreate" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-title-background">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel2">
                    添加施工进度对话框
                </h4>
            </div>
            <form id="formConstructAdd"
                  action="addConstructItem"
                  method="post"
                  enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>施工情况</label>
                        </div>
                        <div class="col-lg-9">
                            <input hidden="hidden" id="id" name="id" value="${construct.id}"/>
                           <textarea class="textareaStyle" name="info" style="width:356px;"
                                     cols="" rows="" id="info">

        				</textarea>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>施工图片</label>
                        </div>
                        <div class="col-lg-9">
                            <input type="file" id="imageurl" name="imageurl"/>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="Create btn btn-primary">
                        添加
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


<div class="modal fade" id="myModalConfirm" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-title-background">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    确认对话框
                </h4>
            </div>
            <div class="modal-body">
                施工是否已经完成?
            </div>
            <div class="modal-footer">
                <input id="idConfirm" hidden="hidden"/>
                <button type="button" class="Confirm btn btn-primary">
                    是
                </button>
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">
                    否
                </button>
            </div>
        </div>
    </div>
</div>


<%@ include file="../public/adminSuffix.jsp" %>



