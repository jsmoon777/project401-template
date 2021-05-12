<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="jquery-1.7.2.min.js"></script>



<style>
   *,ul,li,a{
      list-style: none;
      text-decoration: none;
      margin:0;
      padding: 0;
   }
    #admin_body{
	  z-index:-1;
      position:absolute;
      width:75%;
      margin-left:5%;
      margin-right:5%;
      background:#fff;
      float: left;
      top:150px;
      left: 250px;
      
   }
   #header_all_box{
	   width: 100%;
	   background: #fff;
	   z-index: 1;
   }
   #header{
      position:fixed;
      top:10vh;
      width: 15%;
      height: 90vh;
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
      position:fixed;
      width: 100%;
      height: 10vh;
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
	
   #submenu{
    position:absolute;
    width: 100%;
    background: #fff;
    z-index:9999;
    top:0;
    left:100%;
   	display: none;
   }
    #submenu >ul{
   width: 100%;
   top:0;
   left: 0;
   }
   
   #submenu >ul > li{
   position:relative;
   width: 90%;
   height: 100px;
   padding-left:10%;
   line-height:100px;
   text-align:left;
   background: #fbfafa;
   border-bottom:1px solid #e6e3e3;
   top:0;
   left: 0;
   color:#383838;
   font-size: 14px;
   }
   
   
   
   #submenu >ul > li >a{
   color:#383838;
   }
   
   #submenu >ul > li >a:hover{
   font-weight:900;
   color:#4a90e2;
   }
   
</style>
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

	<!-- 메뉴슬라이드 -->
<style>
/* 패널디자인 */
.siteMapBtn p {
   position: absolute;
   top: -20px;
   left: 20px;
   z-index: 1;
   display: block;
   font-size:80px;
   color: #fff;
   cursor: pointer;
   transform: translate3d(0, 0, 0);
   transition: transform .4s;
}

</style>
<script src="jquery-1.7.2.min.js"></script>

<script>
$(document).ready(function(){
    $("#header").show();
    $(".siteMapBtn").click(function(){
       $(".siteMapBtn p").toggle();
    $('#header').animate({width:'toggle'});
    });

    $(document).on('mouseover', '#header>ul>li>a', function() {
    	$('#submenu').slideDown(300);
    });
    
    $(document).on('mouseover', '#admin_body', function () {
       $('#submenu').slideUp(300);
    	
    });

    
})
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
         <li><a href="/">홈페이지 이동</a></li>
      </ul>
   </div>
   
   <div class="siteMapBtn">
	<p style="margin:0;">&equiv;</p>
	<p style="display:none;margin:0;">&equiv;</p>
   </div>

   
   <div id="header">
      <ul >
         <li><a href="">회원관리</a></li>
         <li><a href="/admin/eventlist">이벤트관리</a>
         </li>
         <li><a href="/admin/snslist">sns 관리</a>
         </li>
         <li><a href="/admin/productList">상품관리</a>
         </li>
         <li><a href="/admin/list">공지관리</a>
      </li>
         
      </ul>
       <div id="submenu">
	   	<ul>
	         <li><a href="/admin/eventform">이벤트글쓰기</a>
	         </li>
	         <li><a href="/admin/writeView">sns 글쓰기</a>
	         </li>
	         <li><a href="/admin/productform">상품올리기</a>
	         </li>
	         <li><a href="/admin/nwriteView">공지글쓰기</a>
	         </li>
	      </ul>
   </div>
   </div>
   </div>
   </c:if>
   

</body>
</html>
