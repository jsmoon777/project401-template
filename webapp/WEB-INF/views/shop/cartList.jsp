<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품장바구니 목록</title>
<script>
    $(document).ready(function(){
        // 리스트 페이지로 이동
        $("#btnList").click(function(){
            location.href="/board/readView";
        });
    });
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
      border-collapse: collapse;
      width:100px;
      font-size:17px;
      color: #333;
      background: #ffffff;
      text-align: center;
      font-weight: 900;
      padding:10px;
      height:50px;
      border-right:1px solid #fff;
      border-bottom: 1px solid #000;
    }

    .table td {
      font-size: 13px;
      padding:10px;
      height:50px;
      border: 1px solid #fff;
    }
    
    /* 상품명 사이즈 */
    .table th:nth-child(1){
    	width: 700px;
    }
    
    /* 상품명 */
    .table td:nth-child(2) {
		text-align:left;
    }
    .table td:nth-child(1) img{
    	width:100px;
    	height: 100px;
    }
    .table td:first-child{
    	text-align: left;
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
       text-align: center;
    }
    
    .sns_title{
       text-align:cener;
       float: left;
       line-height: 60px;
       font-size: 20px;
       font-weight: 900;
    }
    
    
    /* 장바구니 취소 버튼 */
   
    .button_c {
      display: inline-block;
      width: 60px;
      height: 35px;
      text-align: center;
      text-decoration: none;
      line-height: 35px;
      outline: none;
      border: 1px solid #000;
	   line-height:35px;
	   color: #000;
   }
   .button_c::before,
   .button_c::after {
      position: absolute;
      z-index: -1;
      display: block;
      content: '';
   }
   .button_c,
   .button_c::before,
   .button_c::after {
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
      box-sizing: border-box;
      -webkit-transition: all .3s;
      transition: all .3s;
   }
   
   
   .button_c:hover {
      letter-spacing: 5px;
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
<%@include file="/WEB-INF/include/sub_header.jsp" %>
<div style="margin-top:200px; margin-bottom:200px; ">
      <div class="sns_title_box">
            <span class="sns_title">장바구니<span>
       </div>
    <c:choose>
        <c:when test="${map.count == 0}">
           	 장바구니가 비었습니다.
        </c:when>
    <c:when test="${map.count != 0 }">
        <form name="form1" id="form1" method="post" action="${path}/shop/cart/update.do">
        	
            <table border="1" class = "table">
                <tr>
                    <th colspan="2">제품설명</th>
                    <th>단가</th>
                    <th>수량</th>
                    <th>금액</th>
                    <th>선택</th>
                </tr>
                <c:forEach var="row" items="${map.list}" varStatus="i">
                <tr>
                	<td>
                		<img src="/productimg/${row.stored_file_name}" width="100%" />
                	</td>
                    <td>
                        ${row.productName}
                    </td>
                    <td style="width: 80px" align="right">
                        <fmt:formatNumber pattern="###,###,###" value="${row.productPrice}"/>
                    </td>
                    <td>
                        <input type="number" style="width: 40px" name="amount" value="${row.amount}" min="1">
                        <input type="hidden" name="productId" value="${row.productId}">
                    </td>
                    <td style="width: 100px" align="right">
                        <fmt:formatNumber pattern="###,###,###" value="${row.money}"/>
                    </td>
                    <td>
                        <a href="${path}/shop/cart/delete.do?cartId=${row.cartId}" class="button_c">삭제</a>
                    </td>
                </tr>
                </c:forEach>
            </table>
          
             <style>
                	.table2 {
                		
					     border-collapse: collapse;
					     border-top: 1px solid #f0f0f0;
					     border-bottom:1px solid #f0f0f0;
					     width:1200px;
					     text-align: center;
					     margin: 0 auto;
					   }  
					  
					  .table2 tr{
						  width: 1200px;
						 
					  }
					   
					  .table2 td{
					  	width: 200px;
					  	padding-top:50px;
					  	padding-bottom:50px;
						float: left;
						text-align: left;
					  }

					  .table2 td:nth-child(1){
					  	margin-top: 50px;
					  	width:800px; 
					  }
					  #money_title{
					  	margin-left: 50px;
					  	font-size: 25px;
					  	font-weight: 900;
					  }
					  
					  .table2 td:nth-child(3){
					 	text-align: right;
					  
					  }
				#all_money{
					font-weight: 900; 
					font-size: 20px;
				}	
				#all_money_txt{
					font-weight: 900;
					font-size: 30px;
					color: red;
				}  
				 
                </style>
            <table class="table2">
                <tr>
	                <td colspan="2">
	               		<span id="money_title">주문상품</span>
	           		</td>
	           		
	                <td colspan="1">
	                	<span>주문상품 수 </span><br>
	                	<span>금액합계</span><br>
	                	<span>배송료</span><br>
	                	<span id="all_money">전체 주문금액</span>
	                </td>
	                
	                <td colspan="2">
	                   <span>주문상품수</span><br>
	                   <span><fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"/></span><br>
	                   <span>${map.fee}</span><br>
	                   <span id="all_money_txt"><fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/></span>
	                </td>
	                
                </tr>
             </table>
            <input type="hidden" name="count" value="${map.count}" >
            <div style="width:1200px; height: 50px;  margin: 0 auto; padding-top:100px; text-align: center;">
            	<button type="submit" id="btnUpdate" class="button">수정</button>
    			<button type="button" id="btnList" class="button">상품목록</button>
    		</div>
        </form>
        </c:when>
    </c:choose>
    </div>
    <%@include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>
