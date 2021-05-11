<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/commons.css" />
<style>
   #board tr:first-child    { text-align:right;  }
   #board tr:nth-of-type(2) { text-align:center;  }
   #board td:nth-of-type(1) { width:78px; text-align:center;  }
   #board td:nth-of-type(2) { width:378px;  text-align:center; }
   #board td:nth-of-type(3) { width:67px; text-align:center;  }
   #board td:nth-of-type(4) { width:100px; text-align:center;  }
   #board td:nth-of-type(5) { width:67px; text-align:center;  }
      
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
   $(function() {

   });
</script>
</head>
<body>   
   <!-- 메뉴 리스트 -->
   <%@ include file="/WEB-INF/include/menus.jsp" %>

   <!--  게시판 -->
   <table id="board">
     <caption><h1>게시판</h1></caption>
     <tr>
       <td>번호</td> 
       <td>제목</td> 
       <td>글쓴이</td> 
       <td>날찌</td> 
       <td>조회수</td> 
       <td>좋아요</td> 
     </tr> 
     <tr>
       <td colspan="6">
         <a href="/MBoard/WriteForm?menu_id=${menu_id}&bnum=0&lvl=0&step=0&nref=0">새글 쓰기</a>
       </td>
     </tr>
   <c:forEach var="board" items="${ boardList }">
     <tr>
       <td>${ board.idx  }</td> 
       <td>
         <a href="/MBoard/View?idx=${ board.idx }&menu_id=${menu_id}">
          ${ board.title }
         </a>
       </td> 
       <td>${ board.writer    }</td> 
       <td>${ board.regdate   }</td> 
       <td>${ board.readcount }</td>
       <td>${ board.likeNum }</td>        
     </tr> 
   </c:forEach>
   </table>
</body>
</html>
