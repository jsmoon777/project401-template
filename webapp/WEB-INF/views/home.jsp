<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=1440,initial-scale=1.0" />
<meta name="Generator" content="미스터피자" />
<meta name="Author" content="미스터피자" />
<meta name="Keywords" content="미스터피자" />
<meta name="Description" content="미스터피자"/>
<title>온에어 미스터피자</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/mrpizza.ico" />
<link rel="stylesheet" href="/css/import.css">
<script src="/js/jquery-1.11.3.min.js"></script>
<script src="/js/jquery.easing.1.3.js"></script>
<script src="/js/jquery.flexslider-min.js"></script>
<script src="/js/script.js"></script>
<script src="/js/common_renew.js"></script>
<script src="/js/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>	
<link rel="stylesheet" href="css/swiper-bundle.min.css">
<link rel="stylesheet" href="css/swiper-bundle2.min.css">
<link href="/css/hover.css" rel="stylesheet" media="all">
<link href="/css/header.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" media="all">
</head>
<!--헤더-->



<body>
<input type="hidden" name="ribbonLength" value="0">
<script async="" src="/img/js"></script> 
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-172348470-1');
</script>
<!--헤더부분-->

<%@include file="/WEB-INF/include/header.jsp" %>

<section class="img_wrap" >

<div class="swiper-container">
    <div class="swiper-wrapper">
	  <div class="swiper-slide">
		  <div class="title_box">
		  	<div class="title_1">재료가 좋은 집은</div>
			<div class="title_2">피자가<span class="strong">맛있다</span></div>
			<a href="#" class="title_3 hvr-icon-wobble-horizontal">주문하러가기<i class="fa fa-arrow-right hvr-icon"></i></a>
		  </div>
		  <div class="black"></div>
		  <img src="img/slide1.jpg"/>
		</div>
      <div class="swiper-slide">  <div class="title_box">
		  	<div class="title_1">재료가 좋은 집은</div>
			<div class="title_2">피자가<span class="strong">맛있다</span></div>
			<a href="#" class="title_3 hvr-icon-wobble-horizontal">주문하러가기<i class="fa fa-arrow-right hvr-icon"></i></a>
		  </div><img src="img/slide2.jpg"/></div>

    </div>
    <!-- Add Arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>
 <script src="js/swiper-bundle.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>
</section>
<section  id="container" class="page-start">
 <!--인스타그램 sns 부분-->
  <section class="main_content" id="main_sns_warp">
    <article id="main_sns" class="view">
      <h2><span class="strong">FFEE 에서</span><br>
        SNS를 만나보세요</h2>
      <ul class="sns_channel">
        <li><a href="main.html#" target="_blank"><img src="img/youtube_icon.png" alt="" class="ico"></a></li>
        <li><a href="main.html#" target="_blank"><img src="img/face_icon.png" alt="" class="ico"></a></li>
        <li><a href="main.html#" target="_blank"><img src="img/insta_icon.png" alt="" class="ico"></a></li>
      </ul>
    </article>
  </section>
  
  
  <style>
  
  /* 인기카페 신상카페 탭 디자인 */
  	#tab_box{
  		width: 500px;
  		height: 100px;
  		background: pink;
  		margin: 0 auto;
  	}
  	#tab_box ul{
  		width: 500px;
  		height: 100px;
  		background: red;
  	}
  	#tab_box ul li{
  		width: 250px;
  		height: 100px;
  		background: red;
  		float: left;
  		text-align: center;
  		line-height: 100px;
  		font-size: 20px;
  	}
  .popcafe{
  	display: block;
  }
  .newcafe{
  	display: none;
  }
  </style>
 <script>
 
 $(function(){ 
	 $('#popShowBtn').click(function() {
		 alert('인기카페 보이기');
	    $(".popcafe").css("display","block");
	    $(".newcafe").css("display","none");
		    // goodsBtn을 클릭하면 goodsDiv를 보여줘라
		 
		})
	 
	$('#newsHideBtn').click(function() {
		alert('신상카페 보이기');
		$(".popcafe").css("display","none");
		$(".newcafe").css("display","block");
	    // goodsBtn을 클릭하면 goodsDiv를 숨겨라
	 
	})
 });
