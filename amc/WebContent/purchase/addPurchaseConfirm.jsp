<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>Americode Cinema-ProductConfirm</title>
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
    
    <!--  기존 src -->
    	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  		<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
		<!--  ///////////////////////// Sweetalert CDN ////////////////////////// -->
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		
		<!--  font from googleApi -->
		<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">

<style>
	.promo--short .promo__head {
	  color: #4c4145;
	  position: relative;
	  display: inline-block;
	  margin-bottom: 6px;
	  margin-top: 8px;
	}
	.promo--short .promo__head:before {
	  content: '';
	  background-image: url(../images/components/wave-dark.svg);
	  background-repeat: no-repeat;
	  background-size: 84px 8px;
	  width: 84px;
	  height: 8px;
	  position: absolute;
	  top: 8px;
	  left: -116px;
	}
	.promo--short .promo__head:after {
	  content: '';
	  background-image: url(../images/components/wave-dark.svg);
	  background-repeat: no-repeat;
	  background-size: 84px 8px;
	  width: 84px;
	  height: 8px;
	  position: absolute;
	  top: 8px;
	  right: -116px;
	}
	.content__text{
	 /*font-family: 'Jeju Gothic', sans-serif;*/
	  font-family: 'Jeju Gothic', sans-serif; 
	 
	}
	
	 
	 .contact-info {
	  text-align: left;
	}
	.contact-info .contact-info__field {
	  position: relative;
	  width: 100%;
	  display: inline-block;
	  margin-right: 3px;
	}
	.contact-info .contact-info__field .form__mail {
	  padding-left: 60px;
	}
	.contact-info .contact-info__field:before {
	  content: '';
	  width:70px; /* 39px; */ 
	  height: 39px;
	  -webkit-border-radius: 3px 0 0 3px;
	  -moz-border-radius: 3px 0 0 3px;
	  border-radius: 3px 0 0 3px;
	  background-color: #4c4145;
	  position: absolute;
	  top: 0px;
	  left: 0;
	}
	.contact-info .contact-info__field:after {
	  content: '';
	  color: #b4b1b2;
	  font: 13px;
	  position: absolute;
	  top: 10px;
	  left: 15px;
	}
	.contact-info .contact-info__field-mail:after {
	  content: "\f0e0";
	  left: 13px;
	}
	.contact-info .contact-info__field-tel:after {
	  content: "\f095";
	}
	.ticket-control .list--download {
	  border-radius: 3px 0 0 3px;
	  margin-right: -5px;
	}
	.watchlist list--download {
		margin-left : -10px;
		color:white;
	}
	dl {
	  margin-top: 0;
	  margin-bottom: 20px;
	}
	dt,
	dd {
	  line-height: 1.42857143;
	  
	}
	dt {
	  font-weight: bold;
	}
	dd {
	  margin-left: 0;
	}
	@media (min-width: 768px) {
	  .dl-horizontal dt {
	    float: left;
	    width: 160px;
	    clear: left;
	    text-align: right;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    color: #ffffff;
	  }
	  .dl-horizontal dd {
	    margin-left: 180px;
	    color: #ffffff;
	  }
	}
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.page-heading {
	font-family: 'Jeju Gothic', sans-serif;
	font-size: 25px;
	padding-left: 30px;
	margin-top: 10px;
	margin-bottom: 10px;
	color: #4c4145;
	text-transform: uppercase;
	background-image: url(../images/components/scarf.png);
	-webkit-background-size: 21px 6px;
	background-size: 21px 6px;
	background-position: left center;
	background-repeat: no-repeat;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}

html {
	height: auto;
}

.movie__images {
	width: 5px;
}

.slick-prev:before, .slick-next:before {
	color: #ffd564;
}

.comment-form {
	margin-bottom: 60px;
}

.comment-form .movieComment__text {
	width: 100%;
	min-height: 78px;
	padding: 8px 19px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	background-color: #ffffff;
	border: solid 1px #dbdee1;
	font-size: 13px;
	color: #b4b1b2;
}

.comment-form .movieComment__info {
	margin-top: 19px;
	font: 13px 'Roboto', sans-serif;
	color: #969b9f;
	display: inline-block;
}

.comment-form .movieComment__btn {
	float: right;
	margin-top: 9px;
}

.comment {
	margin-bottom: 40px;
}

.comment .movieComment__text {
	width: 100%;
	min-height: 78px;
	padding: 8px 19px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	background-color: #ffffff;
	border: solid 1px #dbdee1;
	font-size: 13px;
	color: #b4b1b2;
}

.comment .movieComment__info {
	margin-top: 19px;
	font: 13px 'Roboto', sans-serif;
	color: #969b9f;
	display: inline-block;
}

.comment .movieComment__btn {
	float: right;
	margin-top: 9px;
}

.comment .comment__user {
	font-size: 18px;
	margin-bottom: 20px;
	font-weight: bold;
	position: relative;
	overflow: hidden;
}

.comment .comment__movieComment {
	font-size: 14px;
	line-height: 14px;
}

.comment .comment__regDate {
	font-size: 12px;
	color: #969b9f;
	line-height: 14px;
}

.trailer {
	position: relative;
	width: 100%;
	height: 0;
	padding-bottom: 56.25%;
}

#realTimeSearch {
	width: 100%;
	height: 250px;
}

section {
	padding-top: 30px
}

#heartempty {
	padding: 5px, 5px, 5px, 5px;
	color: #fe505a;
}

#wish {
	margin-top: 50px;
}

.movie .movie__title {
	position: relative;
	font-size: 20px;
	font-family: 'Jeju Gothic', sans-serif;
	color: #ffffff;
	margin-bottom: 0px;
}

