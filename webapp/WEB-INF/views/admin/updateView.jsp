<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/readView?bno=${update.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		
	</script>
	<style type="text/css">
		
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
	<style type="text/css">
		
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
	
	<body>
	<%@include file="/WEB-INF/include/sub_header.jsp" %>
		<div style="margin-top:200px; margin-bottom:200px; ">
			<div class="sns_title_box">
	   			<span class="sns_title">자유게시판 수정<span>
      	 	</div>
				<form name="updateForm" role="form" method="post" action="/board/update">
					<input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
					
						<table  class="table">
							<tr>
								<th>제목</th>
								<td colspan="2">
									<input type="text" id="title" name="title" value="${update.title}" class="chk" title="제목를 입력하세요"/>
								</td>
							</tr>	
							<tr>
								<th>내용</th>
								<td colspan="2">
									<textarea id="content" name="content"   class="chk" title="내용을 입력하세요" style="width:100%; height: 400px;" ><c:out value="${update.content}"/></textarea>
								</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td colspan="2">
									<input type="text" id="writer" name="writer" value="${update.writer}" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<th>작성날짜</th>
								<td colspan="2">
									<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>
								
					</table>
					
					<div style="width:500px; height:100px; text-align:center;line-height:100px; margin:0 auto;">
						<button type="submit" class="update_btn write_btn button" >저장</button>
						<button type="submit" class="cancel_btn write_btn button" >취소</button>
					</div>
					
				</form>
			</div>
		<%@include file="/WEB-INF/include/footer.jsp" %>
	</body>
</html>