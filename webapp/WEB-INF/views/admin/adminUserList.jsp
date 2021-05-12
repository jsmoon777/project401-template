<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 리스트</title>
<style type="text/css">
     
	  #admin_body{
	  z-index:1;
      position:absolute;
      width:75%;
      margin-left:5%;
      margin-right:5%;
      background:#fff;
      float: left;
      top:150px;
      left: 250px;
      
   }
   #admin_body>h2{
      margin-bottom:50px;
   }
   
   .table {
      border-collapse: collapse;
      border-top: 3px solid #000;
      border-left:1px;
      border-right:1px;
      width:100%;
      text-align: center;
      margin: 0 auto;
    }  
    .table th {
      width:200px;
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
       line-height: 40px;
       font-size: 20px;
       font-weight: 900;
    }
    
    
    
    .td{
    float:left; 
    
    }
    
    .listpage{
    position: relative;
    
    height:30px;
    list-style:none;
    padding: 6px;
    }
   
    
   /* 버튼 css */
   .update_btn_box{
    width: 200px;
      height: 54px;
       margin: 0 auto;
   }
   .update_btn {
      display: inline-block;
      width: 200px;
      height: 54px;
      text-align: center;
      text-decoration: none;
      line-height: 54px;
      outline: none;
       position: relative;
     margin: 0 auto;
     top:5px;
     float: left;
      
   }
   
   .button::before,
   .button::after {
     
      top:940px;
      z-index: -1;
      display: block;
      content: '';
   }
   
   .update_btn,
   .button::before,
   .button::after {
   
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
      box-sizing: border-box;
      -webkit-transition: all .3s;
      transition: all .3s;
   }
   
   .update_btn {
   background-color: #000;
   color: #fff;
   }
   .update_btn:hover {
      letter-spacing: 5px;
   }
   
  /*검색창 */
  
   #p_search_box{
     position: relative;
     border: 1px solid #000;
     width:300px;
     height: 50px;
     margin: 0 auto;
  }
   #p_search_box > ul{
      position: relative;
      border: 0px solid #000;
      background:pink;
      width:300px;
      height: 50px;
      margin: 0 auto;
      text-align: center;
   }
   #p_search_box > ul >li{
      position: relative;
      background:pink;
      width:75px;
      height: 50px;
      float: left;
      text-align: center;
   }
     #p_search_box > ul >li:nth-child(2){
      width:150px;
   }
        .p_boardbox{
           border: 0px;
           
        }
           
        #p_select{
           width: 100%;
           height: 50px;
           
        }
        .p_text{
           width: 100%;
           height: 50px;
        }
        #searchBtn{
           width: 100%;
           height: 50px;
           text-align: center;
           line-height: 50px;
           background: #000;
           color: #fff;
        }
  
   </style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
   $(function() {

   });
</script>
</head>
<%@include file="include/admin_header.jsp" %>
<body>
<div id="admin_body">
     <h2>회원 목록</h2>
	<table class="table">
     <tr style="font-size:small;">
       <td>아이디</td> 
       <td>닉네임</td> 
       <td>이름</td> 
       <td>생일</td> 
       <td>이메일</td> 
       <td>전화</td> 
       <td>성별</td> 
       <td>우편번호</td> 
       <td>주소</td> 
       <td>상세주소</td>
       <td>등록일</td>
       <td>위치서비스</td>
       <td>계정삭제</td>
       
     </tr> 
   <c:forEach var="user" items="${ userList }">
     <tr  style="font-size:xx-small;">
       <td>${ user.user_id  }</td> 
       <td>${ user.nickname  }</td> 
       <td>${ user.user_name  }</td> 
       <td>${ user.user_birth  }</td> 
       <td>${ user.user_email  }</td>        
       <td>${ user.user_phone  }</td>        
       <td>${ user.gender  }</td>        
       <td>${ user.user_oaddress  }</td>        
       <td>${ user.user_address  }</td>        
       <td>${ user.user_dtaddress  }</td>        
       <td>${ user.regdate  }</td>        
       <td>${ user.loca_prov  }</td>        
       <td>
       <form action="/admin/adminDelete" method="post" >
       <input type="hidden" id="user_id" name="user_id" value="${user.user_id }"> 
	    <input class="delete_btn button" type="submit" value="퇴출"/>
	   </form> 
		</td>        
     </tr> 
   </c:forEach>
   </table>
   </div>
</body>
</html>