.movie .movie__time {
	position: relative;
	font-size: 13px;
	color: #ffffff;
	margin-bottom: 0px;
	padding-left: 20px;
}

.getMovie {
	margin-top: 50px;
	/* width: 100%;
	height: 100%;
	padding: 15px 15px 15px 15px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	background-color: #ffffff;
	border: solid 1px #ffd564;
	font-size: 13px;
	color: #b4b1b2;
	padding: 8px 19px;
	-webkit-border-radius: 3px; */
}
.devider-huge {
	width: 100%;
	height: 3px;
	background-color: #ffffff;
	margin-bottom: 30px;
	margin-top: 30px;
}

img.movie__images {
    vertical-align: middle;
    width: 20px;
    float-left:0px;
    padding-left:0px;
    position:relative;
    left:1000px
}

#prodImage {
    vertical-align: middle;
    height:auto;
    width: 40px;
    position:relative;
    right:130px
}

p {
    font-size: 15px;
    line-height: 28px;
    color: #ffffff;
    margin-bottom: 28px;
}

p.movie__time {
    font-size: 15px;
    line-height: 28px;
    color: #ffffff;
    margin-bottom: 28px;
}

b, strong {
    font-weight: bolder;
    color: #ffffff;
}
p.movie__option {
    font-size: 13px;
    line-height: 28px;
    color: #ffffff;
    margin-bottom: 28px;
    text-align:left;
    word-break:break-all;
}



</style>
</head>
		
<body>
 <!-- Banner -->
         	<!-- Banner -->
		<div class="banner-top">
			<img alt='top banner' src="../images/banners/space.jpg">
		</div>
		<header class="header-wrapper header-wrapper--home">
			<!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="/layout/topToolbar.jsp" />
			<!-- ToolBar End /////////////////////////////////////-->
		</header>
   		<br><br><br>
	<div class="container">
	    <!-- Promo boxes -->
    	<div class="content-wrapper">
                  
                
                <div class="col-sm-3">
                  <div class="promo promo-field">
                      <div class="promo__head">A.Movie app</div>
                      <div class="promo__describe">for all smartphones<br> and tablets</div>
                      <div class="promo__content">
                          <ul>
                              <li class="store-variant"><a href="#"><img alt='' src="/images/apple-store.svg"></a></li>
                              <li class="store-variant"><a href="#"><img alt='' src="/images/google-play.svg"></a></li>
                              <li class="store-variant"><a href="#"><img alt='' src="/images/windows-store.svg"></a></li>
                          </ul>
                      </div>
                  </div>
                </div>
                <div class="col-sm-9">
                  <div class="promo promo--short">
                      <img class="promo__images" alt='' src="/images/uploadFiles/images.jpg">
                      <div class="promo__head">My Product</div>
                      <div class="promo__describe"><span class="abc">주문이 완료되었습니다!</span></div>
                      <div class="promo__content"></div>
                  </div>
                  <div class="promo promo--info">
                      <div class="promo__content" align="right">
                          <p class="content__text" >
							<div class="movie__info ">
								<div class="col-sm-4 col-md-3 movie-mobile">
									<div class="movie__images" id="prodImage">
										<img alt='' src="/images/uploadFiles/${purchase.purchaseProd.prodImage}" width=350px/>
									</div>
		
								</div>
		
								<div class="col-sm-9 col-md-9" id="purchasetext">
									<p class="movie__option">
										<strong>상품명 : </strong>${purchase.purchaseProd.prodName}</p>
									<p class="movie__option">
										<strong>구매수량 : </strong>${purchase.orderStock} 개</p>
									<p class="movie__option">
										<strong>가격 : </strong>${purchase.totalProdPrice} 원</p>
									<p class="movie__option">
										<strong>결제방법 : </strong>${purchase.paymentOption=='1'? '현금구매':'신용구매'}</p>
									<p class="movie__option">
										<strong>받으실 분: </strong>${purchase.receiverName}</p>
									<p class="movie__option">
										<strong>연락처: </strong>${purchase.receiverPhone1}&emsp;${purchase.receiverPhone2}&emsp;${purchase.receiverPhone3}</p>
									<p class="movie__option" id="addrtext">
										<strong>배송지: </strong>${purchase.addrDlvy}</p>
									<p class="movie__option">
										<strong>상세주소: </strong>${purchase.addrDlvyDetail}</p>
								</div>
							</div>
						  </p>
                      </div>
   				
		   				<div class="row" style="margin-left:2.3px; margin-top:5px; algin:right;" align="right">
							<a href="#" class="btn btn-md btn--warning btn-wider btn--follow abc" role="button" id="success">확&nbsp;&nbsp;&nbsp;인</a>
						</div>
                  </div>
                </div>
            	</div>
		<!--  end of promo box -->
	</div>

		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />

</body>
<script type="text/javascript">
      $(document).ready(function() {
           if($('html').height() < window.outerHeight){
          	$('html').css('height', '100%');
          } 
      });
</script>
	<script type="text/javascript">
		$(function(){
			$('#success').bind('click',function(){
				self.location.href='getPurchaseList?searchKeyword=purchaseList&searchCondition=${sessionScope.user.userId}';
			});
		});
	</script>


<style type="text/css">
#purchasetext {
	font-size:5px;
	position: relative;
	left: 200px;
    min-height: 1px;
    padding-left: 15px;
    padding-right: 15px;
 }
 html{
  height: auto;
} 
.abc{
	  font-family: 'Jeju Gothic', sans-serif; 
	 }

</style>
</html>

