<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% int index = (int)(java.lang.Math.random()*3.0); %>


<!DOCTYPE html>

<html>
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>AMC 구매목록</title>
        
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.5/sweetalert2.min.css">
</head>

<body bgcolor="#ffffff" text="#000000">
	<div class="wrapper">
		<c:set var="who" value="" />
		<c:if test="${sessionScope.user.role ne 'admin'}">
			<c:set var="who" value="search" />
		</c:if>
		<c:if test="${sessionScope.user eq null || sessionScope.user eq ''}">
			<c:set var="who" value="search" />
		</c:if>
		<c:if test="${sessionScope.user.role eq 'admin'}">
			<c:set var="who" value="admin" />
		</c:if>
		<!-- Banner -->
		<div class="banner-top">
			<img alt='top banner' src="../images/banners/space.jpg">
		</div>
		<header class="header-wrapper header-wrapper--home">
			<jsp:include page="/layout/topToolbar.jsp" />
		</header>
		<div class="container" id="body">
			<div class="clearfix"></div>
			<section class="container">
				<div class="col-md-12">
					<h2 class="page-heading">구매 이력 조회</h2>

					<!-- <div class="tags-area tags-area--thin"> -->
						<div class="container container--add">
							<div class="col-sm-6 text-left">
								<p class="countPage">전체 ${resultPage.totalCount } 건, 현재 ${resultPage.currentPage } 페이지</p>
							</div>
							<div class="col-sm-6 text-right">
						    	<form id="search-form">
						    		<input type="hidden" id="searchCondition" name="searchCondition" value="${sessionScope.user.userId}">
						    		<input type="hidden" id="searchKeyword" name="searchKeyword" value="purchaseList">
						    		<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}">
						    	</form>
							</div>
						</div>
					<!-- </div> -->
			
				    <!--  table Start /////////////////////////////////////-->
					<table class="table table-hover table-striped hidden-xs" id="table" >
						<thead class="purchaseListField">
							<tr class="listTitle">
								<th align="center">No</th>
								<th align="left" >구매물품</th>
								<th align="left">배송지</th>
								<th align="left">전화번호</th>
								<th align="left">배송현황</th>
								<th align="left">비고</th>
							</tr>
						</thead>
			       
						<tbody>
							<c:set var="i" value="${resultPage.totalCount- (resultPage.currentPage-1)*resultPage.pageSize + 1}" />
							<c:forEach var="purchase" items="${list}">
								<c:set var="i" value="${ i-1 }" />
								<tr class="purchaseListRecord">
									<td>${ i }</td>
									<td>
										<input type="hidden" value="${purchase.impId}" id="ImpId">
										<button type="button" class="btn btn-link" name="${purchase.impId}" id="update">${purchase.purchaseProd.prodName}&nbsp;&nbsp;<%-- (수량 : ${purchase.orderStock}) --%></button>
										<div class="modal fade" id="${purchase.impId}" tabindex="-1" role="dialog" aria-labelledby="${purchase.purchaseProd.prodName}" aria-hidden="true"></div>
									</td>
									<td>${purchase.addrDlvy} ${purchase.addrDlvyDetail}</td>
									<td>${purchase.receiverPhone1} ${purchase.receiverPhone2} ${purchase.receiverPhone3}</td>
									<td>
										<c:choose>
											<c:when test="${purchase.tranCode=='1'}">
												구매완료
											</c:when>
											<c:when test="${purchase.tranCode=='2'}">
												배송중
											</c:when>
											<c:when test="${purchase.tranCode=='3'}">
												배송완료
											</c:when>
										</c:choose>
									</td>
									<td>
										<c:if test="${purchase.tranCode=='2'}">
											<input type="hidden" name="impId" value="${purchase.impId}"/> 
											<!-- <a href="#" class="btn btn-link text-success" >물건도착</a> -->
											<a href="#" id="abcd">물건도착</a> 
										</c:if>
									</td>
								</tr>
					        </c:forEach>
				        </tbody>
			      	</table>
	 			</div>
	 		</section>
	 		
			<div class="coloum-wrapper">
				<div class="pagination paginatioon--full">
					<c:if test="${resultPage.currentPage != 1 }">
						<a href='#' class="pagination__prev">prev</a>
					</c:if>
					<c:if test="${resultPage.endUnitPage !=  resultPage.currentPage}">
						<a href='#' class="pagination__next">next</a>
					</c:if>
				</div>
			</div>
	 		
		</div>
	</div>
	
	
	
	
		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />
	
	
	
	
	
