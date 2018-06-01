<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../public/header.jsp" %>
<link href="css/home.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
    $(document).ready(function () {
       $(".btn_search").click(function(){
           $("#search_bar").submit();
       }) ;

    });
</script>

<html>
<head>
    <title>PE管</title>
</head>
<body>
<div class="Alltop1">
    <div class="login_sign fl">
          <span id="login_signBar" class="fl" style="display:block;">
              <span class="fl">欢迎光临PE管服务官网</span>
              <%
                  String username = (String) session.getAttribute("Uname");
                  int uid = (Integer) session.getAttribute("Uid");
                  if (username != null) {
              %>
                     <span class="fl">
                          ,&nbsp;&nbsp;<%out.print(username);%>
                     </span>
                     <a class="fl" href="/logout">&nbsp;&nbsp;退出</a>
              <%
              } else {
              %>
              <a class="fl" rel="nofollow" href="login" style="text-decoration: none;">【请登录】</a>
              <a class="fl" rel="nofollow" href="register" style="text-decoration: none;">【免费注册】</a>
              <%
                  }
              %>
          </span>
    </div>
    <div class="other fr">
        <a class="item-1" href="userInfo" style="text-decoration: none;">个人信息<em>|</em></a>
        <a class="item-1" href="listCart" style="text-decoration: none;">购物车<em>|</em></a>
        <a class="item-1" href="listOrders" style="text-decoration: none;">我的订单<em>|</em></a>
        <a class="item-1" href="listConstruct" style="text-decoration: none;">施工查询<em>|</em></a>
        <a class="item-1" href="listAfterSale" style="text-decoration: none;">售后服务<em>|</em></a>
    </div>
</div>
<div class="Alltop2">
    <div class="logo">
        <a href="/">
            <img alt="PE管" src="images/logo.png">
        </a>
    </div>
    <div class="ss">
        <form id="search_bar" class="searchBar" action="searchProduct" method="post">
            <div class="search_input">
                <input class="key" name="search_keywords" placeholder="" type="text">
            </div>
            <button class="btn btn_search submit_btn mybtn" type="submit">搜索</button>
        </form>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#item0").hover(function () {
            $("#item0").css("background-color", "#01489b");
        }, function () {
            $("#item0").css("background-color", "#01559b");
        });
        $("#item1").hover(function () {
            $("#item1").css("background-color", "#01489b");
        }, function () {
            $("#item1").css("background-color", "#01559b");
        });
        $("#item2").hover(function () {
            $("#item2").css("background-color", "#01489b");
        }, function () {
            $("#item2").css("background-color", "#01559b");
        });
        $("#item3").hover(function () {
            $("#item3").css("background-color", "#01489b");
        }, function () {
            $("#item3").css("background-color", "#01559b");
        });
        $("#item4").hover(function () {
            $("#item4").css("background-color", "#01489b");
        }, function () {
            $("#item4").css("background-color", "#01559b");
        });
        $("#item5").hover(function () {
            $("#item5").css("background-color", "#01489b");
        }, function () {
            $("#item5").css("background-color", "#01559b");
        });
        $(".allGoods").click(function () {
           window.location.href="listProduct";
        });
    });

</script>

<div id="fixed" class="dhbj" style="overflow:visible;">
    <div class="dh" style="overflow:visible;">
        <div class="allGoods" style="overflow:visible;">
        </div>
        <div class="navigation">
            <ul class="nav-list">
                <li id="item0" class="nav-item">
                    <a href="http://localhost:8080/gd/home">首页</a>
                </li>
                <li id="item1" class="nav-item">
                    <a href="aboutUs">关于我们 </a>
                </li>
                <li id="item2" class="nav-item">
                    <a href="newsList?status=0">业内资讯 </a>
                </li>
                <li id="item3" class="nav-item">
                    <a href="customized">产品定制</a>
                </li>
                <li id="item4" class="nav-item">
                    <a href="notice">系统公告 </a>
                </li>
                <li id="item5" class="nav-item">
                    <a href="listOnlineMsg">在线留言</a>
                </li>
            </ul>
        </div>
    </div>

</div>