</script>
  <!--민성님 카페추천 탭 -->
  
  <section class="main_content">
  
   <div id="tab_box">
	    <ul>   
			<li><button id="popShowBtn">인기카페</button></li>
        	<li><button id="newsHideBtn">신상카페</button></li>
        </ul>
    </div>
    
    
    <!-- ****인기카페 -->
    <article id="main_pre_sale" class="view popcafe">
   
      <div class="sale_list">
        <div class="list_slider">
          <ul class="slides" style="width: 1980px;">
          
          <!-- 인기카페 리스트 -->
            <li tabindex="0">
              <div class="inner">
            
                <div class="photo">
                <img src="img/menu_1_img.png" alt="#"> </div>
                <div class="desc">
                  
                  <p class="name">인기카페쪽임
					  <span id="top_img">
						  <img width="50px" src="img/slide_icon2.png"></span></p>
                  <p class="address">포장주문시 20%할인</p>
                  <div class="btn_wish">
                  </div>
                  <div class="info" style="padding-top: 0px; height: 0px;">
                    <table>
                      <caption>
                     		 혜택
                      </caption>
                      <tbody>
                        <tr>
                          <th scope="row">혜택 : </th>
                          <td>등급별 혜택30%</td>
                        </tr>
                      </tbody>
                    </table>
                    <div class="btn_more"> <a href="#" target="_blank" title="새창">주문하기</a> </div>
                  </div>
                </div>
              </div>
            </li>
            <!-- 끝 -->
            
            
            
            
            
            <li tabindex="0">
              <div class="inner">
                
                <div class="photo"> <img src="img/menu_2_img.png" alt="포장주문"> </div>
                <div class="desc">
                 
                  <p class="name">포장주문<span id="top_img">
						  <img width="50px" src="img/slide_icon2.png"></span></p>
                  <p class="address">보너스파우치 / 홈런박스 주문 가능 </p>
                  <div class="btn_wish"> 
                  </div>
                  <div class="info" style="padding-top: 0px; height: 0px;">
                    <table>
                      <caption>
                      혜택&amp;할인
                      </caption>
                      <tbody>
                        <tr>
                          <th scope="row">혜택 : </th>
                          <td>등급별 혜택30%</td>
                        </tr>
                        <tr>
                          <th scope="row">할인 : </th>
                          <td>현대M카드 30%할인</td>
                        </tr>
                      </tbody>
                    </table>
                    <div class="btn_more"> <a href="#" target="_blank" title="새창">주문하기</a> </div>
                  </div>
                </div>
              </div>
            </li>
            <li tabindex="0">
              <div class="inner">
                
                <div class="photo"><img src="img/menu_3_img.png" alt=""> </div>
                <div class="desc">
                  
                  <p class="name">퀵오더
					  <span id="top_img">
						  <img width="50px" src="img/slide_icon2.png"></span></p>
                  <p class="address">빠르고 신속한 퀵 오더</p>
                  <div class="btn_wish"> 
                    
                   
                    
                    
                  </div>
                  <div class="info" style="padding-top: 0px; height: 0px;">
                    <table>
                      <caption>
                      혜택
                      </caption>
                      <tbody>
                        <tr>
                          <th scope="row">혜택 : </th>
                          <td>배달서비스 가입시 20% 적립</td>
                        </tr>
                        
                      </tbody>
                    </table>
                    <div class="btn_more"> <a href="sales/s/oncheon4.html" target="_blank" title="새창">주문하기</a> </div>
                  </div>
                </div>
              </div>
            </li>
            <li tabindex="0">
              <div class="inner">
           
                <div class="photo">
					<img src="img/menu_4_img.png"> </div>
                <p class="notice">드라이빙 픽업으로 주문이 가능합니다.</p>
                <div class="desc">
                 
                  <p class="name">드라이빙 픽업<span id="top_img">
						  <img width="50px" src="img/slide_icon2.png"></span></p>
                  <p class="address">바로 바로 드실수 있는 서비스</p>
                  <div class="btn_wish"> 
                  </div>
                  <div class="info" style="padding-top: 0px; height: 0px;">
                    <table>
                      <caption>
                      혜택
                      </caption>
                      <tbody>
                        <tr>
                          <th scope="row">혜택 : </th>
                          <td>미스터피자 포인트 적립</td>
                        </tr>
                        <tr>
                          <th scope="row">할인 : </th>
                          <td>현대M카드 30%할인</td>
                        </tr>
                      </tbody>
                    </table>
                    <div class="btn_more"> <a href="#" target="_blank" title="새창">주문하기</a> </div>
                  </div>
                </div>
              </div>
            </li>
          
          
			          
            <!-- 여기부턴 지우면 안댐 ㄴㄴ -->
          </ul>
        </div>
           <div class="btn_guide_set">
          <button type="button" class="prev"><img src="img/btn_mps_prev.png" alt="이전" /></button>
          <div class="btn_navi">
            <ol>
              <!--<li><a href="#" class="active">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li>-->
            </ol>
          </div>
          <button type="button" class="next"><img src="img/btn_mps_next.png" alt="다음" /></button>
        </div>
      </div>
      
    </article>

	<!-- ****신상카페 -->
   <article id="main_pre_sale" class="view newcafe">
   
      <div class="sale_list">
        <div class="list_slider">
          <ul class="slides" style="width: 1980px;">
            <li tabindex="0">
              <div class="inner">
            
                <div class="photo"> <img src="img/menu_1_img.png" alt="#"> </div>
                <div class="desc">
                  
                  <p class="name">신상카페 타이틀쪽임
					  <span id="top_img">
						  <img width="50px" src="img/slide_icon2.png"></span></p>
                  <p class="address">포장주문시 20%할인</p>
                  <div class="btn_wish">
                  </div>
                  <div class="info" style="padding-top: 0px; height: 0px;">
                    <table>
                      <caption>
                      혜택
                      </caption>
                      <tbody>
                        <tr>
                          <th scope="row">혜택 : </th>
                          <td>등급별 혜택30%</td>
                        </tr>
                      </tbody>
                    </table>
                    <div class="btn_more"> <a href="#" target="_blank" title="새창">주문하기</a> </div>
                  </div>
                </div>
              </div>
            </li>
            <li tabindex="0">
              <div class="inner">
                
                <div class="photo"> <img src="img/menu_2_img.png" alt="포장주문"> </div>
                <div class="desc">
                 
                  <p class="name">포장주문<span id="top_img">
						  <img width="50px" src="img/slide_icon2.png"></span></p>
                  <p class="address">보너스파우치 / 홈런박스 주문 가능 </p>
                  <div class="btn_wish"> 
                  </div>
                  <div class="info" style="padding-top: 0px; height: 0px;">
                    <table>
                      <caption>
                      혜택&amp;할인
                      </caption>
                      <tbody>
                        <tr>
                          <th scope="row">혜택 : </th>
                          <td>등급별 혜택30%</td>
                        </tr>
                        <tr>
                          <th scope="row">할인 : </th>
                          <td>현대M카드 30%할인</td>
                        </tr>
                      </tbody>
                    </table>
                    <div class="btn_more"> <a href="#" target="_blank" title="새창">주문하기</a> </div>
                  </div>
                </div>
              </div>
            </li>
            <li tabindex="0">
              <div class="inner">
                
                <div class="photo"><img src="img/menu_3_img.png" alt=""> </div>
                <div class="desc">
                  
                  <p class="name">퀵오더
					  <span id="top_img">
						  <img width="50px" src="img/slide_icon2.png"></span></p>
                  <p class="address">빠르고 신속한 퀵 오더</p>
                  <div class="btn_wish"> 
                    
                   
                    
                    
                  </div>
                  <div class="info" style="padding-top: 0px; height: 0px;">
                    <table>
                      <caption>
                      혜택
                      </caption>
                      <tbody>
                        <tr>
                          <th scope="row">혜택 : </th>
                          <td>배달서비스 가입시 20% 적립</td>
                        </tr>
                        
                      </tbody>
                    </table>
                    <div class="btn_more"> <a href="sales/s/oncheon4.html" target="_blank" title="새창">주문하기</a> </div>
                  </div>
                </div>
              </div>
            </li>
            <li tabindex="0">
              <div class="inner">
           
                <div class="photo">
					<img src="img/menu_4_img.png"> </div>
                <p class="notice">드라이빙 픽업으로 주문이 가능합니다.</p>
                <div class="desc">
                 
                  <p class="name">드라이빙 픽업<span id="top_img">
						  <img width="50px" src="img/slide_icon2.png"></span></p>
                  <p class="address">바로 바로 드실수 있는 서비스</p>
                  <div class="btn_wish"> 
                  </div>
                  <div class="info" style="padding-top: 0px; height: 0px;">
                    <table>
                      <caption>
                      혜택
                      </caption>
                      <tbody>
                        <tr>
                          <th scope="row">혜택 : </th>
                          <td>미스터피자 포인트 적립</td>
                        </tr>
                        <tr>
                          <th scope="row">할인 : </th>
                          <td>현대M카드 30%할인</td>
                        </tr>
                      </tbody>
                    </table>
                    <div class="btn_more"> <a href="#" target="_blank" title="새창">주문하기</a> </div>
                  </div>
                </div>
              </div>
            </li>
          </ul>
        </div>
           <div class="btn_guide_set">
          <button type="button" class="prev"><img src="img/btn_mps_prev.png" alt="이전" /></button>
          <div class="btn_navi">
            <ol>
              <!--<li><a href="#" class="active">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li>-->
            </ol>
          </div>
          <button type="button" class="next"><img src="img/btn_mps_next.png" alt="다음" /></button>
        </div>
      </div>
    </article>
    <script>
			mainPreSale();
		</script>
	
  </section>
	<!--서브이미지 슬라이-->
