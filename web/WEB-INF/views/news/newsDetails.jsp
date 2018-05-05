<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../public/prefix.jsp"%>

<link href="css/news.css" rel="stylesheet" type="text/css">
<div class="bgTop">
    <div class="bgTop2">
        <span>
            <a href="home">首页</a>
        </span>
        <span> ></span>
        <span>业内资讯</span>
    </div>
</div>

<div class="news">
    <div class="newsTitle">
        <div style="text-align:center;">${news.title}</div>
    </div>
    
    <div class="newsContent" style="font-size: 15px;margin-top: 13px;">
        ${news.content}
    </div>
</div>