<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../public/adminPrefix.jsp"%>

<link href="css/productAdmin.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
    $(document).ready(function () {
        var v = {};
        var info="";

        $(".ToCreate").on("click", function () {
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
            if ($("#codeCreate").val() == "") {
                info = "请填写产品编号";
            }
            if ($("#nameCreate").val() == "") {
                info = "请填写产品名称";
            }
            if ($("#priceCreate").val() == "") {
                info = "请填写产品价格";
            }
            if (!(/^[0-9]+\.?[0-9]*$/.test($("#priceCreate").val()))) {
                info = "价格格式不正确";
            }
            var imageurl = $("#imageurlCreate").val();
            if (imageurl ==="") {
                info = "请选择商品图片";
            } else {
                var strExtension = imageurl.substr(imageurl.lastIndexOf('.') + 1);
                if (strExtension != 'jpg' && strExtension != 'gif'
                    && strExtension != 'png' && strExtension != 'bmp') {
                    info = "只支持.jpg .png .gif .bmp格式的图片";
                }
                var obj_file = document.getElementById("imageurlCreate");
                if (browserCfg.firefox || browserCfg.chrome) {
                    filesize = obj_file.files[0].size;
                }
                if (filesize > 4 * 1024 * 1024) {
                    info = "图片大小不能超过4M字节";
                }
            }

            if (info === "") {
                $(".Create").attr("type", "submit");
                $("formProductCreate").submit();
            } else {
                $("#Info").text(info);
                $("#myModalInfo").modal("show");
            }
        });

        $(".ToUpdate").on("click", function () {
            v.id = $(this).attr("data1");
            v.code = $(this).attr("data2");
            v.name = $(this).attr("data3");
            v.price = $(this).attr("data4");
            v.description = $(this).attr("data5");
            v.cid = $(this).attr("data6");
            v.color=$(this).attr("data7");
            $("#idUpdate").val(v.id);
            $("#codeUpdate").val(v.code);
            $("#nameUpdate").val(v.name);
            $("#priceUpdate").val(v.price);
            $("#descriptionUpdate").val(v.description);
            $("#cidUpdate").val(v.cid);
            $("#colorUpdate").val(v.color);
            $("#myModalUpdate").modal("show");
        });
        $(".Update").on("click", function () {
            info="";
            var  browserCfg = {};
            var ua = window.navigator.userAgent;
            if (ua.indexOf("MSIE")>=1){
                browserCfg.ie = true;
            }else if(ua.indexOf("Firefox")>=1){
                browserCfg.firefox = true;
            }else if(ua.indexOf("Chrome")>=1){
                browserCfg.chrome = true;
            }
            if($("#codeUpdate").val()==""){
                info="请填写产品编号";
            }
            if($("#nameUpdate").val()==""){
                info="请填写产品名称";
            }
            if($("#priceUpdate").val()==""){
                info="请填写产品价格";
            }
            if (!(/^[0-9]+\.?[0-9]*$/.test($("#priceUpdate").val()))) {
                info = "价格格式不正确";
            }
            var imageurl=$("#imageurlCreate").val();
            if(imageurl==""){

            }else{
                var strExtension = imageurl.substr(imageurl.lastIndexOf('.') + 1);
                if (strExtension != 'jpg' && strExtension != 'gif'
                    && strExtension != 'png' && strExtension != 'bmp') {
                    info="只支持.jpg .png .gif .bmp格式的图片";
                }
                var obj_file = document.getElementById("imageurlCreate");
                if(browserCfg.firefox || browserCfg.chrome ){
                    filesize = obj_file.files[0].size;
                }
                if(filesize>4*1024*1024){
                    info="图片大小不能超过4M字节";
                }
            }
            if(info==""){
                $(".Update").attr("type","submit");
                $("formUpdate").submit();
            }else{
                $("#Info").text(info);
                $("#myModalInfo").modal("show");
            }
        });
        $(".ToDelete").on("click", function () {
            v.id = $(this).attr("IdToDelete");
            $("#idDelete").val(v.id);
            $("#myModalDelete").modal("show");
        });
        $(".Delete").on("click", function () {
            v.id=$("#idDelete").val();
            $.ajax({
                type: "POST",
                url: "deleteProduct",
                data: { productObj: JSON.stringify(v) },
                success: function (json) {
                    if (json == "1") {
                        window.location.href="productSet";
                    }else if(json=="0"){
                        $("#Info").text("删除产品失败");
                        $("#myModalInfo").modal("show");
                    }else{
                        $("#Info").text("产品中存在商品,无法删除");
                        $("#myModalInfo").modal("show");
                    }
                }
            });
        });
    });




</script>
<div class="productList">
    <div class="productListTop">
        <span>
            <a href="adminHome">首页</a>
        </span>
        <span> ></span>
        <span>产品设置</span>
    </div>
</div>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h6 class="panel-title">产品设置</h6>
        <hr/>
    </div>
    <div class="panel-body panel-header">
        <form id="form1" action="listProduct" method="get">
            <ul class="list-inline">
                <li class="liname">按名称:</li>
                <li>
                    <input type="text" value="${name}"
                           name="queryText" id="queryText"
                           placeholder="请输入名称" readonly
                           onfocus="this.removeAttribute('readonly');" />
                </li>
                <li>
                    <button class="btn btn-primary btnStyle btnQuery"
                            type="submit">
                        查找
                    </button>
                </li>
                <li>
                    <button class="ToCreate btn btn-primary btnStyle"
                            type="button">添加</button>
                </li>
            </ul>
        </form>
    </div>
