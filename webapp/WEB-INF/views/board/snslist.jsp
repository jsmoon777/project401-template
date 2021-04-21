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
	width:1080px;
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
	.sns_li{
		float: right;
	}
	#sns_content{
	width:1500px;
	height:100%;
	overflow:hidden;
	padding-bottom:200px;
	padding-top:200px;
	margin:0 auto;
	}
	#sns_content> .sns_grid{
		width:300px;
		height: 300px;
		background: #000;
		overflow:hidden;
		float:left;
		position:relative;
		cursor:pointer;
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
</style>
</head>
<body>
<%@include file="/WEB-INF/include/sub_header.jsp" %>
	<!-- 그리드 이미지 갤러리 -->
	<div style="margin-top:200px; width: 100%; ">
		<!-- sns박스 -->
		<div  id ="sns_box" >
			<div id="sns_div">
				<span id="sns_title" >SNSLIST</span>
				<span class="sns_li">
				<a href="/board/writeView" id="snswite_btn">+</a></span>
			</div>
		</div>	
		
		
		<!--목록구현 -->
		<div id="sns_content">
		
			<c:choose>
				<c:when test="${snsfile==null }">
					<div class="sns_grid">
						<a href="#">등록된 글이 없습니다.</a>
					</div>
				</c:when>
				<c:when test="${snsfile != null }">
					<c:forEach items="${snsfile}" var = "snsfile">
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
	
						
		<!-- 푸터 -->
	<%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>