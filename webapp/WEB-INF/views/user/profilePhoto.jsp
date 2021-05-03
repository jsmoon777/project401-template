<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로필 사진</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   <!-- 이미지 미리보기 -->
   <script> 
	   function setProfile(event) {
		   
	      for (var image of event.target.files) {
	    	  document.getElementById("prev_img").style.display = "none";
	    	  document.getElementById("prev_img").style.visibility = 'hidden';
	    	  document.getElementById("image_container").style.display = "block";
	    	  document.getElementById("image_container").style.visibility = 'visible';
	         var reader = new FileReader(); 
	         reader.onload = function(event) { 
	            var img = document.createElement("img"); 
	            img.setAttribute("src", event.target.result); 
	            document.querySelector("div#image_container").appendChild(img); };
	            console.log(image); 
	            reader.readAsDataURL(image); 
	       } 
	    };

   </script>
   
   <style type="text/css">
   	#prev_img >img{
   	width: 100%;
   	}
   
    #image_container >img{
  	width: 100%;
    
    }
   
   #prev_img, #image_container{
   width: 200px;
   height: 200px;
   }
   
   
   </style>
</head>
<body>
   <table>
      <tr>
         <td>
         <div id="prev_img" class="form-group">     
         <c:choose>
				<c:when test="${profile.sfilename == null}">
					<img src="/img/no_profile_img.gif" width="100%">
				</c:when>
				<c:otherwise>
					<img src="/image6/${profile.sfilename}" width="100%"/>
				</c:otherwise>
			</c:choose>
          </div>     
         <div id="image_container" style="display:none;"></div>
         </td>
       </tr>
		<tr>
         <td class="profile_image">프로필 사진</td>
        </tr>
       <tr>
         <td id="tdfile">
          <form action="/uploadProfile" method="post" enctype="multipart/form-data">
      

         
              <input type="hidden" name="user_id" value="${login.user_id}"  >
              <input type="file" name="upfile" id="upfile" onchange="setProfile(event);" multiple>
              <input type="submit" value="업로드">    
          </form>      
         </td>
       </tr>
   </table> 
</body>
</html>