<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(function(){
		
   });
</script>
</head>
<body>
	<h2>mypage22</h2>
	<table>
		<tr>
	      <td class="tdfile">파일</td>
	      <td style="width:100%;" colspan="3">      
	       <c:forEach var="file" items="${ profile }" >
	      <%--     <a href="<c:out value="/download/external/${ file.sfilename}" />"> --%>
	      <img src="/image6/${file.sfilename}" width="100%"/>
	            ${ file.filename }
	       </c:forEach>      
	      </td>
	    </tr>
		<tr>
	      <td>프로필사진 변경</td>
	      <td>
		    <form action="/profilePhoto" method="post" enctype="multipart/form-data">
		        <input type="submit" value="변경">    
		    </form>      
	      </td>
	    </tr> 
		<tr>
			<td colspan="2">
			     <form action="/selfcheckUForm" method="post" >        
			      <input class="update_btn" type="submit" value="회원수정"/> 
			     </form>
			     <form action="/selfcheckDForm" method="post" > 
			      <input class="delete_btn" type="submit" value="회원탈퇴"/>
			      </form>  
			 </td>
		 </tr>
	 </table>
</body>
</html>