<div class="ui tiny modal updateScreenContentModal">
			
			<div class="ui header">구매 정보 확인/수정</div>

			<div class="updateScreenContentWrapper col-md-12 col-sm-12">
				<input type="hidden" name="tranCode" value="${purchase.tranCode}">
				<input type="hidden" name="impId" value="${purchase.impId}" id="updateTranCode">
				<input type="hidden" name="buyer.userId" value="${purchase.buyer.userId}">
				
				<div>
					<div class="col-md-6 col-sm-6 updateScreenContentTitle">물품명</div>
					<div class="col-md-6 col-sm-6">
						<input type="text" name="prodName" readonly="readonly">
						<%-- <p class="form-control-static">${purchase.purchaseProd.prodName}</p> --%>
					</div>
				</div>
			
				<div title="수정하려면 클릭하세요">
					<div class="col-md-6 col-sm-6 updateScreenContentTitle">결제방법</div>
					<div class="col-md-6 col-sm-6">
						<input type="text" name="paymentOption" readonly="readonly"> 
					</div>
				</div>
			
				<div title="수정하려면 클릭하세요">
					<div class="col-md-6 col-sm-6 updateScreenContentTitle">구매수량</div>
					<div class="col-md-6 col-sm-6">
						<input type="text" name="orderStock" readonly="readonly">
					</div>
				</div>
				
				<div title="수정하려면 클릭하세요">
					<div class="col-md-6 col-sm-6 updateScreenContentTitle">받는사람</div>
					<div class="col-md-6 col-sm-6">
						<input type="text" name="receiverName">
					</div>
				</div>
							
				<div title="수정하려면 클릭하세요">
					<div class="col-md-6 col-sm-6 updateScreenContentTitle">연락처</div>
					<div class="col-md-2 col-sm-2">
						<input type="text" name="receiverPhone1">
					</div>
					<div class="col-md-2 col-sm-2">
						<input type="text" name="receiverPhone2">
					</div>
					<div class="col-md-2 col-sm-2">
						<input type="text" name="receiverPhone3">
					</div>
				</div>
				
				<div title="수정하려면 클릭하세요">
					<div class="col-md-6 col-sm-6 updateScreenContentTitle">배송지</div>
					<div class="col-md-6 col-sm-6">
						<input type="text" name="addrDlvy">
					</div>
				</div>
				
				<div title="수정하려면 클릭하세요">
					<div class="col-md-6 col-sm-6 updateScreenContentTitle">상세주소</div>
					<div class="col-md-6 col-sm-6">
						<input type="text" name="addrDlvyDetail" >
					</div>
				</div>
				
				<div>
					<div class="col-md-6 col-sm-6 updateScreenContentTitle">주문일</div>
					<div class="col-md-6 col-sm-6">
						<input type="text" name="orderRegDate" readonly="readonly">
					</div>
				</div>
				
			</div>
				
			<div class="actions">
				<div class="ui positive right labeled icon button actionUpdateButton" id="fix">
					수정 <i class="checkmark icon"></i>
				</div>
				<div class="ui black deny button actionCancleButton">취소</div>
	
			</div>

 </div>
	
	
	
	

   <!-- JavaScript-->
        
        <!-- <script src="/js/external/jquery-migrate-1.2.1.min.js"></script> -->
		<!-- jQuery UI -->
		<!-- <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script> -->
		
		<!-- Custom -->
		<script src="/js/custom.js"></script>
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.5/sweetalert2.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
		        

