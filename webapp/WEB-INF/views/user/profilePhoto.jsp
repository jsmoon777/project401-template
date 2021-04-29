<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로필 사진</title>
<style>

</style>
</head>
<body>
		<div = class="profile_image">
			<c:choose>
				<c:when test="${map.sfilename == null}">
					<img src="/resources/img/airKorea_map.png" class="profile_image">
				</c:when>
				<c:otherwise>
					<img src="/image6/${map.sfilename}" class="profile_image">
				</c:otherwise>
			</c:choose>
		</div>
		    <form action="/uploadProfile" method="post" enctype="multipart/form-data">
	<table>
    	<tr>
	      <td>사진</td>
	      <td id="tdfile">
	        <!-- enctype="multipart/form-data" 파일업로드 필수 옵션 -->
		    <!-- application/x-www-form-urlencoded 기본옵션 -->
		        
		        <input type="hidden" name="user_id" value="${login.user_id}">
		        <input type="file" name="upfile" id="upfile">
		        <input type="submit" value="업로드">    
	      </td>
	    </tr>
   </table> 
		    </form>      
</body>
</html>