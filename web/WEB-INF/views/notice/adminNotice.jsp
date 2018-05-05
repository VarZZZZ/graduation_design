<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="../public/adminPrefix.jsp" %>
<link href="css/notice.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
    $(document).ready(function () {
        var v = {};
        var info=""

        $(".btnSubmit").on("click", function () {
            if($("#headline").val()===""){
                info="请填写标题";
            }

            if(info===""){
                v.headline=$("#headline").val();
                v.content=$("#content").val();
                $.ajax({
                    type: "POST",
                    url: "updateNotice",
                    data: { noticeObj: JSON.stringify(v) },
                    success: function (json) {
                        if (json=== "1") {
                            window.location.href="adminNotice";
                        }else{
                            $("#Info").text("更新失败");
                            $("#myModalInfo").modal("show");
                        }
                    }
                });
            }else{
                $("#Info").text(info);
                $("#myModalInfo").modal("show");
            }
        });
    });
</script>

<div class="form-content">
    <div class="formtitle">
        <span>系统公告</span>
    </div>
    <div class="row rowStyle">
        <div class="col-lg-2">
            <label>公告标题</label>
        </div>
        <div class="col-lg-9">
        	<textarea  class="textStyle" style="resize: none"
                       cols="" rows="" id="headline">
                ${notice.headline}
            </textarea>
        </div>
    </div>
    <div class="row rowStyle">
        <div class="col-lg-2">
            <label>公告内容</label>
        </div>
        <div class="col-lg-9">
        	<textarea class="textareaStyle"
                      cols="" rows="" id="content">
                ${notice.content}
            </textarea>
        </div>
    </div>
    <div class="row rowStyle">
        <div class="col-lg-2">

        </div>
        <div class="col-lg-9">
            <button type="button"
                    class="btn btn-primary btnSubmit">
                提交</button>
        </div>
    </div>
</div>

<%@ include file="../public/adminSuffix.jsp" %>