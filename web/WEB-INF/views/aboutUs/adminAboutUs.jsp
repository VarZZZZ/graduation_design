<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../public/adminPrefix.jsp"%>

<link href="css/aboutUs.css" rel="stylesheet" type="text/css">
<div class="aboutUs">
    <div class="aboutTop">
        <span>
            <a href="home">首页</a>
        </span>
        <span> ></span>
        <span>关于我们</span>
    </div>
</div>

<div class="form-content">
    <form id="formAboutUs"
          action="updateAboutUs"
          method="post"
          enctype="multipart/form-data">
        <div class="rowStyle">
            <div class="choose-image">
                <label>选择关于图片:</label>
            </div>
            <div class="imagearea">
                <input type="file" id="imageurl" name="imageurl"/>
            </div>
        </div>
        <div class="imgRow">
            <div class="input-name">
                <label>关于图片</label>
            </div>
            <div class="imageUrl">
                <img class="imageStyle" src="${aboutUs.imageurl}" />
            </div>
        </div>
        <div class="contentRow">
            <div class="input-name">
                <label>相关内容</label>
            </div>
            <div class="textarea">
                <textarea class="textareaStyle" id="content" name="content">
                    ${aboutUs.content}
                </textarea>
            </div>
        </div>
        <div class="row rowStyle">

            <div class="submit-btn">
                <button type="submit"
                        class="btn btn-primary btnSubmit">
                    提交</button>
            </div>
        </div>

    </form>
</div>



   </body>
</html>