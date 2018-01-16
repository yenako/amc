<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
  <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>Americode Cinema addProduct</title>
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
</head>

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
			<div class="page-header text-center">
				<h3 class="text-info">상 품 등 록</h3>
			</div>					
			<form class="form row add-product" id="formData"> 
					<div class="row">
			  			<label for="prodType" class="col-sm-offset-1 col-sm-3 control-label"><strong>상품 구분</strong></label>
			 	 			<div class="col-sm-4" style="display: inline">			  		
			  	  				<select class="search-sort" name="prodType" id="prodType">
									<option value="G">굿즈</option>
									<option value="S">스낵바</option>
								</select>	
			  				</div>
		  			</div>
		  			
					<div class="row">
						<label for="inputProdName" class="col-sm-offset-1 col-sm-3 control-label"><strong>상품명</strong></label>
							<div class="col-sm-4">
								<input type="text" class="inputtype" id="inputProdName" name="prodName" placeholder="상품명">
							</div>
					</div>
					
				
					<div class="row">
						<label for="inputProdDetail" class="col-sm-offset-1 col-sm-3 control-label"><strong>상품상세정보</strong></label>
						<div class="col-sm-4">
							<input type="text" class="inputtype" id="inputProdDetail" name="prodDetail" placeholder="상세정보">
						</div>
					</div>
					
					<div class="row">
						<label for="inputProdSetInfo" class="col-sm-offset-1 col-sm-3 control-label"><strong>상품구성정보</strong></label>
						<div class="col-sm-4">
							<input type="text" class="inputtype" id="inputProdDetail" name="prodSetInfo" placeholder="상세정보">
						</div>
					</div>
					
					
					<div class="row">
						<label for="inputStock" class="col-sm-offset-1 col-sm-3 control-label"><strong>상품수량</strong></label>
						<div class="col-sm-4">
							<input type="text" class="inputtype" id="inputStock" name="totalStock" placeholder="최소 수량은 1개 입니다.">
	<!-- 					<input type="hidden"  class="form-control" id="inputStock" name="stock"> -->
						</div>
					</div>
					
				
					<div class="row">
						<label for="salesOpenDate" class="col-sm-offset-1 col-sm-3 control-label"><strong>판매시작일</strong></label>
						<div class="col-sm-2">
							<input type="date" class="inputtype" id="salesOpenDate" name="salesOpenDate" readonly>
						</div>
						<label for="salesEndDate" class="col-sm-3 control-label"><strong>판매종료일</strong></label>
						<div class="col-sm-2">
							<input type="date" class="inputtype" id="salesEndDate" name="salesEndDate" readonly>
						</div>
					</div>
					
			
					<div class="row">
						<label for="inputPrice" class="col-sm-offset-1 col-sm-3 control-label"><strong>가격</strong></label>
						<div class="col-sm-4">
							<input type="text" class="inputtype" id="prodPrice" name="prodPrice" >
						</div>
					</div>
					
					
