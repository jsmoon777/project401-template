<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <style type="text/css">
      
   .table {
      border-collapse: collapse;
      border-top: 3px solid #000;
      border-left:1px;
      border-right:1px;
      width:500px;
      text-align: center;
      margin: 0 auto;
    }  
    .table th {
      width:200px;
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
       line-height: 40px;
       font-size: 20px;
       font-weight: 900;
    }
    
    .td{
    float:left; 
    
    }
    
    .listpage{
    position: relative;
    left:900px;
    list-style:none;
    padding: 6px;
    }
   .search{
   position: relative;
   left:800px;
   
   }
    
   /* 버튼 css */
   
   .update_btn {
      display: inline-block;
      width: 200px;
      height: 54px;
      text-align: center;
      text-decoration: none;
      line-height: 54px;
      outline: none;
       position: relative;
      left:850px;
     top:5px;
      
   }
   
   .button::before,
   .button::after {
     
      top:940px;
      z-index: -1;
      display: block;
      content: '';
   }
   
   .update_btn,
   .button::before,
   .button::after {
   
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
      box-sizing: border-box;
      -webkit-transition: all .3s;
      transition: all .3s;
   }
   
   .update_btn {
   background-color: #000;
   color: #fff;
   }
   .update_btn:hover {
      letter-spacing: 5px;
   }
  
   </style>
   

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
  $(function() {

  });
</script>
</head>
<%@include file="/WEB-INF/include/sub_header.jsp" %>
 	<body>
		<div style="margin-top:200px; margin-bottom:200px; ">
			 <div class="sns_title_box">
            <span class="sns_title">공지 등록<span>
       </div>
			
			<section id="container">
				<form role="form" method="GET" action="/nboard/writeView">
					<table  class="table">
						<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th></tr>
						
						<c:choose>
							<c:when test="${list == null}">
								<tr>등록된 글이 없습니다.</tr>
							</c:when>
						
							<c:when test="${list != null}">
							<c:forEach items="${list}" var = "list">
								<tr>
									<td><c:out value="${list.nno}" /></td>
									<td>
										<a href="/nboard/readView?nno=${list.nno}"><c:out value="${list.title}" /></a>
									</td>
									<td><c:out value="${list.writer}" /></td>
									<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
								    <td><c:out value="${list.hit }"/></td>
								</tr>
							</c:forEach>
						
						</c:when>
						</c:choose>
						</table>
						 
						<div class="listpage">
		                    <th>
		                       <c:if test="${pageMaker.prev }">
		                          <td><a href="list${pageMaker.makeSearch(pageMaker.startPage -1) }">이전</a></td>
		                       </c:if>
		                       
		                       <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
		                         <td><a href="list${pageMaker.makeSearch(idx) }">${idx }</a></td>
		                       </c:forEach>
		                       
		                       <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
		                        <td><a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">다음</a></td>
		                       </c:if>
		                    </th>
		                  </div>
						 
						   <div class="search">
						     <select name="searchType">
						       <option value="n"<c:out value="${scri.searchType == null ?'selected' : '' }"/>>---</option>
						       <option value="t"<c:out value="${scri.searchType eq 't' ?'selected' : '' }"/>>제목</option>
						       <option value="c"<c:out value="${scri.searchType eq 'c' ?'selected' : '' }"/>>내용</option>
						       <option value="w"<c:out value="${scri.searchType eq 'w' ?'selected' : '' }"/>>작성자</option>
						       <option value="tc"<c:out value="${scri.searchType eq 'tc' ?'selected' : '' }"/>>제목+내용</option>
						     </select>
						     
								<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control" style="width:140px;height:30px;font-size:30px;"/>
								<button id="searchBtn" type="button" class="btn btn-default">검색</button> 	
						     
						     <script>
						     $(document).ready(function() {
		                            $('#searchBtn').on("click",function(event) {
		                                str = "list"
		                                        + '${pageMaker.makeQuery(1)}'
		                                        + "&searchType="
		                                        + $("select option:selected").val()
		                                        + "&keyword="
		                                        + encodeURIComponent($('#keywordInput').val());
		                                alert(str);
		                                self.location = str;
		                            });
		                            });
						     </script>
						</div>
						 
						<tr>	
							<td colspan="10">
								<button type="submit" class="update_btn" formaction="/nboard/writeView">글쓰기</button>
							 </td>	
					        </tr>
					       
				</form>
			</section>
		</div>
	</body>
		<%@include file="/WEB-INF/include/footer.jsp" %>

</html>