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
<script type="text/javascript">
    jssor_1_slider_init = function() {

        var jssor_1_options = {ㅁ
          $AutoPlay: 1,
          $Idle: 2000,
          $ArrowNavigatorOptions: {
            $Class: $JssorArrowNavigator$
          },
          $BulletNavigatorOptions: {
            $Class: $JssorBulletNavigator$
          }
        };

        var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

        /*#region responsive code begin*/

        var MAX_WIDTH = 1300;

        function ScaleSlider() {
            var containerElement = jssor_1_slider.$Elmt.parentNode;
            var containerWidth = containerElement.clientWidth;

            if (containerWidth) {

                var expectedWidth = Math.min(MAX_WIDTH || containerWidth, containerWidth);

                jssor_1_slider.$ScaleWidth(expectedWidth);
            }
            else {
                window.setTimeout(ScaleSlider, 30);
            }
        }

        ScaleSlider();

        $Jssor$.$AddEvent(window, "load", ScaleSlider);
        $Jssor$.$AddEvent(window, "resize", ScaleSlider);
        $Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
        /*#endregion responsive code end*/
    };
</script>
<style>
    /* jssor slider loading skin spin css */
    .jssorl-009-spin img {
        animation-name: jssorl-009-spin;
        animation-duration: 1.6s;
        animation-iteration-count: infinite;
        animation-timing-function: linear;
    }

    @keyframes jssorl-009-spin {
        from {
            transform: rotate(0deg);
        }

        to {
            transform: rotate(360deg);
        }
    }


    .jssorb052 .i {position:absolute;cursor:pointer;}
    .jssorb052 .i .b {fill:#fff;fill-opacity:0.3;}
    .jssorb052 .i:hover .b {fill-opacity:.7;}
    .jssorb052 .iav .b {fill-opacity: 1;}
    .jssorb052 .i.idn {opacity:.3;}

    .jssora053 {display:block;position:absolute;cursor:pointer;}
    .jssora053 .a {fill:none;stroke:#fff;stroke-width:640;stroke-miterlimit:10;}
    .jssora053:hover {opacity:.8;}
    .jssora053.jssora053dn {opacity:.5;}
    .jssora053.jssora053ds {opacity:.3;pointer-events:none;}

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
		  margin:0 auto;
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
		height: 1296px;
		background: #fff;
	}
	#product_ul{
		width: 1340px;
		height:auto;
		background: #fff;
		margin: 0 auto;
	}

	.product_li{
		padding-right: 20px;
		width: 315px;
		height: 648px;
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
		width: 315px;
		height: 400px;
		background: #f7f5f5;
		float: left;
	}
	
		.product_img_box > .img{
			width: 90%;
			padding:5%;
			height: 400px;
			overflow:hidden;
			background: #f7f5f5;
			line-height: 400px;
			margin: 0 auto;
		}
		
			.product_img_box > .img > img{
				width: 100%;
			}
	
	.product_txt_box{
		position: relative;
		padding : 24px 10px 24px 10px;
		width: 295px;
		height: 200px;
		background: #fff;
		float: left;
		
	}
	
	.p_title{
		position: relative;
		font-size: 25px;
		color: #000;
		
	}
	
	.p_s_title{
		top:10px;
		position: relative;
		font-size: 20px;
		color: #a0a0a0;
	}
	
	.o_price{
		top:10px;
		left:0px;
		position: relative;
		font-size: 15px;
		color: #a0a0a0;
	}
	
	.s_price{
		margin-left:10px;
		top:-15px;
		left:60px;
		position: relative;
		font-size: 20px;
		color: #000;
	}
	.cart_btn{
		right:10px;
		bottom: 10px;
		width: 30px; height: 30px;
		background: url(/img/cart_icon.png);
		position: absolute;
		font-size: 20px;
		color: #a0a0a0;`
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
	<div style="margin-top:200px; margin-bottom: 200px;"> 
	<!-- 상품 이미지 슬라이드 -->
	<div id="jssor_1" style="position:relative;margin:0 auto;top:0px;left:0px;width:1300px;height:325px;overflow:hidden;visibility:hidden;">
	    	<!-- Loading Screen -->
	    	<div data-u="loading" class="jssorl-009-spin" style="position:absolute;top:0px;left:0px;width:100%;height:100%;text-align:center;background-color:rgba(0,0,0,0.7);">
	        	<img style="margin-top:-19px;position:relative;top:50%;width:38px;height:38px;" src="../svg/loading/static-svg/spin.svg" />
	    	</div>
	     <div data-u="slides" style="cursor:default;position:relative;top:0px;left:0px;width:1300px;height:325px;overflow:hidden;">
	         
	         <div data-p="170.00">
	             <img data-u="image" src="/img/product_slide2.png" />
	         </div>
	         <div data-p="170.00">
	             <img data-u="image" src="/img/product_slide2.png" />
	         </div>
	         
	     </div>
	     <!-- Bullet Navigator -->
	     <div data-u="navigator" class="jssorb052" style="position:absolute;bottom:12px;right:12px;" data-autocenter="1" data-scale="0.5" data-scale-bottom="0.75">
	         <div data-u="prototype" class="i" style="width:16px;height:16px;">
	             <svg viewBox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
	                 <circle class="b" cx="8000" cy="8000" r="5800"></circle>
	             </svg>
	         </div>
	     </div>
	     <!-- Arrow Navigator -->
	     <div data-u="arrowleft" class="jssora053" style="width:55px;height:55px;top:0px;left:25px;" data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
	         <svg viewBox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
	             <polyline class="a" points="11040,1920 4960,8000 11040,14080 "></polyline>
	         </svg>
	     </div>
	     <div data-u="arrowright" class="jssora053" style="width:55px;height:55px;top:0px;right:25px;" data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
	         <svg viewBox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
	             <polyline class="a" points="4960,1920 11040,8000 4960,14080 "></polyline>
	         </svg>
	     </div>
	</div>
    
    <script type="text/javascript">jssor_1_slider_init();</script>
    <!-- 상품 이미지 슬라이드#endregion Jssor Slider End -->
		
		
		
		
	<div id="product_title_box">
		<h1 id="product_title">주문하기</h1>
		<a href="/product/productform">관리자 권한 글쓰기</a>
	</div>
		
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
					<a href="/product/productview?product_id=${productlist.product_id}" class="button">
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
									<span class="cart_btn"></span>
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
	<%@include file="/WEB-INF/include/footer.jsp" %>
  </body>
</html>
