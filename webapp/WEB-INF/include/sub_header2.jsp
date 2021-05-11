<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="header">
<div id="top_header">
  <ul class="top_menu_ul">
  	<c:if test="${member == null}">
	  	<li><a href="/login">로그인</a></li>
	  	<li><a href="/registerPro">회원가입</a></li>
  	</c:if>
	<c:if test="${member != null}">
		<li><span style="font-weight: 900;">${member.userId}</span> 님 안녕하세요.</li>
		<li><a href="/logout">로그아웃</a></li>
	</c:if>
  	<li><a href="/">메인페이지</a></li>
  </ul>
</div>
  <nav class="menu_nav">
    <ul class="menu_ul">
		<li><a href="/mat/map"  class="hvr-underline-from-left">맛집정보</a></li>
		<li class="hvr-underline-from-left"><a href="/PDS/List?menu_id=MENU01">카페추천</a></li>
		<li class="hvr-underline-from-left"><a href="/board/snslist">SNS</a></li>
		<li><img src="/img/logo.png" width="70px;"alt="ffee"></a></li>
		<li class="hvr-underline-from-left"><a href="/event/eventlist">이벤트</a></li>
		<li class="hvr-underline-from-left"><a href="/nboard/list">공지</a></li>
		<li class="hvr-underline-from-left"><a href="/MBoard/WriteForm?menu_id=MENU01&bnum=0&lvl=0&step=0&nref=0">문의</a></li>
	  </ul>
  </nav>
</header>
