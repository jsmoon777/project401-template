<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<title>FFEE 이벤트 </title>
<script src="/js/jssor.slider.min.js" type="text/javascript"></script>

<script type="text/javascript">
   jssor_1_slider_init = function() {

       var jssor_1_options = {
         $AutoPlay: 1,
         $Idle: 2000,
         $ArrowNavigatorOptions: {
           $Class: $JssorArrowNavigator$
         },
         $BulletNavigatorOptions: {
           $Class: $JssorBulletNavigator$
         }
       };

       var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

       /*#region responsive code begin*/

       var MAX_WIDTH = 1300;

       function ScaleSlider() {
           var containerElement = jssor_1_slider.$Elmt.parentNode;
           var containerWidth = containerElement.clientWidth;

           if (containerWidth) {

               var expectedWidth = Math.min(MAX_WIDTH || containerWidth, containerWidth);

               jssor_1_slider.$ScaleWidth(expectedWidth);
           }
           else {
               window.setTimeout(ScaleSlider, 30);
           }
       }

       ScaleSlider();

       $Jssor$.$AddEvent(window, "load", ScaleSlider);
       $Jssor$.$AddEvent(window, "resize", ScaleSlider);
       $Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
       /*#endregion responsive code end*/
   };
</script>
<style>
@import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
@import url(https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css);

	*,html,body,div,span,p{
		font-family: 'NanumSquare', sans-serif !important;
		
	    }
	    
    #admin_body{
      position:absolute;
      width:75%;
      margin-left:5%;
      margin-right:5%;
      height:800px;
      background:#fff;
      overflow-y:scroll;
      float: left;
      top:150px;
      left: 250px;
   }
	/* 이벤트 대문 슬라이드 */
    .jssorl-009-spin img {
        animation-name: jssorl-009-spin;
        animation-duration: 1.6s;
        animation-iteration-count: infinite;
        animation-timing-function: linear;
    }

    @keyframes jssorl-009-spin {
        from {
            transform: rotate(0deg);
        }

        to {
            transform: rotate(360deg);
        }
    }


    .jssorb052 .i {position:absolute;cursor:pointer;}
    .jssorb052 .i .b {fill:#fff;fill-opacity:0.3;}
    .jssorb052 .i:hover .b {fill-opacity:.7;}
    .jssorb052 .iav .b {fill-opacity: 1;}
    .jssorb052 .i.idn {opacity:.3;}

    .jssora053 {display:block;position:absolute;cursor:pointer;}
    .jssora053 .a {fill:none;stroke:#fff;stroke-width:640;stroke-miterlimit:10;}
    .jssora053:hover {opacity:.8;}
    .jssora053.jssora053dn {opacity:.5;}
    .jssora053.jssora053ds {opacity:.3;pointer-events:none;}
	
	#sns_content{
	width:1500px;
	height:100%;
	overflow:hidden;
	padding-bottom:200px;
	padding-top:200px;
	margin:0 auto;
	}
	
	/* 이벤트 리스트  */
	
	#event_div{
		font-famliy:'NanumSquare',san-serif;
		position: relative;
		width: 1300px;
		height: 1000px;
		margin: 0 auto;
	}
	/*이벤트*/
	.event_box{
		font-famliy:'NanumSquare',san-serif;
		position: relative;
		width:420px;
		height: 400px;
		margin-right: 20px;
		float: left;
	}
	.event_box:nth-of-type(3){
		margin-right: 0px;
	}
	.event_box:nth-of-type(6){
		margin-right: 0px;
	}
	.event_img{
		position: relative;
		width: 420px;
		height: 200px;
		overflow: hidden;
		background: blue;
		
	}
	.event_img > .event_slide_img{
		position: absolute;
		top:0;
		left:0;
		width: 100%;
		height:auto;
		background:pink;
		z-index: -1;
	}
	/*디데이*/
	.event_img>.event_dday{
		font-famliy:'NanumSquare',san-serif;
		position: absolute;
		margin-top:10px;
		margin-bottom: 10px;
		width: 55px;
		height: 55px;
		line-height: 55px;
		right: 0;
		color: #ff463a;
		text-align: center;
		font-size: 12px;
		font-weight: 900;
		background: url(/img/dday_img.png);
	}
	.event_img>img{
		width: 100%;
		
	}
	.event_text_box{
		width: 420px;
		height: 180px;
		padding-top:50px;
		text-align: center;
		float: left;
	}
	
	.event_slide_box{
		position: absolute;
	}
	
	.event_text_box>.event_h2{
		font-weight: 500;
		margin-bottom:22px;
		text-overflow: ellipsis;
		
	}
	.event_span{
	    font-family: 'Marian',sans-serif;
	    font-weight:400;
		font-size: 16px;
		color:#a0a0a0;
	}
	.event_day{
		font-family: 'Marian',sans-serif;
		font-weight:400;
		font-size:16px;
		color:#ff463a;
	}

	#event_title_box{
	width: 1300px;
	height:200px;
	padding-top:100px;
	background:#fff;
	text-align: center;
	margin: 0 auto;	
	
	}
	#event_title{
		font-weight:600;
		width: 1000px;
		font-size:38px;
		height: 100px; 
		margin: 0 auto;
	}
	
	#event_href_box{
	
		width: 1300px;
		height: 200px; 
		line-height:200px;
		margin: 0 auto;
		text-align: center; 
		font-size: 150px;
		color:#a0a0a0;
		font-weight: 100;
	}
	#a_href_vot{
		/* background-image:url(/img/bg_vot.png);
		background-repeat:inherit; */
		width: 44px;
		height: 76px;
	}
	.page_text{
		font-weight: 300;
		font-size: 22px;
		line-height: 200px;
	}
	
	.page_text>a{
		text-decoration: none;
		color: #000;
	}
	.end_event{
		position: relative;
		top: -70px;
	}
	.gift_event{
		position: relative;
		bottom: 10px;
	}
	
	/* 슬라이드  */
	.slide_event_box{
		width: 100%;
		height: auto;
		position: relative;
	}
	.slide_event_dday{
		position: absolute;
		font-family: 'Marian',sans-serif;
		top:50px;
		right:50px;
		width: 55px;
		height: 55px;
		line-height: 55px;
		margin-bottom:10px;
		text-align: center;
		font-size: 16px;
		font-weight:700;
		color: #ff463a;
		background: url(/img/dday_img.png);
	}
	.slide_event_day{
	    font-family: 'Marian',sans-serif;
		position: absolute;
		text-align: right;
		width: 110px;
		height: 50px;
		font-weight:500;
		font-size: 15px;
		color: #fff;
		top:120px;
		right:50px;
	}
	.slide_event_text_box{
		position: absolute;
		top:300px;
		left:100px;
		
	}
	.slide_event_h2{
		font-weight:800;
		font-size: 40px;
		color:#fff;
	}
	.slide_event_span{
		position:relative;
		font-weight:300;
		margin-top:30px;
		font-size:20px;
		color: #fff;
	}
