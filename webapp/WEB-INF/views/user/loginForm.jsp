<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ffee 로그인</title>
<style></style>
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
</head>
<body>
	<form action="/user/loginPost" method="POST">
		<div>
			아이디:<input type="text" name="user_id" />
		</div>
		<div>
			암호:<input type="password" name="user_pw" onkeypress="caps_lock(event)" />
			<p id="capslock" style="position:relative; border:2px solid #003b83; width:300px; bottom:0px; display:none"> 
    			&nbsp;<b>CapsLock</b> 키가 눌려있습니다.&nbsp;
			</p>
		</div>
		<div>
			<input type="submit" name="로그인" />
		</div>
	</form>
</body>
</html>