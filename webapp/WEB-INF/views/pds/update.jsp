<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/commons.css" />
<style>
  #writeTable  input[type=text] { width:550px; } 
  #writeTable  textarea         { width:550px;  height:300px;                                  
  } 
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
   $(function() {
	   // btnAdd Click 	
	   var  num = 1;
	   $('#btnAddFile').on('click', function() {
    	   //alert('Click');    	   
    	   var html  = '<input type="file"';
    	   html     += ' name = "upfile' + num + '"';
    	   html     += ' id   = "upfile' + num + '"';
    	   html     += ' /><br>';
    	   $('#tdfile').append( html );
    	   num      += 1;
       });
	   
	   // aDelete Click
	   $('.aDelete').on('click', function(e) {
		   e.preventDefault();
		   e.stopPropagation();
		   var aDelete = e.target;
		   var href    = aDelete.href;
		   alert(href);
		 //  alert('a click');
		   $.ajax({
			   url        : href,
		   	   success : function(json) {
		   		   alert('삭제 완료');
		   		   // 내가 속한 부모 element(dov) 삭제
		   		   // jqeury 명령, $().remove()		   		   
		   		   $(aDelete).parent().remove();
		   	   },
		       error :  function(xhr) {
		    	   alert(xhr.status + ':' + xhr.textStatus);
		       }
		   });
	   })
       
       // submit click
       $('#form1').on('submit', function() {
    	   // 작성자 입력? db writer : not null
    	   if ( $('#writer').val() == '') {
    		   alert('작성자를 입력하세요');
    		   $('#writer').focus();
    		   return false;   // submit 이벤트를 중지
    	   } 		   
    	   // 제목   입력? db title : not null
    	   if ( $('#title').val() == '') {
    		   alert('제목을 입력하세요');
    		   $('#title').focus();
    		   return false;   // submit 이벤트를 중지
    	   } 			   
    	   // 내용   입력? db cont  : not null
    	    if ( $('#cont').val() == '') {
    		   alert('내용을 입력하세요');
    		   $('#cont').focus();
    		   return false;   // submit 이벤트를 중지
    	   } 	
    	   
 	       return true;
       });
   });
</script>
</head>
<body>
   <!-- 메뉴목록 (menuList) -->
   <%@include file="/WEB-INF/include/menus.jsp" %>
   
   <!-- 수정하기 -->
   <form action="/PDS/Update"  method="POST" id="form1"
        enctype="multipart/form-data">
   <input type="hidden" name="idx"         value="${ pdsVo.idx }" />     
   <input type="hidden" name="menu_id"     value="${ pdsVo.menu_id }" />   
   <input type="hidden" name="nowpage"     value="${ pdsVo.nowpage }" />     
   <input type="hidden" name="pagegrpnum"  value="${ pdsVo.pagegrpnum }" />     

   <table id="writeTable">
    <caption><h2>수정하기</h2></caption>
    <tr>
      <td>작성자</td>
      <td><input type="text" name="writer"  id="writer"
        value="${ pdsVo.writer }" readonly />
      </td>
    </tr> 
    <tr>
      <td>글제목</td>
      <td><input type="text" name="title" id="title" 
        value="${ pdsVo.title }" /></td>
    </tr> 
    <tr>
      <td>글내용</td>
      <td><textarea name="cont" 
         id="cont">${ pdsVo.cont }</textarea></td>
    </tr> 
    <tr>
      <td>파일</td>
      <td id="tdfile">
        <c:forEach var="file"  items="${ filesList }">
        <div>
         <a class="aDelete" href="/deleteFile?file_num=${file.file_num}">x</a>&nbsp;  
        <%--  <a class="bDelete" href="/deleteFile?file_num=${file.file_num}">x</a>&nbsp;   --%>
         <a href="/download/external/${ file.sfilename }">
           ${ file.filename }
         </a>
        </div>
        </c:forEach>
        <hr />
        <input type="button" id="btnAddFile" value="Add file" /><br>
        <input type="file" name="upfile" id="upfile" /><br>        
      </td>
    </tr> 
    <tr>      
      <td colspan="2">
        <input type="submit" value="확인" />
      </td>
    </tr> 
   </table>   
   </form>
   
</body>
</html>










