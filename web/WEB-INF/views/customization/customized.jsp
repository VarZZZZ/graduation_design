<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../public/prefix.jsp"%>

<link href="css/customization.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
    $(document).ready(function(){
        var v={};
        var info = "";
        $(".ToCreate").on("click",function () {
            $("#myModalCreate").modal("show");
        });
        $(".Create").on("click",function(){
            $(".Create").attr("type","submit");
            $("formCusCreate").submit();

        });

        var z={};
        $(".btnConfirm").on("click", function () {
            z.id = $("#conf").val();
            $("#idConfirm").val(z.id);
            $("#myModalConfirm").modal("show");
        });
        $(".Confirm").on("click", function () {
            var id;
            z.id = $("#idConfirm").val();
            $.ajax({
                type: "POST",
                url: "addCusConfirm",
                data: {confirmObj: JSON.stringify(z)},
                success: function (json) {
                    if (json === "1") {
                        window.location.href = "customized";
                    } else if (json === "0") {
                        $("#Info").text("确认失败");
                        $("#myModalInfo").modal("show");
                    }
                }
            });
        });


    });
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

<div class="sub-title">
    <h1 class="title-name">产品定制</h1>
    <p>我们以科技和品质为起点，为您提供更优质的服务，更有保障的管道产品，不止是PE，还有更多</p>
    <span>
        Product-Customized
    </span>
</div>

<div class="btnMsg">
    <button type="submit" class="btn btn-primary ToCreate" style="float:right;">添加定制</button>
</div>

<div class="main-table">
    <table class="table table-bordered mytable">
        <tr>
            <th style="width:70px">定制编号</th>
            <th>定制明细</th>
            <th style="width:18%;">操作</th>
        </tr>
        <c:forEach items="${customizationVMList}" var="o" varStatus="st">
            <tr>
                <td>${o.customization.id}</td>

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
                        <c:when test="${o.customization.status=='待确认'}">
                            <input id="conf" value="${o.customization.id}" type="hidden" />
                            <a class="btn btnSet btnConfirm">${o.customization.status}</a>
                        </c:when>
                        <c:when test="${o.customization.status=='待发货'||o.customization.status=='待生产'}">
                            <a class="btn btnSet" style="border: solid 1px #806161;">${o.customization.status}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="cusStatusCenter?id=${o.customization.id}&total=${o.customization.total}&status=${o.customization.status}"
                               class="btn btnSet">${o.customization.status}</a>
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
                    定制对话框
                </h4>
            </div>
            <form id="formCusCreate" action="addCustomized" method="post">
                <div class="modal-body">
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>产品名称</label>
                        </div>
                        <div class="col-lg-9">
                            <select id="pid" class="form-control"
                                    name="pid">
                                <c:forEach items="${productList}" var="p" varStatus="st">
                                    <option value="${p.id}">${p.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>产品数量</label>
                        </div>
                        <div class="col-lg-9">
                            <input type="text" id=numberCreate" name="numberCreate" class="form-control"/>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>定制需求</label>
                        </div>
                        <textarea class="textareaStyle" name="demandCreate" style="margin-left: 15px;"
                                  cols="" rows="" id="demandCreate">

                        </textarea>
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
                您确认收到货吗?
            </div>
            <div class="modal-footer">
                <input id="idConfirm" hidden="hidden"/>
                <button type="button" class="Confirm btn btn-primary">
                    确认收货
                </button>
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">
                    关闭
                </button>
            </div>
        </div>
    </div>
</div>


<%@include file="../public/suffix.jsp"%>