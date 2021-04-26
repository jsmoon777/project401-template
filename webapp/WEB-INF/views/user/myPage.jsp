<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<td colspan="2">
		     <form action="/selfcheckUForm" method="post" >        
		      <input class="update_btn" type="submit" value="회원수정"/> 
		     </form>
		     <form action="/selfcheckDForm" method="post" > 
		      <input class="delete_btn" type="submit" value="회원탈퇴"/>
		      </form>  
		 </td>
	 </table>
</body>
</html>