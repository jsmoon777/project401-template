<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>FFEE 회원정보 수정</title> 
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
<!-- daum 도로명주소 찾기 api --> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css"> 

   body {
      margin:0;
      padding:0;
      width:100%;
      font-size: small; 
      font-family: Arial, '맑은 고딕';
   }
   
   #register{
      margin:0 auto;
      padding-top:250px;
      padding-bottom:250px;
      text-align: center;
      width:500px;
      height: 900px;
      background: #fff;
   }
   
   .form-group{
   		width:500px;
   		text-align: left;
   }
      
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
      text-align: left;
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
      text-align: left;
    }
    .table caption{caption-side: bottom; display: none;}
    
    /* textarea{
       width:100%;
       height: 200px;
    } */
    input[type="text"]{
       width:100%;
    }
    input[type="password"]{
       width:100%;
    }
    input[type="email"]{
       width:100%;
    }
    input[type="tel"]{
       width:100%;
    }
    /* 타이틀 */
    .sns_title_box{
       width:1200px;
       height: 60px;
       background:#fff;
       margin: 0 auto;
    }
    
    .sns_title{
       float: left;
       line-height: 60px;
       font-size: 20px;
       font-weight: 900;
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
<script type="text/javascript"> 
	//모든 공백 체크 정규식 
	var empJ = /\s/g; 
	// 비밀번호 정규식 
	var pwJ = /^[A-Za-z0-9]{4,12}$/; 
	// 이름 정규식 
	var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; 
	// 이메일 검사 정규식 
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
	// 휴대폰 번호 정규식 
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; 
	
	var birthJ = false; 
	
	var address = $('#user_dtaddress'); 
	
	$(document).ready(function() { 
		var address = $('#user_dtaddress'); 
		
		
		$('form').on('submit',function(){ 
			var inval_Arr = new Array(6).fill(false); 
			// 비밀번호가 같은 경우 && 비밀번호 정규식 
			if (($('#user_pw').val() == ($('#user_pw2').val())) 
					&& pwJ.test($('#user_pw').val())) { 
				
			} else { 
				alert('비밀번호를 확인하세요.'); 
				return false; 
				
			} 
			// 이름 정규식 
			if (nameJ.test($('#user_name').val())) { 
				inval_Arr[0] = true; 
				
			} else { 
				inval_Arr[0] = false; 
				alert('이름을 확인하세요.'); 
				return false; 
				
			} 
			// 이메일 정규식 
			if (mailJ.test($('#user_email').val())){ 
				console.log(phoneJ.test($('#user_email').val())); 
				inval_Arr[1] = true; 
				
			} else { 
				inval_Arr[1] = false; 
				alert('이메일을 확인하세요.'); 
				return false; 
				
			} 
			// 휴대폰번호 정규식 
			if (phoneJ.test($('#user_phone').val())) { 
				console.log(phoneJ.test($('#user_phone').val())); 
				inval_Arr[2] = true; 
				
			} else { 
				inval_Arr[2] = false; 
				alert('휴대폰 번호를 확인하세요.'); 
				return false; 
				
			} 
			//우편번호확인 
	         if($('#user_oaddress').val() == ''){ 
	            inval_Arr[3] = false; 
	            alert('우편번호를 확인하세요.'); 
	            return false; 
	            
	         }else {
	            inval_Arr[3] = true;
	         }
	         //주소확인 
	         if($('#user_address').val() == ''){ 
	            inval_Arr[4] = false; 
	            alert('주소를 확인하세요.'); 
	            return false; 
	            
	         }else {
	            inval_Arr[4] = true;
	         }
	         //상세주소확인 
	         if($('#user_dtaddress').val() == ''){ 
	            inval_Arr[5] = false; 
	            alert('상세주소를 확인하세요.'); 
	            return false; 
	            
	         }else {
	            inval_Arr[5] = true;
	         }
			//전체 유효성 검사 
			var validAll = true; 
			for(var i = 0; i < inval_Arr.length; i++){ 
				if(inval_Arr[i] == false){ validAll = false; 
				} 
			} 
			if(validAll == true){ // 유효성 모두 통과 
				alert('수정되었습니다. 마이페이지 화면으로 이동합니다.'); 
			} else{ 
				alert('정보를 다시 확인하세요.') 
			} 
		}); 
		
			$('#user_pw').blur(function() { 
				if (pwJ.test($('#user_pw').val())) { 
					console.log('true'); 
					$('#pw_check').text(''); 
				} else { 
					console.log('false'); 
					$('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.'); 
					$('#pw_check').css('color', 'red'); 
					
				} 
				
			}); 
			//1~2 패스워드 일치 확인 
			$('#user_pw2').blur(function() { 
				if ($('#user_pw').val() != $(this).val()) { 
					$('#pw2_check').text('비밀번호가 일치하지 않습니다.'); 
					$('#pw2_check').css('color', 'red'); 
				} else { 
					$('#pw2_check').text(''); 
				} 
			}); 
			//이름에 특수문자 들어가지 않도록 설정 
			$("#user_name").blur(function() { 
				if (nameJ.test($(this).val())) { 
					console.log(nameJ.test($(this).val())); 
					$("#name_check").text(''); 
				} else { 
					$('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)'); 
					$('#name_check').css('color', 'red'); 
				} 
			}); 
			$("#user_email").blur(function() { 
				if (mailJ.test($(this).val())) { 
					$("#email_check").text(''); 
				} else { 
					$('#email_check').text('이메일 양식을 확인해주세요.'); 
					$('#email_check').css('color', 'red'); 
				} 
			}); 
			
			// 휴대전화 
			$('#user_phone').blur(function(){ 
				if(phoneJ.test($(this).val())){ 
					console.log(nameJ.test($(this).val())); 
					$("#phone_check").text(''); 
					
				} else { 
					$('#phone_check').text('휴대폰번호를 확인해주세요 '); 
					$('#phone_check').css('color', 'red'); 
					
				} 
				
			}); 
	}); //(document).ready
	
	//우편번호 찾기 버튼 클릭시 발생 이벤트 
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("user_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("user_extraAddress").value = ''; 
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('user_oaddress').value = data.zonecode;
                document.getElementById("user_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("user_dtaddress").focus();
            }
        }).open();
    
	}
