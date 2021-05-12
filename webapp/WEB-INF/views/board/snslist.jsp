<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=1440,initial-scale=1.0" />
<meta name="Generator" content="FFEE" />
<meta name="Author" content="FFEE" />
<meta name="Keywords" content="FFEE" />
<meta name="Description" content="FFEE"/>
<title>sns 자유게시판</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/mrpizza.ico" />
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>

	#sns_div{
	width:1500px;
	margin: 0 auto;
	
	}
	#sns_title{
	color:#dcdcdc;
	font-size: 50px;
	}
	/* 글쓰기 폼 */
	#snswite_btn{
	width:150px;
	height: 150px;
	font-size:70px;
	font-weight:900;
	margin: 0 auto;
}
	#snswite_btn:hover{
		color:red;	
	}
	
	#sns_content{
	position:relative;
		width:1500px;
		height:100%;
		overflow:hidden;
		margin:0 auto;
	}
	
	#sns_list_box> .sns_grid{
		width:300px;
		height: 300px;
		background: #000;
		overflow:hidden;
		float:left;
		position:relative;
		cursor:pointer;
	}	
	
	#sns_list_box{
	position: relative;
	}
	
	/* sns 호버 영역 */
	.img-wrapper {
	  width:300px;
	  height:300px;
	}
	
	.img-wrapper img {
	  width:inherit;
	  height:inherit;
	}
	
	.img1 {
	  top:2px;
	  left:2px;
	}
	
	.darkness {
	  position:absolute;
	  top:0;
	  left:0;
	  width:inherit;
	  height:inherit;
	  background:#000000;
	  /* 추가된 부분 */
	  opacity:0;
	  transition:all .6s linear;
	}
	
	.btn-plus {
	  position:absolute;
	  top:120px;
	  left:120px;
	  width:50px;
	  height:50px;
	  text-align:center;
	  /* 추가된 부분 */
	  opacity:0;
	  transform:scale(2);
	  transition:all .3s linear;
	}
	
	.btn-plus span {
	  font-size:2.3em;
	  color:#ffffff;
	  user-select:none;
	}
	
	/* 추가된 부분 */
	.img-wrapper:hover .darkness{
	  opacity:0.4;
	}
	
	/* 추가된 부분 */
	.img-wrapper:hover .btn-plus {
	  opacity:1;
	  transform:scale(1);
	}

	/* 버튼 css */
   
   .button {
  	 
      display: inline-block;
      width: 100px;
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
	
	/* 검색창 */
	#big_search_box{
	position: relative;
	width: 100%;
	height: 50px;
	margin-bottom: 50px;
	}
	#p_search_box{
	  position: absolute;
	  border: 1px solid #C7C7C7;
	  width:500px;
	  height: 50px;
	  right: 0;
  }
	#p_search_box > ul{
		position: relative;
		border: 0px solid #000;
		background:pink;
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
			  /* background: #5f0080; */
			  background: #464646;
			  
			  color: #fff;
		  }
		input[type="text"],
		input[type="email"],
		input[type="password"],
		input[type="email"],
		input[type="tel"],
		textarea {
			border: 0px;
		}
			
	</style>

<script>
    $(function(){
      $('#searchBtn').click(function() {
      	self.location = "snslist" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
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
				<h1>FFEE SNSLIST</h1>
		      	<p class="lead">SNSLIST</p>
			<a href="/board/writeView" id="snswite_btn">+</a>
			</div>
		</div>	
		
		<form role="form" action="get">
		
		<!--목록구현 -->
		<div id="sns_content">
		  <!-- 검색 -->
		  <div id="big_search_box">
			  <div id="p_search_box">
				  <ul>
				  	<li> 
					  <select name="searchType" id="p_select" class="p_boardbox">
					     <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>선택</option>
					      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
					   </select>
				    </li>
				  	<li><input type="text" class="p_boardbox p_text" name="keyword" id="keywordInput"  placeholder="검색해주세요" value="${scri.keyword}" style="border: 0px;"/></li>
				  	<li><button id="searchBtn" type="button" class="input_btn p_boardbox">검색</button></li>
				  </ul>
			  </div> 
		  </div>
		  
		
		  <div id="sns_list_box">
			<c:choose>
				<c:when test="${snsfile==null }">
					<div class="sns_grid">
						<a href="#">등록된 글이 없습니다.</a>
					</div>
				</c:when>
				<c:when test="${snsfile != null }">
					<c:forEach items="${snsfile}" var = "snsfile">
			        <input type="hidden" name="title" value="${snsfile.title }"/>
			        <input type="hidden" name="content" value="${snsfile.content }"/>
			        <input type="hidden" name="writer" value="${snsfile.writer }"/>
						<div class=" sns_grid img1">
							<a class="img-wrapper" href="/board/readView?bno=${snsfile.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
								 <div class="darkness"></div>
		      					 <div class="btn-plus">
		      					 	<img src ="/img/sns/sns_plus.png" width="50px" draggable="false">
		      					 	</div>
								<img src="/image/${snsfile.stored_file_name}"/>
							</a>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
	</div>
		
		<!-- 페이징 -->
		<div class="paging">
		  <ul>
		    <c:if test="${pageMaker.prev}">
		    	<li><a href="snslist${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
		    </c:if> 
		
		    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		    	<li><a href="snslist${pageMaker.makeSearch(idx)}">${idx}</a></li>
		    </c:forEach>
		
		    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		    	<li><a href="snslist${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
		    </c:if> 
		  </ul>
		</div>
		
  </div>

	  </form>				
		<!-- 푸터 -->
	<%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>