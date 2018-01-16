<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!doctype html>
<html lang="en">
<head>
	<title>Americode Cinema-theaterInfo</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- 파노라마 -->
	<link type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/3.0.0/normalize.min.css" media="all" rel="stylesheet" />
	<!-- <link href="https://fonts.googleapis.com/css?family=PT+Serif:400italic" rel="stylesheet" type="text/css"> -->
	<link type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/prism/0.0.1/prism.min.css" media="all" rel="stylesheet" />
	<!-- <link rel="stylesheet" href="../demo/dist/css/style.min.css" /> -->
	<link rel="stylesheet" href="../dist/css/paver.min.css" />
	<!-- 파노라마 end -->
	
	<!-- 글씨체 -->
	<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet">
	
	 <!-- Fonts -->
        <!-- Font awesome - icon font -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Roboto -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>
    
    <!-- slick -->
    <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
	<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
    
    <!-- Stylesheets -->

        <!-- Mobile menu -->
        <link href="../css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="../css/external/jquery.selectbox.css" rel="stylesheet" />
    
        <!-- Custom -->
        <link href="../css/style.css?v=1" rel="stylesheet" />

        <!-- Modernizr -->
        <script src="../js/external/modernizr.custom.js"></script>
    
    	<!--   semantic UI  -->
		<link rel="stylesheet" type="text/css" href="../semantic/semantic.min.css">
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"
		  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
		  crossorigin="anonymous"></script>
		<script src="../semantic/semantic.min.js"></script>
		
<script>
	 $(function(){
		 
			$.ajax(
					{
						url : "/cinema/json/getTransportListAtStation/127.02760560000002/37.4946/300", 
						method : "GET", 
						dataType : "json", 
						headers : {
							"Accept" : "application/json", 
							"Content-Type" : "application/json"
						}, 
						success : function(JSONData, status){
							var all = "";
							var busStationName = "";
							var busNo = "";
							var subway ="";
							
							for(var i = 0; i < JSONData.stationNameList.length; i ++) {
								if(i == JSONData.stationNameList.length-1){
									busStationName += JSONData.stationNameList[i];	
								}else{
									busStationName += JSONData.stationNameList[i]+", ";
								}
							}
							if(JSONData.stationNameList.length == 0){
								busStationName = "근처 버스정류장이 없습니다." 
							}
							
							for(var i = 0; i < JSONData.busNoList.length; i ++) {
								if(i == JSONData.busNoList.length-1){
									busNo += JSONData.busNoList[i]
								}else{
									busNo += JSONData.busNoList[i]+", ";
								}
							}
							if(JSONData.busNoList.length == 0){
								busNo = "근처 버스번호가 없습니다." 
							}
							
							for(var i = 0; i < JSONData.subwayList.length; i++) {
								if(i == JSONData.subwayList.length-1){
									subway += JSONData.subwayList[i];	
								}else{
									subway += JSONData.subwayList[i]+", ";	
								}
							}
							if(JSONData.subwayList.length == 0){
								subway = "근처 지하철이 없습니다." 
							}
							
							$("#busStationName").text(busStationName);
							$("#busNo").text(busNo);
							$("#subway").text(subway);
						}
					}		
			)
		
	});
</script>


<style>
.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.hn{font-family: 'Hanna', sans-serif;}

/* Panorama container */
*[data-paver] {
  margin-bottom: 1.5rem;
  
  height: 80vh;
  left: -25%;
  width: 150%;
  overflow-x: hidden;
  overflow-y: hidden;
}

*[data-paver] img {
  height: 100%;
}

.panorama {
  height: 400px;
  margin-bottom: 1.5rem;
  overflow-x: hidden;
  overflow-y: hidden;
  left: 0;
  width: 100%;
}

.panorama img {
  height: 100%;
}

/* Fallback message */
.paver--fallback {
  margin-bottom: 0;
}

.paver--fallback + .paver__fallbackMessage {
  font-size: .8rem;
  margin-bottom: 1.5rem;
  padding: .25rem 1rem;
  text-align: center;
}

.theaterphoto img{
/* 			height : calc(50vh - 100px);
			width : auto;
			margin : 0 auto; */
		}
		.slick-prev:before,
		.slick-next:before{
			color : #f06060;
		}

</style>
</head>

