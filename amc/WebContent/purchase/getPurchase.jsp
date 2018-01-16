<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% int index = (int)(java.lang.Math.random()*3.0); %>

<!DOCTYPE html>

<html>
<head>
	<title>AMC</title>
	<meta charset="EUC-KR">
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.5/sweetalert2.all.js"></script>
	

</head>

<body bgcolor="#ffffff" text="#000000" >
	<div class="wrapper text-center">
		<div class="container" id="body">
			<h3 class="text-info">구매 정보 확인/수정</h3>
		</div>
			<form class="update-product form-horizontal">
				<input type="hidden" name="tranCode" value="${purchase.tranCode}">
				<input type="hidden" name="impId" value="${purchase.impId}">
				<input type="hidden" name="buyer.userId" value="${purchase.buyer.userId}">
				<div class="form-group">
				<div class="row">
					<label for="inputprodType" class="col-sm-2 control-label">물품명</label>
					<div class="col-sm-3">
						<p class="form-control-static">${purchase.purchaseProd.prodName}</p>
					</div>
				</div>
				
				<div class="row" title="수정하려면 클릭하세요">
					<label class="col-sm-2 control-label">결제방법</label>
					<div class="col-sm-3">
						<p class="form-control-static">${purchase.paymentOption=='1  ' ? "카카오페이 구매" : "" }</p>
						<select class="form-control hidden" name="paymentOption">
							<option value="1" ${purchase.paymentOption=='1  ' ? "selected":""}>카카오페이 구매</option>							
						</select>
					</div>
				</div>
				<div class="row" title="수정하려면 클릭하세요">
					<label class="col-sm-2 control-label">구매수량</label>
					<div class="col-sm-3">
						<p class="form-control-static">${purchase.orderStock}</p>
						<select class="form-control hidden" name="orderStock">
							<c:forEach var="i" begin="1" end="${purchase.purchaseProd.stock+purchase.orderStock>10? 10 : purchase.purchaseProd.stock+purchase.orderStock }">
								<option value="${i}" ${purchase.orderStock==i ? "selected":"" }>${i}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="row" title="수정하려면 클릭하세요">
					<label class="col-sm-2 control-label">받는사람</label>
					<div class="col-sm-3">
						<p class="form-control-static">${purchase.receiverName}</p>
						<%-- <input type="text" class="form-control hidden" name="receiverName" value="${purchase.receiverName}"> --%>
					</div>
				</div>
				<div class="row" title="수정하려면 클릭하세요">
					<label class="col-sm-2 control-label">연락처</label>
					<div class="col-sm-3">
						<p class="form-control-static">${purchase.receiverPhone1} ${purchase.receiverPhone2} ${purchase.receiverPhone3}</p>
						<%-- <input type="text" class="form-control hidden" name="receiverPhone1" value="${purchase.receiverPhone1}">
						<input type="text" class="form-control hidden" name="receiverPhone2" value="${purchase.receiverPhone2}">
						<input type="text" class="form-control hidden" name="receiverPhone3" value="${purchase.receiverPhone3}"> --%>
					</div>
				</div>
				<div class="row" title="수정하려면 클릭하세요">
					<label class="col-sm-2 control-label">배송지</label>
					<div class="col-sm-3">
						<p class="form-control-static">${purchase.addrDlvy}</p>
						<%-- <input type="text" class="form-control hidden" name="addrDlvy" value="${purchase.addrDlvy}"> --%>
					</div>
				</div>
				<div class="row" title="수정하려면 클릭하세요">
					<label class="col-sm-2 control-label">상세주소</label>
					<div class="col-sm-3">
						<p class="form-control-static">${purchase.addrDlvyDetail}</p>
						<%-- <input type="text" class="form-control hidden" name="addrDlvyDetail" value="${purchase.addrDlvyDetail}"> --%>
					</div>
				</div>
				<div class="row" title="수정하려면 클릭하세요">
					<label class="col-sm-2 control-label">배송 상세주소</label>
					<div class="col-sm-3">
						<p class="form-control-static">${purchase.addrDlvyDetail}</p>
						<%-- <input type="text" class="form-control hidden" name="addrDlvyDetail" value="${purchase.addrDlvyDetail}" readonly> --%>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-2 control-label">주문일</label>
					<div class="col-sm-3">
						<p class="form-control-static">${purchase.orderRegDate}</p>
					</div>
				</div>
				
			</div>
		</form>
		
	</div>


		<div>
			<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
			<c:if test="${purchase.tranCode == '1'}">
				<button type="button" class="btn btn-primary" id="update">정보수정</button>
			</c:if>
		</div>
 	

	
<script src="../js/custom.js"></script>

</body>

	<script type="text/javascript">
		
		function init(){
			
			console.log($('div.modal-body').html());
			
			$('.form-group .form-control').addClass('hidden');
			
			$('.btn-primary:contains("정보수정")').attr('disabled','disabled');
			
			$('div.form-group[title="수정하려면 클릭하세요"] p').removeClass('hidden').unbind('click').bind('click',function(){
				if($('input:hidden[name="tranCode"]').val() == '1'){
					$(this).addClass('hidden');
					$(this).parent().find('.form-control').removeClass('hidden');
					if($('.btn-primary:contains("정보수정")').attr('disabled')=='disabled'){
						$('.btn-primary:contains("정보수정")').removeAttr('disabled');
					}
				}else if($('input:hidden[name="tranCode"]').val() == '2'){
					alert('배송 중인 상품은 정보를 수정할 수 없습니다!');
				}else{
					alert('이미 배송 완료된 상품입니다!');
				}
				$(this).unbind('click');
			});
			
		}
	