<!-- 					<div class="row">
						<label for="inputPrice" class="col-sm-offset-1 col-sm-3 control-label"><strong>유효 기간</strong></label>
						<div class="col-sm-4">
							<input type="text" class="inputtype" id="expiryDate" name="expiryDate" >
						</div>
					</div>
 -->					
					
					<div class="row">
						<label for="inputFile" class="col-sm-offset-1 col-sm-3 control-label"><strong>상품이미지</strong></label>
						<div class="col-sm-4">
							<input type="file" class="inputtype" id="inputFile" name="file" >
						</div>
					</div>
					
					
					<div class="row">
						<div class="col-sm-offset-3 col-sm-9">
							<button type="button" class="btn btn-success">
								등록하기
							</button>
							
							<!-- Modal -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-body">
											<!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
											<h4 class="modal-title" id="myModalLabel">상품 등록 중입니다..</h4>
										</div>
									</div>
								</div>
							</div>
		
						</div>
					</div>
			</form>
		</div>
	</div>
		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />

   <!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
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
	
		function fncAddProduct(){
			//Form 유효성 검증
			var type = $('input[name="prodType"]').val();
			var name = $('input[name="prodName"]').val();
			var openDate = $('input[name="salesOpenDate"]').val();
			var endDate = $('input[name="salesEndDate"]').val();
			var totalStock = $('input[name="totalStock"]').val();
			var stock = $('input[name="totalStock"]').val();
			var price = $('input[name="prodPrice"]').val();
			var expiryDate = $('input[name="expiryDate"]').val();
			var detail = $('input[name="prodDetail"]').val();
			var setInfo = $('input[name="prodSetInfo"]').val();
			var file = $('input[name="file"]').val();
			
			var formData = new FormData();
			formData.append('file',$('input[name="file"]')[0].files[0]);
			
			if(name == null || name.length<1){
				alert("상품명은 반드시 입력하여야 합니다.");
				return;
			}
			if(openDate == null || openDate.length<1){
				alert("판매시작일은 반드시 입력하셔야 합니다.");
				return;
			}
			if(endDate == null || endDate.length<1){
				alert("판매종료일은 반드시 입력하셔야 합니다.");
				return;
			}
			if(totalStock == null || totalStock.length<1){
				alert("최소 수량은 1개 입니다.")
				return;
			}
			if(price == null || price.length<1){
				alert("가격은 반드시 입력하셔야 합니다.");
				return;
			}
			if(detail == null || detail.length<1){
				alert("상품상세정보는 반드시 입력하여야 합니다.");
				return;
			}
			if(!$.isNumeric(totalStock)){
				alert('수량은 숫자로 적어주세요.');
				return;
			}
			if(!$.isNumeric(price)){
				alert('가격은 숫자로 적어주세요.');
				return;
			}
			
			$('#myModal').modal('show');
			if($('input[name="file"]')[0].files[0] != null){
				$.ajax({
					url : '/product/json/uploadFile',
					method : 'post',
					data : formData,
					contentType:false,
					processData:false,
					success : function(){
						window.setTimeout(modalOut,5000);
						window.setTimeout(sendForm,5000);						
					},
					error : function(jqXHR, status, error){
						modalOut();
						alert('등록에 실패했습니다. 잠시 후 다시 시도해 주세요..');
					},
					statusCode : {
						404 : function(){
							alert('404맨');
						},
						405 : function(){
							alert('405맨');
						},
						400 : function(){
							alert('400맨');
						},
						415 : function(){
							alert('415맨');
						}
					}
	
				});
			}else{
				modalOut();
				sendForm();
			}
			
		}
	
	
		$(function(){
			$('button:contains("등록하기")').bind('click',function(){
				fncAddProduct();
			});
			
			$('#salesOpenDate').datepicker({
				dateFormat : 'yy-mm-dd',
				defaultDate: "+1w",
				changeMonth: true,
					 onClose: function( selectedDate ) {
					  $("#salesEndDate").datepicker( "option", "minDate", selectedDate );
				 }

			})//datepicker cdn
			
			//끝일. 시작일보다는 길어야 되게끔
			$( "#salesEndDate" ).datepicker({
			 dateFormat: "yy-mm-dd",
			 defaultDate: "+1w",
			 changeMonth: true,
			 	onClose: function( selectedDate ) {
			 	 $("#salesOpenDate").datepicker( "option", "maxDate", selectedDate );
			 }
			});

			
		})//fncAddProduct cdn 포함
		
		function modalOut(){
			$('#myModal').modal('hide');
		}
		
		function sendForm(){
			$("#formData").attr('method','post').attr('action','addProduct').attr('enctype','multipart/form-data').submit();
		}
		
	</script>
	<style type="text/css">
	 	#body{ padding-top: 100px; }
	 	html{
        	height: auto;
  		}
	 #body {
	/* background-color: #EDEDED; */
	background-color: #ffffff;
	margin-top: 100px;
	margin-bottom: 5px;
	padding-top: -50px;
	/* padding-top: 10px;
	    padding-bottom: 10px; */
	/*padding-left: 20px;
	    padding-right: 20px; */
	/* margin-left: 1px;
	    margin-right: 1px; */
	padding-bottom: 10px;
	border-radius: 15px;
	border-color: #000000;
	border-width: 30px;
	box-shadow: inset 0 0 10px #a0a0a0;
}

html {
	height: auto;
}

.inputtype {
	margin-bottom: 10px;
	width: 100%;
	border: none;
	box-shadow: none;
	border: 1px solid #dbdee1;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	font-size: 13px;
	color: #000000;
	padding: 9px 18px 10px !important;
	position: relative;
}

input, #prodType {
	margin-bottom: 10px;
	height: 100%;
	width: 100%;
	border: none;
	box-shadow: none;
	border: 1px solid #dbdee1;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	font-size: 13px;
	color: #000000;
	padding: 9px 18px 10px !important;
}

.ui-datepicker {
	border: none;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
	padding: 0;
	margin-left: auto;
	margin-top: 15px;
	background-color: #4c4145;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.17);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.17);
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.17);
	position: relative;
}
	</style>
</html>