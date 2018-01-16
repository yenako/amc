<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.springframework.util.StringUtils" %>
<!doctype html>
<html>
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>Americode Cinema-unifiedSearch</title>
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
   
  
  <script type="text/javascript">
   </script> 
</head>


<body>
    <div class="wrapper place-wrapper">
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
        
        <div class="place-form-area">
        <section class="container">
            
            <!-- 영화 통합검색  시작-->
            <div class="order-step-area">
                <div class="order-step second--step">영화</div>
                <div class="row">
                	<p/>
                	<p/>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="row">
	                <div class="gallery-wrapper">
	                <c:set var="i" value="0" />
					  <c:forEach var="movie" items="${unifiedSearch.uniMovieList}">
						<c:set var="i" value="${ i+1 }" />
						<div class="col-xs-6 col-sm-4 col-md-3 mm">
	                        <div class="gallery-item">
	                            <a href="/movie/getMovie?movieNo=${movie.movieNo}&menu=search">
	                                <img alt='' src="${movie.postUrl}" align="middle" width="100%" height="290px">
	                            </a>
	                            <a href="/movie/getMovie?movieNo=${movie.movieNo}&menu=search" class="gallery-item__descript gallery-item--video-link">
	                                <span class="gallery-item__icon"><i class="fa fa-video-camera"></i></span>
	                                <p class="gallery-item__name jeju">${movie.movieNm }</p>
	                            </a>
	                        </div>
	                    </div>	
			        </c:forEach>
	                </div>
                </div>
            </div>
          	<hr/>
          	<!-- 영화 통합검색 끝 -->
          	
          	<!-- 시사회 통합검색  시작-->
            <div class="order-step-area">
                <div class="order-step second--step">시사회</div>
            </div>
                <div class="row">
                	<p/>
                	<p/>
                </div>
            <div class="col-sm-12">
                <div class="row">
	                <div class="gallery-wrapper">
	                <c:set var="i" value="0" />
					  <c:forEach var="screenContent" items="${unifiedSearch.uniPreviewList}">
						<c:set var="i" value="${ i+1 }" />
						<div class="col-xs-6 col-sm-4 col-md-3 pp">
	                        <div class="gallery-item">
	                            <a href="/movie/getMovie?movieNo=${screenContent.movie.movieNo}&menu=preview">
	                                <img alt='' src="${screenContent.movie.postUrl }" align="middle" width="100%"  height="290px">
	                            </a>
	                            <div class="alert alert-danger"><strong>티켓 오픈 일자</strong><br/> ${screenContent.ticketOpenDate }
	                            	<span class="label label-danger"></span>
	                            </div>
	                            <a href="/movie/getMovie?movieNo=${screenContent.movie.movieNo}&menu=preview" class="gallery-item__descript gallery-item--video-link">
	                                <span class="gallery-item__icon"><i class="fa fa-video-camera"></i></span>
	                                <p class="gallery-item__name jeju">${screenContent.previewTitle }</p>
	                            </a>
	                        </div>
	                    </div>	
			        </c:forEach>
	                </div>
                </div>
            </div>
          	<hr/>
          	<!-- 시사회 통합검색 끝 -->
          	
          	<!-- 굿즈 통합검색  시작-->
            <div class="order-step-area">
                <div class="order-step third--step">굿즈</div>
            </div>
	            <div class="row">
	              	<p/>
	              	<p/>
	            </div>
            <div class="col-sm-12">
                <div class="row">
	                <div class="gallery-wrapper">
	                <c:set var="i" value="0" />
					  <c:forEach var="goods" items="${unifiedSearch.uniGoodsList}">
						<c:set var="i" value="${ i+1 }" />
						<div class="col-xs-6 col-sm-4 col-md-3 gg">
	                        <div class="gallery-item">
	                            <a href="/product/getGoodsProduct?prodNo=${goods.prodNo}">
	                                <img alt='' src="/images/uploadFiles/${goods.prodImage}" align="middle" width="100%"  height="290px">
	                            </a>
	                            <a href="/product/getGoodsProduct?prodNo=${goods.prodNo}" class="gallery-item__descript gallery-item--goods-link">
	                                <span class="gallery-item__icon"><i class="fa fa-shopping-cart"></i></span>
	                                <p class="gallery-item__name jeju">${goods.prodName}</p>
	                            </a>
	                        </div>
	                    </div>	
			        </c:forEach>
	                </div>
                </div>
            </div>
          	<hr/>
          	<!-- 굿즈 통합검색 끝 -->
          	
        	<!-- 스낵바 통합검색  시작-->
            <div class="order-step-area">
                <div class="order-step first--step">스낵바</div>
            </div>
           		<div class="row">
	              	<p/>
	              	<p/>
	            </div>
            <div class="col-sm-12">
                <div class="row">
	                <div class="gallery-wrapper">
	                <c:set var="i" value="0" />
					  <c:forEach var="snack" items="${unifiedSearch.uniSnackList}">
						<c:set var="i" value="${ i+1 }" />
						<div class="col-xs-6 col-sm-4 col-md-3 ss">
	                        <div class="gallery-item">
	                            <a href="/product/getSnackProduct?prodNo=${snack.prodNo}">
	                                <img alt='' src="/images/uploadFiles/${snack.prodImage}" align="middle" width="100%"  height="290px">
	                            </a>
	                            <a href="/product/getSnackProduct?prodNo=${snack.prodNo}" class="gallery-item__descript gallery-item--photo-link">
	                                <span class="gallery-item__icon"><i class="fa fa-glass"></i></span>
	                                <p class="gallery-item__name jeju">${snack.prodName }</p>
	                            </a>
	                        </div>
	                    </div>	
			        </c:forEach>
	                </div>
                </div>
            </div>
          	<hr/>
          	<!-- 스낵바 통합검색 끝 -->
   
        </section>  
       
         <input type="hidden" name="clientId" value=""/>
         <form id="addBooking">
         <input type="hidden" name="userId" value="${sessionScope.user.userId}"/>
         <input type="hidden" name="screenContentNo" value="${screenContent.screenContentNo}"/>
         <input type="hidden" name="bookingSeatNo" value=""/>         
         <input type="hidden" name="headCount" value=""/>
         <input type="hidden" name="totalTicketPrice" value=""/>
         <!-- <input type="hidden" name="impId" value=""/> -->
         <!-- <input type="hidden" name="qrUrl" value=""/> -->   
         <input type="hidden" name="impId" value="temp_imp_uid"/>
         <input type="hidden" name="qrUrl" value="temp_qrUrl"/>
         <input type="hidden" name="displaySeat" value="temp_displaySeat"/>
      </form>
                
       </div>
        
        <jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />        
     </div>
  


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
            
            function unifiedSearch(){
    	   		$("form").attr("method" , "POST").attr("action" , "/cinema/unifiedSearch").attr("accept-charset","EUC-KR").submit();
    	   	}
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
      .gallery-item .gallery-item--goods-link:before {
		  background-color: #4c4145;
	  }
	  .mm{
      	/* background-color: #ffbfbf; */
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
 	    box-shadow:inset 0 0 10px #ff9696; 
      }
      .pp {
      	/* background-color: #ffbfbf; */
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
 	    box-shadow:inset 0 0 10px #ff9696; 
      }
      .gg{
      	/* background-color: #b7b7b7; */
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
 	    box-shadow:inset 0 0 10px #606060; 
      }
      .ss{
      	/* background-color: #f9ed98; */
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
 	    box-shadow:inset 0 0 10px #fce86a; 
      }
      
	 .contact-form-wrapper-search{
	  background-color: #dbdee1;
	  overflow: hidden;
	  margin: -30px 0 80px;
	  padding: 56px 0 60px;
	}
	
	.order-step-area .order-step {
    font: 16px 'Jeju Gothic', sans-serif;
    padding-left: 55px;
    position: relative;
    width: 33.2%;
    display: inline-block;
	}
	
	 
 </style>
</html>