<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 리스트</title>
<style>
#section{
      width:100%;
      height : 600px;
      text-align:center;
      position:relative;
}
#map{
     display:inline-block;
     height : 600px;
     width:30%;
     float: left;
     background: #ff0;
     padding:auto;
     position:absolute;
     top:300px;
     left:320px;
}
#div1{
     position:absolute;
     top:600px;
     left:400px;
}
#div_2{
display:inline-block;
padding:auto;
position:absolute;
     top:300px;
     left:850px;
}
</style>

<body>
<%@include file="/WEB-INF/include/sub_header.jsp" %>
<h3>대구맛집</h3>
<div id="map" style="width:500px;height:350px;"></div>
<script type="text/javascript" 
	  src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a60fdb07467139ad701399153a95a0fa&libraries=services">
</script>
	 

<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
 
  <script>
 
var infowindow = new kakao.maps.InfoWindow({zIndex: 1});
  
  var mapContainer = document.getElementById('map'); 
  var mapOption = { 
	center: new kakao.maps.LatLng(33.450701, 126.570667),
	level: 3 
   };

   var map = new kakao.maps.Map(mapContainer, mapOption); 
  
   //-----------------기본 맵설정끝
  
   
    var ps = new kakao.maps.services.Places(); 

   // 키워드로 장소를 검색
    ps.keywordSearch('대구맛집', placesSearchCB); 

    function placesSearchCB (data, status, pagination) {
      if (status == kakao.maps.services.Status.OK) {

        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
          }       

             map.setBounds(bounds);
         } 
     }

       // 지도에 마커를 표시
        function displayMarker(place) {
    
       // 마커를 생성하고 지도에 표시
        var marker = new kakao.maps.Marker({
           map: map,
           position: new kakao.maps.LatLng(place.y, place.x) 
        });

        kakao.maps.event.addListener(marker, 'click', function() {
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
       });
    }
       
  </script>
  
  <h2>목록</h2>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
  function test(data){
	  
	  var items = '';
	  
	  //display 가 어차피 최대 5개
	  //나중에 total 불러와서 total 범위로 설정하던지 total로 페이징할것
	  for(var i=0; i<5; i++){
		  var link = data.items[i].link;
		  items += '<a target="_blank" href="'+link+'">'
	      items += data.items[i].title;
		  items += "</a>";
		  items += "<br>";
		  items += "주소: ";
		  items += data.items[i].address;
		  items += "<br>";
		  items += "<br>";
	  
	  
		  $('#div1').html(items);
	  }
  } 
	  $(function(){
			$.ajax({
				url : 'http://localhost:9090/getlocal?area=7',
				data: {
					keyword : $('#keyword').val(),
					currentPage : $('#currentPage').val(),
					display : $('display').val()
				},
				success : function(items){
					console.log(items);
					test(items);
				},
				error : function(xhr){
					alert(xhr.status + ',에러' + xhr.statusText);
				}
		});
	  });
  
</script>
 
 

<div id="div1"></div>

<div id="div_2">
  <iframe width="530" height="315" src="https://www.youtube.com/embed/cW00llSljCo?autoplay=1&mute=1" title="YouTube video player" 
  frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
  allowfullscreen></iframe>
</div>
<div style="clear:both;">
</div>
</body>  

  
</html>













