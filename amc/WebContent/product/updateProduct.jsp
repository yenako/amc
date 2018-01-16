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
				<h3 class="text-info">��ǰ��������</h3>
			</div> 
			<form class="update-product form-horizontal">
				<div class="form-group">
					<input type="hidden" name="prodNo" value="${product.prodNo }"/>
					<br/>
					<div class="row" id="selectbox">
						<label for="inputprodType" class="col-sm-2 control-label">��ǰ ����</label>
				 		<div class="col-sm-3">		
							<select class="search-sort" name="prodType" id="prodType">
								<option value="G">����</option>
								<option value="S">������</option>
							</select>
				  		</div>
				  	</div>
					<br/>
					
					<div class="row">
						<label for="inputProdName" class="col-sm-2 control-label">��ǰ��</label>
						<div class="col-sm-3">
							<input type="text" class="form-control-static" id="inputProdName" name="prodName" value="${product.prodName}" placeholder="��ǰ��">
						</div>
					</div>
					<br/>
					
					<div class="row">
						<label for="inputProdDetail" class="col-sm-2 control-label">��ǰ������</label>
						<div class="col-sm-3">
							<input type="text" class="form-control-static" id="inputProdDetail" name="prodDetail" value="${product.prodDetail}" placeholder="��ǰ������">
						</div>
					</div>
					<br/>
					
					<div class="row">
						<label for="inputProdSetInfo" class="col-sm-2 control-label">��ǰ��������</label>
						<div class="col-sm-3">
							<input type="text" class="form-control-static" id="inputProdSetInfo" name="prodSetInfo" value="${product.prodSetInfo}" placeholder="��ǰ��������">
						</div>
					</div>
					<br/>
					
					<div class="row">
						<label for="inputStock" class="col-sm-2 control-label" >�߰�����</label>
						<div class="col-sm-3">
							<input type="text" class="form-control-static" id="inputStock" name="stock" >
						</div>
						<span class="col-sm-6" id="stocktext">(���� ���� : ${product.stock})</span>
					</div>
					<br/>
					
					<div class="row">
						<label for="salesOpenDate" class="col-sm-2 control-label">�ǸŽ�����</label>
						<div class="col-sm-3">
							<input type="date" class="form-control-static" id="salesOpenDate" name="salesOpenDate" value="${product.salesOpenDate}">
						</div>
						<label for="salesEndDate" class="col-sm-2 control-label" id="salesEndDatetext">�Ǹ�������</label>
						<div class="col-sm-3">
							<input type="date" class="form-control-static" id="salesEndDate" name="salesEndDate" value="${product.salesEndDate}">
						</div>
					</div>
					<br/>
					
					<div class="row">
						<label for="inputPrice" class="col-sm-2 control-label">����</label>
						<div class="col-sm-3">
							<input type="text" class="form-control-static" id="inputPrice" name="prodPrice" value="${product.prodPrice}">
						</div>
					</div>
					<br/>
					
					<div class="row">
						<label for="inputFile" class="col-sm-2 control-label">��ǰ�̹���</label>
						<div class="col-sm-6">
							<input type="file" class="form-control-static" id="inputFile" name="file">
						</div>
					</div>
					<br/>
					
					<div class="row">
						<label for="inputCurrent" class="col-sm-2 control-label">���� �̹���</label>
						<div class="col-sm-6">
							<c:if test="${!empty product.prodImage}">
								<img src="../images/uploadFiles/${product.prodImage}" style="height: 200px; width: 100%;"/>
							</c:if>
							<c:if test="${empty product.prodImage}">
								��ϵ� ������ �����ϴ�.
							</c:if>
						</div>
					</div>
					<br/>
					
						<div class="row">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="button" id="update" class="btn btn-success">
									�����ϱ�
								</button>
								<button type="button" id="delete" class="btn btn-success">
									�����ϱ�
								</button>
								<!-- Modal -->
								<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-body">
												<!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
												<h4 class="modal-title" id="myModalLabel">��ǰ ���� ���� ���Դϴ�..</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
				</div>
			</form>
		</div><!-- //container �� -->
	</div><!-- //wrapper �� -->
		

</body>
	<script type="text/javascript">
		function fncUpdateProduct(){
			//Form ��ȿ�� ����
/* ��ǰ���� */			var Type = $('input[name="prodType"]').val();
/* ��ǰ��*/			var name = $('input[name="prodName"]').val(); 
/* ��ǰ������ */		var detail = $('input[name="prodDetail"]').val();
/* ��ǰ�������� */		var SetInfo = $('input[name="prodSetInfo"]').val();
/* �߰����� */			var stock = $('input[name="stock"]').val();
/* �ǸŽ����� */		var OpenDate = $('input[name="salesOpenDate"]').val();
/* �Ǹ������� */		var EndDate = $('input[name="salesEndDate"]').val();
/* ���� */			var price = $('input[name="prodPrice"]').val();
/* ��ǰ�̹��� */		var formData = new FormData();
			
			
			
			formData.append('file',$('input[name="file"]')[0].files[0]);
			
			if(name == null || name.length<1){
				alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
				return;
			}
			if(detail == null || detail.length<1){
				alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
				return;
			}
			if(SetInfo == null || SetInfo.length<1){
				alert("��ǰ���������� �ݵ�� �Է��Ͽ��� �մϴ�.");
				return;
			}
			if(stock == null || stock == ''){
				stock = 0;
				$('input[name="stock"]').val(0);
			}
			if(stock != ''){
				if(!$.isNumeric(stock)){
					alert('������ ���ڷ� �����ּ���.');
					return;
				}
			}
			if(OpenDate == null || OpenDate.length<1){
				alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(EndDate == null || EndDate.length<1){
				alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(price == null || price.length<1){
				alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(!$.isNumeric(price)){
				alert('������ ���ڷ� �����ּ���.');
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
						alert('��Ͽ� �����߽��ϴ�. ��� �� �ٽ� �õ��� �ּ���..');
					},
					statusCode : {
						404 : function(){
							alert('404��');
						},
						405 : function(){
							alert('405��');
						},
						400 : function(){
							alert('400��');
						},
						415 : function(){
							alert('415��');
						}
					}
	
				});
			}else{
				modalOut();
				sendForm();
			}
			
		}
	
	
		$(function(){
			$('button:contains("�����ϱ�")').bind('click',function(){
				fncUpdateProduct();
			});
			
			$('button:contains("�����ϱ�")').bind('click',function(){
				alert("${product.prodNo }�� ���� �����Ͻðڽ��ϱ�?");
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
			
			//����. �����Ϻ��ٴ� ���� �ǰԲ�
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