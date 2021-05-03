<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<style type="text/css">
   
    #image_container >img{
  	width: 100%;
    
    }
   
    #image_container{
   width: 200px;
   height: 200px;
   }
   
   
   </style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(function(){
		
   });
</script>
</head>
<body>
	<h2>mypage</h2>
	<table>
		<tr>
	      <td>
	      <div id="image_container" class="form-group" >
	      <c:choose>
				<c:when test="${profile.sfilename == null}">
					<img src="/img/no_profile_img.gif" width="100%">
				</c:when>
				<c:otherwise>
					<img src="/image6/${profile.sfilename}" width="100%"/>
				</c:otherwise>
			</c:choose>
	      
	       </div>     
	      </td>
	    </tr>
	    <tr>
         <td class="profile_image">프로필 사진</td>
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