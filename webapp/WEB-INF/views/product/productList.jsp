<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.5.0/materia/bootstrap.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/> <!-- 아이콘 -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>FFEE 상품목록 </title>
<style>
	a{
	list-style: none;
	text-decoration: none;
	}
	#sns_content{
	width:1500px;
	height:100%;
	overflow:hidden;
	padding-bottom:200px;
	margin:0 auto;
	}
	
	.p_money{
	
		font-size: 25px;
		font-weight: 900;
		color:red;
	}
	/* 버튼 css */
   
   .button {
  	 margin-top:50px;
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
	</style>
 <style>

 #p_search_box{
	  position: relative;
	  width:905px;
	  height: 53px;
	  margin: 0 auto;
  }
	#p_search_box > ul{
		position: relative;
		border: 1px solid #000;
		background:#fff;
		width:902px;
		height: 52px;
		overflow:hidden;
		margin: 0 auto;
		text-align: center;
	}
	#p_search_box > ul >li{
		position: relative;
		width:100px;
		height: 50px;
		float: left;
		text-align: center;
	}
	  #p_search_box > ul >li:nth-child(2){
		width:700px;
	}
		  .p_boardbox{
			  border-right:1px solid #fff;
		  }
			  
		  #p_select{
			  width: 100%;
			  height: 50px;
			  background-image: url( "images/bg-house.png" );
        	  background-repeat: repeat;
        	  font-size: 12px;
        	  
		  }
		  .p_text{
		  	  padding-left:20px;
			  width: 100%;
			  height: 50px;
			  border-right: 1px solid #000;
		  }
		  #searchBtn{
			  width: 100%;
			  height: 50px;
			  text-align: center;
			  line-height: 50px;
			  background: #000;
			  color: #fff;
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
  <%@include file="/WEB-INF/include/sub_header.jsp" %>
   <!-- 그리드 이미지 갤러리 -->
   <div style="margin-top:200px; width: 100%; margin-bottom:200px;">
		<!-- sns박스 -->
		<div  id ="sns_box" style="width:1500px;margin:0 auto;">
			<div id="sns_div">
			      <h1>FFEE 상품목록</h1>
			      <p class="lead">케이크</p>
				<span class="sns_li">
				<a href="/product/productform" id="snswite_btn">+</a>
				</span>
			</div>
		</div>	
      <form role = "form" action="get">
      
	<!-- 검색창 -->
	  <div id="p_search_box">
	  <ul>
	  	<li> 
		  <select name="searchType" id="p_select" class="p_boardbox">
		      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>전체</option>
		      <option value="pn"<c:out value="${scri.searchType eq 'pn' ? 'selected' : ''}"/>>상품명</option>
		   </select>
	    </li>
	  	<li><input type="text" class="p_boardbox p_text" name="keyword" id="keywordInput"  placeholder="Search..." value="${scri.keyword}"/></li>
	  	<li><button id="searchBtn" type="button" class="input_btn p_boardbox">검색</button></li>
	  </ul>
	  </div> 
    
	  
      <!-- 이벤트 목록 구현 -->
      <div class="container text-right mt-3">
        <a type="button" class="no-outline p-0 grid-3x3" title="Spaced">
          <span class="material-icons">
            apps
          </span>
        </a>

        <a
          type="button"
          class="no-outline p-0 mx-2 grid-4x3"
          title="Compact">
          <span class="material-icons">
            view_comfy
          </span>
        </a>
      </div>
      
      <div id="sns_content">
        <!-- 검색 -->
        
       <script type="text/javascript">
       $(document).ready(function(){
    	   var selectTarget = $('.selectbox select');

    	  selectTarget.on('blur', function(){
    	    $(this).parent().removeClass('focus');
    	  });

    	   selectTarget.change(function(){
    	     var select_name = $(this).children('option:selected').text();

    	   $(this).siblings('label').text(select_name);
    	   });
    	 });
       </script>
	 

	  
	  
	  
     <div class="row">
      <c:choose>
		<c:when test ="${productlist == null }">
		
			<p>등록된 글이 없습니다.</p>
			
		</c:when>

		<c:when test="${productlist != null}">
			<c:forEach items="${productlist}" var="productlist">
				
				 <div class="gv-card col-4 my-4">
					<div class="card">
					  <img class="product_img" src="/productimg/${productlist.stored_file_name}"/>
					  <div class="card-body">
					    <h3 class="card-title">${productlist.product_name}</h3>
					    <p class="card-text p_money"  ><fmt:formatNumber pattern="###,###,###" value="${productlist.product_price}"/></p>
					    
					    <a href="/product/productview?product_id=${productlist.product_id}" class="button">보러가기</a>
					  </div>
					</div>
				</div>
				
			</c:forEach>
		</c:when>
      </c:choose>

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
    </div>
    
    </form>
    </div>
    <!--Scripts needed to run bootstrap-->
    <script
      src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
      integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
      crossorigin="anonymous"
    ></script>
    <!--Grid View JS-->
    <script src="/js/grid-view.js"></script>
    <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<script>
try {
  fetch(new Request("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js", { method: 'HEAD', mode: 'no-cors' })).then(function(response) {
    return true;
  }).catch(function(e) {
    var carbonScript = document.createElement("script");
    carbonScript.src = "//cdn.carbonads.com/carbon.js?serve=CK7DKKQU&placement=wwwjqueryscriptnet";
    carbonScript.id = "_carbonads_js";
    document.getElementById("carbon-block").appendChild(carbonScript);
  });
} catch (error) {
  console.log(error);
}
</script>

<%@include file="/WEB-INF/include/footer.jsp" %>
  </body>
</html>
