<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ffee 회원정보 수정 본인확인</title>
<style>
#login{
      margin:0 auto;
      padding-top:250px;
      padding-bottom:250px;
      text-align: center;
      width:400px;
      height: 100vh;
      background: #fff;
   }
   
   .form-group{
   		width:400px;
   		text-align: left;
   }
 	input[type="text"]{
       width:100%;
    }
    input[type="password"]{
       width:100%;
    }
    #capslock{
    	color:blue;
    }
    .caps{
    	height:40px;
    }
    
    /* 버튼 css */
   .button {
      display: inline-block;
      width: 200px;
      height: 54px;
      margin:0 auto;
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
<script type="text/javascript">
	   function caps_lock(e) {
           var keyCode = 0;
           var shiftKey = false;
           keyCode = e.keyCode;
           shiftKey = e.shiftKey;
           if (((keyCode >= 65 && keyCode <= 90) && !shiftKey)
                   || ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
               show_caps_lock();
               setTimeout("hide_caps_lock()", 3500);
           } else {
               hide_caps_lock();
           }
       } 

   function show_caps_lock() {
        $("#capslock").show();
   }

   function hide_caps_lock() {
        $("#capslock").hide();
   }
   
</script>
<%@include file="/WEB-INF/include/sub_header.jsp" %>
</head>
<body>
	<h2>회원정보 수정 본인확인</h2>
	<form action="/selfcheckU" method="POST">
	<div id="login">
		<div class="form-group">
			<input type="text" name="user_id"  value="${login.user_id}" readonly/>
		</div>
		<div class="form-group">
			<input type="password" name="user_pw" onkeypress="caps_lock(event)"  placeholder="PASSWORD"/>
		</div>	
		<div class="caps">
			<p id="capslock" style="position:relative; width:300px; bottom:0px; display:none"> 
    			&nbsp;<b>CapsLock</b> 키가 눌려있습니다.&nbsp;
			</p>
		</div>
		<div>
			<input class="button" type="submit" value="확인" />
		</div>
	</div>
	</form>
	<%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>