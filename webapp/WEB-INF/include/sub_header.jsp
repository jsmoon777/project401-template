<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=1440,initial-scale=1.0" />
<meta name="Generator" content="미스터피자" />
<meta name="Author" content="미스터피자" />
<meta name="Keywords" content="미스터피자" />
<meta name="Description" content="미스터피자"/>
<title>온에어 미스터피자</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/mrpizza.ico" />
<link rel="stylesheet" href="/css/import.css">
<script src="/js/jquery-1.11.3.min.js"></script>
<script src="/js/jquery.easing.1.3.js"></script>
<script src="/js/jquery.flexslider-min.js"></script>
<script src="/js/script.js"></script>
<script src="/js/common_renew.js"></script>
<script src="/js/jquery.min.js"></script>
<link rel="stylesheet" href="css/swiper-bundle.min.css">
<link rel="stylesheet" href="css/swiper-bundle2.min.css">
<link href="/css/hover.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" media="all">

<style>
	.hvr-underline-from-left:before {
	  content: "";
	  position: absolute;
	  z-index: -1;
	  left: 0;
	  right: 100%;
	  bottom:0px;
	  background: #5f0080;
	  color:#fff;
	  height: 4px;
	  -webkit-transition-property: right;
	  transition-property: right;
	  -webkit-transition-duration: 0.2s;
	  transition-duration: 0.2s;
	  -webkit-transition-timing-function: ease-out;
	  transition-timing-function: ease-out;
	}
	
	.header {
	  position:fixed;
	  z-index: 9999;
	  width:100%;
	  top:0;
	  left:0;
	  height:150px;
	  background-color:#fff;
	  margin-bottom:200px;
	  border-bottom:1px solid #dcdcdc;
	  -webkit-transition-duration:0.4s;
	  -webkit-transition-timing-function:ease;
	  transition-duration:0.4s;
	  transition-timing-function:ease;
	 
	}
		.menu_nav{
			margin: 0 auto;
			width: 750px;
			height: 150px;
			background-color:#fff;
			position: relative;
		}
	.menu_ul{
			width: 750px;
			height: 100px;
			background-color:#fff;
			color:#fff;
		    margin: 0 auto;
		}
		.menu_ul>li{
			float: left;
			width: 100px;
			height: 100px;
			line-height: 100px;
			background-color:#fff;
			text-align: center;
			
		}
		.menu_ul>li>a{
			font-size: 14px;
			color:#000;
		}
		
		.menu_ul>li>a:hover{
			color:#5f0080;
		}
	.header:after {
	  display:block;
	  width:100%;
	  content:"";
	}
	.img_wrap {
	  width:100%;
	}
	.img_wrap img {
	  display:block;
	  width:100%;
	  margin:0;
	}
	section article {
	  margin:30px 0;
	  font-size:1rem;
	  line-height:1.7em;
	}
	.down {
	  background-color:#fff;
	  -webkit-transition-duration:0.3s;
	  -webkit-transition-timing-function:ease;
	  transition-duration:0.3s;
	  transition-timing-function:ease;
		border-bottom:1px solid #000;
	}
		
	  .menu_nav_ch {
	  background-color:#fff;
	  -webkit-transition-duration:0.4s;
	  -webkit-transition-timing-function:ease;
	  transition-duration:0.4s;
	  transition-timing-function:ease;
	}
	  .menu_ul_ch {
	  color:#333;
	 
	  background: #fff;
	  -webkit-transition-duration:0.4s;
	  -webkit-transition-timing-function:ease;
	  transition-duration:0.4s;
	  transition-timing-function:ease;
	}
	
	#top_header{
	position:relative;
	top:0;
	left:0;
	width: 100%;
	height: 50px;
	
	}
	.top_menu_ul{
		text-align:right;
		right:200px;
		width:500px;
		height:50px;
		margin:0 auto;
		color: #000;
		float: right;
	}
	.top_menu_ul>li{
		width:100px;
		float: left;
		font-size: 12px;
		line-height: 50px;
		text-align: center;
	}
	
</style>

<script>
$(function(){
  var header = $('.header'); //헤더를 변수에 넣기
  var menunav = $('.menu_nav'); //헤더를 변수에 넣기
  var menuul =$('.menu_ul');
  var page = $('.page-start,.title_box'); //색상이 변할 부분
  var pageOffsetTop = page.offset().top; //색상 변할 부분의 top값 구하기
  $(window).resize(function(){ //반응형을 대비하여 리사이즈시 top값을 다시 계산
    pageOffsetTop = page.offset().top;
  });
  
  $(window).on('scroll', function(){
    if($(window).scrollTop() >= pageOffsetTop) { // 스크롤이 page보다 밑에 내려가면
        header.addClass('down'); //클래스 추가
		menunav.addClass('menu_nav_ch'); //클래스 추가
		menuul.addClass('menu_ul_ch'); //클래스 추가
	
    } else { // 스크롤 올릴 때
      header.removeClass('down'); //클래스 제거
		menunav.removeClass('menu_nav_ch'); //클래스 제거
		menuul.removeClass('menu_ul_ch'); //클래스 추가
    }
  });
});
	</script>

<header class="header">
<div id="top_header">
  <ul class="top_menu_ul">
  	<c:if test="${member == null}">
	  	<li><a href="/login">로그인</a></li>
	  	<li><a href="/registerPro">회원가입</a></li>
  	</c:if>
	<c:if test="${member != null}">
		<li><span style="font-weight: 900;">${member.userId}</span> 님 안녕하세요.</li>
		<li><a href="/logout">로그아웃</a></li>
	</c:if>
  	<li><a href="/">메인페이지</a></li>
  </ul>
</div>
  <nav class="menu_nav">
    <ul class="menu_ul">
		<li><a href="/mat/map"  class="hvr-underline-from-left">맛집정보</a></li>
		<li class="hvr-underline-from-left"><a href="#">카페추천</a></li>
		<li class="hvr-underline-from-left"><a href="/board/snslist">SNS</a></li>
		<li><img src="/img/logo.png" width="70px;"alt="ffee"></a></li>
		<li class="hvr-underline-from-left"><a href="/event/eventlist">이벤트</a></li>
		<li class="hvr-underline-from-left"><a href="/nboard/list">공지</a></li>
		<li class="hvr-underline-from-left"><a href="#">문의</a></li>
	  </ul>
  </nav>
</header>
