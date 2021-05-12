<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>FFEE 상품목록 </title>
<script src="/js/jssor.slider.min.js" type="text/javascript"></script>

<style>
 
	a{
	list-style: none;
	text-decoration: none;
	}
   
	/* 페이징 */
	.paging ul {
	text-align:center;
	}
	.paging ul li {
		display:inline;
		vertical-align:middle;
	}
	.paging ul li a {
		display:-moz-inline-stack;	/*FF2*/
		display:inline-block;
		vertical-align:top;
		padding:4px;
		margin-right:3px;
		width:25px !important;
		height:25px;
		color:#000;
		font:bold 12px tahoma;
		border:1px solid #eee;
		text-align:center;
		text-decoration:none;
		width /**/:26px;	/*IE 5.5*/

	}
	.paging ul li a.now {
		color:#fff;
		background-color:#f40;
		border:1px solid #f40;
	}
	.paging ul li a:hover, .paging ul li a:focus {
		color:#fff;
		border:1px solid #f40;
		background-color:#f40;
	}
	
	/* 검색창 */
	#big_search_box{
		position: relative;
		width: 100%;
		height: 50px;
		margin-bottom: 50px;
	}
	#p_search_box{
		  position: relative;
		  float:right;
		  border: 1px solid #C7C7C7;
		  width:500px;
		  height: 50px;
		  right: 0;
  }
	#p_search_box > ul{
		position: relative;
		border: 0px solid #000;
		background:#fff;
		width:500px;
		height: 50px;
		right:0;
		text-align: center;
	}
	#p_search_box > ul >li{
		position: relative;
		background:#fff;
		width:100px;
		height: 50px;
		float: left;
		text-align: center;
	}
	  #p_search_box > ul >li:nth-child(2){
		width:300px;
	}
	  .p_boardbox{
		  border: 0px;
		  
	  }
		  
	  #p_select{
		  width: 100%;
		  height: 50px;
		  background-repeat: no-repeat;
		  
	  }
	  .p_text{
		  width: 100%;
		  height: 50px;
		  border: 0px;
	  }
	  #searchBtn{
		  width: 100%;
		  height: 50px;
		  text-align: center;
		  line-height: 50px;
		  background: #fff;
		  color: #000;
	  }
	  
	   #searchBtn > img{
	   	width: 20px;
	   	height: 20px;
	   	line-height:20px;
	   	margin: 0 auto;
	   }
	   
	input[type="text"],
	input[type="email"],
	input[type="password"],
	input[type="email"],
	input[type="tel"],
	textarea {
		border: 0px;
	}

	/* 타이틀 박스 */
	#product_title_box{
		width: 1300px;
		height:200px;
		padding-top:100px;
		background:#fff;
		text-align: center;
		margin: 0 auto;	
	
	}
	#product_title{
		font-weight:600;
		width: 1000px;
		font-size:38px;
		height: 100px; 
		margin: 0 auto;
	}
	
	/* 상품주문하기 */
	*,bocy,ul,li{
		list-style: none;
		padding: 0;
		margin:0;
	}
	#product_box{
		margin-bottom:100px;
		width: 100%;
		height: 411px;
		background: #fff;
		overflow-y:scroll;
		overflow-y:hidden;



	}
	#product_ul{
		width: 1340px;
		height:auto;
		background: #fff;
		margin: 0 auto;
	}

	.product_li{
		padding-right: 20px;
		width: 200px;
		height: 411px;
		background: #fff;
		float: left;
	}
	#product_box > ul > li:nth-of-type(4){
		padding-right: 0px;
	}
	
	#product_box > #product_ul > .product_li:nth-child(8){
		padding-right: 0px;
	}
	
	.product_img_box{
		position:relative;
		margin: 0 auto;
		width: 200px;
		height: 254px;
		background: #f7f5f5;
		float: left;
	}
	
		.product_img_box > .img{
			width: 90%;
			padding:5%;
			height: 254px;
			overflow:hidden;
			background: #f7f5f5;
			line-height: 254px;
			margin: 0 auto;
		}
		
			.product_img_box > .img > img{
				width: 100%;
			}
	
	.product_txt_box{
		position: relative;
		padding : 24px 10px 24px 10px;
		width: 180px;
		height: 158px;
		background: #fff;
		float: left;
		
	}
	
	.p_title{
		position: relative;
		font-size: 15px;
		color: #000;
		
	}
	
	.p_s_title{
		top:10px;
		position: relative;
		font-size: 12px;
		color: #a0a0a0;
	}
	
	.o_price{
		top:10px;
		left:0px;
		position: relative;
		font-size: 12px;
		color: #a0a0a0;
	}
	
	.s_price{
		margin-left:10px;
		top:-15px;
		left:60px;
		position: relative;
		font-size: 12px;
		color: #000;
	}
	.cart_btn{
		right:10px;
		bottom: 10px;
		width: 30px; height: 30px;
		background: url(/img/cart_icon.png);
		position: absolute;
		font-size: 12px;
		color: #a0a0a0;`
	}
	
	
	/* 관리자페이지 */
   #admin_body{
      position:absolute;
      width:75%;
      margin-left:5%;
      margin-right:5%;
      height:800px;
      background:#fff;
      float: left;
      top:150px;
      left: 250px;
   }
   #admin_body>h2{
   margin-bottom:50px;
   }
   .table {
      border-collapse: collapse;
      border-top: 3px solid #383838;
      width:100%;
      text-align: center;
      margin: 0 auto;
    }  
    .table th {
      color: #383838;
      background: #fff;
      text-align: center;
      font-size: 12px;
    }
    .table th, .table td {
      padding: 10px;
      border: 1px solid #ddd;
      font-size: 10px;
    }
    .table th:first-child, .table td:first-child {
      border-left: 0;
    }
    .table th:first-child, .table td:nth-of-type(3) {
      text-align:left;
      border-left: 0;
    }
    .table th:last-child, .table td:last-child {
      border-right: 0;
    }
    .table tr td:first-child{
      text-align: center;
    }
