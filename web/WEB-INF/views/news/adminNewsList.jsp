<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../public/adminPrefix.jsp"%>

<link href="css/news.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
    $(document).ready(function () {
        var v = {};
        var info="";

        $(".ToCreate").on("click", function () {
            $("#myModalCreate").modal("show");
        });

        $(".Create").on("click", function () {
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
            if($("#titleCreate").val()===""){
                info="请填写资讯标题";
            }
            if($("#contentCreate").val()==""){
                info="请填写资讯内容";
            }

            if(info===""){
                $(".Create").attr("type","submit");
                $("formProductCreate").submit();
            }else{
                $("#Info").text(info);
                $("#myModalInfo").modal("show");
            }
        });
        $(".ToUpdate").on("click", function () {
            v.id = $(this).attr("data1");
            v.title = $(this).attr("data2");
            v.content = $(this).attr("data3");
            $("#idUpdate").val(v.id);
            $("#titleUpdate").val(v.title);
            $("#contentUpdate").val(v.content);

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
            if($("#titleUpdate").val()==""){
                info="请填写零件编号";
            }
            if($("#contentUpdate").val()==""){
                info="请填写零件名称";
            }

            if(info===""){
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
                url: "deleteNews",
                data: { newsObj: JSON.stringify(v) },
                success: function (json) {
                    if (json == "1") {
                        window.location.href="newsList";
                    }else if(json=="0"){
                        $("#Info").text("删除失败");
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
            <a href="home" style="text-decoration: none;">首页</a>
        </span>
        <span> ></span>
        <span>资讯管理</span>
    </div>
</div>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h6 class="panel-title">咨询设置</h6>
        <hr/>
    </div>
    <div class="panel-body panel-header">
        <form id="form1" action="newsList" method="get">
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
                <th>资讯标题</th>
                <th style="width:30%;">操作</th>
            </tr>
            <c:forEach items="${newsList}" var="c" varStatus="st">
                <tr>

                    <td><a href="newsDetails?id=${c.id}" style="text-decoration: none;">${c.title}</a></td>
                    <td>
                        <a href="javascript:void(0);"
                           class="ToUpdate btn"
                           data1="${c.id}"
                           data2="${c.title}"
                           data3="${c.content}">
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
                  action="addNews"
                  method="post"
                  enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>资讯标题</label>
                        </div>
                        <div class="col-lg-9">
                            <input type="text" id="titleCreate" name="titleCreate" class="form-control"/>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>资讯内容</label>
                        </div>
                        <textarea class="textareaStyle" name="contentCreate"
                                  cols="" rows="" id="contentCreate">

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
                  action="updateNews"
                  method="post"
                  enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>资讯标题</label>
                        </div>
                        <div class="col-lg-9">
                            <input type="text" id="titleUpdate" name="titleUpdate" class="form-control"/>
                        </div>
                    </div>
                    <div class="row set-padding-bottom">
                        <div class="col-lg-3">
                            <label>资讯内容</label>
                        </div>
                        <div class="col-lg-9">
                           <textarea class="textareaStyle" name="contentUpdate"
                                     cols="" rows="" id="contentUpdate">

                           </textarea>
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