</body>
	<script type="text/javascript">
		function fncGetPageList(currentPage) {
			$("#currentPage").val(currentPage)
			$("#search-form").attr("method" , "POST").attr("action" , "/purchase/getPurchaseList").submit(); 
		}

		$(function(){
			$('.boxshadow').css("box-shadow", "0 0 0px rgba(0, 0, 0, 0)")
			
				$('#abcd').bind('click',function(){
 				var anchor = $(this);
 				var impId = $('input[name="impId"]').val();
 				if(confirm("정말 도착하였습니까? (수정불가)")){
	 				$.ajax({
	 					/* url : '/purchase/json/updateTranCode/'+$(this).parent().find('input:hidden').val()+'/3', */
	 					url : '/purchase/json/updateTranCode/'+impId+'/3',
	 					method : 'get',
	 					success : function(data){
	 						$(anchor.parent().parent().find('td')[4]).text("배송완료");
	 						anchor.remove();
	 					}
	 				})
 				}
 			});
 			 		
 	        $(".pagination__next").on("click", function() {

 	            searchKeyword = $("input[name='searchKeyword']").val();

 	            var currentPage = $("#currentPage").val()

 	            currentPage = parseInt(currentPage) + 1

 	            fncGetPageList(currentPage);
 	        });

 	        $(".pagination__prev").on("click", function() {
 	            var currentPage = $("#currentPage").val()

 	            currentPage = parseInt(currentPage) - 1

 	            fncGetPageList(currentPage);

 	            fncGetPageList(currentPage);

 	        });

 			
		});

		function init(){
			
			console.log($('div.modal-body').html());
			
			$('.form-group .form-control').addClass('hidden');
			
			$('.btn-primary:contains("비고")').attr('disabled','disabled');
			
			$('div.form-group[title="수정하려면 클릭하세요"] p').removeClass('hidden').unbind('click').bind('click',function(){
				if($('input:hidden[name="tranCode"]').val() == '1'){
					$(this).addClass('hidden');
					$(this).parent().find('.form-control').removeClass('hidden');
					if($('.btn-primary:contains("비고")').attr('disabled')=='disabled'){
						$('.btn-primary:contains("비고")').removeAttr('disabled');
					}
				}else if($('input:hidden[name="tranCode"]').val() == '2'){
					alert('배송 중인 상품은 정보를 수정할 수 없습니다!');
				}else{
					alert('이미 배송 완료된 상품입니다!');
				}
				$(this).unbind('click');
			});
			
		}
	
	
