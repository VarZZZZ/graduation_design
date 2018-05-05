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

<div class="sub-title">
    <h1 class="title-name">业内资讯</h1>
    <p>我们以科技和品质为起点，为您提供更优质的服务，更有保障的管道产品，不止是PE，还有更多</p>
    <span>
        News—PE
    </span>
</div>

<div class="newsList">
    <c:forEach items="${newsList}" var="n" varStatus="st">
        <h1 class="list-title">
            <span>${n.date}</span>
            <a href="newsDetails?id=${n.id}&status=0" style="text-decoration: none;">
                ${n.title}
            </a>
        </h1>
    </c:forEach>
    <div style="text-align: right;margin-top: 10px;" class="pageNews">
        <a href="?queryText=${name}&start=0&status=0">首  页</a>
        <a href="?queryText=${name}&status=0&start=${page.start-page.count<0?0:page.start-page.count}">上一页</a>
        <a href="?queryText=${name}&status=0&start=${page.start+page.count>page.last?page.last:page.start+page.count}">下一页</a>
        <a href="?queryText=${name}&status=0&start=${page.last}">末  页</a>
        (共${pageCount}页,当前是第${currentPage}页)
    </div>
</div>



<%@include file="../public/suffix.jsp"%>