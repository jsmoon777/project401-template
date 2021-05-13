<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
<%  pageContext.setAttribute("newLine", "\n");  %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/commons.css" />
<style>
   .tdcont {  height:300px; vertical-align: top;  }
   .tdfile {  height:100px; vertical-align: top;  }
   
      
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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
   $(function() {

   });
</script>
</head>
<body>
   <!-- 메뉴 목록 -->\
   
   <%@include file="/WEB-INF/include/sub_header.jsp" %>
   <div style="margin-bottom:250px; margin-top:250px;">
   <table id="pdsView" class="table">
    <caption><h2>내용 보기</h2></caption>
    <tr>
      <td>작성자</td>
      <td>${ pdsVo.writer }</td>
      <td>작성일</td>
      <td>${ pdsVo.regdate }</td>
    </tr>
    <tr>
      <td>글번호</td>
      <td>${ pdsVo.idx }</td>
      <td>조회수</td>
      <td>${ pdsVo.readcount }</td>
    </tr>
    <tr>
      <td>글제목</td>
      <td colspan="3">${ pdsVo.title }</td>
    </tr>
    <tr>
      <td class="tdcont">글내용</td>
      <td class="tdcont" colspan="3">      
         ${fn:replace( pdsVo.cont, newLine ,"<br />") }         
      </td>
    </tr>
    
    
    <tr>
      <td class="tdfile">파일</td>
      <td class="tdfile" colspan="3">      
       <c:forEach var="file" items="${ filesList }" >
          <div>
          <%-- <a href="<c:out value="/download/external/${ file.sfilename}" />"> --%>
          <div style="width:500px; height: 500px; overflow: hidden;"><img src="/image7/${ file.sfilename}" width="100%"/>${ file.sfilename}</div>
          
          </a> 
          </div> 
       </c:forEach>      
      </td>
    </tr>
    
    <tr>
       <td colspan="4">
          <a href="/PDS/List?menu_id=${ pdsVo.menu_id }" class="button">목록</a>&nbsp;&nbsp;
          <a href="/PDS/WriteForm?menu_id=${ pdsVo.menu_id }&bnum=0&lvl=0&step=0&nref=0" class="button">새글 쓰기</a>&nbsp;&nbsp;
          <a href="/PDS/WriteForm?menu_id=${pdsVo.menu_id}&bnum=${pdsVo.bnum}&lvl=${pdsVo.lvl}&step=${pdsVo.step}&nref=${pdsVo.nref}" class="button">답글 쓰기</a>&nbsp;&nbsp;
         
          <c:choose>
          <c:when test="${login.user_id  == 'admin'}">
          <a href="/PDS/UpdateForm?menu_id=${pdsVo.menu_id}&idx=${pdsVo.idx}" class="button">수정</a>&nbsp;&nbsp;
          <a href="/PDS/Delete?menu_id=${pdsVo.menu_id}&idx=${pdsVo.idx}&nref=${pdsVo.nref}&lvl=${pdsVo.lvl}&step=${pdsVo.step}" class="button">삭제</a>
       	  </c:when>
       	  </c:choose>
       </td>
    </tr>
    
   </table>  
   </div> 
   <%@include file="/WEB-INF/include/footer.jsp" %>   
</body>
</html>
