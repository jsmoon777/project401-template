ㅇ<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/commons.css" />
<style> 
   #board1 tr:first-child    { text-align:right;  }
   #board1 tr:nth-of-type(2) { text-align:center;  }
   #board1 td:nth-of-type(1) { width:78px; text-align:center;  }
   #board1 td:nth-of-type(2) { width:378px;  text-align:center; }
   #board1 td:nth-of-type(3) { width:67px; text-align:center;  }
   #board1 td:nth-of-type(4) { width:100px; text-align:center;  }
   #board1 td:nth-of-type(5) { width:67px; text-align:center;  }
      
      
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
   <table id="board1" class="board">
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
