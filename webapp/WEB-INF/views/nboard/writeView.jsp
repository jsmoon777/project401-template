<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	function setThumbnail(notice) {
		for (var image of notice.target.files) {
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

<%@include file="/WEB-INF/include/sub_header.jsp" %>
<body>
 <div style="margin-top:200px; margin-bottom:200px; ">
      <div class="sns_title_box">
            <span class="sns_title">공지 등록<span>
       </div>
         
   <form name="writeForm" method="post" action="/nboard/write" enctype="multipart/form-data">
   <table  class="table">
   <tr>
      <th for="writer">작성자</th>
      <td colspan="2"><input type="text" id="writer" name="writer" value="관리자" class="sns_txt"/></td>
   <tr>

   <tr>
      <th for="title">제목</th>
      <td colspan="2">
         <input type="text" id="title" name="title" class="sns_txt"/>
      </td>
   </tr>   
   <tr>
      <th for="content">내용</th>
      <td colspan="2">
         <textarea id="content" name="content" class="chk" style="width:100%; height: 400px;" >
         </textarea>
      </td>
   </tr>  
    
   <tr>
		<th for="gdsImg">공지 파일첨부</th>
		<td><input type="file" name="file" id="image" accept="image/*" onchange="setThumbnail(notice);"multiple ></td>
	    <td><div id="image_container"></div></td>
	<tr>  
   <tr>
      <td colspan="3">                  
         <input class="write_btn button" type="submit" value="업로드" onclick="loginck();"/>   
      </td>
   </tr>   
   <tr>
      <td colspan="3">                  
         <p style="font-size: 12px;"><a href="/nboard/list">목록으로 돌아가기</a></p>   
      </td>
   </tr>   
   </table>
   </form>
            
      </div>
   </body>
<%@include file="/WEB-INF/include/footer.jsp" %>    

</html>