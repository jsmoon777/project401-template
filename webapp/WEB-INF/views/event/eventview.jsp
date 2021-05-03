<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		  <input type="hidden" id="bno" name="bno" value="${read.eno}" />
	</form>
	
	<div style="margin-top:200px; margin-bottom:200px; ">
	   <div class="sns_title_box">
	   		<span class="sns_title">진행중인 이벤트<span>
       </div>
			
	<table  class="table">
	<tr>
		<th for="writer">작성자</th>
		<td colspan="2">${read.writer}</td>
	<tr>

	<tr>
		<th for="title">이벤트제목</th>
		<td colspan="2">${read.title}</td>
	</tr>	
	<tr>
		<th for="title">이벤트기간</th>
		<td colspan="2">${read.eventday} ~ ${read.eventday2}</td>
	</tr>	
	<tr>
		<th for="content">내용</th>
		<td colspan="2">${read.content}</td>
	</tr>
	<tr>
		<th for="gdsImg" ></th>
		<td style="width:100%;" colspan="2">
		
			<c:forEach var="eventlist" items="${eventlist}">
				<img src="/image2/${eventlist.stored_file_name}" width="100%"/>
			</c:forEach>
		
		</td>
	<tr>
		<td colspan="3">						
			<p style="font-size: 12px;"><a href="/event/eventlist">목록으로 돌아가기</a></p>	
		</td>
	</tr>	
	</table>
	</form>
	
		</div>
	
	
 <%@include file="/WEB-INF/include/footer.jsp" %>	
</body>
</html>