</style>
	
<!-- 검색이동 -->
<script type="text/javascript">
	$(function(){
	  $('#searchBtn').click(function() {
	    	alert('검색되었습니다.');
	  	self.location = "productList" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	  });
	});   
</script>
  </head>
  
  <body>
    <%@include file="include/admin_header.jsp" %>
	<div id="admin_body"> 
	<h2>주문하기</h2 >
	<a href="/admin/productform">관리자 권한 글쓰기</a>
		
    <form role = "form" action="get">
		<!-- 검색창 -->
		<div id="big_search_box">
			<div id="p_search_box">
			 <ul>
			 	<li> 
				  <select name="searchType" id="p_select" class="p_boardbox">
				      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>전체</option>
				   		  <option value="pn"<c:out value="${scri.searchType eq 'pn' ? 'selected' : ''}"/>>상품명</option>
				  </select>
			  	</li>
			  
				<li><input type="text" class="p_boardbox p_text" name="keyword" id="keywordInput"  placeholder="검색해주세요" value="${scri.keyword}" style="border: 0px;"/></li>
			  	<li>
			  		<button id="searchBtn" type="button" class="input_btn p_boardbox">
			  		<img src="/img/search_icon.png"/>
			  		</button>
			  	</li>
			  </ul>
			 </div> 
		</div>
	
	<!-- 상품 -->
	<div id="product_box">
		<ul id="product_ul">
		<c:choose>
			<c:when test ="${productlist == null }">
			
			<li>등록된 글이 없습니다.</li>
			
			</c:when>
			<c:when test="${productlist != null}">
				<c:forEach items="${productlist}" var="productlist">
					<a href="/admin/productview?product_id=${productlist.product_id}" class="button">
						<li class="product_li">
								<div class="product_img_box">
									<div class="img">
										<img src="/productimg/${productlist.stored_file_name}">
									</div>
								</div>
								
								<div class="product_txt_box">
									<span class="p_title">${productlist.product_name}</span><br>
									<span class="p_s_title">${productlist.product_tag}</span><br>
									<span class="o_price"><del>₩<fmt:formatNumber pattern="###,###,###" value="${productlist.product_price}"/></del></span><br>
									<span class="s_price"><b>₩<fmt:formatNumber pattern="###,###,###" value="${productlist.product_price2}"/></b></span><br>
								</div>
						</li>
						
					</a>
				</c:forEach>
			</c:when>
			</c:choose>
		</ul>
	</div>
	
	
	
	<!-- 페이징  -->
		<div class="paging">
		
		  <ul>
		    <c:if test="${pageMaker.prev}">
		 	<li><a href="productList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
		 </c:if> 
		
		 <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		 	<li><a href="productList${pageMaker.makeSearch(idx)}">${idx}</a></li>
		 </c:forEach>
		
		 <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		 	<li><a href="productList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
		 </c:if> 
		  </ul>
		</div>
    <!-- 페이징 끝 -->
	  
	
	</form>
	</div>  
	
  </body>
</html>