<body>
<div class="wrapper">
		<!-- Banner -->
        <div class="banner-top">
            <img alt='top banner' src="/images/banners/space.jpg">
        </div>

        <!-- Header section -->
        <header class="header-wrapper header-wrapper--home">
			<!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="/layout/topToolbar.jsp" />
			<!-- ToolBar End /////////////////////////////////////-->
        </header>


		<br/>
		<br/>
		<br/>
		<br/>
		
        <section class="container">
            <h1 class="page-heading heading--outcontainer jeju">AMC 위치</h1>
              <div class="contact">
                <div id="map" style="width:100%;height:350px;"></div>
              </div>
	            <div class="ui ignored warning message hanna">
	            		<i class="fa fa-location-arrow"><strong class="jeju">&nbsp;주소</strong></i>
	            		<div>&nbsp;</div>
	            		<div>서울특별시 서초구 서초동 1327-15</div>
	            		<div>서울특별시 서초구 강남대로53길 8 비트아카데미빌딩(AmericodeCinema)</div>
	            		<div><i class="fa fa-phone"></i> : 02-3486-9600</div>
	            </div>
	            <div class="ui ignored info message hanna">
	            		<i class="fa fa-road"><strong class="jeju">&nbsp;교통편</strong></i>
	            			<div>&nbsp;</div>
	            			<div>[버스정류장]</div>
	            			<div id="busStationName">실시간 정류장 검색중...</div>
	            			<br/>
	            			<div>[버스 번호]</div>
	            			<div id="busNo">실시간 버스번호 검색중...</div>
	            			<br/>
	            			<div>[지하철] </div>
	            			<div id="subway">실시간 지하철 검색중...</div>
           		 </div>
        </section>
         <div class="contact-form-wrapper">
            <div class="container" style="margin:auto;">
	            <h1 class="page-heading heading2--outcontainer">Panorama</h1>
	            <div class="col-md-12" style="margin-bottom:10px">
	            	<div class="massive ui red tag label">1 상영관</div>
	            </div>
	            <div class="col-sm-11 col-md-11" id="change">
	                 <figure>
						<div class="panorama" data-paver data-start-position="0" style="width:100%;">
						 	<img src="../images/theater/pano.jpg"/>
					
							<!-- <img src="../images/theater/theater1.jpg"/> -->
						</div>
					 </figure>
	            </div>
	            <div class="col-md-12" style="margin-bottom:10px">
	            	<div class="massive ui red tag label">2 상영관</div>
	            </div>
	            <div class="col-sm-11 col-md-11" id="change">
	                 <figure>
						<div class="panorama" data-paver data-start-position="0" style="width:100%;">
						<img src="../images/theater/pano2.jpg"/>
							<!--  <img src="../images/theater/theater2.jpg"/> -->
						</div>
					</figure>
	            </div>
            </div>
        </div>
        
        <section class="container">
        <h1 class="page-heading heading--outcontainer jeju">영화관 사진</h1>
        	<div class="contact">
                <!-- <div class="center-block theaterphoto" style="width:800px; height:300px" align="center" style="margin-left:auto; margin-right:auto;"> -->
                <div class="theaterphoto" style="width:800px; height:300px; display:block; margin: 0 auto;" align="center" style="margin-left:auto; margin-right:auto;">
	   					<div>
	 					 	<div class="image center-block"><img  src="../images/theater/theaterEnter1.jpg" width="1000px" height="400px"/></div>
	 					</div>			 				
	 				
						<div>
							<div class="image"><img class="steelCut" src="../images/theater/theaterEnter2.jpg" width="1000px" height="400px"/></div>
						</div>
						<div>
							<div class="image"><img class="steelCut" src="../images/theater/theaterElevator.jpg" width="1000px" height="400px"/></div>
						</div>
						
						<div>
							<div class="image"><img class="steelCut" src="../images/theater/screenTheaterEnter.jpg" width="1000px" height="400px"/></div>
					
					
						</div>
						
						<div>
							<div class="image"><img class="steelCut" src="../images/theater/screenTheaterLobby.jpg" width="1000px" height="400px"/></div>
						</div>
				</div>
            </div>
        </section>
        
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        
   		<div class="contact-form-wrapper-search">
         <div class="place-form-area">
        <section class="container">
            <div class="order-container">
                <div class="order">
                    <img class="order__images" alt='' src="/images/unifiedSearch.png">
                    <div class="order__title">통합검색 <br><span class="order__descript">in amc homepage</span></div>
                </div>
            </div>
         </section>
         </div>
         	<div class="container" style="margin:auto;">
	            <div class="container" style="margin:auto;">
					        <!-- Search bar -->
			        <div class="search-wrapper">
			            <div class="container container--add">
			                <form id='search-form' action="/cinema/unifiedSearch" method='post' class="search">
			                    <input type="text" class="search__field" placeholder="Search" name="searchKeyword">
			                    <button type='submit' class="btn btn-md btn--danger search__button" onClick="javascript:unifiedSearch()">search a amc</button>
			                </form>
			            </div>
			        </div>
	            </div>
            </div>
        </div>


			<!---------------------------------- 스크립트 -------------------------------->
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=602c37cc6b68ef5c22dd85c18e6663a5"></script>
			<script>
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			  mapOption = { 
			        center: new daum.maps.LatLng(37.4946444, 127.02759279999998), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
			
			var map = new daum.maps.Map(mapContainer, mapOption);
			
			var markerPosition = new daum.maps.LatLng(37.4946444, 127.02759279999998); // 마커가 표시될 위치입니다
			
			
			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
			  position: markerPosition,
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);  
			
			// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			var content = '<div class="customoverlay">' +
			    '  <a href="http://map.daum.net/link/map/24048361" target="_blank">' +
			    '    <span class="title">AmericodeCinema</span>' +
			    '  </a>' +
			    '</div>';
			
			// 커스텀 오버레이가 표시될 위치입니다 
			var position = new daum.maps.LatLng(37.4946444, 127.02759279999998);  
			
			// 커스텀 오버레이를 생성합니다
			var customOverlay = new daum.maps.CustomOverlay({
			    map: map,
			    position: position,
			    content: content 
			});
			
			//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new daum.maps.MapTypeControl();
			
			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
			
			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new daum.maps.ZoomControl();
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
			
			//지도에 교통정보를 표시하도록 지도타입을 추가합니다
			//map.addOverlayMapTypeId(daum.maps.MapTypeId.TRAFFIC);    
		
		</script>
		
		
			
			<!-- 파노라마용 스크립트 -->
			<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
			<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
			<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/prism/0.0.1/prism.min.js"></script>
			<script type="text/javascript" src="../dist/js/jquery.paver.min.js"></script>
			<script type="text/javascript" src="../demo/dist/js/functions.min.js"></script>
			<script type="text/javascript">
				$(function () {
					// Paver
					$('div[data-paver]').paver();
				});
			</script>
			<!-- 파노라마용 스크립트 end-->
		
		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />
