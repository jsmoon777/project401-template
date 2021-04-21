<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 리스트</title>
<style>
#map_box{
			width:700px;
			height:1000px;
			background:none;
			position:relative;
			
		}

.map_1{
			width:50px;
			height:50px;
			position:absolute;
			top:260px;
			left:250px;
		}
.map_2{
			width:50px;
			height:50px;
			position:absolute;
			top:235px;
			left:380px;
		}
.map_3{
			width:50px;
			height:50px;
			position:absolute;
			top:380px;
			left:220px;
		}
.map_4{
			width:50px;
			height:50px;
			position:absolute;
			top:350px;
			left:330px;
		}
.map_5{
			width:50px;
			height:50px;
			position:absolute;
			top:500px;
			left:260px;
		}
.map_6{
			width:50px;
			height:50px;
			position:absolute;
			top:630px;
			left:200px;
		}
.map_7{
			width:50px;
			height:50px;
			position:absolute;
			top:500px;
			left:400px;
		}
.map_8{
			width:50px;
			height:50px;
			position:absolute;
			top:590px;
			left:430px;
		}
.map_9{
			width:50px;
			height:50px;
			position:absolute;
			top:720px;
			left:280px;
		}
.map_0{
            position:absolute;
            top:50%;
            left:50%;
            transform:translate(-50%,-50%);
           } 
       
</style>


<body>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<%@include file="/WEB-INF/include/sub_header.jsp" %>

<nav class="menu_nav">
 
        <div id = "map_box">
   <!-- <ul class="menu_ul">
		<li><a href="/mat/map2"  class="hvr-underline-from-left">서울맛집</a></li>
		<li><a href="/mat/map3"  class="hvr-underline-from-left">강원도맛집</a></li>
		<li><a href="/mat/map4"  class="hvr-underline-from-left">충청북도맛집</a></li>
		<li><a href="/mat/map5"  class="hvr-underline-from-left">충청남도맛집</a></li>
		<li><a href="/mat/map6"  class="hvr-underline-from-left">전라북도맛집</a></li>
		<li><a href="/mat/map7"  class="hvr-underline-from-left">전라남도맛집</a></li>
		<li><a href="/mat/map8"  class="hvr-underline-from-left">대구맛집</a></li>
		<li><a href="/mat/map9"  class="hvr-underline-from-left">부산맛집</a></li>
		<li><a href="/mat/map10"  class="hvr-underline-from-left">제주도맛집</a></li>
	  </ul>--> 
	    <img src="/img/airKorea_map.png" class="map_0"/>
    <a href="/mat/map2"><img src="/img/pint.png" class="map_1"/></a>
    <a href="/mat/map3"><img src="/img/pint.png" class="map_2"/></a>
    <a href="/mat/map4"><img src="/img/pint.png" class="map_3"/></a>
    <a href="/mat/map5"><img src="/img/pint.png" class="map_4"/></a>
    <a href="/mat/map6"><img src="/img/pint.png" class="map_5"/></a>
    <a href="/mat/map7"><img src="/img/pint.png" class="map_6"/></a>
    <a href="/mat/map8"><img src="/img/pint.png" class="map_7"/></a>
    <a href="/mat/map9"><img src="/img/pint.png" class="map_8"/></a>
    <a href="/mat/map10"><img src="/img/pint.png" class="map_9"/></a>
	  </div>
	  
  </nav>
  <!-- 
  <div class="slide_wrapper">
    <ul class="slides">
     <li><img src="/img/landscape.jpg" alt=""></li>
     <li><img src="/img/landscape.jpg" alt=""></li>
     <li><img src="/img/landscape.jpg" alt=""></li>
     <li><img src="/img/landscape.jpg" alt=""></li>
     <li><img src="/img/landscape.jpg" alt=""></li>
     <li><img src="/img/landscape.jpg" alt=""></li>
    </ul>
    <p class="controls">
     <span class="prev">prev</span>
     <span class="next">next</span>
  </div>
  -->
</body>  
  
</html>













