<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   <style type="text/css">
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
    
    height:30px;
    list-style:none;
    padding: 6px;
    }
   
    
   /* 버튼 css */
   .update_btn_box{
    width: 200px;
      height: 54px;
       margin: 0 auto;
   }
   .update_btn {
      display: inline-block;
      width: 200px;
      height: 54px;
      text-align: center;
      text-decoration: none;
      line-height: 54px;
      outline: none;
       position: relative;
     margin: 0 auto;
     top:5px;
     float: left;
      
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
   
  /*검색창 */
  
   #p_search_box{
     position: relative;
     border: 1px solid #000;
     width:300px;
     height: 50px;
     margin: 0 auto;
  }
   #p_search_box > ul{
      position: relative;
      border: 0px solid #000;
      background:pink;
      width:300px;
      height: 50px;
      margin: 0 auto;
      text-align: center;
   }
   #p_search_box > ul >li{
      position: relative;
      background:pink;
      width:75px;
      height: 50px;
      float: left;
      text-align: center;
   }
     #p_search_box > ul >li:nth-child(2){
      width:150px;
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
   


<script>
  $(function() {

  });
</script>
</head>
<%@include file="include/admin_header.jsp" %>
 	<body>
		<div id="admin_body">
		   <h2>공지 관리</h2>
			
			<section id="container">
				<form role="form" method="GET" action="/admin/nwriteView">
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
										<a href="/admin/nreadView?nno=${list.nno}"><c:out value="${list.title}" /></a>
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
		                    <ul>
		                       <c:if test="${pageMaker.prev }">
		                          <li><a href="list${pageMaker.makeSearch(pageMaker.startPage -1) }">이전</a></li>
		                       </c:if>
		                       
		                       <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
		                         <li><a href="list${pageMaker.makeSearch(idx) }">${idx }</a></li>
		                       </c:forEach>
		                       
		                       <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
		                        <li><a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">다음</a></li>
		                       </c:if>
		                    </ul>
		                  </div>
						 
						    <div id="p_search_box">
						     <ul>
						        <li> 
						        <select name="searchType" id="p_select" class="p_boardbox">
						       <option value="n"<c:out value="${scri.searchType == null ?'selected' : '' }"/>>---</option>
						       <option value="t"<c:out value="${scri.searchType eq 't' ?'selected' : '' }"/>>제목</option>
						       <option value="c"<c:out value="${scri.searchType eq 'c' ?'selected' : '' }"/>>내용</option>
						       <option value="w"<c:out value="${scri.searchType eq 'w' ?'selected' : '' }"/>>작성자</option>
						       <option value="tc"<c:out value="${scri.searchType eq 'tc' ?'selected' : '' }"/>>제목+내용</option>
						       </select>
						     
								</li>
							        <li><input type="text" class="p_boardbox p_text" name="keyword" id="keywordInput"  placeholder="Search..." value="${scri.keyword}"/></li>
							        <li><button id="searchBtn" type="button" class="input_btn p_boardbox">검색</button></li>
							     </ul>
							     <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   
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
						 <div class="update_btn_box">
						    <tr>	
							<td colspan="10">
								<button type="submit" class="update_btn" formaction="/admin/nwriteView">글쓰기</button>
							 </td>	
					        </tr>
					     </div>
				</form>
			</section>
		</div>
	</body>
</html>