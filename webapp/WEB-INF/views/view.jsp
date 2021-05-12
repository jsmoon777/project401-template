<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
 
   .td1 {  width:178px; text-align:center; }
   .td2 {  width:178px; text-align:left; }
   .td3 {  width:178px; text-align:center; }
   .td4 {  width:178px; text-align:left; }
   .td5 {  width:578px; text-align:left; }
   
   #cont {  height:300px; text-align:left; }
   
   [type=text] { width : 570px; }
   textarea    { width : 570px; height:400px;}
   
   .mboard{height:300px; margin-bottom:400px; position:relative; }
    #menulist{position:relative; margin:50px auto;}
    #mboardTitle{text-align:center; font-size: 30px; margin-bottom:30px;}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
   $(function() {
	  $('input[type=button]').on('click', function(event) {
		  var btn = event.target;
		  var href = '';
		  switch( btn.id ) {
		  case 'btnWrite':
			  href  = '/MBoard/WriteForm?menu_id=${menu_id}';
			  href += '&bnum=0';
			  href += '&lvl=0';
			  href += '&step=0';			  
			  href += '&nref=0';
			  break;
		 
		  case 'btnReplyWrite':
			  href  = '/MBoard/WriteForm?menu_id=${menu_id}';
			  href += '&bnum=${ board.bnum }';
			  href += '&lvl=${ board.lvl }';
			  href += '&step=${ board.step }';			  
			  href += '&nref=${ board.nref }';			  
			  break;		
		  
		  case 'btnList':
			  href  = '/MBoard/List?menu_id=${menu_id}';
			  break;
		  case 'btnUpdate':
			  var  idx =  '${ board.idx }';
			  href     = '/MBoard/UpdateForm?menu_id=${menu_id}&idx=' + idx;
		  	  break;
		  case 'btnDelete':
			  var  idx =  '${ board.idx }';
			  href = '/MBoard/Delete?menu_id=${menu_id}&idx=' + idx;
			  break;
		  }
	
		  
	  })
   });
</script>
</head>
<body>

   <!-- 메뉴 목록  menuList -->
   <%@include file="/WEB-INF/include/sub_header2.jsp" %>
   <%@include file="/WEB-INF/include/menus.jsp" %>
  <!-- 게시물 조회 -->
  <section class="mboard">
  <table class="table">
    <div id="mboardTitle"><h2>게시물 조회</h2></div>
    <tr>  
      <td class="td1">메뉴아이디</td>
      <td class="td5" colspan="3">${ board.menu_id }</td>
    </tr>    
    <tr>
      <td class="td1">번호</td>
      <td class="td2">${ board.idx }</td>
      <td class="td3">날짜</td>
      <td class="td4">${ board.regdate }</td>
    </tr>    
    <tr>
      <td class="td1">글쓴이</td>
      <td class="td2">${ board.writer }</td>   
      <td class="td3">조회수 / 좋아요수</td>
      <td class="td4">${ board.readcount } / ${ board.likeNum }</td>
    </tr>    
    <tr>
      <td class="td1">제목</td>
      <td class="td5" colspan="3">${ board.title }</td>
    </tr>
    <tr>
      <td class="td1">내용</td>
      <td class="td5" id="cont" colspan="3">${ board.cont }</td>
    </tr>  
    <tr>
      <td colspan="4">
       <input type="button" value="새글쓰기"  id="btnWrite"/>
       <input type="button" value="답글쓰기"  id="btnReplyWrite"/>
       <input type="button" value="글목록"    id="btnList"/>
       <button id="like">좋아요</button>
       <c:choose>
       <c:when test="${login.user_id  == 'admin'}">
       <input type="button" value="글수정"    id="btnUpdate"/>
       <input type="button" value="글삭제"    id="btnDelete"/>
       </c:when>
       </c:choose>
      </td>
    </tr>
  </table>
  </form>
  </section>
  <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>






