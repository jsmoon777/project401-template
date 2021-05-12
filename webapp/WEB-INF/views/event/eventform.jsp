<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트폼</title>
	
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/event/eventwrite");
				formObj.attr("method", "post");
				formObj.submit();
			});
			fn_addFile();
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
	</script>
<style type="text/css">
      
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
</head>
<body>
<!-- 이미지 미리보기 -->
   <script> 
   function setThumbnail(event) {
      for (var image of event.target.files) {
         var reader = new FileReader(); 
         reader.onload = function(event) { 
            var img = document.createElement("img"); 
            img.setAttribute("src", event.target.result); 
            document.querySelector("div#image_container").appendChild(img); };
            console.log(image); 
            reader.readAsDataURL(image); 
            } 
      } 
 
   </script>
   
   <script type="text/javascript">
      $(document).ready(function(){
         
      /* 파일 추가 버튼 */
      function fn_addFile(){
         var fileIndex = 1;
         //$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
         $(".fileAdd_btn").on("click", function(){
            $("#fileIndex").append("<div><input type='file'  style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
         });
         $(document).on("click","#fileDelBtn", function(){
            $(this).parent().remove();
            
         });
      }
   </script>
   
   
<body>
   <!-- 헤더 -->
	<%@include file="/WEB-INF/include/sub_header.jsp" %>
   <div style="margin-top:200px; margin-bottom:200px; ">
      <div class="sns_title_box">
            <span class="sns_title">이벤트 등록<span>
       </div>
         
   <form name="writeForm" method="post" action="/eventwrite/" enctype="multipart/form-data">

   <table  class="table">
   <tr>
      <th for="writer">작성자</th>
      <td colspan="2"><input type="text" id="writer" name="writer" class="chk" title="관리자" value="${login.user_id}" class="sns_txt"/></td>
   <tr>

   <tr>
      <th for="title">이벤트제목</th>
      <td colspan="2">
         <input type="text" id="title" name="title" class="chk" title="이벤트 명입력하세요" class="sns_txt"/>
      </td>
   </tr>   
   <tr>
      <th for="title">이벤트기간</th>
      <td colspan="2">
         <input type="date" id="eventday" name="eventday" class="chk" title="이벤트 기간을 입력하세요" class="sns_txt"  min="1977-01-01" max="2022-12-31"/>
         <input type="date" id="eventday2" name="eventday2" class="chk" title="이벤트 기간을 입력하세요" class="sns_txt"  min="1977-01-01" max="2022-12-31"/>
   	  </td>
   </tr>   
   <tr>
      <th for="content">내용</th>
      <td colspan="2">
         <textarea id="content" name="content" class="chk" style="width:100%; height: 400px;" title="내용을 입력하세요."></textarea>
      </td>
   </tr>

   <tr>
      <th for="slide_title">슬라이드 제목</th>
      <td colspan="2">
         <input type="text" id="slide_title" name="slide_title" class="chk" title="슬라이드 제목을 입렵해주세요" class="sns_txt"/>
      </td>
   </tr>
   
   <tr>
      <th for="hashtag">슬라이드 부제목 및 해시태그</th>
      <td colspan="2">
         <input type="text" id="hashtag" name="hashtag" class="chk" title="해시태그를 입력해주세요" class="sns_txt"/>
      </td>
   </tr>

   <tr>
      <th for="gdsImg">이벤트 썸네일</th>
      <td><input type="file" name="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple >
      </td>
       <td><div id="image_container"></div><br>
   </tr>
   
   <tr>
   <th for="gdsImg">이벤트 바디포스터</th>
      <td>
      	<button class="fileAdd_btn" type="button">파일추가</button>
      </td>
      <td id="fileIndex"></td>
   </tr>          
   <tr>
      <td colspan="3">                  
         <input class="write_btn button" type="submit" value="업로드" onclick="loginck();"/>   
         
      </td>
   </tr>   
   
   <tr>
      <td id="fileIndex">
      </td>
   </tr>
   
   <tr>
      <td colspan="3">                  
         <p style="font-size: 12px;"><a href="/event/eventlist">목록으로 돌아가기</a></p>   
      </td>
   </tr>   
   </table>
   </form>
            
      </div>
<!-- 푸터 -->
<%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>