</script>

</head>
<body>
<%@include file="/WEB-INF/include/sub_header.jsp" %>

<div id="register">
	<article class="container"> 
		<div class="page-header"> 
			<div class="col-md-6 col-md-offset-3"> 
				<h3>회원정보 수정</h3> 
			</div> 
		</div> 
		<div class="col-sm-6 col-md-offset-3"> 
			<form action="/userupdate" method="post" role="form" id="usercheck" name="member"> 
				
				<div class="form-group"> 
					<label for="id">아이디</label> 
					<input type="text" class="form-control" id="user_id" name="user_id" value="${login.user_id}" readonly> 
					<div class="check_font" id="id_check"></div> 
				</div> 
				<div class="form-group"> 
					<label for="pw">비밀번호</label> 
					<input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="PASSWORD"> 
					<div class="eheck_font" id="pw_check"></div> 
				</div> 
				<div class="form-group"> 
					<label for="pw2">비밀번호 확인</label> 
					<input type="password" class="form-control" id="user_pw2" name="user_pw2" placeholder="Confirm Password"> 
					<div class="eheck_font" id="pw2_check"></div> 
				</div> 
				<div class="form-group"> 
					<label for="nickname">닉네임</label> 
					<input type="text" class="form-control" id="nickname" name="nickname"  value="${login.nickname}" readonly> 
					<div class="eheck_font" id="nickname_check"></div> 
				</div> 
				<div class="form-group"> 
					<label for="user_name">이름</label> 
					<input type="text" class="form-control" id="user_name" name="user_name" value="${login.user_name}"> 
					<div class="eheck_font" id="name_check"></div> 
				</div> 
				<div class="form-group"> 
					<label for="user_email">이메일 주소</label> 
					<input type="email" class="form-control" id="user_email" name="user_email" value="${login.user_email}"> 
					<div class="eheck_font" id="email_check"></div> 
				</div> 
				<div class="form-group"> 
					<label for="user_phone">휴대폰 번호('-'없이 번호만 입력해주세요)</label> 
					<input type="tel" class="form-control" id="user_phone" name="user_phone" value="${login.user_phone}"> 
					<div class="eheck_font" id="phone_check"></div> 
				</div> 
				
				<!-- login.을 쓰는 이유는 session에서 로그인 정보를 들고 오기 때문 -->
				<div class="form-group"> 
					<input type="text" id="user_oaddress" name="user_oaddress" value="${login.user_oaddress}">
					<input type="button" class="button" style="pading-top:50px; width: 150px; height: 40px; line-height:40px;" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="user_address" name="user_address" value="${login.user_address}"><br>
					<input type="text" id="user_dtaddress" name="user_dtaddress" value="${login.user_dtaddress}">
					<input type="text" id="user_extraAddress" placeholder="참고항목">
				</div> 
				
				<div class="form-group text-center" style="pading-top:50px; width: 500px; height: 150px; line-height:150px; text-align:center; margin: 0 auto;"> 
               <button type="submit" class="btn btn-primary button">수정</button> 
            </div>
			</form> 
		</div> 
	</article>
</div>
<%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>