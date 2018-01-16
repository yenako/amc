<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% int index = (int)(java.lang.Math.random()*3.0); %>

<!DOCTYPE html>

<html>
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>Americode Cinema addProduct Confirm</title>
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
        <!-- <link href="/css/style.css?v=1" rel="stylesheet" /> -->

        <!-- Modernizr --> 
        <!-- <script src="/js/external/modernizr.custom.js"></script> -->
    
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

<body bgcolor="#ffffff" text="#000000">
	<div class="wrapper">
    	<!-- Banner -->
        <div class="banner-top">
            <img alt='top banner' src="../images/banners/space.jpg">
        </div> 
        <header class="header-wrapper header-wrapper--home">
			<jsp:include page="/layout/topToolbar.jsp" />
   		</header>
	
		<div class="container" id="body">
			<div id="tabs">
				<ul>
					<li><a href="#tabs-1">등록상품보기</a></li>
				</ul>
				<input type="hidden" value="${product.prodType}">
				<div class="row" id="tabs-1">
					<div class="col-xs-5">
						<c:if test="${!empty product.prodImage}">
							<img src="../images/uploadFiles/${product.prodImage}" class="img-responsive"/>
						</c:if>
						<c:if test="${empty product.prodImage}">
							<img src="../images/uploadFiles/empty<%=index%>.GIF" class="img-responsive"/>
						</c:if>
					</div>
					<div class="col-xs-7">
						<dl class="dl-horizontal">
							<dt>상품구분</dt>
							<dd>${product.prodType eq 'G'? "굿즈" : "스낵" }</dd>
						</dl>				
						<dl class="dl-horizontal">
							<dt>상품명</dt>
							<dd>${product.prodName}</dd>
						</dl>
						<dl class="dl-horizontal">
							<dt>수량</dt>
							<dd>${product.totalStock} 개</dd>
						</dl>
						<dl class="dl-horizontal">
							<dt>판매시작일</dt>
							<dd>${product.salesOpenDate}</dd>
						</dl>
						<dl class="dl-horizontal">
							<dt>판매종료일</dt>
							<dd>${product.salesEndDate}</dd>
						</dl>
						<dl class="dl-horizontal">
							<dt>가격</dt>
							<dd>${product.prodPrice} 원</dd>
						</dl>
						<dl class="dl-horizontal">
							<dt>상세정보</dt>
							<dd>${product.prodDetail}</dd>
						</dl>
						<dl class="dl-horizontal">
							<dt>구성정보</dt>
							<dd>${product.prodSetInfo}</dd>
						</dl>
						<div class="btn-group" role="group">
							<a href="#" class="add btn btn-success" role="button">확인</a>
							<a href="#" class="add btn btn-primary" role="button">추가등록</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />

   <!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
	
</body>

	<script type="text/javascript">
	
		$(function(){
			
			$('#tabs').tabs();
			
			$('a.add:contains("확인")').bind('click',function(){
				self.location.href = 'getGoodsList?menu=manage&searchProdType='+$('input[type="hidden"]').val();
			});
			
			$('a.add:contains("추가등록")').bind('click',function(){
				self.location.href = 'addProduct';
			});
		});

	</script>
	
	<style type="text/css">
	 	#body{ padding-top: 100px; }
	 	html {
			height: auto;
		}
	</style>
	
</html>
