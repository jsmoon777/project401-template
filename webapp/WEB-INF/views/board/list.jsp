<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>sns 자유계시판</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	width:200px;
	height: 200px;
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
	.search{
		width:1000px;
		height: 50px;
		margin:0 auto;
	}
	.paging{
	width: 1200px;
		height: 50px;
		margin:0 auto;
		background: pink;
		}
	.paging ul li{
	float: left;
	list-style: none;
	width:50px;
	}
	
	</style>
	 <script>
      $(function(){
        $('#searchBtn').click(function() {
          	alert('클릭');
        	self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
	</head>
	
	<body>
	<div style="margin-top:200px; width: 100%;">
	<section id="container">
		
		<form role="form" method="get">
			<table  class="table">
				<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				</tr>
				
				<c:forEach items="${list}" var = "list">
					<tr>
						<td><c:out value="${list.bno}"/></td>
						<td>
							<a href="/board/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
								<c:out value="${list.title}" />
							</a>
							
						</td>
						<td><c:out value="${list.writer}" /></td>
						<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</table>
			<style>
				.search{
					width: 1200px;
					margin: 0 auto;
				}
				.search select {
				width: 100px;
				}
				#keywordInput{
				width: 800px;
				}
				#searchBtn{
				width: 200px;
				}
				.paging{
					width:500px;
					margin: 0 auto;
				}
				
			</style>
			<!-- 검색 -->
			  <div class="search">
			    <select name="searchType">
			      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>선택</option>
			      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
			      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
			      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
			      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
			    </select>
			
			    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
			
			    <button id="searchBtn" type="button" class="button">검색</button>
			   
			  </div>
		 
		  
		    <!-- 페이징 -->
			<div class="paging">
			  <ul>
			    <c:if test="${pageMaker.prev}">
			    	<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
			    </c:if> 
			
			    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			    	<li><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
			    </c:forEach>
			
			    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			    	<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			    </c:if> 
			  </ul>
			</div>
			
		</form>
		</section>
		</div>
	</body>
</html>