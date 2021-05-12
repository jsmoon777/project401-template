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
   #board1 .td1 {  width:178px; text-align:center; }
   #board1 .td2 {  width:578px; text-align:left; }
   
   #board1 [type=text] { width : 570px; }
   #board1 textarea    { width : 570px; height:300px;}
   
      
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

  <form action="/MBoard/Write" method="POST">
  <input type="hidden" name="menu_id" value="${ menu_id }" />
  <input type="hidden" name="bnum"    value="${ board.bnum }" />
  <input type="hidden" name="lvl"     value="${ board.lvl }" />
  <input type="hidden" name="step"    value="${ board.step }" />
  <input type="hidden" name="nref"    value="${ board.nref }" />
  <table id="board1" class="board">
    <caption><h2>게시물 등록</h2></caption>
    <tr>
      <td class="td1">제목</td>
      <td class="td2"><input type="text" name="title" /></td>
    </tr>   
    <tr>
      <td class="td1">글쓴이</td>
      <td class="td2"><input type="text" name="writer" /></td>
    </tr>
    <tr>
      <td class="td1">내용</td>
      <td class="td2"><textarea name="cont"></textarea></td>
    </tr>
   
    <tr>
      <td colspan="2">
       <input type="submit" value="저장" />
      </td>
    </tr>
  </table>
  </form>
</body>
</html>






