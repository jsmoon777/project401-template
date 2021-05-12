<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
  #writeTable  input[type=text] { width:660px; } 
  #writeTable  textarea         { width:660px;  height:300px;} 
  /* #writeTable  { text-align: center;} */
  
  .pdsWrite{height:300px; margin-bottom:400px; position:relative; }
  #menulist{position:relative; margin: 150px;}
  #pdsTitle2{text-align:center; margin-bottom:30px; font-size: 30px;}
  #td1, td2, td3, td4{width:100px;}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
   $(function() {
	   
	   // btnAdd Click 	
	   var  num = 1;
	   $('#btnAddFile').on('click', function() {
    	   //alert('Click');    	   
    	   var html  = '<input type="file"';
    	   html     += ' name = "upfile' + num + '"';
    	   html     += ' id   = "upfile' + num + '"';
    	   html     += ' /><br>';
    	   $('#tdfile').append( html );
    	   num      += 1;
       });
       
       // submit click
       $('#form1').on('submit', function() {
    	   // 작성자 입력? db writer : not null
    	   if ( $('#writer').val() == '') {
    		   alert('작성자를 입력하세요');
    		   $('#writer').focus();
    		   return false;   // submit 이벤트를 중지
    	   } 		   
    	   // 제목   입력? db title : not null
    	   if ( $('#title').val() == '') {
    		   alert('제목을 입력하세요');
    		   $('#title').focus();
    		   return false;   // submit 이벤트를 중지
    	   } 			   
    	   // 내용   입력? db cont  : not null
    	    if ( $('#cont').val() == '') {
    		   alert('내용을 입력하세요');
    		   $('#cont').focus();
    		   return false;   // submit 이벤트를 중지
    	   } 	
    	   
 	       return true;
       });
   });
</script>
</head>
<body>
   <!-- 메뉴목록 (menuList) -->
   <%@include file="/WEB-INF/include/sub_header2.jsp" %>
   <%@include file="/WEB-INF/include/menus.jsp" %>
   
   
   <section class="pdsWrite">
   <!-- 새글 쓰기 -->
   <form action="/PDS/Write"  method="POST" id="form1"
        enctype="multipart/form-data">
   <input type="hidden" name="menu_id"     value="${ map.menu_id }" />     
   <input type="hidden" name="bnum"        value="${ map.bnum }" />     
   <input type="hidden" name="lvl"         value="${ map.lvl }" />     
   <input type="hidden" name="step"        value="${ map.step }" />     
   <input type="hidden" name="nref"        value="${ map.nref }" />     
   <input type="hidden" name="nowpage"     value="${ map.nowpage }" />     
   <input type="hidden" name="pagegrpnum"  value="${ map.pagegrpnum }" />     

   <table id="writeTable" class="table">
    <div id="pdsTitle2" ><h2>등   록</h2></div>
    <tr> 
      <td id="td1">작성자</td>
      <td><input type="text" name="writer"  id="writer"
        value="${ map.user_id }"  /> <!-- 로그인된 유저아이디  -->
      </td>
    </tr> 
    <tr>
      <td id="td2">글제목</td>
      <td><input type="text" name="title" id="title" /></td>
    </tr> 
    <tr>
      <td id="td3">글내용</td>
      <td><textarea name="cont" id="cont"></textarea></td>
    </tr> 
    <tr>
      <td id="td4">파일</td>
      <td id="tdfile">
        <input type="button" id="btnAddFile" value="Add file" /><br>
        <input type="file" name="upfile" id="upfile" /><br>        
      </td>
    </tr> 
    <tr>      
      <td colspan="2">
        <a href="/MBoard/List?menu_id="><input type="submit" value="확인" /></a>
      </td>
    </tr> 
   </table>   
   </form>
   </section>
    <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>










