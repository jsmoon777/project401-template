<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>로그인</title>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#logoutBtn").on("click", function(){
				alert("로그아웃 되엇습니다.");
				location.href="/member/logout";
			})
			
		})
	</script>

	<style>
	#login_form{
		padding-top: 200px; 
		width: 500px; 
		height:500px;
		text-align:center; 
		margin: 0 auto; 
		
		}
		
		#logo_img_box{
		margin-bottom:50px;
		}
		
		.text{
			width: 300px;
			height: 80px;
			margin-bottom: 5px;
		
		}
	</style>
	<%@include file="/WEB-INF/include/sub_header.jsp" %>
	<div id="login_form">
		<form name='homeForm' method="post" action="/member/login">
			<div id="logo_img_box"><img src="/img/logo.png"/></div>
			<c:if test="${member == null}">
				<div>
					<label for="userId"></label>
					<input type="text" class="text" id="userId" name="userId" placeholder="아이디를 입력 해주세요">
				</div>
				<div>
					<label for="userPass"></label>
					<input type="password" class="text"  id="userPass" name="userPass" placeholder="비밀번호를 입력 해주세요">
				</div>
				<div>
					<button type="submit" style="width:200px; margin-top:50px; height: 50px; background: #000;color:#fff;">로그인</button><br>
					<button type="button" style="font-size:13px;margin-top:50px;">회원가입 하러가기</button>
				</div>
			</c:if>
			
			<c:if test="${member != null }">
				<div>
					<p>${member.userId}님 환영 합니다.</p>
					<button id="logoutBtn" type="button">로그아웃</button>
				</div>
			</c:if>
			<c:if test="${msg == false}">
				<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
			</c:if>
		</form>
	
	</div>
	<%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>