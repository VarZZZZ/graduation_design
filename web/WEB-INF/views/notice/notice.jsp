<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../public/prefix.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="css/notice.css" rel="stylesheet" type="text/css">

<div class="bgTop">
    <div class="btTop2">
        <span>
            <a href="home">首页</a>
        </span>
        <span> ></span>
        <span>系统公告</span>
    </div>
</div>

<div class="news">
    <div class="newsTitle">
        <div style="text-align:center;">${notice.headline}</div>
    </div>

    <div class="newsContent" style="font-size: 18px;margin-top: 13px;">
        ${notice.content}
    </div>
</div>