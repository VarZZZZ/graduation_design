<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>

<%@include file="../public/prefix.jsp"%>

<script type="text/javascript">
    $(document).ready(function(){
        $(".cat-vertical li").hover(function () {
            $(this).addClass("mouseenter-cat");
        },function () {
            $(this).removeClass("mouseenter-cat");
        })
    });
</script>

<div class="bj2">
    <div class="bj2_1">
        <div class="classify fl">
            <div class="cat_vertical_1">
                <ul class="cat-vertical">
                    <li  class="cat-item lv1 " data-catid="1" data-typeid="1" data-typename="给水管道">
                        <div class="cat-root-box">
                            <a href="listProduct?categoryA=给水管材" target="_blank">
                                <span>给水管材</span>
                            </a>
                            <div class="cat-lv2-redundancy">
                                <a href="listProduct?categoryA=给水管材&&categoryB=给水管道">给水管道</a>
                                <a href="listProduct?categoryA=给水管材&&categoryB=给水管件">给水管件</a>
                            </div>
                        </div>
                        <div class="cat-children-box" style="top:0;">
                            <div class="cat-children">
                                <dl class="cat-item lv2" data-catpid="1" data-catid="11" data-typeid="1" data-type="给水管道">
                                    <dt>
                                        <a href="listProduct?categoryA=给水管材&&categoryB=给水管道" target="_blank">
                                            <span>给水管道</span>
                                        </a>
                                    </dt>
                                </dl>
                                <dl class="cat-item lv2" data-catpid="1" data-catid="12" data-typeid="1" data-typename="给水管道">
                                    <dt>
                                        <a href="listProduct?categoryA=给水管材&&categoryB=给水管件" target="_blank">
                                            <span>给水管件</span>
                                        </a>
                                    </dt>
                                </dl>
                            </div>
                        </div>
                    </li>
                    <li class="cat-item lv1" >
                        <div class="cat-root-box">
                            <a href="listProduct?categoryA=排水管材" target="_blank">
                                <span>排水管材</span>
                            </a>
                            <div class="cat-lv2-redundancy">
                                <a href="listProduct?categoryA=排水管材&&categoryB=排水管道">排水管道</a>
                                <a href="listProduct?categoryA=排水管材&&categoryB=排水管件">排水管件</a>
                            </div>
                        </div>
                        <div class="cat-children-box" >
                            <div class="cat-children">
                                <dl class="cat-item lv2">
                                    <dt>
                                        <a href="listProduct?categoryA=排水管材&&categoryB=排水管道" target="_blank">
                                            <span>排水管道</span>
                                        </a>
                                    </dt>
                                </dl>
                                <dl class="cat-item lv2">
                                    <dt>
                                        <a href="listProduct?categoryA=排水管材&&categoryB=排水管件" target="_blank">
                                            <span>排水管件</span>
                                        </a>
                                    </dt>
                                </dl>
                            </div>
                        </div>
                    </li>
                    <li class="cat-item lv1">
                        <div class="cat-root-box">
                            <a href="listProduct?categoryA=燃气管材" target="_blank">
                                <span>燃气管材</span>
                            </a>
                            <div class="cat-lv2-redundancy">
                                <a href="listProduct?categoryA=燃气管材&&categoryB=燃气管道">燃气管道</a>
                                <a href="listProduct?categoryA=燃气管材&&categoryB=燃气管件">燃气管件</a>
                            </div>
                        </div>
                        <div class="cat-children-box" style="top:120px">
                            <div class="cat-children">
                                <dl class="cat-item lv2">
                                    <dt>
                                        <a href="listProduct?categoryA=燃气管材&&categoryB=燃气管道" target="_blank">
                                            <span>燃气管道</span>
                                        </a>
                                    </dt>
                                </dl>
                                <dl class="cat-item lv2">
                                    <dt>
                                        <a href="listProduct?categoryA=燃气管材&&categoryB=燃气管件" target="_blank">
                                            <span>燃气管件</span>
                                        </a>
                                    </dt>
                                </dl>
                            </div>
                        </div>
                    </li>
                    <li class="cat-item lv1">
                        <div class="cat-root-box">
                            <a href="listProduct?categoryA=地热管材" target="_blank">
                                <span>地热管材</span>
                            </a>
                            <div class="cat-lv2-redundancy">
                                <a href="listProduct?categoryA=地热管材&&categoryB=PE-RT地暖管材管件">PE-RT地暖管材管件</a>
                                <a href="listProduct?categoryA=地热管材&&categoryB=PE地源热泵管材管件">PE地源热泵管材管件</a>
                            </div>
                        </div>
                        <div class="cat-children-box" style="top:135px">
                            <div class="cat-children">
                                <dl class="cat-item lv2">
                                    <dt>
                                        <a href="listProduct?categoryA=地热管材&&categoryB=PE-RT地暖管材管件"><span>PE-RT地暖管材管件</span></a>
                                    </dt>
                                </dl>
                                <dl class="cat-item lv2">
                                    <dt>
                                        <a href="listProduct?categoryA=地热管材&&categoryB=PE地源热泵管材管件"><span>PE地源热泵管材管件</span></a>
                                    </dt>
                                </dl>
                            </div>
                        </div>
                    </li>
                    <li class="cat-item lv1">
                        <div class="cat-root-box">
                            <a href="listProduct?categoryA=塑料检查井">
                                <span>塑料检查井</span>
                            </a>
                            <div class="cat-lv2-redundancy">
                                <a href="listProduct?categoryA=塑料检查井&&categoryB=PE塑料检查井">PE塑料检查井</a>
                            </div>
                        </div>
                        <div class="cat-children-box" style="top:230px">
                            <div class="cat-children">
                                <dl class="cat-item lv2">
                                    <dt>
                                        <a href="listProduct?categoryA=塑料检查井&&categoryB=PE塑料检查井"><span>PE塑料检查井</span></a>
                                    </dt>
                                </dl>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <script type="text/javascript">
            window.onload=function(){
                var nowing = 0;

                var imgs =document.getElementById("picul").getElementsByTagName("img");
                var imglis = document.getElementById("picul").getElementsByTagName("li");
                var navlis = document.getElementById("navmenu").getElementsByTagName("li");
                var timer = window.setInterval(doing,2000);
                clearInterval(timer);
                function doing(){

                    if(nowing<imgs.length-1)
                        nowing++;
                    else
                        nowing=0;
                    picRefresh();
                }
                for(var n=0;n<navlis.length;n++){
                    navlis[n].index=n;
                    navlis[n].onmouseover=function () {
                        nowing=this.index;
                        picRefresh();
                    }
                }
                function picRefresh(){
                    for(var i =0;i<imglis.length;i++)
                        imglis[i].className="";
                    imglis[nowing].className="cur";
                    for(var j=0;j<navlis.length;j++)
                        navlis[j].className="";
                    navlis[nowing].className="cur";
                }
                picRefresh();

                $("#picCarousel").onmouseover=function(){
                    window.clearInterval(timer);
                }
                $("#picCarousel").onmouseout=function () {
                    window.clearInterval(timer);
                    timer=window.setInterval(doing,2000);
                }
            }

        </script>
        <div class="gg fr" id="picCarousel">
            <div class="picView">
                <ul id="picul">
                    <li >
                        <a href="aboutUs"><img src="images/pic1.jpg" />
                        </a>
                    </li>
                    <li >
                        <a href="#"><img src="images/pic2.jpg" />
                        </a>
                    </li>
                    <li >
                        <a href="#"><img src="images/pic3.jpg" />
                        </a>
                    </li>
                    <li >
                        <a href="#"><img src="images/pic4.jpg" />
                        </a>
                    </li>
                    <li >
                        <a href="#"><img src="images/pic5.jpg" />
                        </a>
                    </li>
                </ul>
            </div>

            <div class="picinfo">
                <ul id="navmenu">
                    <li ></li>
                    <li ></li>
                    <li ></li>
                    <li ></li>
                    <li ></li>
                </ul>
            </div>

        </div>
    </div>

</div>

</body>
</html>