/* 		$(function(){
			
			init();
			
			$('.btn-primary:contains("비고")').bind('click',function(){
				$.ajax({
					url : '/purchase/json/updatePurchase',
					method : 'post',
					dataType : 'json',
					data : JSON.stringify({
						impId : $('input[name="impId"]').val(),
						paymentOption : $('select[name="paymentOption"]').val(),
						orderStock : $('select[name="orderStock"]').val(),
						receiverName : $('input[name="receiverName"]').val(),
						receiverPhone : $('input[name="receiverPhone"]').val(),
						dlvyAddr : $('input[name="dlvyAddr"]').val(),
						dlvyDate : $('input[name="dlvyDate"]').val(),
						dlvyRequest : $('input[name="dlvyRequest"]').val()
					}),
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					success : function(data){
						$($('.form-group[title="수정하려면 클릭하세요"] p')[0]).text(data.paymentOption.trim()=='1' ? '현금구매':'신용구매');
						$($('.form-group[title="수정하려면 클릭하세요"] p')[1]).text(data.orderStock);
						$($('.form-group[title="수정하려면 클릭하세요"] p')[2]).text(data.receiverName);
						$($('.form-group[title="수정하려면 클릭하세요"] p')[3]).text(data.receiverPhone);
						$($('.form-group[title="수정하려면 클릭하세요"] p')[4]).text(data.dlvyAddr);
						$($('.form-group[title="수정하려면 클릭하세요"] p')[5]).text(data.dlvyDate);
						$($('.form-group[title="수정하려면 클릭하세요"] p')[6]).text(data.dlvyRequest);
						init();
					},
					error : function(){
						alert("정보수정실패");
					}
				});
			});
			
		}); */
		
		
	    function UpdatePurchase() { //상영정보 수정 
			receiverName = $(".updateScreenContentModal input[name='receiverName' ]").val();
			receiverPhone1 = $(".updateScreenContentModal input[name='receiverPhone1' ]").val();
			receiverPhone2 = $(".updateScreenContentModal input[name='receiverPhone2' ]").val();
			receiverPhone3 = $(".updateScreenContentModal input[name='receiverPhone3' ]").val();
			addrDlvy = $(".updateScrenContentModal input[name='addrDlvy' ]").val();
			addrDlvyDetail = $(".updateScreenContentModal input[name='addrDlvyDetail' ]").val();
			orderStock = $(".updateScreenContentModal input[name='orderStock' ]").val();
			paymentOption : $(".updateScreenContentModal input[name='paymentOption' ]").val();
			paymentOption : $(".updateScreenContentModal input[name='tranCode' ]").val();
			
	        $.ajax({
	            url : "/purchase/json/updatePurchase",
	            method : 'POST',
	            async : false,
	            dataType : "json",
	            headers : {
	                "Accept" : "application/json",
	                "Content-Type" : "application/json"
	            },
	            data : JSON.stringify({
					impId : $("#ImpId").val(),
					receiverName : $('input[name="receiverName"]').val(),
					receiverPhone1 : $('input[name="receiverPhone1"]').val(),
					receiverPhone2 : $('input[name="receiverPhone2"]').val(),
					receiverPhone3 : $('input[name="receiverPhone3"]').val(),
					addrDlvy : $('input[name="addrDlvy"]').val(),
					addrDlvyDetail : $('input[name="addrDlvyDetail"]').val(),
					tranCode : $('input[name="tranCode"]').val(),
/* 					orderStock : $('input[name="orderStock"]').val(), */
						
	            }),
	            success : function(JSONData, status) {
	            	alert("성공");
					 
 	                $(".updateScreenContentModal input[name='receiverName' ]").val(JSONData.receiverName);
	                $(".updateScreenContentModal input[name='receiverPhone1' ]").val(JSONData.receiverPhone1);
	                $(".updateScreenContentModal input[name='receiverPhone2' ]").val(JSONData.receiverPhone2);
	                $(".updateScreenContentModal input[name='receiverPhone3' ]").val(JSONData.receiverPhone3);
	                $(".updateScreenContentModal input[name='addrDlvy' ]").val(JSONData.addrDlvy);
	                $(".updateScreenContentModal input[name='addrDlvyDetail' ]").val(JSONData.addrDlvyDetail);
	                $(".updateScreenContentModal input[name='tranCode' ]").val(JSONData.tranCode);
 	                /* $(".updateScreenContentModal input[name='orderStock' ]").val(JSONData.orderStock); */

	            }
	        });

	    }

	    function fncGetPurchase() { //  수정을 위한 값 가져오기
	        $.ajax({
	            url : "/purchase/json/getPurchase/" + ImpId,
	            method : "GET",
	            dataType : "json",
	            headers : {
	                "Accept" : "application/json",
	                "Content-Type" : "application/json"
	            },
	            success : function(JSONData, status) {
/* 	                var screenDateTest = JSONData.screenDate;
	                screenDateTest = screenDateTest.replace(/\//gi, "-");
	                */		                
                 	$(".updateScreenContentModal input[name='prodName' ]").val(JSONData.purchaseProd.prodName);
	                $(".updateScreenContentModal input[name='paymentOption' ]").val("카카오페이");
	                $(".updateScreenContentModal input[name='orderStock' ]").val(JSONData.orderStock);
	                $(".updateScreenContentModal input[name='receiverName' ]").val(JSONData.receiverName);
	                $(".updateScreenContentModal input[name='receiverPhone1' ]").val(JSONData.receiverPhone1);
	                $(".updateScreenContentModal input[name='receiverPhone2' ]").val(JSONData.receiverPhone2);
	                $(".updateScreenContentModal input[name='receiverPhone3' ]").val(JSONData.receiverPhone3);
	                $(".updateScreenContentModal input[name='addrDlvy' ]").val(JSONData.addrDlvy);
	                $(".updateScreenContentModal input[name='addrDlvyDetail' ]").val(JSONData.addrDlvyDetail);
	                $(".updateScreenContentModal input[name='orderRegDate' ]").val(JSONData.orderRegDate);
	                $(".updateScreenContentModal input[name='tranCode' ]").val(JSONData.tranCode);
	                $(".updateScreenContentModal input[name='impId' ]").val(JSONData.impId);

	            },
	        })

	    }

	
	     
/*         $(document).on("click", ".btn-link", function() {
        	ImpId = ($("#ImpId").val());
        	alert(ImpId);
        	fncGetPurchase();
        	
            $(".updateScreenContentModal").modal('show');
        }); */
        
        $(document).on("click", ".btn-link", function() {
        	ImpId = ($("#ImpId").val());
        	fncGetPurchase();
        	
            $(".updateScreenContentModal").modal('show');
        });
        
        $(".updateScreenContentModal").modal({
            autofocus : false,
            closable : false,
            onApprove : function() {
                window.location.reload()
                return false;
            },
            onDeny : function() {
                /* funClearInputBox() */
                window.location.reload();
            }
            
        });

        $("#fix").on("click", function() {
	    	 UpdatePurchase();
      	 });
	</script>
<style>
#body{ padding-top: 100px; }
label {
	display: inline-block;
	width: 10em;
}
html{
	height: auto;
}

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.page-heading {
	font-family: 'Jeju Gothic', sans-serif;
	margin-top: 100px
}

