<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 상품 주문 테이블 -->
<style type="text/css">
	.table2 {
      border-collapse: collapse;
      border:0px;
      width:1200px;
      text-align: left;
      margin: 0 auto;
      margin-bottom:50px;
    }  
   
    .table2 th, .table2 td {
	
      padding-left:50px;
      height:50px;
      border: 0px solid #f0f0f0;
    }
    .table2 th:first-child, .table2 td:first-child {
      border-left: 0;
    }
    .table2 th:last-child, .table2 td:last-child {
      border-right: 0;
    }
    .table2 tr td:first-child{
      text-align: center;
    }
    .table2 caption{caption-side: bottom; display: none;}
    
</style>
<style type="text/css">
		
	.table {
      border-collapse: collapse;
      border-top: 3px solid #000;
      border-left:1px;
      border-right:1px;
      width:1200px;
      text-align: left;
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
    /* 타이틀 */
    .sns_title_box{
    	width:1200px;
    	height: 60px;
    	background:#fff;
    	margin: 0 auto;
    }
    
    .sns_title{
    	float: left;
    	line-height: 60px;
    	font-size: 20px;
    	font-weight: 900;
    }
	/* 버튼 css */
	
	.button {
		display: inline-block;
		width: 200px;
		height: 54px;
		text-align: center;
		text-decoration: none;
		line-height: 54px;
		outline: none;
	}
	.button::before,
	.button::after {
		position: absolute;
		z-index: -1;
		display: block;
		content: '';
	}
	.button,
	.button::before,
	.button::after {
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
		-webkit-transition: all .3s;
		transition: all .3s;
	}
	
	.button {
	background-color: #000;
	color: #fff;
	}
	.button:hover {
		letter-spacing: 5px;
	}
	</style>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
		});
	</script>
</head>
<body>
 <%@include file="/WEB-INF/include/sub_header.jsp" %>
	<!-- 이벤트 뷰페이지 -->
	<form name="readForm" role="form" method="post">
		  <input type="hidden" id="product_id" name="product_id" value="${read.product_id}" />
	</form>
	
  <%--  <div class="sns_title_box">
   		<span class="sns_title">상품주문<br>${read.product_name}<span>
      </div> --%>
	<div style="margin-top:200px; margin-bottom:200px; ">
       
      
       
	<table border="1" class="table2">
       <tr>
           <td style="width:50%; height:500px; overflow: hidden;">
	             <c:forEach var="thumnailfile" items="${thumnailfile}">
					<img src="/productimg/${thumnailfile.stored_file_name}" width="100%" />
				</c:forEach>
           </td>
           <td>
               <table border="0" style="width:100%; height: 500px;">
                   <tr>
                       <td 
                       style="
                       width:100%;
                       font-size: 25px; 
                       font-weight: 500; 
                       text-align: left; 
                       ">${read.product_name}</td>
                   </tr>
                   <tr>
                       <td 
                       style="
                       font-size: 20px; 
                       font-weight: 500;
                       text-align: left;
                       color:red;
                        ">
                       		<fmt:formatNumber value="${read.product_price}" pattern="###,###,###"/>원
                       </td>
                   </tr>
                   <tr>
                       <td
                       style="
                       font-size: 15px; 
                       font-weight: 900;
                       text-align: left;
                       
                        "
                       >${read.product_desc}</td>
                   </tr>
                   <tr>
                       <td colspan="2" 
                       style="
                       font-size: 20px; 
                       font-weight: 900;
                       text-align: left;
                        ">
                           <form name="form1" method="post" action="${path}/shop/cart/insert.do">
                           
                               <input type="hidden" name="productId" value="${read.product_id}">
                               <select name="amount"
                               style="
                               width:20%;
                               height:25px;
                              
		                       font-size: 25px; 
		                       text-align: left;
		                        ">
                                   <c:forEach begin="1" end="10" var="i">
                                       <option value="${i}">${i}</option>
                                   </c:forEach>
                               </select>&nbsp;개<br><br>
                               <input type="submit" class="button" value="장바구니에 담기" style="margin-top:25px;width:100%;">
                               
                           </form>
                          <br>
                           <a href="${path}/shop/product/list.do"  class="button">상품목록</a>
                       </td>
                   </tr>
               </table>
           </td>
       </tr>
   </table>
   
	<table  class="table">
	<tr>
		<th for="writer">상품명</th>
		<td colspan="2">${read.product_name}</td>
	<tr>

	<tr>
		<th for="title">가격</th>
		<td colspan="2">${read.product_price}</td>
	</tr>	
	<tr>
		<th for="title">상품내용</th>
		<td colspan="2">${read.product_desc}</td>
	</tr>	
	<tr>
		<th for="gdsImg" ></th>
		<td style="width:100%;" colspan="2">
		
			<c:forEach var="productlist" items="${productlist}">
				<img src="/productimg/${productlist.stored_file_name}" width="100%"/>
			</c:forEach>
		
		</td>
	<tr>
		<td colspan="3">						
			<p style="font-size: 12px;"><a href="/product/productlist">목록으로 돌아가기</a></p>	
		</td>
	</tr>	
	</table>
	</form>
	
		</div>
	
	
 <%@include file="/WEB-INF/include/footer.jsp" %>	
</body>
</html>