<style>

    .swiper-container2 {
	  position: relative;
      width: 100%;
      height:500px;
	  background:pink;
    }

    .swiper-slide2 {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
	.swiper-slide2>img{
		width:100%;
	}
	#sub_img_slide{
		
		position: relative;
	}
	.swiper-button-next2{
		color:#373737;
		margin-right: 180px;
	}
	.swiper-button-prev2{
		color:#373737;
		margin-left: 180px;
	}
  </style>
    <!-- Swiper -->
	<section id="sub_img_slide">
  <div class="swiper-container2">
    <div class="swiper-wrapper2">
      <div class="swiper-slide2"><img src="img/sub_slide1.png"/></div>
      <div class="swiper-slide2"><img src="img/sub_slide2.png"/></div>
      <div class="swiper-slide2"><img src="img/sub_slide3.png"/></div>
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination2"></div>
    <!-- Add Arrows -->
		<div class="swiper-button-next2"></div>
		<div class="swiper-button-prev2"></div>
  </div>
	</section>
  <!-- Swiper JS -->
  <script src="js/swiper-bundle2.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container2', {
      slidesPerView: 1,
      spaceBetween: 30,
      loop: true,
      pagination: {
        el: '.swiper-pagination2',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next2',
        prevEl: '.swiper-button-prev2',
      },
    });
  </script>
  
  

  <section class="main_content">
    <article id="main_gallery">
      <h2 class="hidden_cont">할인혜택안내</h2>
      <ul class="gallery_list">
        <li class="gallery">
          <div class="photo"><img src="img/event_img_1.png" alt="프리미엄 이벤트1"></div>
          <a href="gallery/main/intro.html" class="category_subject">
          <p class="category">할인혜택안내</p>
          <p class="subject">제휴카드 안내 및 할인 가능한 카드<br />
            안내해드립니다.</p>
          </a> <a href="#" class="btn"><img src="img/btn_mg_ask.png" alt="" class="ico" /><span class="txt">할인혜택안내</span></a> </li>
        <li class="academy">
          <div class="photo"><img src="img/event_img_2.png" alt=""></div>
          <a href="gallery/academy/lecture/list.html" class="category_subject">
          <p class="category">이벤트 안내</p>
          <p class="subject">미스터 피자에서 이벤트<br/>
			  안내드립니다.</p>
          </a> <a href="#" class="btn"><img src="img/btn_mg_ask.png" alt="" class="ico" /><span class="txt">이벤트안내</span></a> </li>
      </ul>
    </article>
    <script>
			mainGallery();
		</script> 
  </section>
	<style>
	#main_times_wrap {
	width: 100%;
	height:700px;
	z-index: 1;
	position: relative;
	background:url(img/bg_times.png) no-repeat center bottom;
	background-size: cover;
}
	</style>
	<!--공지 상 쿠폰 위치-->
  <section class="main_content" id="main_times_wrap">
    <article id="main_times">
      <h2 class="hidden_cont"></h2>
      <ul class="times_list">
        <li> 
		  <a href="javascript:void(0)"data-type="thumbnail">
          <p class="category"> 공지 &nbsp;<img src="img/icon_1.png"/></p>
          <p class="subject">배달의민족 1만 6천원 행사</p>
          <p class="cont"> <img src="img/notice.png" alt="배민공지"/> </p>
          <p class="date">
            <time datetime="2020-03-16">2020.06.15</time>
          </p>
          </a> 
	  </li>
        <li> <a href="javascript:void(0)" data-type="thumbnail">
          <p class="category">상 &nbsp;<img src="img/icon_2.png"></p>
          <p class="subject">미스터피자 연간 매출 1위..</p>
          <p class="cont"> <img src="img/prize.png" alt="#"> </p>
          <p class="date">
            <time datetime="2020-03-16">2020.09.02</time>
          </p>
          </a> </li>
        <li> <a href="javascript:void(0)"  data-type="thumbnail">
          <p class="category">쿠폰 &nbsp;<img src="img/icon_3.png"></p>
          <p class="subject">월간 쿠폰 발급</p>
          <p class="cont"> <img src="img/coo.png" alt="쿠폰이미지"> </p>
          <p class="date">
            <time datetime="2020-03-16">2020.07.16</time>
          </p>
          </a> 
		  </li>
		   <li> <a href="javascript:void(0)"  data-type="thumbnail">
          <p class="category">매장찾기</p>
          <p class="subject"></p>
          <p class="cont"><img src="img/locaction.png" alt="매장찾기"></p>
          <p class="date">
            <time datetime="2020-03-16">　</time>
          </p>
          </a> 
		  </li>
		  
        
      </ul>
    </article>
    <script>
			mainTimesList();
	</script> 
  </section>
	
	<!--뉴스-->
	<style>
	
	</style>
  <section class="main_content" id="main_news_wrap">
    <article id="main_news" class="view">
      <h2>미스터피자 뉴스</h2>
      <div class="news_list_wrap">
        <ul class="news_list" style="margin-top: -168px;"><li><strong class="category">소식</strong><a href="#" title="" class="subject" target="_blank">[눈길 끄는 분양단지]삼성물산 ‘부산 레이카운티’ </a>
            <time datetime="2020-03-31">2020.07.28</time>
          </li>
          <li><strong class="category">소식</strong><a href="#" title="" class="subject" target="_blank">미스터피자 불닭치즈피자 신메뉴 출</a>
            <time datetime="2020-03-31">2020.08.06</time>
          </li>
          <li><strong class="category">공지</strong><a href="#" title="" class="subject" target="_blank">브랜드 피자 평판 1위 입</a>
            <time datetime="2020-03-31">2020.08.06</time>
          </li>
          <li><strong class="category">소식</strong><a href="#" title="" class="subject" target="_blank">미스터피자에서 그동안 인기 있던메뉴 하루만 출</a>
            <time datetime="2020-03-31">2020.08.03</time>
          </li>
          <li><strong class="category">소식</strong><a href="#" title=" " class="subject" target="_blank">1+1 프리미엄 피자 행</a>
            <time datetime="2020-03-31">2020.07.30</time>
			  
          </li>
			<li><strong class="category">공지</strong><a href="#" title="" class="subject" target="_blank">브랜드 피자 평판 1위 입</a>
            <time datetime="2020-03-31">2020.08.06</time>
          </li>
          <li><strong class="category">소식</strong><a href="#" title="" class="subject" target="_blank">미스터피자에서 그동안 인기 있던메뉴 하루만 출</a>
            <time datetime="2020-03-31">2020.08.03</time>
          </li>
          <li><strong class="category">소식</strong><a href="#" title=" " class="subject" target="_blank">1+1 프리미엄 피자 행</a>
            <time datetime="2020-03-31">2020.07.30</time>
			</li>
        </ul>
      </div>
      <div class="btn_guide_set">
        <button class="prev"><img src="img/btn_mn_prev.png" alt="이전" /></button>
        <button class="next"><img src="img/btn_mn_next.png" alt="다음" /></button>
      </div>
    </article>
    <script>
			mainNewsList();
		</script> 
  </section>
	
	
	<!--이벤트배너-->
  <section class="main_content">
    <aside class="event_list view">
      <h3 class="hidden_cont">이벤트배너</h3>
      <ul class="col2">
        <li> <a href="#" target="_self"> <img src="img/banner_1.png" alt=""> </a> </li>
        <li> <a href="#" target="_self"> <img src="img/banner_2.png" alt=""> </a> </li>
      </ul>
    </aside>
  </section>