#body {
	padding-top: 100px;
}

#table{
	margin-top:20px;
}

.listTitle, .listTitleXs {
	font-size: 10px;
	font-weight: bold;
	height: auto;
	vertical-align: middle;
	padding-top: 5px;
	color: #FFFFFF;
	background-color: #4C4145;
}

.listTitleXs {
	font-size: 13px;
}

.listTitleXs  div {
	padding: 5px 0px 5px 0px
}

html {
	height: auto;
}

section {
	margin-bottom: 30px
}

#writeButton {
	font-size: 13px;
	text-align: center;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-right: 20px;
	color: #4C4145;
	padding: 10px 10px 10px 10px;
}

.countPage {
	font-size: 13px;
	margin-top: 10px;
}

.search {
	margin-right: 30px;
}

.title {
	font-size: 13px;
	font-weight: bold;
}

.title:hover {
	color: #fe505a;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}

.search {
	margin-right: 30px;
}

.page-heading {
	margin-top: 100px
}

#search-form {
	display: block;
	margin-top: 1em;
}

.search__button {
	padding: 5px 5px 5px 5px;
}

input, select {
	height: 30px;
	width: auto;
	border: none;
	box-shadow: none;
	/* border: 1px solid #dbdee1; */
	/* -webkit-border-radius: 3px;
	-moz-border-radius: 3px; */
	/* border-radius: 3px; */
	font-size: 13px;
	color: #b4b1b2;
}

select {
	font-family: 'Jeju Gothic', sans-serif;
}

.userListTable {
	margin-top: 15px;
}

.purchaseListField th {
	height: 100%;
	padding-top: 8px;
	padding-bottom: 10px;
	font-size: 13px;
	padding-left: 5px;
}

.purchaseListRecord td {
	font-size: 13px;
	height: 40px;
	vertical-align: middle;
	padding-top: 5px;
	color: #4C4145;
	border-bottom: 1px solid #969b9f;
	padding: 15px;
}

.tags-area {
	/* border-top: 1px solid #dbdee1; */
	/* border-bottom: 1px solid #dbdee1; */
	margin-top: inherit;
	padding-top: inherit;
}

.tags-area--thin {
	padding-top: inherit;
	padding-bottom: inherit;
	margin-top: inherit;
}

hr {
	margin-top: 5px;
	margin-bottom: 5px;
	/* border: solid 0.1px #4c4145; */
}

.xsUserId {
	font-size: 10pt;
}

.xsUserRole, .xsUserName {
	font-size: 9pt
}

.xsDisplay {
	margin: 20px 0px 20px 0px
}

.toolBar {
	margin-top: 100px
}

input, select {
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
	color: #b4b1b2;
	padding: 5px 5px 5px;
}

.addScreenContentWrapper, .updateScreenContentWrapper {
	padding: 10px 10px 10px 10px;
}

.addScreenContentWrapper>div, .updateScreenContentWrapper>div {
	height: 40px;
	margin: 10px 10px 10px 10px;
}

.addScreenContentWrapper button, .updateScreenContentWrapper button {
	padding: 5px 5px 5px 5px;
}

#addButton {
	padding: 5px 5px 5px 5px;
	margin-top: 20px;
	margin-bottom: 20px;
}

.addScreenContentTitle, .updateScreenContentTitle {
	position : relative;
	left : 50px;
	color: #4C4145;
	font-size: 13px;
}

.listTitle {
	font-size: 10px;
	font-weight: bold;
	height: 40px;
	vertical-align: middle;
	padding-top: 5px;
	color: #FFFFFF;
	background-color: #4C4145;
}

.listData {
	font-size: 10px;
	height: 40px;
	vertical-align: middle;
	padding-top: 5px;
	color: #4C4145;
}

.checkDupTime {
	color: #4C4145;
	height: 40px;
	vertical-align: middle;
}

input[readonly="readonly"], select[disabled="disabled"] {
	background-color: #dbdee1;
}

.fa-bars {
	background-color: #4C4145;
	padding: 7px 7px 7px 7px;
	border-width: 1px;
	border-color: #4C4145;
	border-style: solid;
	border-radius: 5px;
	color: #ffffff;
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

.col-md-6.col-sm-6{
	color:#000000;
}
input[type=email], input[type=password], input[type=search], input[type=text] {
    color: #000000;
    -webkit-appearance: none;
    -moz-appearance: none;
}
</style>
</html>