/* 	
		 $(function(){ 
			alert();
			init(); */
			
			/* $('.btn-primary:contains("정보수정")').bind('click',function(){ */
			$("#update").bind('click',function(){
				alert("updatepurchase 시작");
				$.ajax({
					url : '/purchase/json/updatePurchase',
					method : 'post',
					dataType : 'json',
					data : JSON.stringify({
						impId : $('input[name="impId"]').val(),
						paymentOption : $('select[name="paymentOption"]').val(),
						orderStock : $('select[name="orderStock"]').val(),
						receiverName : $('input[name="receiverName"]').val(),
						receiverPhone1 : $('input[name="receiverPhone1"]').val(),
						receiverPhone2 : $('input[name="receiverPhone2"]').val(),
						receiverPhone3 : $('input[name="receiverPhone3"]').val(),
						dlvyAddr : $('input[name="dlvyAddr"]').val(),
						dlvyDate : $('input[name="dlvyDate"]').val(),
						dlvyRequest : $('input[name="dlvyRequest"]').val()
					}),
					headers : {
						'Accept' : 'application/json',
						'Content-Type' : 'application/json'
					},
					success : function(data){
						alert("updatepurchase성공");
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
	/* 	 }); */ 
	</script>


<style type="text/css">
 	#body{ padding-top: 0px; }
 	.countPage {
	  	font-size: 13px;
	   	margin-top: 10px;
	}
	 
/*  	.search{
		margin-right : 30px;
	}  */
	
 	section{
		margin-bottom : 30px
	}
	
	.movieNm {
		  font-size: 0px;
		  font-weight: bold;
		  display: block;
		  margin-bottom: 0px;
		  margin-top: 0px;
	}
		html{
	        height: auto;
	  	}
	  	
.ui.modal > .close {
  cursor: pointer;
  position: absolute;
  top: -2.5rem;
  right: -2.5rem;
  z-index: 1;
  opacity: 0.8;
  font-size: 1.25em;
  color: #FFFFFF;
  width: 2.25rem;
  height: 2.25rem;
  padding: 0.625rem 0rem 0rem 0rem;
}  	  


.ui.modal > .header {
  display: block;
  font-family: 'Lato', 'Helvetica Neue', Arial, Helvetica, sans-serif;
  background: #FFFFFF;
  margin: 0em;
  padding: 1.25rem 1.5rem;
  box-shadow: none;
  color: rgba(0, 0, 0, 0.85);
  border-bottom: 1px solid rgba(34, 36, 38, 0.15);
}

button:-moz-focusring,
[type="button"]:-moz-focusring,
[type="reset"]:-moz-focusring,
[type="submit"]:-moz-focusring {
  outline: 0px dotted ButtonText;
}

.ui.modal {
  display: none;
  position: fixed;
  z-index: 1001;
  top: 00%;
  left: 50%;
  text-align: left;
  background: #000000;
  border: none;
  /* box-shadow: 1px 3px 3px 0px rgba(0, 0, 0, 0.2), 1px 3px 15px 2px rgba(0, 0, 0, 0.2); */
  -webkit-transform-origin: 00% 25%;
  transform-origin: 50% 25%;
  border-radius: 0.28571429rem;
  -webkit-user-select: text;
  -moz-user-select: text;
  -ms-user-select: text;
  user-select: text;
  will-change: top, left, margin, transform, opacity;
}

.col-xs-7 {
  width: 58.33333333%;
  font-size: 15px;
}
#body {
	/* background-color: #EDEDED; */
	padding:100px;
	position:relative;
	text : center;
	/* background-color: rgba(224, 103, 103, 0.1); */
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
	/* box-shadow: inset 0 0 10px #a0a0a0; */
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

input, #phone1,#gender {
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
input, #prodType{
	position::fixed;
	right:50px;
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
input, #salesEndDate{
	position::relative;
	left:500px;
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
.col-sm-2 {
	position : relative;
	bottom:-10px;
    width: 12%;
   	font-size: 14px;
}
#salesEndDatetext{
    width: 10%;
}
#stocktext{
	position:fixed;
	bottom:530px;
	right:340px;
    width: 15%;
    font-size: 14px;
    
}
.updateheader{
	position:relative;
	left:-110px;
}
 .btn-success {
    color: #ffffff;
    background-color: #582cb9;
    border-color: #582cb9;
    position: relative;
    left: 30px;
}
.btn-success:hover {
  color: #ffffff;
  background-color: #be41e8;
  border-color: #be41e8;
}

.text-info {
    /* color: #31708f; */
    color: #000000;
    position: fixed;
    left: 100px;
    bottom: 830px;
}

.col-sm-2 {
    position: relative;
    bottom: -10px;
    width: 12%;
    font-size: 14px;
}
	
</style>
</html>