</style>
</head>
<body>
	<%@include file="include/admin_header.jsp" %>
	
	<div id="admin_body">
	<div id="event_title_box">
		<h1 id="event_title">진행중인 이벤트</h1>
		<a href="/admin/eventform" >이벤트 작성하기</a>
	</div>
    <div id="event_div">
	<!-- 진행중인 이벤트 제목 -->
	   <c:choose>
			<c:when test ="${eventfile == null }">
			
			<p>등록된 글이 없습니다.</p>
			
			</c:when>
		
			<c:when test="${eventfile != null and eventlist != null}">
				<c:forEach items="${eventfile}" var="eventfile">
				<!-- 이벤트 박스 -->
				<div class="event_box">
					<a href="/event/eventview?eno=${eventfile.eno}">
						<div class="event_img">
						    <span class="event_dday">D-${eventfile.dday}</span>
							<img src="/image2/${eventfile.stored_file_name}"/>
						</div>
						<div class="event_text_box">
							<h2 class="event_h2">${eventfile.title}</h2>
							<span class="event_span">${eventfile.hashtag} </span>
							<p class="event_day">${eventfile.eventday} ~ ${eventfile.eventday2}</p>
						</div>
					</a>
				</div>	
				
				
				</c:forEach>
			</c:when>
		</c:choose>
	</div>
	<!-- 이동 -->
	<div id="event_href_box">
		<span class="page_text end_event"><a href="/event/eventendlist"> 종료된이벤트</a></span>
		<span id="a_href_vot"><img src="/img/bg_vot.png"/></span>
		<span class="page_text gift_event"><a href="#">당첨자확인</a></span>
	</div>
	</div>
	
</body>
</html>