</section>

<div id="cm_popup"></div>
<script>
	mainScrollInt();
	
function closePop(){
	closeLayerPopup('.layer_popup');
}
	
function goList(pg,idx){
	//document.location.reload();
	location.href='main8309.html?isUpdate=Y';
}

</script> 
<script type="text/javascript" src="img/mark.js.다운로드"></script> 
<script type="text/javascript" src="img/frontControl5f29.js.다운로드"></script>
<link rel="stylesheet" href="img/popup.css">
<!--하단부분-->
<!-- <div id="footer_wrap">
  <footer id="footer">
    <h2><a href="http://www.secc.co.kr/ko/html/index.asp" target="_blank" title="새 창 열림"><img src="img/mp_logo.png" alt="빈습니스"></a></h2>
    <ul class="foot_menu">
      <li><a href="common/terms/terms.html">이용약관</a></li>
      <li><a href="common/privacy/privacyInfo.html"><strong>개인정보처리방침</strong></a></li>
      <li><a href="common/email/email.html">이메일주소무단수집거부</a></li>
      <li><a href="common/copyright/copyright.html">저작권안내</a></li>
      <li><a href="/brand/partners/partnerList.do">래미안파트너즈</a></li>
      <li><a href="customer/guide/customerGuide.html" class="cscenter">고객센터 <strong>1588-3588</strong></a></li>
    </ul>
    <ul class="sns">
      <li><a href="https://www.instagram.com/raemian_official/" target="_blank" title="새 창 열림"><img src="img/btn_foot_instagram.png" alt="인스타그램"></a></li>
      <li><a href="https://www.youtube.com/user/RAEMIANAPT" target="_blank" title="새 창 열림"><img src="img/btn_foot_youtube.png" alt="유튜브"></a></li>
      <li><a href="https://pf.kakao.com/_xiHlxaT" target="_blank" title="새 창 열림"><img src="img/btn_foot_kakao.png" alt="카카오"></a></li>
    </ul>
    <p class="company_info"><b>미스터피자 만든 김수빈</b> <b>부상궁 서면싱 어딘구</b> <b>사업자등록번호 000-0000-0000</b></p>
    <p class="warning">※ 본 컨텐츠의 저작권은 빈스빈스에 있으며, 이를 무단 이용하는 경우 저작권법 등에 따라 법적책임을 질 수 있습니다.</p>
    <p class="copyright" lang="en">ⓒ SAMSUNG C&amp;T Corp. All Rights Reserved.</p>
  </footer>
  <aside id="foot_award_list">
    <h3 class="hidden_cont">수상 목록</h3>
    <ul>
      <li> <img src="img/award_f_ncsi.png" alt="" class="ico"> <span class="txt">국가고객만족도 (NCSI)<br>
        22년 연속 1위</span> </li>
      <li> <img src="img/award_f_nbci.png" alt="" class="ico"> <span class="txt">국가브랜드 경쟁력지수 (NBCI)<br>
        17년 연속 1위</span> </li>
      <li> <img src="img/award_f_kbpi.png" alt="" class="ico"> <span class="txt">한국 산업의 브랜드 파워 (K-BPI)<br>
        19년 연속 1위</span> </li>
      <li> <img src="img/award_f_hf.png" alt="" class="ico"> <span class="txt">고객감동경영대상<br>
        ‘명예의 전당 최초 헌정 기업</span> </li>
      <li> <img src="img/award_f_ks0sql.png" alt="" class="ico"> <span class="txt">한국 서비스 품질지수 (KS-SQI)<br>
        5년 연속 1위</span> </li>
     
    </ul>
  </aside>
</div> -->
<!-- 시작 팝업 메세지  -->
<div class="dialog_popup" tabindex="0" id="comMsgDialog" style="display:none; width: 446px; opacity: 0;">	
	<div class="msg">
		<div class="ico">
			<img src="#" alt="">
		</div>		
		<p class="txt">미스터피자에 오신것을 환영합니다 :) </p>
	</div>	
	<div class="btn_dp_set">	
		<a href="javascript:closeLayerPopup(&#39;.dialog_popup&#39;)" class="warning">닫기</a>	
	</div>
</div>
<!--주문하기 버튼팝업-->
<a href="#" class="btn_quick_search" style="opacity: 1;">
	<img src="img/popup_img.png" alt="주문하기">
</a>
<!--위로 버튼팝업-->
<a href="#" class="btn_quick_search" style="display: block; position: fixed; bottom: 30px; top: auto; opacity: 1;">
	<img src="img/btn_top.png" alt="위로">
</a>
	
<div id="bg_modal" class=""></div>
	

</body>
</html>

















