<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.5.0/materia/bootstrap.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/> <!-- 아이콘 -->
<title>FFEE 이벤트 </title>
<style>
	#sns_content{
	width:1500px;
	height:100%;
	overflow:hidden;
	padding-bottom:200px;
	padding-top:200px;
	margin:0 auto;
	}

</style>
  </head>
  <body>
  <%@include file="/WEB-INF/include/sub_header.jsp" %>
   
    <div style="margin-top:200px; margin-bottom:200px;">
      
      
      <!-- 그리드 이미지 갤러리 -->
	<div style="margin-top:200px; width: 100%; margin-bottom:200px;">
		<!-- sns박스 -->
		<div  id ="sns_box" style="width:1500px;margin:0 auto;">
			<div id="sns_div">
			      <h1>FFEE 진행중인 이벤트</h1>
			      <p class="lead">이벤트 참여를 원하시면 클릭을하셔서 상세페이지를 확인 해주세요</p>
				<span class="sns_li">
				<a href="/event/eventform" id="snswite_btn">+</a></span>
			</div>
		</div>	
      
      
      <!-- 이벤트 목록 구현 -->
      <div class="container text-right mt-3">
        <a type="button" class="no-outline p-0 grid-3x3" title="Spaced">
          <span class="material-icons">
            apps
          </span>
        </a>

        <a
          type="button"
          class="no-outline p-0 mx-2 grid-4x3"
          title="Compact">
          <span class="material-icons">
            view_comfy
          </span>
        </a>
      </div>
      <div id="sns_content">
      <div class="row">
      
      <c:choose>
		<c:when test ="${eventfile == null }">
		
			<p>등록된 글이 없습니다.</p>
			
		</c:when>

		<c:when test="${eventfile != null and eventlist != null}">
			<c:forEach items="${eventfile}" var="eventfile">
				
				 <div class="gv-card col-4 my-4">
					<div class="card">
					  <img class="card-img-top project-image" src="/image2/${eventfile.stored_file_name}"/>
					  <div class="card-body">
					    <h3 class="card-title">${eventfile.title}</h3>
					    <p class="card-text">${eventfile.eventday}</p>
					    <a href="/event/eventview?eno=${eventfile.eno}" class="btn btn-primary">이벤트 참여</a>
					  </div>
					</div>
				</div>
				
			</c:forEach>
		</c:when>
      </c:choose>
      
     
      	
      
     
      </div>
    </div>
    </div>
    
    <!--Scripts needed to run bootstrap-->
    <script
      src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
      integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
      crossorigin="anonymous"
    ></script>
    <!--Grid View JS-->
    <script src="/js/grid-view.js"></script>
    <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<script>
try {
  fetch(new Request("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js", { method: 'HEAD', mode: 'no-cors' })).then(function(response) {
    return true;
  }).catch(function(e) {
    var carbonScript = document.createElement("script");
    carbonScript.src = "//cdn.carbonads.com/carbon.js?serve=CK7DKKQU&placement=wwwjqueryscriptnet";
    carbonScript.id = "_carbonads_js";
    document.getElementById("carbon-block").appendChild(carbonScript);
  });
} catch (error) {
  console.log(error);
}
</script>
<%@include file="/WEB-INF/include/footer.jsp" %>
  </body>
</html>
