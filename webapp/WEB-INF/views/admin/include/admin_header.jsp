<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>



<style>
   *,ul,li,a{
      list-style: none;
      text-decoration: none;
      margin:0;
      padding: 0;
   }
   #header_all_box{
   width: 100%;
   height: 100vh;
   background: #fff;
   }
   #header{
      width: 15%;
      height: 100vh;
      background: #f5f5f5;
      float: left;
   }
   #header >ul{
   width: 100%;
   height: 700px;
   background: #f5f5f5;
   top:0;
   left: 0;
   }
   
   #header >ul > li{
   position:relative;
   width: 90%;
   height: 100px;
   padding-left:10%;
   line-height:100px;
   text-align:left;
   background: #f5f5f5;
   border-bottom:1px solid #e6e3e3;
   top:0;
   left: 0;
   color:#383838;
   font-size: 14px;
   }
   
   
   
   #header >ul > li >a{
   color:#383838;
   }
   
   #header >ul > li >a:hover{
   font-weight:900;
   color:#4a90e2;
   }
   /* 탑헤더 */

   #top_header{
      width: 100%;
      height: 80px;
      background:#383838;
      top:0;
      left: 0;
      float: left;
      
   }


   #top_header>ul{
      width: 650px;
      height: 80px;
      float: right;
   }

   #top_header>ul > li{
      width: 150px;
      height: 80px;
      line-height:80px;
      text-align:center;
      font-size:12px;
      float: left;
      color:#fff;
   }
   
   #top_header>ul > li > a{
      color:#fff;
   }
   #top_header>ul > li{
      width: 150px;
      height: 80px;
      line-height:80px;
      text-align:center;
      font-size:12px;
      float: left;
      color:#fff;
   }
   
   

   
   #top_header>ul > li:nth-child(1)>a{
      text-align:center;
      font-size:15px;
      font-weight:900px;
      float: center;
      color: #4a90e2;
   }
   
   #top_header>ul > li:nth-child(2){
      width: 200px;
      height: 80px;
      line-height:80px;
      text-align:center;
      font-size:12px;
      float: left;
   }

   #top_header> ul > li>a{
      font-size:12px;
   }
   
   /* 슬라이드 다운 업 */
	.tip > li{
	top:0;
	position:absolute;
	z-index:9999;
	width: 250px;
	height:100px;
	margin-left: 100%;
	background: red;
	padding-left:10%;
	text-align: left;
	line-height: 100px;
	}

</style>
<script type="text/javascript">
	$(".tip").hide();
	$(".menu li")
	.mouseenter(function(){ $(this).children(".tip").stop().slideDown(300);})
	.mouseleave(function(){ $(this).children(".tip").stop().slideUp(300);})
	
	$(".menu2 li")
	.click(function(){ $(this).children(".tip").slideToggle(300);})
	//click or hover
</script>
<script>
   function logout(){
      alert('관리자님 로그아웃 되었습니다.');
   }
</script>
<script>
   function modify(){
      alert('회원정보를 수정합니다.');
   }
</script>

</head>
<body>
   <c:if test="${login.user_id == 'admin' || login.user_pw == '1234'}">
   <div id="header_all_box">
   <div id="top_header">
      <ul>
         <li><a href="/admin/adminmainpage"><b>FFEE</b></a></li>
         <li><b>관리자님</b> 환영합니다.</li>
         <li><a href="/logout">로그아웃</a></li>
         <li>홈페이지 이동</li>
      </ul>
   </div>
   <div id="header">
      <ul class="menu">
         <li><a href="#">회원관리</a></li>
         <li><a href="/admin/eventlist">이벤트관리</a>
         	<ul class="tip">
         		<li>이벤트글쓰기</li>
         	</ul>
         </li>
         <li class="main_menu"><a href="/admin/snslist">sns 관리</a>
         	<ul class="tip">
         		<li>sns글쓰기</li>
         	</ul>
         </li>
         <li class="main_menu"><a href="/admin/productList">상품관리</a>
         	<ul class="tip">
         		<li>상품글쓰기</li>
         	</ul>
         </li>
         <li class="main_menu"><a href="/admin/list">공지관리</a>
         	<ul class="tip">
         		<li>공지글쓰기</li>
         	</ul>
         </li>
         
      </ul>
   </div>
   </div>
   </c:if>
</body>
</html>
