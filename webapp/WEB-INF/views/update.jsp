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
   .td1 {  width:178px; text-align:center; }
   .td2 {  width:178px; text-align:left; }
   .td3 {  width:178px; text-align:center; }
   .td4 {  width:178px; text-align:left; }
   .td5 {  width:578px; text-align:left; }
   
   #cont {  height:300px; text-align:left; }
   
   [type=text] { width : 570px; }
   textarea    { width : 570px; height:400px;}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
   $(function() {
	  $('input[type=button]').on('click', function(event) {
		  var btn = event.target;
		  var href = '';
		  switch( btn.id ) {		 
		  case 'btnList':
			  href  = '/MBoard/List?menu_id=${menu_id}';
			  break;		  
		  }
		  alert(href);
		  location.href = href;
		  
	  })
   });
</script>
</head>
<body>

   <!-- 메뉴 리스트 -->
   <%@ include file="/WEB-INF/include/menus.jsp" %>
   
   
  <form action="/MBoard/Update" method="POST"> 
  <input type="hidden" name="menu_id" value="${ menu_id }" />
  <input type="hidden" name="idx"     value="${ board.idx }" />
  <table>
    <caption><h2>게시물 수정</h2></caption>
    <tr>  
      <td class="td1">메뉴아이디</td>
      <td class="td5" colspan="3">${ board.menu_id }</td>
    </tr>    
    <tr>
      <td class="td1">번호</td>
      <td class="td2">${ board.idx }</td>
      <td class="td3">날짜</td>
      <td class="td4">${ board.regdate }</td>
    </tr>    
    <tr>
      <td class="td1">글쓴이</td>
      <td class="td2">${ board.writer }</td>   
      <td class="td3">조회수</td>
      <td class="td4">${ board.readcount }</td>
    </tr>    
    <tr>
      <td class="td1">제목</td>
      <td class="td5" colspan="3">
         <input type="text" name="title" value="${ board.title }" />
      </td>
    </tr>
    <tr>
      <td class="td1">내용</td>
      <td class="td5" id="cont" colspan="3">      
         <textarea name="cont" >${ board.cont }</textarea>      
      </td>
    </tr>  
    <tr>
      <td colspan="4">       
       <input type="submit" value="수정"  />
       <input type="button" value="글목록"  id="btnList"/>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>






