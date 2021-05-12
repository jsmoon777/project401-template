<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/swiper-bundle.min.css">
<link rel="stylesheet" href="css/swiper-bundle2.min.css">
<link href="/css/hover.css" rel="stylesheet" media="all">
<link href="/css/header.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" media="all">
	
	 	<title>게시판</title>
	</head>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			// 목록
			$(".list_btn").on("click", function(){

			location.href = "/board/list?page=${scri.page}"
			+"&perPageNum=${scri.perPageNum}"
			+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			});
			
			
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니가?");
				if(deleteYN == true){
					
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/board/snslist";
			})
			
			//댓글 
			$(".replyWriteBtn").on("click", function(){
			  var formObj = $("form[name='replyForm']");
			  formObj.attr("action", "/board/replyWrite");
			  formObj.submit();
			});
			
			//댓글 수정 View
			$(".replyUpdateBtn").on("click", function(){
				location.href = "/board/replyUpdateView?bno=${read.bno}"
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}"
								+ "&rno="+$(this).attr("data-rno");
			});
					
			//댓글 삭제 View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "/board/replyDeleteView?bno=${read.bno}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&rno="+$(this).attr("data-rno");
			});
			 
		})
	</script>
	
	<!-- 추천하기 버튼 -->
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#btnRecommend").click(function(){
		    if(confirm("해당 글을 추천하시겠습니까?")){
		        document.form1.action="/board/recommend";
		        document.form1.submit();
		        
		        alert("해당 글을 추천하였습니다.")
		        
		        }
		    });
		
		$("#btnLowRecommend").click(function(){
		    if(confirm("해당 글을 비추천하시겠습니까ㅠㅠ?")){
		        document.form1.action="/board/lowrecommend";
		        document.form1.submit();
		        
		        alert("해당 글을 비추천하였습니다.")
		        
		        }
		    });
	
		});
	

	</script>	
	
	<body>
	<!-- 헤더 부분  -->
	<%@include file="/WEB-INF/include/sub_header.jsp" %>
	
	<style>

	#sns_div{
		width:1080px;
		margin: 0 auto;
	}
	#sns_title{
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
		width:1360px;
		height:100%;
		overflow:hidden;
		margin:0 auto;
	}
	#sns_content> .sns_grid{
		width:300px;
		height: 300px;
		padding-left:40px;
		padding-bottom:40px;
		background: #fff;
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
	  top:0px;
	  left:40px;
	  width:inherit;
	  height:inherit;
	  background:#000000;
	  /* 추가된 부분 */
	  opacity:0;
	  transition:all .6s linear;
	}
	
	.btn-plus {
	  position:absolute;
	  top:130px;
	  left:160px;
	  width:35px;
	  height:35px;
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

	<style>
		#snsview_body{
			position: relative;
			width:1400px;
			margin: 0 auto;
			height: 100vh;
			overflow: hidden;
			background: #fff;
			border: 1px solid #dbdbdb;
			margin-top: 200px;
			margin-bottom: 100px;
			
		}
		/*바디 박스*/
		#snsview_box{
			position: relative;
			width: 999px;
			height: 100vh;
			overflow:scroll;
			float: left;
			border-right: 1px solid #dbdbdb;
			background: #fff;
			
		}
		/*이미지박스*/
		#snsimg_box{
			
		}
		
		
		/*글내용*/
		#sns_container{
			position: absolute;
			right:0;
			width: 400px;
			height: 100vh;
			float: left;
			background: #fff;
		}
		
		/*글내용*/
		#readview_con{
			width: 360px;
			padding: 20px;
			height: auto;
			border-bottom: 1px solid #dbdbdb;
			float: left;
			background: #fff;
		}
			/*글쓰기 값*/
			#user_id{
				font-size: 15px;
				font-weight: 900;
				color: #000;
			}
			#read_day{
				position: absolute;
				right:20px;
				font-size: 11px;
				color:#333;
			}
			#read_title{
				margin-right:10px;
				font-size: 13px;
				color:#333;
				margin-bottom: 10px;
			}
			#read_con{
				width: 360px;
				height: auto;
				background: #fff;
				font-size: 13px;
				color:#333;
		
			}
		#reply_con{
			width: 400px;
			height: 70vh;
			overflow-y: scroll;
			float: left;
			background: #fff;
		}
			.reply_box{
				position: relative;
				width:360px;
				height: auto;
				background: #fff;
				padding:20px;
				
			}
		
		
		.box {
    	-ms-overflow-style: none; 
			scrollbar-width: none; 
		}
		.box::-webkit-scrollbar {
			display: none;
		}
			/* 댓글 값*/
			#reply_id{
				margin-right:10px;
				font-weight: 900;
				font-size: 15px;
				color:#333 ;
			}
			#reply_title{
				width: 360px;
				background: #fff;
				font-size: 13px;
				color:#333;
			}
			#reply_read_day{
				position: absolute;
				left:320px;
				font-size: 11px;
				color:#696969;
			}
		#reply_form{
			position: absolute;
			bottom: 0;
			right: 0;
			width: 400px;
			height: 6vh;
			line-height: 6vh;
			float: left;
			background: #fff;
			border-top: 1px solid #dbdbdb;
			/*background: pink;*/
			text-align: center;
		}
		
		/*댓글 아이디 폼*/
		.reply_id_form{
			width: 20%;
			height: 50px;
			border: 0px solid #dbdbdb;
			border-radius: 5px;
		}
		.reply_title_form{
			width: 50%;
			height: 50px;
			border-radius: 5px;
			border: 0px solid #dbdbdb;
			
		}
		
		#reply_btn{
			width: 20%;
			height: 55px;
			font-size: 13px;
			font-weight: 900;
			background: #fff;
			color: #0B82FF;
			border: 0px solid #dbdbdb;
			border-radius: 5px;
		}
		
	
		
		/*토글*/
		
		#button{
			position: relative;
			z-index: 1;
			top:0;
			left: 330px;
			width: 30px;
			height: 30px;
			background-image: url(/img/sns/sns_pannel.png);
			background-size: cover;
		}
		#divToggle{
			position: absolute;
			z-index: 9999;
			top:150px;
			right:180px;
			width: 80px;
			height: 150px;
			background: pink;
			border: 1px solid #dcdcdc;
		}
		.pannel_li{
			float: left;
			width: 80px;
			height: 50px;
			border-bottom: 1px solid #dcdcdc;
			font-size: 12px;
			line-height: 80px;
			text-align: center;
			background: #fff;
			
		}
		
		/* 추천 비추천 조회수 */
		#btnRecommend{
			font-size: 12px; 
			font-weight: 900;
			width: 70px;
			height: 30px;
			border: 1px solid #dbdbdb;
			border-radius: 50px; 
		}
		#btnLowRecommend{
			font-size: 12px; 
			font-weight: 900;
			width: 70px;
			height: 30px;
			border: 1px solid #dbdbdb;
			border-radius: 50px; 
		}
		</style>
		
		<script type="text/javascript">
			$(function (){
				$("#button").click(function (){
				$("#divToggle").toggle();
			  });
			});
		
		</script>


	<!-- 패널 display -->
	
	<form name="readForm" role="form" method="post">
		  <input type="hidden" id="bno" name="bno" value="${read.bno}" />
		  <input type="hidden" id="page" name="page" value="${scri.page}"> 
		  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
		  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
		  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
	</form>
	
	<div id="divToggle" style="display: none;">
		<div class="pannel_li"><button type="submit" class="update_btn">수정</button></div>
		<div class="pannel_li"><button type="submit" class="delete_btn">삭제</button></div>
		<div class="pannel_li"><button type="submit" class="list_btn">목록</button></div>
	</div>
	
	<div id="snsview_body">
	
		<div id="snsview_box">
		
			<c:forEach var="file" items="${file}">										
				
				 <img src="/image/${file.stored_file_name}" width="100%"/>
				 
				<br>
			</c:forEach>
		</div>
		<div id="sns_container">
			<form name="form1">
			<div id="readview_con">
			<!-- 추천하기 -->
				<input type="hidden" id="bno" name="bno" value="${read.bno}" />
			
			<!-- 장바구니 즐켜찾기 -->
			 <form name="cart" method="post" action="cart/insert">
                   <input type="hidden" name="productId" value="${read.bno}">
                   <input type="submit" value="★">
               </form>

			<!-- 메인페널 -->
			    <div id="button"></div>
				<span id="user_id">${read.writer}</span><br><!-- 작성자 -->
				<span id="read_day">
				
					<span style="font-size: 12px; font-weight: 900; ">조회수 ${read.hit}</span><br>
					<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" /></span><br><!-- 날짜 -->
				<span id="read_title">${read.title}</span><br><!-- 제목 -->
				<div id="read_con">${read.content}</div><!-- 내용 -->
				<button type = "button" id = "btnRecommend">추천 
					<span style="color:red; font-size: 9px;">${read.like_cnt}</span>
				</button>
				
				<button type = "button" id = "btnLowRecommend">비추천 
					<span style="color:blue; font-size: 9px;">${read.like_low}</span>
				</button>
			</div>		
			</form>
			
			
			
			<div id="reply_con" class="box">
			 <c:forEach items="${replyList}" var="replyList">
				<div class="reply_box">
					<span id="reply_id">
						<img src="/img/sns/reply_icon.png" width="20px"/>
						${replyList.writer}
					</span>
					<!--댓글작성자  -->
					<div id="reply_title">
						${replyList.content}
					</div>
					<span id="reply_read_day">
						<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />
					</span>
					<br>
					<!-- 댓글작성날짜 -->
					
					<!-- 댓글 수정 삭제 -->
					<div id="reply_btn_box">
						  <button type="button" class="replyUpdateBtn" data-rno="${replyList.rno}" style="font-size:11px; " >수정</button>
						  <button type="button" class="replyDeleteBtn" data-rno="${replyList.rno}" style="font-size:10px; " >삭제</button>
					</div>
				</div>
				</c:forEach>
			</div>	
			

			<!-- 댓글창 -->
			
			<form name="replyForm" method="post">
				  <input type="hidden" id="bno" name="bno" value="${read.bno}" />
				  <input type="hidden" id="page" name="page" value="${scri.page}"> 
				  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
			<div id="reply_form">
				<input type="text" class="reply_id_form" value="${login.user_id}" id="writer" name="writer" style="border:0px; font-size:13px;"/>
				<input type="text" class="reply_title_form" placeholder="내용" id="content" name="content" style="border:0px; font-size:13px;"/>
				<button type="button" id="reply_btn" class="replyWriteBtn" >게시</button>
			</div>
			
			</form>
		</div>				
		
	</div>
	

	<!--목록구현 -->
	
	<div style="font-size: 15px; 
				width:1360px; 
				text-align: left; 
				margin: 0 auto; 
				height: 50px; 
				padding-top: 50px;
				border-top: 1px solid #ccc;
				line-height: 20px;">
		<span style=" font-weight: 900;">${read.writer}</span>님의 다른 게시글 더 보기</div>
		<div id="sns_content">
		
			<c:choose>
				<c:when test="${snsfile==null }">
					<div class="sns_grid">
							<a href="#">
							등록된 글이 없습니다.
							</a>
					</div>
				</c:when>
				<c:when test="${snsfile != null }">
					<c:forEach items="${snsfile}" var = "snsfile" begin="1" end="8">
						<div class=" sns_grid img1">
							<a class="img-wrapper" href="/board/readView?bno=${snsfile.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
								 <div class="darkness"></div>
		      					 <div class="btn-plus">
		      					 	</div>
								<img src="/image/${snsfile.stored_file_name}"/>
							</a>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
		
		</div>

	<%@include file="/WEB-INF/include/footer.jsp" %>
	</body>
</html>