</div>

		<!-- 슬릭 캐러셀 -->
        <script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
         <script>
         $(document).ready(function(){
            $('.theaterphoto').slick({
            	centerMode:true,
                	edgeFriction : 2,
                	dots: true,
              	  infinite: true,
              	  speed: 500,
          	  fade: true,
          	  prevArrow : '<button type="button" class="slick-prev">Previous</button>'
            });
          });
         
         function unifiedSearch(){
 	   		$("form").attr("method" , "POST").attr("action" , "/cinema/unifiedSearch").attr("accept-charset","EUC-KR").submit();
 	   	 }
         $('.boxshadow').css("box-shadow","0 0 0px rgba(0, 0, 0, 0)")
         
         $('.btn--singin').click(function (e){
	         e.preventDefault();
	         $('.auth__function').toggleClass('open-function')
	     });
         $('.login-window').click(function (e){
             e.preventDefault();
             $('.overlay').removeClass('close').addClass('open');
         });

         $('.overlay-close').click(function (e) {
             e.preventDefault;
             $('.overlay').removeClass('open').addClass('close');

             setTimeout(function(){
                 $('.overlay').removeClass('close');}, 500);
         });
         </script>
         <script src="/js/jquery.mobile.menu.js"></script>
         <script src="/js/custom.js"></script>
         
</body>
 <style>
	  @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	  .jeju{
		font-family: 'Jeju Gothic', sans-serif;
		font-size: 20px;
  	  }
      html{
 	     height: auto;
      }
      .contact-form-wrapper {
	  background-color: #ffd564;
	  overflow: hidden;
	  margin: 150px 0;
	  padding: 56px 0 60px;
	}
	.hanna{ 
	  font-family: 'Hanna', sans-serif; 
	  font-size: 120%;
	   line-height:4.3em
	 }
	.auth--home .auth__show {
	  background: transparent;
	}
	.contact-form-wrapper-search{
	  background-color: #dbdee1;
	  overflow: hidden;
	  margin: 76px 0;
	  padding: 56px 0 60px;
	}
 </style>

</html>