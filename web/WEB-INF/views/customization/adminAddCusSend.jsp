<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../public/adminPrefix.jsp" %>

<link href="css/send.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
    $(document).ready(function () {
        var v = {};
        var info="";
        $(".Create").on("click", function () {
            v.id=$("#id").val();
            v.companyname=$("#companyname option:selected").val();
            v.companycode=$("#companycode").val();
            v.companyweb=$("#companyweb").val();
            v.username=$("#username").val();
            v.userphone=$("#userphone").val();
            v.useraddress=$("#useraddress").val();
            $.ajax({
                type: "POST",
                url: "addToCusSend",
                data: { sendObj: JSON.stringify(v) },
                success: function (json) {
                    if (json === "1") {
                        window.location.href="adminCustomized";
                    }else{
                        $("#Info").text("发货失败");
                        $("#myModalInfo").modal("show");
                    }
                }
            });
        });
    });
</script>

<div class="main-table-send" style="margin-top:10px;">
    <table class="table table-bordered mytable">
        <tr>
            <th style="width:250px">定制编号</th>
            <th>定制明细</th>
            <th style="width:18%;">定制状态</th>
        </tr>
        <tr>
            <td>${cusVm.customization.id}</td>
            <td>
                <table class="table">

                        <tr>
                            <td>
                                <img class="imageStyle" style="width:40px;height: 40px;" src="${cusVm.product.imageurl}"/>
                            </td>
                            <td>${cusVm.product.name}</td>
                            <td>${cusVm.product.price}(元)</td>
                            <td>${cusVm.customization.number}</td>
                            <td>${cusVm.customization.demand}</td>
                        </tr>

                </table>
            </td>
            <td>
                ￥${cusVm.customization.total}<br/>
                ${cusVm.customization.status}
            </td>
        </tr>

    </table>

    <div class="form-content">
        <div class="formtitle">
            <span>发货信息</span>
        </div>

        <div class="row rowStyle">
            <div class="col-lg-2">
                <label>物流公司</label>
            </div>
            <div class="col-lg-9">
                <input id="id" value="${id}" hidden="hidden"/>
                <select id="companyname" class="form-control">
                    <option>顺丰速运</option>
                    <option>圆通快递</option>
                    <option>申通快递</option>
                    <option>中通快递</option>
                    <option>国通快递</option>
                    <option>韵达快递</option>
                    <option>百世汇通</option>
                    <option>天天快递</option>
                    <option>中国邮政</option>
                    <option>优速快递</option>
                </select>
            </div>
        </div>

        <div class="row rowStyle">
            <div class="col-lg-2">
                <label>物流单号</label>
            </div>
            <div class="col-lg-9">
                <input class="form-control" id="companycode"/>
            </div>
        </div>
        <div class="row rowStyle">
            <div class="col-lg-2">
                <label>公司网址</label>
            </div>
            <div class="col-lg-9">
                <input class="form-control" id="companyweb"/>
            </div>
        </div>

        <div class="row rowStyle">
            <div class="col-lg-2">
                <label>收货人</label>
            </div>
            <div class="col-lg-9">
                <input class="form-control" id="username"/>
            </div>
        </div>
        <div class="row rowStyle">
            <div class="col-lg-2">
                <label>联系电话</label>
            </div>
            <div class="col-lg-9">
                ${myuser.mobile}
            </div>
        </div><div class="row rowStyle">
        <div class="col-lg-2">
            <label>地址</label>
        </div>
        <div class="col-lg-9">
            ${address.address}
        </div>
    </div>
        <div class="row rowStyle">
            <div class="col-lg-2">

            </div>
            <div class="col-lg-9">
                <button type="submit" class="btn btn-primary Create" >发货</button>
            </div>
        </div>
    </div>

</div>


<%@ include file="../public/alertdialog.jsp" %>
<%@ include file="../public/adminSuffix.jsp" %>