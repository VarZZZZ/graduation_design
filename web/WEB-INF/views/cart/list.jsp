<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../public/prefix.jsp"%>

<link href="css/cart.css" rel="stylesheet" type="text/css">
<div class="bgTop">
    <div class="btTop2">
        <span>
            <a href="home">首页</a>
        </span>
        <span> ></span>
        <span>我的购物车</span>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        var v = {};
        var info="";

        $(".ToUpdate").on("click", function () {
            v.id = $(this).attr("data1");
            v.number = $(this).attr("data2");
            $("#idUpdate").val(v.id);
            $("#numberUpdate").val(v.number);
            $("#myModalUpdate").modal("show");
        });
        $(".Update").on("click", function () {
            info="";
            if($("#numberUpdate").val()===""){
                info="请填写数量";
            }

            if(info==""){
                v.id=$("#idUpdate").val();
                v.number=$("#numberUpdate").val();
                $.ajax({
                    type: "POST",
                    url: "updateCartItem",
                    data: { cartItemObj: JSON.stringify(v) },
                    success: function (json) {
                        if (json == "1") {
                            window.location.href="listCart";
                        }else{
                            $("#Info").text("修改失败");
                            $("#myModalInfo").modal("show");
                        }
                    }
                });
            }else{
                $("#Info").text(info);
                $("#myModalInfo").modal("show");
            }
        });
        $(".ToDelete").on("click", function () {
            v.id = $(this).attr("IdToDelete");
            $.ajax({
                type: "POST",
                url: "deleteCartItem",
                data: { cartItemObj: JSON.stringify(v) },
                success: function (json) {
                    if (json == "1") {
                        window.location.href="listCart";
                    }else{
                        $("#Info").text("删除失败");
                        $("#myModalInfo").modal("show");
                    }
                }
            });
        });
        $(".ToSubmit").on("click", function () {
            var t;
            t=$("#testT").attr("dataT");
            if(t<=0)
                window.location.href="listCart";
            else{
                $.ajax({
                    type: "POST",
                    url: "addToOrders",
                    success: function (json) {
                        if (json === "1") {
                            window.location.href="home";
                        }else{
                            $("#Info").text("添加失败");
                            $("#myModalInfo").modal("show");
                        }
                    }
                });
            }

        });
    });
</script>
<div class="main-table">
    <table class="table table-bordered mytable">
        <tr>
            <th>产品图片</th>
            <th>产品名称</th>
            <th>产品价格</th>
            <th>数量</th>
            <th style="width:30%;">操作</th>
        </tr>
        <c:forEach items="${cart.cartItems}" var="c" varStatus="st">
            <tr>
                <td>
                    <img class="imageStyle" src="${c.product.imageurl}" />
                </td>
                <td>${c.product.name}</td>
                <td>${c.product.price}(元)</td>
                <td>${c.number}</td>

                <td>
                    <a href="javascript:void(0);"
                       class="ToUpdate btn btnSet"
                       data1="${c.id}"
                       data2="${c.number}" >
                        修改数量
                    </a>
                    <a href="javascript:void(0);"
                       class="ToDelete btn btnSet"
                       IdToDelete="${c.id}">
                        移除产品
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="totalDiv">
        <label id="testT" class="labelStyle" dataT="${total}">总价:${total}(元)</label>

        <br>
        <a href="javascript:void(0);"
           class="ToSubmit btn btnBuy">
            提交订单
        </a>
    </div>
</div>

<div class="modal fade" id="myModalUpdate" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-title-background">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改对话框
                </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-3">
                        <label>数量</label>
                    </div>
                    <div class="col-lg-9">
                        <input id="idUpdate" hidden="hidden" />
                        <input class="form-control" id="numberUpdate" />
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="Update btn btn-primary">
                    修改
                </button>
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">
                    关闭
                </button>
            </div>
        </div>
    </div>
</div>

<%@ include file="../public/footer.jsp" %> 
