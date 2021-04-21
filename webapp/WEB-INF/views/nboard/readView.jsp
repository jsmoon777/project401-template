<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
 <style type="text/css">
      
    .table {
      border-collapse: collapse;
      border-top: 3px solid #000;
      border-left:1px;
      border-right:1px;
      width:1000px;
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
   
   .update_btn,.delete_btn,.list_btn {
      display: inline-block;
      width: 200px;
      height: 54px;
      text-align: center;
      text-decoration: none;
      line-height: 54px;
      outline: none;
      
   }
   .delete_btn::before,
   .list_btn::after {
      position: absolute;
      z-index: -1;
      display: block;
      content: '';
   }
   .update_btn,
   .delete_btn::before,
   .list_btn::after {
   
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
      box-sizing: border-box;
      -webkit-transition: all .3s;
      transition: all .3s;
   }
   
   .update_btn,.delete_btn,.list_btn {
   background-color: #000;
   color: #fff;
   }
   .update_btn:hover {
      letter-spacing: 5px;
   }
   </style>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			// 목록
			$(".list_btn").on("click", function(){

			location.href = "/nboard/list?page=${scri.page}"
			+"&perPageNum=${scri.perPageNum}"
			+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			});
			
			
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/nboard/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니가?");
				if(deleteYN == true){
					
				formObj.attr("action", "/nboard/delete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/nboard/list";
			})
			
			
			
				
			
		})
	</script>

	<%@include file="/WEB-INF/include/sub_header.jsp" %>
<body>
		<div style="margin-top:200px; margin-bottom:200px; ">
			 <div class="sns_title_box">
            <span class="sns_title">공지 사항<span>
       </div>
        <section id="container">
				<form name="readForm" role="form" method="post">
				  <input type="hidden" id="nno" name="nno" value="${read.nno}" />
				  <input type="hidden" id="page" name="page" value="${scri.page}"> 
				  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				  <input type="hidden" id="FILE_NO" name="FILE_NO" value=" ">
				</form>
           
				<table class="table">
					<tbody>
						<tr>
						<th for="title">제목</th>
							<td colspan="2">
								<input type="text" id="title" name="title" value="${read.title}" readonly="readonly" />
							</td>
						</tr>	
						<tr>
						<th for="content">내용</th>
							<td colspan="2">
								<textarea id="content" name="content" readonly="readonly"style="width:100%; height: 250px;">
								<c:out value="${read.content}" /></textarea>
							</td>
						</tr>
						<tr>
						<th for="writer">작성자</th>
							<td colspan="2">
								<input type="text" id="writer" name="writer" value="${read.writer}"  readonly="readonly"/>
							</td>
						</tr>
						<tr>
						<th for="regdate">작성날짜</th>
							<td>
								<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />					
							</td>
						</tr>
						<tr>
						<th for="gdsImg">공지 파일첨부</th>
						<td>
						<div class="form-group" style="border: 1px solid #dbdbdb; width:100%;">
						<c:forEach var="file" items="${file}">
					    	<img src="/image5/${file.STORED_FILE_NAME} " style="width:100%;"/>
					    </c:forEach>
						</div>
						</td>
						</tr>
						<tr>
						<td colspan="3">                 
					      <input class="update_btn" type="submit" value="수정"/> 
					      <input class="delete_btn" type="submit" value="삭제"/>   
					      <input class="list_btn" type="submit" value="목록"/>   
					    </td>	
					    </tr>	
					</tbody>			
				</table>
				
         </section>
		</div>
	</body>
		<%@include file="/WEB-INF/include/footer.jsp" %>
</html>