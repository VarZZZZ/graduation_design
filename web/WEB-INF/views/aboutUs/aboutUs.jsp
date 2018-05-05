<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../public/prefix.jsp"%>

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

<div class="sub-title">
    <h1 class="title-name">关于我们</h1>
    <p>我们以科技和品质为起点，为您提供更优质的服务，更有保障的管道产品，不止是PE，还有更多</p>
    <span>
        ABOUT US
    </span>
</div>

<div class="imgDiv">
    <img class="img" src="${aboutUs.imageurl}"/>
</div>

<div class="content">
    <div class="title">
        相关内容：
    </div>
    <div class="aboutContent">
        ${aboutUs.content}
    </div>
</div>






</body>
</html>