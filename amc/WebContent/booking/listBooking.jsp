<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.springframework.util.StringUtils" %>
<!doctype html>
<html>
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>Americode Cinema-listBooking</title>
        <meta name="description" content="A Template by Gozha.net">
        <meta name="keywords" content="HTML, CSS, JavaScript">
        <meta name="author" content="Gozha.net">
    
    <!-- Mobile Specific Metas-->
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="telephone=no" name="format-detection">
    
    <!-- Fonts -->
        <!-- Font awesome - icon font -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Roboto -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>
    
    <!-- Stylesheets -->
    <!-- jQuery UI --> 
        <link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="stylesheet">

        <!-- Mobile menu -->
        <link href="/css/gozha-nav.css" rel="stylesheet" />
        <!-- Select -->
        <link href="/css/external/jquery.selectbox.css" rel="stylesheet" />
        <!-- Swiper slider -->
        <link href="/css/external/idangerous.swiper.css" rel="stylesheet" />
    
        <!-- Custom -->
        <link href="/css/style.css?v=1" rel="stylesheet" />

        <!-- Modernizr --> 
        <script src="/js/external/modernizr.custom.js"></script>
    
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
   
        <!--   Sweetalert2 CDN  -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.0/sweetalert2.all.min.js"></script>
	
		<!--   semantic UI  -->
		<link rel="stylesheet" type="text/css" href="../semantic/semantic.min.css">
		<script
		  src="https://code.jquery.com/jquery-3.1.1.min.js"
		  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
		  crossorigin="anonymous"></script>
		<script src="../semantic/semantic.min.js"></script>
  
  <script type="text/javascript">
  
   
	//무한스크롤
	var count = 2;
	var all = '';
	var condition = 'now';
	
	$( window ).scroll(function(){
		 if ($(window).scrollTop() == $(document).height() - $(window).height()){
			 loadList(count,condition);
			 console.log(count++);
		 }//end if문
	 }); 
	
	$(function() {
		$("#now").on("click",function(){
			condition = 'now';
			count = 2;
			$(".gallery-wrapper").empty();
			loadList(1,condition);
		});
		
		$("#past").on("click",function(){
			condition = 'past';
			count = 2;
			$(".gallery-wrapper").empty();
			loadList(1,condition);
		});
	})
	
	function loadList(page,condition){
		 $.ajax({
				url:"/booking/json/getBookingList/",
				method:"POST",
				async : false,
				headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
				},
				data:JSON.stringify({
					currentPage : page,
					searchCondition : condition
				}),
				
				success : function(JSONData, status){
						
								var booking = JSONData.list;
								
								for(i in JSONData.list){
	
									all = '<div class="col-xs-6 col-sm-4 col-md-3">'
									all += 	'<div class="gallery-item">'
									all += 	  '<a href="/movie/getMovie?movieNo='+booking[i].movie.movieNo+'&menu='
											   if(booking[i].screenContent.previewFlag == 'Y'){
												    all += 'preview'
											   }else{
													all += 'movie'												   
											   }
									all +=	   '">'
									all += 	  '<img src="' +booking[i].movie.postUrl+ '" style="width:100%; height:365px;"></a>'
									all += 		'<div class="alert alert-success jeju" role="alert">'
									all +=			'<strong><td align="left">'
											   if(booking[i].screenContent.previewFlag == 'Y'){
												    all += booking[i].screenContent.previewTitle
											   }else{
													all += booking[i].movie.movieNm												   
											   }
									all +=	 		'</td></strong>'
									all +=			'<br/>'+booking[i].screenContent.screenOpenTime 
									all +=          '<br/>상영관 : '+booking[i].screenContent.screenTheater+' 관'
									all +=          '<br/>티켓수 : '+booking[i].headCount+' ( '+booking[i].bookingSeatNo+')'
									all += 			'<span class="label label-success jeju">'
									all +=          '<input type="hidden" value="'+booking[i].bookingNo+'">'
									all += 			'예매내역</span>'
									all +=		'</div>'
									all += 	   '<a href="/booking/getBooking?bookingNo='+booking[i].bookingNo+'" class="gallery-item__descript gallery-item--success-link">'
									all +=     '<span class="gallery-item__icon"><i class="fa fa-tag"></i></span>'
									all += 	   '<p class="gallery-item__name jeju">예매 상세 조회'
									all += 	   '</p></a>'
									all +=	'</div>'
									all +='</div>'
										
									console.log($(".gallery-wrapper").html());
									$(".gallery-wrapper").html($(".gallery-wrapper").html()+all);
							}
					//ajax 목록 링크 및 색 추가 끝
				}
		})//end ajax  
	}
 
   </script> 
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
        
        
        <!-- Main content -->
        <section class="container" style="margin-top:8%">
            <div class="col-sm-12">
            	<p/>
                <h2 class="page-heading jeju">나의 예매 리스트</h2>
                <p class="btn btn-md btn--danger jeju" id="now">현재 예매 내역</p>
                <p class="btn btn-md btn--danger jeju" id="past">지난 예매 내역</p>
                <div class="row">
	                <div class="gallery-wrapper">
	                 <c:set var="i" value="0" />
					  <c:forEach var="booking" items="${list}">
						<c:set var="i" value="${ i+1 }" />
        				<div class="col-xs-6 col-sm-4 col-md-3">
						     <div class="gallery-item">
						     	<c:set var="what" value=""/>
						     	<c:if test="${booking.screenContent.previewFlag eq 'Y'}">
						     		<c:set var="what" value="preivew"/>
						     	</c:if>
						     	<c:if test="${booking.screenContent.previewFlag eq 'N'}">
						     		<c:set var="what" value="movie"/>
						     	</c:if>
	                            <a href="/movie/getMovie?movieNo=${booking.movie.movieNo}&menu=${what}">
	                                <img alt='' src="${booking.movie.postUrl}" style="width: 100%; height: 365px;">
	                            </a>
	                            <div class="alert alert-success jeju" role="alert">
  									<strong>
  										<td align="left">
  										<c:if test="${booking.screenContent.previewFlag eq 'Y'}">
								     		${booking.screenContent.previewTitle}
								     	</c:if>
								     	<c:if test="${booking.screenContent.previewFlag eq 'N'}">
								     		${booking.movie.movieNm}
								     	</c:if>
								     	</td>
  									</strong>
  									<br/>${booking.screenContent.screenOpenTime}
  									<br/>상영관 : ${booking.screenContent.screenTheater} 관
  									<br/>티켓수 : ${booking.headCount} ( ${booking.bookingSeatNo})
  									<span class="label label-success jeju"><input type="hidden" value="${booking.bookingNo}">예매내역</span>
								</div>
	                            <a href="/booking/getBooking?bookingNo=${booking.bookingNo}" class="gallery-item__descript gallery-item--success-link">
	                                <span class="gallery-item__icon"><i class="fa fa-tag"></i></span>
	                                <p class="gallery-item__name jeju">예매 상세 조회</p>
	                            </a>
 	                         </div>       
	                    </div>
	             		</c:forEach>	
	                </div>
                </div>
            </div>
        </section>
       
       
       	
		<jsp:include page="/layout/loginModal.jsp" />
     </div>
     <div class="here">
     	<c:if test="${list.size() < 1}">
        <br/><br/>
     	<br/><br/>
     	<br/><br/>
     	<br/><br/>
     	<br/><br/>
     	<br/><br/>
     	<br/><br/>
     	</c:if>
     </div>
  	 <jsp:include page="/layout/bottomToolbar.jsp" />


   <!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
        <script>window.jQuery || document.write('<script src="/js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate --> 
        <script src="/js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- jQuery UI -->
        <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <!-- Bootstrap 3--> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

        <!-- Mobile menu -->
        <script src="/js/jquery.mobile.menu.js"></script>
         <!-- Select -->
        <script src="/js/external/jquery.selectbox-0.2.min.js"></script>
        <!-- Swiper slider -->
        <script src="/js/external/idangerous.swiper.min.js"></script>

        <!-- Form element -->
        <script src="/js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="/js/form.js"></script>

        <!-- Custom -->
        <script src="/js/custom.js"></script>
      
      <script type="text/javascript">
            $(document).ready(function() {
                init_BookingOne();
            });
      </script>
</body>
 <style>
	 @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	  .jeju{
		font-family: 'Jeju Gothic', sans-serif;
	  }
      html{
 	     height: auto;
      }
      .col-sm-4{
      	/* background-color: #c1ffbc; */
      	margin-top:5px;
      	margin-bottom:5px;
 	    /* padding-top: 10px;
	    padding-bottom: 10px; */
	    /*padding-left: 20px;
	    padding-right: 20px; */
	    /* margin-left: 1px;
	    margin-right: 1px; */
	    border-radius: 15px;
	    border-color:#000000;
	    border-width: 30px;
 	    box-shadow:inset 0 0 10px #a5ff9e; 
      }
 </style>
</html>