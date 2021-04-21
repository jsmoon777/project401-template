<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	<style type="text/css">
      
   .table {
      border-collapse: collapse;
      border-top: 3px solid #000;
      border-left:1px;
      border-right:1px;
      width:1000px;
      text-align: center;
      margin: 0 auto;
    }  
    .table label {
      width:100px;
      font-size:13px;
      color: #333;
      background: #ffffff;
      text-align: center;
    }
    .table label, .table td {
      padding: 10px;
      height:50px;
      border: 1px solid #f0f0f0;
      font-size:13px;
      color: #333;
    }
    .table label:first-child, .table td:first-child {
      border-left: 0;
    }
    .table label:last-child, .table td:last-child {
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
   
   .list_btn,.update_btn,.cancel_btn {
      display: inline-block;
      width: 200px;
      height: 54px;
      text-align: center;
      text-decoration: none;
      line-height: 54px;
      outline: none;
   }
   .update_btn::before,
   .cancel_btn::after {
      position: absolute;
      z-index: -1;
      display: block;
      content: '';
   }
   .button,
   .update_btn::before,
   .cancel_btn::after {
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
      box-sizing: border-box;
      -webkit-transition: all .3s;
      transition: all .3s;
   }
   
   .list_btn,.update_btn,.cancel_btn {
   background-color: #000;
   color: #fff;
   }
   .list_btn:hover {
      letter-spacing: 5px;
   }
   </style>
	
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/nboard/readView?nno=${update.nno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/nboard/update");
				formObj.attr("method", "POST");
				formObj.submit();
			})
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		
	</script>
	<%@include file="/WEB-INF/include/sub_header.jsp" %>
	<body>
	
		<div style="margin-top:200px; margin-bottom:200px; ">
			 <div class="sns_title_box">
            <span class="sns_title">공지 사항<span>
       </div>
				<form name="updateForm" role="form" method="post" action="/nboard/update">
					<input type="hidden" name="nno" value="${update.nno}" readonly="readonly"/>
					<table class="table">
					<tbody>
						<tr>
						<th for="title">제목</th>
							<td colspan="2">
								<input type="text" id="title" name="title" value="${update.title}" />
							</td>
						</tr>	
						<tr>
						<th for="content">내용</th>
							<td colspan="2">
								<textarea id="content" name="content" style="width:100%; height: 250px;">
								<c:out value="${update.content}" /></textarea>
							</td>
						</tr>
						<tr>
						<th for="writer">작성자</th>
							<td colspan="2">
								<input type="text" id="writer" name="writer" value="${update.writer}"  readonly="readonly"/>
							</td>
						</tr>
						<tr>
						<th for="regdate">작성날짜</th>
							<td>
								<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd" />					
							</td>
						</tr>
						
						<tr>
							<th for="gdsImg">공지 파일첨부</th>
							<td><input type="file" name="file" id="image" accept="image/*" onchange="setThumbnail(notice);"multiple ></td>
						    <td><div id="image_container"></div></td>
						<tr>  
						<tr>
						<td colspan="3">                 
					      <input class="update_btn" type="submit" value="수정"/> 
					      <input class="cancel_btn" type="submit" value="취소"/>   
					    </td>	
					    </tr>	
					</tbody>			
				</table>
				</form>
		</div>
	</body>
		<%@include file="/WEB-INF/include/footer.jsp" %>
</html>