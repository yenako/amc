<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.springframework.util.StringUtils" %>
<!doctype html>
<html>
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>Americode Cinema-listCancelAlarm</title>
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
	
	$( window ).scroll(function(){
		 if ($(window).scrollTop() == $(document).height() - $(window).height()){
			 loadList(count);
			 console.log(count++);
		 }//end if문
	 });
	
	 $(function() {
		 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 $( ".label-success" ).on("click" , function() {
			 if(confirm("삭제하시겠습니까?")!=0){
				 $.ajax({
		               url : "/alarm/json/deleteAlarm/"+$(this).find('input').val(),                  
		               method : "GET" ,
		               async : false,
		               success : function(data, status) {
		                  if(data == 1){
		                	 $(".gallery-wrapper").empty();
	 						for(var i = 1; i < count+1; i++ ){
								loadList(i);
							} 
		                  }
		               }
		      	});//end of ajax
			 }
		});
	 })

	function loadList(page){
		 var C = 'C';
		 $.ajax({
				url:"/alarm/json/getInfiCancelAlarmList/"+'${sessionScope.user.userId}',
				method:"POST",
				async : false,
				headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
				},
				data:JSON.stringify({
					currentPage : page,
					alarmFlag : C
				}),
				
				success : function(JSONData, status){
							
							
							
							var alarm = JSONData.list;
							
							for(i in JSONData.list){

								all = '<div class="col-xs-6 col-sm-4 col-md-3">'
								all += 	'<div class="gallery-item">'
								all += 	  '<a href="/movie/getMovie?movieNo='+alarm[i].screenContent.movie.movieNo+'&menu='
											if(alarm[i].screenContent.previewFlag == 'Y'){
												all += "preview"
											}else{
												all += "movie"
											}
								all +=    '">'
								all += 	  '<img src="' +alarm[i].screenContent.movie.postUrl+ '" style="width:100%; height:365px;"></a>'
								all += 		'<div class="alert alert-success jeju" role="alert">'
								all +=			'<strong>취소표 신청 좌석</strong><br/>['
								all +=           alarm[i].alarmSeatNo
								all += 			' ]<span class="label label-success jeju">'
								all +=          '<input type="hidden" value="'+alarm[i].alarmNo+'">'
								all +=			'취소</span></a>'
								all +=		'</div>'
								all += 	   '<a href="/movie/getMovie?movieNo='+alarm[i].screenContent.movie.movieNo+'&menu='
											if(alarm[i].screenContent.previewFlag == 'Y'){
												all += "preview"
											}else{
												all += "movie"
											}
								all +=		'" class="gallery-item__descript gallery-item--success-link">'
								all +=     '<span class="gallery-item__icon"><i class="fa fa-shopping-cart"></i></span>'
								all += 	   '<p class="gallery-item__name jeju">'
											if(alarm[i].screenContent.previewFlag == 'Y'){
												all += alarm[i].screenContent.previewTitle
											}else{
												all += alarm[i].screenContent.movie.movieNm
											}
								all += 	   '</p></a>'
								all +=	'</div>'
								all +='</div>'
									
								console.log($(".gallery-wrapper").html());
								$(".gallery-wrapper").html($(".gallery-wrapper").html()+all);
								
								$( ".label-success" ).on("click" , function() {
									if(confirm("삭제하시겠습니까?")!=0){
									 $.ajax({
							               url : "/alarm/json/deleteAlarm/"+$(this).find('input').val(),                  
							               method : "GET" ,
							               async : false,
							               success : function(data, status) {
							                  if(data == 1){
							                	  $(".gallery-wrapper").empty();
												for(var i = 1; i < count+1; i++ ){
													loadList(i);
												}
							                  }
							               }
							     	  });//end of ajax
									}
							});
						}
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
                <h2 class="page-heading jeju">취소표 알림 리스트</h2>
                <div class="row">
	                <div class="gallery-wrapper">
	                 <c:set var="i" value="0" />
					  <c:forEach var="alarm" items="${list}">
						<c:set var="i" value="${ i+1 }" />
        				<div class="col-xs-6 col-sm-4 col-md-3">
						     <div class="gallery-item">
						     	<c:if test="${alarm.screenContent.previewFlag eq 'Y'}">
	                            	<a href="/movie/getMovie?movieNo=${alarm.screenContent.movie.movieNo}&menu=preview">
	                            </c:if>
	                            <c:if test="${alarm.screenContent.previewFlag eq 'N'}">
	                            	<a href="/movie/getMovie?movieNo=${alarm.screenContent.movie.movieNo}&menu=movie">
	                            </c:if>
	                                <img alt='' src="${alarm.screenContent.movie.postUrl}" style="width: 100%; height: 365px;">
	                            </a>
	                            <div class="alert alert-success jeju" role="alert">
  									<strong>취소표 신청 좌석</strong><br/>[ ${alarm.alarmSeatNo}]
  									<span class="label label-success jeju"><input type="hidden" value="${alarm.alarmNo}">취소</span>
								</div>
								<c:if test="${alarm.screenContent.previewFlag eq 'Y'}">
	                            	<a href="/movie/getMovie?movieNo=${alarm.screenContent.movie.movieNo}&menu=preview" class="gallery-item__descript gallery-item--success-link">
	                            </c:if>
	                            <c:if test="${alarm.screenContent.previewFlag eq 'N'}">
	                            	<a href="/movie/getMovie?movieNo=${alarm.screenContent.movie.movieNo}&menu=movie" class="gallery-item__descript gallery-item--success-link">
	                            </c:if>
	                                <span class="gallery-item__icon"><i class="fa fa-bell-o"></i></span>
                        	        <c:if test="${alarm.screenContent.previewFlag eq 'Y'}">
	                                	<p class="gallery-item__name jeju">${alarm.screenContent.previewTitle}</p>
	                                </c:if>
	                                <c:if test="${alarm.screenContent.previewFlag eq 'N'}">
	                                	<p class="gallery-item__name jeju">${alarm.screenContent.movie.movieNm}</p>
	                                </c:if>
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
            
/*            $(function(){
        		if($(window).height() == $(document).height()){
        			fncFooterPositioning();
        		}
        	});
            
         	function fncFooterPositioning(){
        		$('footer').css('position', 'absolute')
        		.css('top', document.body.scrollHeight-300);
         	}
         	
         	$(window).resize(function(){
        		fncFooterPositioning();
         	});
 */
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