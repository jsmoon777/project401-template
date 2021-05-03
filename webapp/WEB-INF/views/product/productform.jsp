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
				formObj.attr("action", "/product/productwrite");
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
            <span class="sns_title">상품 등록<span>
       </div>
         
   <form name="writeForm" method="post" action="/product/write" enctype="multipart/form-data">

   <table  class="table">
   <tr>
      <th for="writer">상품명</th>
      <td colspan="2"><input type="text" id="product_name" name="product_name" class="chk" title="상품명을 입력하세요" class="sns_txt"/></td>
   <tr>

   <tr>
      <th for="title">*원래 판매단가</th>
      <td colspan="2">
         <input type="text" id="product_price2" name="product_price" class="chk" title="할인되기전 단가를 입력하세요" class="sns_txt"/>
      </td>
   </tr>   

   <tr>
      <th for="title">*판매단가</th>
      <td colspan="2">
         <input type="text" id="product_price" name="product_price2" class="chk" title="단가를 입력하세요" class="sns_txt"/>
      </td>
   </tr>   
   <tr>
      <th for="title">상품설명</th>
      <td colspan="2">
         <input type="text" id="product_desc" name="product_desc" class="chk" title="상품설명을 적어주세요" class="sns_txt"/>
      </td>
   </tr>   
   <tr>
      <th for="title">해시태그</th>
      <td colspan="2">
         <input type="text" id="product_desc" name="product_tag" class="chk" title="해시태그 적어주세요" class="sns_txt"/>
      </td>
   </tr>   
   <tr>
      <th for="gdsImg">상품 이미지</th>
      <td><input type="file" name="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple >
      </td>
       <td><div id="image_container"></div><br>
   </tr>
   
   <tr>
   <th for="gdsImg">상품 바디포스터</th>
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
         <p style="font-size: 12px;"><a href="#">목록으로 돌아가기</a></p>   
      </td>
   </tr>   
   </table>
   </form>
            
      </div>
<!-- 푸터 -->
<%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>