<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
	   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>Americode Cinema UpdateProduct</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.5/sweetalert2.all.js"></script>
</head>
<body bgcolor="#ffffff" text="#000000">
	

	<div class="wrapper text-center">
		<div class="container" id="body">
			<div class="row updateheader">
				<h3 class="text-info">상품정보수정</h3>
			</div> 
			<form class="update-product form-horizontal">
				<div class="form-group">
					<input type="hidden" name="prodNo" value="${product.prodNo }"/>
					<br/>
					<div class="row" id="selectbox">
						<label for="inputprodType" class="col-sm-2 control-label">상품 구분</label>
				 		<div class="col-sm-3">		
							<select class="search-sort" name="prodType" id="prodType">
								<option value="G">굿즈</option>
								<option value="S">스낵바</option>
							</select>
				  		</div>
				  	</div>
					<br/>
					
					<div class="row">
						<label for="inputProdName" class="col-sm-2 control-label">상품명</label>
						<div class="col-sm-3">
							<input type="text" class="form-control-static" id="inputProdName" name="prodName" value="${product.prodName}" placeholder="상품명">
						</div>
					</div>
					<br/>
					
					<div class="row">
						<label for="inputProdDetail" class="col-sm-2 control-label">상품상세정보</label>
						<div class="col-sm-3">
							<input type="text" class="form-control-static" id="inputProdDetail" name="prodDetail" value="${product.prodDetail}" placeholder="상품상세정보">
						</div>
					</div>
					<br/>
					
					<div class="row">
						<label for="inputProdSetInfo" class="col-sm-2 control-label">상품구성정보</label>
						<div class="col-sm-3">
							<input type="text" class="form-control-static" id="inputProdSetInfo" name="prodSetInfo" value="${product.prodSetInfo}" placeholder="상품구성정보">
						</div>
					</div>
					<br/>
					
					<div class="row">
						<label for="inputStock" class="col-sm-2 control-label" >추가수량</label>
						<div class="col-sm-3">
							<input type="text" class="form-control-static" id="inputStock" name="stock" >
						</div>
						<span class="col-sm-6" id="stocktext">(현재 수량 : ${product.stock})</span>
					</div>
					<br/>
					
					<div class="row">
						<label for="salesOpenDate" class="col-sm-2 control-label">판매시작일</label>
						<div class="col-sm-3">
							<input type="date" class="form-control-static" id="salesOpenDate" name="salesOpenDate" value="${product.salesOpenDate}">
						</div>
						<label for="salesEndDate" class="col-sm-2 control-label" id="salesEndDatetext">판매종료일</label>
						<div class="col-sm-3">
							<input type="date" class="form-control-static" id="salesEndDate" name="salesEndDate" value="${product.salesEndDate}">
						</div>
					</div>
					<br/>
					
					<div class="row">
						<label for="inputPrice" class="col-sm-2 control-label">가격</label>
						<div class="col-sm-3">
							<input type="text" class="form-control-static" id="inputPrice" name="prodPrice" value="${product.prodPrice}">
						</div>
					</div>
					<br/>
					
					<div class="row">
						<label for="inputFile" class="col-sm-2 control-label">상품이미지</label>
						<div class="col-sm-6">
							<input type="file" class="form-control-static" id="inputFile" name="file">
						</div>
					</div>
					<br/>
					
					<div class="row">
						<label for="inputCurrent" class="col-sm-2 control-label">현재 이미지</label>
						<div class="col-sm-6">
							<c:if test="${!empty product.prodImage}">
								<img src="../images/uploadFiles/${product.prodImage}" style="height: 200px; width: 100%;"/>
							</c:if>
							<c:if test="${empty product.prodImage}">
								등록된 파일이 없습니다.
							</c:if>
						</div>
					</div>
					<br/>
					
						<div class="row">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="button" id="update" class="btn btn-success">
									수정하기
								</button>
								<button type="button" id="delete" class="btn btn-success">
									삭제하기
								</button>
								<!-- Modal -->
								<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-body">
												<!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
												<h4 class="modal-title" id="myModalLabel">상품 정보 수정 중입니다..</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
				</div>
			</form>
		</div><!-- //container 끝 -->
	</div><!-- //wrapper 끝 -->
		

</body>
	<script type="text/javascript">
		function fncUpdateProduct(){
			//Form 유효성 검증
/* 상품구분 */			var Type = $('input[name="prodType"]').val();
/* 상품명*/			var name = $('input[name="prodName"]').val(); 
/* 상품상세정보 */		var detail = $('input[name="prodDetail"]').val();
/* 상품구성정보 */		var SetInfo = $('input[name="prodSetInfo"]').val();
/* 추가수량 */			var stock = $('input[name="stock"]').val();
/* 판매시작일 */		var OpenDate = $('input[name="salesOpenDate"]').val();
/* 판매종료일 */		var EndDate = $('input[name="salesEndDate"]').val();
/* 가격 */			var price = $('input[name="prodPrice"]').val();
/* 상품이미지 */		var formData = new FormData();
			
			
			
			formData.append('file',$('input[name="file"]')[0].files[0]);
			
			if(name == null || name.length<1){
				alert("상품명은 반드시 입력하여야 합니다.");
				return;
			}
			if(detail == null || detail.length<1){
				alert("상품상세정보는 반드시 입력하여야 합니다.");
				return;
			}
			if(SetInfo == null || SetInfo.length<1){
				alert("상품구성정보는 반드시 입력하여야 합니다.");
				return;
			}
			if(stock == null || stock == ''){
				stock = 0;
				$('input[name="stock"]').val(0);
			}
			if(stock != ''){
				if(!$.isNumeric(stock)){
					alert('수량은 숫자로 적어주세요.');
					return;
				}
			}
			if(OpenDate == null || OpenDate.length<1){
				alert("제조일자는 반드시 입력하셔야 합니다.");
				return;
			}
			if(EndDate == null || EndDate.length<1){
				alert("제조일자는 반드시 입력하셔야 합니다.");
				return;
			}
			if(price == null || price.length<1){
				alert("가격은 반드시 입력하셔야 합니다.");
				return;
			}
			if(!$.isNumeric(price)){
				alert('가격은 숫자로 적어주세요.');
				return;
			}

			$('#myModal').modal('show');
			if($('input[name="file"]')[0].files[0] != null){
				$.ajax({
					url : 'json/uploadFile',
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
			$('button:contains("수정하기")').bind('click',function(){
				fncUpdateProduct();
			});
			
			$('button:contains("삭제하기")').bind('click',function(){
				alert("${product.prodNo }를 정말 삭제하시겠습니까?");
				/* $('form.update-product').attr('method','post').attr('action','deleteProduct').submit(); */
				self.location.href = '/product/deleteProduct?prodNo='+$('input:hidden[name="prodNo"]').val()+"&menu=manage";
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
			
		})
		
		function modalOut(){
			$('#myModal').modal('hide');
		}
		
		function sendForm(){
			$('form.update-product').attr('method','post').attr('action','updateProduct').attr('enctype','multipart/form-data').submit();
		}

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
	</style>
	
</html>