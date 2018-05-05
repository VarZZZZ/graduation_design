<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../public/prefix.jsp" %>
<link href="css/evaluation.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
    $(document).ready(function(){
        var v={};
        var info = "";
        $(".btnSubmit").on("click",function () {
            v.id=$("#id").val();
            v.evacontent=$("#evacontent").val();

            $.ajax({
                type: "POST",
                url:  "addToCusEvaluation",
                data: { evaluationObj: JSON.stringify(v) },
                success: function (json) {
                    if (json === "1") {
                        window.location.href="customized";
                    }else{
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
        <a href="customized" style="text-emphasis:none;">
            <span>我的定制</span>
        </a>
        <span> ></span>
        <span>评价</span>
    </div>
</div>
<div class="main-table-send" style="margin:10px auto;width:1200px;">
    <table class="table table-bordered mytable">
        <tr>
            <th style="width:250px">定制编号</th>
            <th>定制明细</th>
            <th style="width:18%;">总价</th>
        </tr>
        <tr>
            <td>${cusVM.customization.id}</td>
            <td>
                <table class="table">

                        <tr>
                            <td>
                                <img class="imageStyle" style="width:40px;height: 40px;" src="${cusVM.product.imageurl}"/>
                            </td>
                            <td>${cusVM.product.name}</td>
                            <td>${cusVM.customization.price}(元)</td>
                            <td>${cusVM.customization.number}</td>
                            <td>${cusVM.customization.demand}</td>
                        </tr>

                </table>
            </td>
            <td>
                ￥${cusVM.customization.total}<br/>
            </td>
        </tr>

    </table>

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
            <button type="submit" class="btn btn-primary Create btnSubmit" >评论</button>
        </div>
    </div>
</div>

</div>


<%@ include file="../public/suffix.jsp" %>