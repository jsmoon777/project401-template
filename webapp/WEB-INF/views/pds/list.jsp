<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"  %>    
 <%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
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
<link rel="stylesheet" href="/css/commons.css" />
	
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
	  position:relative;
	  z-index: 9999;
	  width:100%;
	  top:0;
	  left:0;
	  height:150px;
	  background-color:#fff;
	  margin-bottom:0px;
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
	
	
  #pdsList td:nth-of-type(1) { width:48px; text-align:center; }
  #pdsList td:nth-of-type(2) { width:308px; }
  #pdsList td:nth-of-type(3) { width:78px; text-align:center; }
  #pdsList td:nth-of-type(4) { width:78px; text-align:center;}
  #pdsList td:nth-of-type(5) { width:68px; text-align:center; }
  #pdsList td:nth-of-type(6) { width:88px; text-align:center;}
  
  .pdsBoard{height:300px; margin-bottom:500px; position:relative; }
  #menulist{position:relative; margin: 150px; }
  #pdsTitle{text-align:center; font-size: 30px;}
  
     
   .table {
      border-collapse: collapse;
      border-top: 3px solid #000;
      border-left:1px;
      border-right:1px;
      width:1200px;
      text-align: center;
      margin: 0 auto;
    }  
    .table th {
      width:100px;
      font-size:13px;
      color: #333;
      background: #ffffff;
      text-align: center;
    }
    .table th, .table td {
      padding: 10px;
      height:50px;
      border: 1px solid #f0f0f0;
    }
    .table th:first-child, .table td:first-child {
      border-left: 0;
    }
    .table th:last-child, .table td:last-child {
      border-right: 0;
    }
    .table tr td:first-child{
      text-align: center;
    }
    .table caption{caption-side: bottom; display: none;}
    
    input[type="text"]{
       width:100%;
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


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
   $(function() {

   });
</script>
</head>

<body>
   <!-- 메뉴 목록  menuList -->
   <%@include file="/WEB-INF/include/sub_header2.jsp" %>
   <%@include file="/WEB-INF/include/menus.jsp" %>
   
   
	<section class="pdsBoard">   
   <!-- 자료실 pdsList -->
   <table id="pdsList" class="table">
    <div id="pdsTitle"><h2>신  규  등  록</h2></div>>
    <tr>
     <td>번호</td> 
     <td>제목</td> 
     <td>작성자</td> 
     <td>조회수</td> 
     <td>파일첨부</td> 
     <td>작성일</td>     
    </tr>
    
   <c:forEach var="pdsVo"  items="${ pdsList }">
     <tr>
      
      <!-- 번호 --> 
      <td>
       <c:choose>
         <c:when test="${ pdsVo.lvl eq 0 }">
		    ${ pdsVo.bnum }         
         </c:when>
         <c:otherwise>
            &nbsp;
         </c:otherwise>
       </c:choose>
      </td> 
      
      <!-- 제목 --> 
      <td> 
       <%-- 새글부분 --%>
       <c:choose>
        <c:when test="${ pdsVo.lvl == 0 }">
           <c:choose>
             <c:when test="${ pdsVo.delnum eq 0 }">
               <a href="/PDS/View?idx=${ pdsVo.idx }&menu_id=${ menu_id }"> 
                ${ pdsVo.title  }
               </a> 
             </c:when>
             <c:otherwise>
                <s>삭제된 글입니다</s>
             </c:otherwise>
           </c:choose>
        </c:when>  
        
       <%-- 답글 부분 --%>
        <c:otherwise> 
          <b style="display:inline-block;width:${pdsVo.lvl*20}px" ></b>        
          <c:choose> 
            <c:when test="${ pdsVo.delnum eq 0 }"> 
              <a href="/PDS/View?idx=${ pdsVo.idx }&menu_id=${ menu_id }"> 
              [답글] ${ pdsVo.title  }
              </a>
            </c:when>
            <c:otherwise>
              [답글] <s>삭제된 글입니다</s>
            </c:otherwise>
          </c:choose>  
        </c:otherwise>        
       </c:choose>     
      </td> 
      
      <!-- 작성자 --> 
      <td> ${ pdsVo.writer }</td> 
      
      <!-- 조회수 --> 
      <td> ${ pdsVo.readcount }</td> 
      
      <!-- 첨부(attach)된 파일 수 --> 
      <td>
        <c:choose>
          <c:when test="${ pdsVo.filescount eq 0 }">
            &nbsp;
          </c:when>
          <c:otherwise>
            ${ pdsVo.filescount } 개
          </c:otherwise>
        </c:choose> 
      </td> 
      
       <%-- 작성일 el 에서 substring 함수사용 fn tag 추가 
         <%@taglib prefix="fn"
             uri="http://java.sun.com/jsp/jstl/functions"%> 
       추가필요 
         containts, startsWith, endsWith, indexOf,
         split, join(+),length, replace, substring,
         toLowerCase, toUpperCase, 사용자정의함수 사용   
       --%>
       
      <td>${fn:substring(pdsVo.regdate, 0 , 10) }</td> 
      
     </tr>   
   </c:forEach> 
   
   <!-- 페이징 영역   -->
   <tr>
     <td colspan="6">
      <%--  <%@include file="/WEB-INF/include/paging.jsp" %> --%>
     </td>
   </tr>
   
   <!-- 페이지 이동 -->
   <tr>
     <td colspan="6">
       <a href="/PDS/WriteForm?menu_id=${menu_id}&bnum=0&lvl=0&step=0&nref=0&nowpage=${pdsVo.nowpage}&pagegrpnum=${pagegrpnum}">새 글 쓰기</a> 
     </td>
   </tr>
   </table>
   </section>
    <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>