</div>

<div class="panel panel-primary mypanel">
    <div class="panel-heading">
        <hr/>
    </div>
    <div class="panel-body">
        <table class="table table-bordered table-striped mytable">
            <tr>
                <th>产品图片</th>
                <th>产品编号</th>
                <th>产品名称</th>
                <th>产品价格</th>
                <th>产品颜色</th>
                <th>产品类别</th>
                <th style="width:30%;">操作</th>
            </tr>
            <c:forEach items="${products}" var="c" varStatus="st">
                <tr>
                    <td>
                        <img class="imageStyle" src="${c.imageurl}" />
                    </td>
                    <td>${c.code}</td>
                    <td>${c.name}</td>
                    <td>${c.price}(元)</td>
                    <td>${c.color}</td>
                    <td>${c.categoryB.name}</td>
                    <td>
                        <a href="javascript:void(0);"
                           class="ToUpdate btn"
                           data1="${c.id}"
                           data2="${c.code}"
                           data3="${c.name}"
                           data4="${c.price}"
                           data5="${c.description}"
                           data6="${c.categoryB.id}"
                            data7="${c.color}">
                            修改
                        </a> |
                        <a href="javascript:void(0);"
                           class="ToDelete btn"
                           IdToDelete="${c.id}">
                            删除
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div style="text-align:center">
            <a href="?queryText=${name}&start=0">首  页</a>
            <a href="?queryText=${name}&start=${page.start-page.count<0?0:page.start-page.count}">上一页</a>
            <a href="?queryText=${name}&start=${page.start+page.count>page.last?page.last:page.start+page.count}">下一页</a>
            <a href="?queryText=${name}&start=${page.last}">末  页</a>
            (共${pageCount}页,当前是第${currentPage}页)
        </div>
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
                <h4 class="modal-title" id="myModalLabel">
                    添加对话框
                </h4>
            </div>
            <form id="formProductCreate"
                  action="addProduct"
                  method="post"
                  enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>产品编号</label>
                        </div>
                        <div class="col-lg-9">
                            <input type="text" id="codeCreate" name="codeCreate" class="form-control"/>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>产品名称</label>
                        </div>
                        <div class="col-lg-9">
                            <input type="text" id="nameCreate" name="nameCreate" class="form-control"/>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>产品价格</label>
                        </div>
                        <div class="col-lg-9">
                            <input type="text" id="priceCreate" name="priceCreate" class="form-control"/>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>产品颜色</label>
                        </div>
                        <div class="col-lg-9">
                            <input type="text" id=colorCreate" name="colorCreate" class="form-control"/>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>产品类别</label>
                        </div>
                        <div class="col-lg-9">
                            <select id="cbidCreate" class="form-control"
                                    name="cbidCreate">
                                <c:forEach items="${categorybBs}" var="cat" varStatus="st">
                                    <option value="${cat.id}">${cat.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>产品描述</label>
                        </div>
                        <div class="col-lg-9">
                        <textarea class="textareaStyle" name="descriptionCreate"
                                  cols="" rows="" id="descriptionCreate">

        				</textarea>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>产品图片</label>
                        </div>
                        <div class="col-lg-9">
                            <input type="file" id="imageurlCreate" name="imageurlCreate"/>
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
            <form id="formUpdate"
                  action="updateProduct"
                  method="post"
                  enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>产品编号</label>
                        </div>
                        <div class="col-lg-9">
                            <input id="idUpdate" name="idUpdate" hidden="hidden" />
                            <input type="text" id="codeUpdate" name="codeUpdate" class="form-control"/>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>产品名称</label>
                        </div>
                        <div class="col-lg-9">
                            <input type="text" id="nameUpdate" name="nameUpdate" class="form-control"/>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>产品价格</label>
                        </div>
                        <div class="col-lg-9">
                            <input type="text" id="priceUpdate" name="priceUpdate" class="form-control"/>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>产品颜色</label>
                        </div>
                        <div class="col-lg-9">
                            <input type="text" id="colorUpdate" name="colorUpdate" class="form-control"/>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>产品类别</label>
                        </div>
                        <div class="col-lg-9">
                            <select id="cbidUpdate" class="form-control"
                                    name="cbidUpdate">
                                <c:forEach items="${categorybBs}" var="cat" varStatus="st">
                                    <option value="${cat.id}">${cat.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>产品描述</label>
                        </div>
                        <div class="col-lg-9">
                        <textarea class="textareaStyle"
                                  cols="" rows="" id="descriptionUpdate" name="descriptionUpdate">

        				</textarea>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>商品图片</label>
                        </div>
                        <div class="col-lg-9">
                            <input type="file" id="imageurlUpdate" name="imageurlUpdate"/>
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
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="myModalDelete" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-title-background">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    删除对话框
                </h4>
            </div>
            <div class="modal-body">
                您确认删除该信息吗?
            </div>
            <div class="modal-footer">
                <input id="idDelete" hidden="hidden" />
                <button type="button" class="Delete btn btn-primary">
                    确认删除
                </button>
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">
                    关闭
                </button>
            </div>
        </div>
    </div>
</div>

<%@ include file="../public/adminSuffix.jsp" %>