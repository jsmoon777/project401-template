<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 보기</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<!-- 상품 주문 테이블 -->
<style>
@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
@import url(https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css);

	*,html,body,div,span,p{
		font-family: 'NanumSquare', sans-serif !important;
		
	    }
	#admin_body{
      position:absolute;
      width:75%;
      margin-left:5%;
      margin-right:5%;
      height:800px;
      background:red;
      overflow-x:scroll;
      overflow-x:hidden;
      float: left;
      top:150px;
      left: 250px;
   }

	#product_view_box{
		width: 100%;	
		height: 100vh;
		background: #cbcbcb;
	}	
	
	
	#product_view_ul{
		width: 1500px;
		height: 100%;
		background: #cbcbcb;
		margin: 0 auto;
	}
		#product_view_ul > li{
		padding-top:40vh; 
		width: 500px;
		text-align: center;
		background: #cbcbcb;
		float: left;
	}
	#product_view_ul > li:nth-child(2){
		padding-top:20vh; 
		width: 500px;
		text-align: center;
		background: #cbcbcb;
		float: left;
	}
	#product_tag{
		color: #000;
		font-size: 20px;
	}
	#product_title{
		color:#000;
		padding-: 50px 100px;
		font-size: 30px;
	}
	
	/*텍스트 */
	#ptoduct_con{
		width: 100%;
		font-size: 12px;
		font-weight: 700;
		margin-bottom: 20px; 
	}
	#ptoduct_select_box{
		width: 40%;
		margin : 0 30%;
		padding-bottom: 5%;
		height: 50px;
		border-bottom: 1px solid #000;
	}
	#ptoduct_select_box select{
		width: 100%;
		height: 50px;
		background: rgba(255,255,255,0.00);
		border: 1px solid #a0a0a0;
	}
	#ptoduct_select_box select > option{
		width: 100%;
		height: 100px;
		border: 1px solid #888;
		background: #fff;
		
	}
	#product_btn{
		width: 40%;
		height: 50px;
		padding: 0 30%;
		
	}
	#product_btn > .button{
		width: 100%;
		height: 50px;
		padding: 0 10%;
		background: #000;
		border: 1px solid #888;
		color: #fff;
	}
	#product_price{
		color: #a0a0a0;
	}
	#product_price2{
		font-size: 30px;
		font-weight: 900;
		margin-left:20px;
	}
	
	#product_cont_box{
		width: 100%;
		height: auto;
		background: #fff;
	}
	#product_cont_box > ul{
		width: 400px;
		height: 80px;
		background: #fff;
		margin: 0 auto;
	}
	#product_cont_box > ul > li{
		width: 200px;
		height: 80px;
		background: #fff;
		float: left;
		text-align: center;
		line-height: 80px;
		font-weight: 900;
	}
	#product_cont_box > ul > li:nth-child(1){
		border-bottom: 2px solid #000;
	}
	#product_cont_box > ul > li:hover{
		border-bottom: 2px solid #000;
	}
	#product_con_div{
		width: 100%;
		height: 100%;
		background: #fff;
	}
	#product_body_img{
		width: 1300px;
		height: 100%;
		background: #fff;
		margin: 0 auto;
	}
</style>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니가?");
				if(deleteYN == true){
					
				formObj.attr("action", "/admin/productdelete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
			
		});
	</script>
</head>
<body>
    <%@include file="include/admin_header.jsp" %>
	<!-- 이벤트 뷰페이지 -->
	
	<form name="readForm" role="form" method="post">
		  <input type="hidden" id="product_id" name="product_id" value="${read.product_id}" />
	</form>


	<div id="admin_body">
       <div id="product_view_box">
		<ul id="product_view_ul">
			<li class="view_box">
				<div class="view_title_box">
					<span id="product_tag">${read.product_tag}</span><br>
					<span id="product_title">${read.product_name}</span><br>
					<span id="product_price"><del><fmt:formatNumber value="${read.product_price}" pattern="###,###,###"/></del></span>
					<span id="product_price2"><fmt:formatNumber value="${read.product_price2}" pattern="###,###,###"/></span>
				</div>
		
			</li>
			<li style="text-align: center;">
				  <c:forEach var="thumnailfile" items="${thumnailfile}">
					<img src="/productimg/${thumnailfile.stored_file_name}" width="100%" />
				</c:forEach>
			</li>
			<li>
				<a href="#" type="submit" class="button ">수정</a>
				<a href="#" type="submit" class="button delete_btn">삭제</a>
			</li>
		</ul>
	</div>
                   
	<!-- 바디 -->
	<div id="product_cont_box">
		<ul>
			<li>WHAT IS IT</li>
			<li>REVIEW</li>
		</ul>
		<div id="product_con_div">
			<div id="product_body_img">
				<c:forEach var="productlist" items="${productlist}">
					<img src="/productimg/${productlist.stored_file_name}" width="100%"/>
				</c:forEach>
			</div>
		</div>
	</div>	
	</div>
</body>
</html>