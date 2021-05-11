<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=1440,initial-scale=1.0" />
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
<link href="/css/header.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" media="all">

<script>
$(function(){
  var header = $('header'); //헤더를 변수에 넣기
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

	.menu_ul>li>a{
			font-size: 14px;
			color:#000;
		}
		
		.menu_ul>li>a:hover{
			color:#5f0080;
		}

	}
	#top_header{
	position:relative;
	top:0;
	left:0;
	width: 100%;
	height: 50px;
	background: #000;
	
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

<!-- 민성 04/21  -->
 ul{list-style:none; margin:0px; padding:0px;border:1px solid #D5D5D5;}
.one{float:left;}/* 전체 메뉴를 float 시킴 */
.one > li{float:left;}   /*1단 메뉴를 일렬로 늘어놓기 */
.one ul{display:none;}  /*2단, 3단 메뉴를 숨기기 */
.one li:hover > ul {display:block;}  /*주 메뉴에 마우스 오버했을 때 부 메뉴 드러내가 */
.two{position:absolute;left:100px; top: 80px; }  /*2단 메뉴 절대 위치*/
.three{position:absolute;left:90px; top: 0px; }  /*3단 메뉴 절대 위치*/
.four{position:absolute;left:90px; top: 30px; }  /*3단 메뉴 절대 위치*/
.itmeBox{width: 300px; height: 300px;} /* 크기 왜 안바뀜 ???? */
ul li a{text-decoration:none; display:block; width:90px;height: 30px;line-height: 30px;text-align:center;} 
.one  li {width:90px;}  
.one li:hover{background-color:#EAEAEA;} 
 
#header {position:relative;margin-left:5px;zoom:1;} 
#header:before, #header:after{content: " "; display: block; clear: both;}
#header:after{clear: both;}  
.itemBox {font-size: 15px; width: 600px; position: absolute;left: 90px;top: -1px;background: gray; height: 400px;}
.itemBox > .item { width: 190px; float:left; overflow: auto; height: 190px;text-align: center;margin-top: 6px;}
.itemBox > .item > a {margin: auto;}
.three li a:hover ~ ul .itemBox, .four li a:hover ~ ul .itemBox { opacity: 1; visibility: visible;}

</style>

<header>
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
		<ul class="one">	
		<li><a href="/mat/map" class="hvr-underline-from-left">맛집정보</a></li>
		<li><a href="#" class="hvr-underline-from-left">카페추천</a>
			<ul class="two">
				<li><a href="#" class="hvr-underline-from-left">신상카페</a>
			    	<ul class="three">
			    		<li>
			    			<a href="#" class="hvr-underline-from-left">신상목록</a>
							<ul>
			    				<li>
				    				<div class="itemBox">
						    			<c:forEach var="BoardFileList" items="${ rBoardFileList }">
											<div class="item">
											  <a href="/PDS/View?idx=${ BoardFileList.idx }&menu_id=${menu_id}">
												<img src="/image7/${ BoardFileList.sfilename}" width="150" height="150" />
												  <p >${ BoardFileList.title }</p>
													</a>
												</div>
										</c:forEach>
									</div>
								</li>
			    			</ul>
			    		</li>
			    	</ul>
			    </li>		
			    <li><a href="#" class="hvr-underline-from-left">인기카페</a>
			    	<ul class="four">
			    		<li>
			    			<a href="#" class="hvr-underline-from-left">
			    			인기목록
			    			</a>
			    			<ul>
			    				<li>
				    				<div class="itemBox">
						    			<c:forEach var="BoardFileList2" items="${ rBoardFileList2 }">
												<div class="item">
													<a href="/MBoard/View?idx=${ BoardFileList2.idx }&menu_id=${menu_id}">
														<img src="/image7/${ BoardFileList2.sfilename}" width="150" height="150"/>
														<p>${ BoardFileList2.title }</p>
													</a>
												</div>
										</c:forEach>
									</div>
								</li>
			    			</ul>
			    			
			    		</li>
			    	</ul>
			    </li>
			</ul>
		</li>  		
		<li class="hvr-underline-from-left"><a href="sns/snslist.jsp">SNS</a></li>
		<li><img src="img/mp_logo.png" width="100px;" alt="ffee"></li>
		<li class="hvr-underline-from-left"><a href="#">이벤트</a></li>
		<li class="hvr-underline-from-left"><a href="/nboard/list">공지</a></li>
		<li class="hvr-underline-from-left"><a href="#">문의</a>
			<ul>
				<li><a href="/MBoard/WriteForm?menu_id=MENU01&bnum=0&lvl=0&step=0&nref=0" class="hvr-underline-from-left">등록&문의</a></li>
			</ul>
		</li>	
	  </ul>	
	  </div> 
  </nav>
</header>
