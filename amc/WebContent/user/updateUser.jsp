<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>ȸ�� ��������</title>
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
        
   		<!-- ���� �ּ� CDN -->
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
        
</head>

<body>
	<div class="wrapper">
    	<!-- Banner -->
        <div class="banner-top">
            <img alt='top banner' src="../images/banners/space.jpg">
        </div> 
        <header class="header-wrapper header-wrapper--home">
			<jsp:include page="/layout/topToolbar.jsp" />
   		</header>
		<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
		<div class="container" id="body">
			<div class="page-header text-center">
	       		<h2 class="text-info">ȸ����������</h2>
		       	<h5 class="text-muted">�� ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
		    </div><br/><br/>
		    
		    <input type="hidden" value="${user.password}" id="snslogin">
		    
			<form id="form" class="form row" method='post' novalidate="">
		  		<div class="row">
			    	<label for="userId" class="col-sm-offset-1 col-sm-3 control-label"><strong>�� �� ��</strong></label>
				    	<div class="col-sm-3" style="display:inline">
				      		<input type="text" class="form__name" id="userId" name="userId" value="${user.userId }" readonly> 
				    	</div>
				    	<div class="col-sm-3">
				    		<span id="helpBlock" class="help-block">
			      					<strong class="text-danger">���̵�� �����Ұ�</strong>
			     				</span>
				    	</div>
		  		</div><br/>
		  		
		  		
		  		
		  		<c:if test='${user.password != null}'>
			  		<div class="row">
			    		<label for="password" class="col-sm-offset-1 col-sm-3 control-label"><strong>��й�ȣ</strong></label>
			    		<div class="col-sm-3">
			      			<input type="password" class="form__name" id="password" name="password" placeholder="��й�ȣ 8�ڸ� �̻�~12�ڸ� ����" maxlength="12">
			    		</div>
			  		</div><br/>
			  		<div class="row">
			    		<label for="password2" class="col-sm-offset-1 col-sm-3 control-label"><strong>��й�ȣ Ȯ��</strong></label>
			    		<div class="col-sm-3">
			      			<input type="password" class="form__name" id="password2" name="password2" placeholder="�����й�ȣ Ȯ��" maxlength="12">
			    		</div>
			     			<span id="helpBlock2" class="help-block2 col-sm-2"></span>
			  		</div><br/>
		  		</c:if>
		  		
		  		
		  		<div class="row">
		    		<label for="userName" class="col-sm-offset-1 col-sm-3 control-label"><strong>�̸�</strong></label>		
		    		<div class="col-sm-3">
		      			<input type="text" class="form__name" id="userName" name="userName" value="${user.userName}" placeholder="����ȸ���̸�">
		    		</div>
		  		</div><br/>
<%-- 				<div class="row">
					<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"><strong>�����ȣ</strong></label>
						<div class="col-sm-3" style="display:inline">		      
							<input type="text" class="inputtype" id="postcode" placeholder="�����ȣ" readonly>
						</div>
				
						<div class="col-sm-2" >
							<input type="button" class="btn btn-md btn--info" onclick="execDaumPostcode()" value="�����ȣ ã��" readonly="readonly" >
						</div>
				</div><br/>
		  		<div class="row">
		    		<label for="addr" class="col-sm-offset-1 col-sm-3 control-label"><strong>�ּ�</strong></label>
		    		<div class="col-sm-3">
		      			<input type="text" class="form__name" id="addr" name="addr"  value="${user.addr}" placeholder="�����ּ�">
		    		</div>
		  		</div><br/>
	  	  		<div class="row">
		    		<label for="addr" class="col-sm-offset-1 col-sm-3 control-label"><strong>���ּ�</strong></label>
		    		<div class="col-sm-3">
		      			<input type="text" class="form__name" id="addrDetail" name="addrDetail"  value="${user.addrDetail}" placeholder="�����ּ�">
		    		</div>
		  		</div><br/>
		  		
 --%>		  		
 				<div class="row">
					<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"><strong>�����ȣ</strong></label>
						<div class="col-sm-3" style="display:inline">		      
							<input type="text" class="inputtype" id="postcode" placeholder="�����ȣ" readonly>
						</div>
				
						<div class="col-sm-2" >
							<input type="button" class="btn btn-md btn--info" onclick="execDaumPostcode()" value="�����ȣ ã��" readonly="readonly" >
						</div>
				</div><br/>	
							
				<div class="row">
					<label for="addr" class="col-sm-offset-1 col-sm-3 control-label"><strong>�ּ�</strong></label>
						<div class="col-sm-3" style="display:inline">
							<input type="text" name='addr' class="inputtype" id="address" value="${user.addr}" placeholder="�ּ�">
						</div>
				</div><br/>
					
				<div class="row">
					<label for="addrDetail" class="col-sm-offset-1 col-sm-3 control-label"><strong>���ּ�</strong></label>
						<div class="col-sm-3" style="display:inline">			
							<input type="text" name='addrDetail' class="inputtype" id="address_detail" value="${user.addrDetail}" placeholder="���ּ�">
						</div>
				</div><br/>
 
 				<div class="row">
		    		<label for="addr" class="col-sm-offset-1 col-sm-3 control-label"><strong>������</strong></label>
		    		<div class="col-sm-3">
		      			<input type="text" class="form__name" id="userRegDate" name="userRegDate"  value="${user.userRegDate}" readonly>
		    		</div>
		  		</div><br/>
		  		<div class="row">
		    		<label for="phone" class="col-sm-offset-1 col-sm-3 control-label"><strong>�޴���ȭ��ȣ</strong></label>
		     		<div class="col-sm-2">
				      	<select class="search-sort" name="phone1" id="phone1">
						  	<option value="010" ${ ! empty user.phone1 && user.phone1 == "010" ? "selected" : ""  } >010</option>
							<option value="011" ${ ! empty user.phone1 && user.phone1 == "011" ? "selected" : ""  } >011</option>
							<option value="016" ${ ! empty user.phone1 && user.phone1 == "016" ? "selected" : ""  } >016</option>
							<option value="018" ${ ! empty user.phone1 && user.phone1 == "018" ? "selected" : ""  } >018</option>
							<option value="019" ${ ! empty user.phone1 && user.phone1 == "019" ? "selected" : ""  } >019</option>
						</select>
		    		</div>
		    		<div class="col-sm-2">
		      			<input type="text" class="form__name" id="phone2" name="phone2" value="${ ! empty user.phone2 ? user.phone2 : ''}"  placeholder="�����ȣ">
		    		</div>
		    		<div class="col-sm-2">
		      			<input type="text" class="form__name" id="phone3" name="phone3" value="${ ! empty user.phone3 ? user.phone3 : ''}"   placeholder="�����ȣ">
		    		</div>
	  			</div><br/><br/>
			  	<div class="form-group">
			    	<div class="col-sm-offset-4  col-sm-4 text-center">
			      		<button type="button" class="btn btn-md btn--info" id="update">�� &nbsp;��</button>
				  		<button type="button" class="btn btn-md btn--info" id="back" role="button">�� &nbsp;��</button>
			    		<br/><br/><br/>
			    	</div>
			    		
			  	</div>
			  
			</form>
 		</div>
	</div>
		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />
			
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
	 	
</body>
	<script type="text/javascript">
	
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#update" ).on("click" , function() {
				fncUpdateUser();
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#back").on("click" , function() {
				/* alert("������ ����Ͻðڽ��ϱ�?"); */
				swal({
					  title: '������ ����Ͻðڽ��ϱ�?',
					  text: "Yes�� �����ø� ȸ��������ȸ�� �̵��մϴ�.",
					  type: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: 'Yes!'
					
					}).then(function (result) {
					  if (result.value) {
						 
						
					  }  history.back();
					})
				  /* history.back(); */
			});
		});	
		
		//=============�̸���" ��ȿ��Check  Event ó�� =============
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
					
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("�̸��� ������ �ƴմϴ�.");
			     }
			});
			 
		});	
	
		$(function(){
			$('#password2').bind('keyup',function(){
				if( $('#password').val() != $(this).val()){
					$('span.help-block2').text("��й�ȣ�� �ٸ��ϴ�.").css('color','red');
				}else{
					$('span.help-block2').text("Ȯ��").css('color','blue');
				}
			});
		});
		
		///////////////////////////////////////////////////////////////////////
		function fncUpdateUser() {
			var name=$("input[name='userName']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var snslogin=$("input[type='hidden']").val();
			
			if(name == null || name.length <1){
				alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(snslogin != ''){
	            if (pw == null || pw.length < 8) {
	                alert("�н������  �ݵ�� 8�ڸ� �̻� �Է��ϼž� �մϴ�.");
	                /* return check=false; */
	                return;
	            }
				if(pw == null || pw.length <1){
					alert("�н������  �ݵ�� �Է��ϼž� �մϴ�.");
					/* return check=false; */
					return; 
				}
				if(pw_confirm == null || pw_confirm.length <1){
					alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
					/* return check=false; */
					return;
				}
	            if (pw != pw_confirm) {
	                alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
	                $("input:text[name='password2']").focus();
	                /* return check=false; */
	                return;
	            }
				$("#form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
				return;
			}
			
			$("#form").attr("method" , "POST").attr("snslogin","snslogin").attr("action" , "/user/updateUser").submit();
		}
	
		
		////���� �ּ� API////////////////////////////////////////////////////////////////////////////////////////////////
		function execDaumPostcode() {
			
	        new daum.Postcode({
	            oncomplete: function(data) {
	            	
	                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
	
	                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
	                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
	                var fullAddr = ''; // ���� �ּ� ����
	                var extraAddr = ''; // ������ �ּ� ����
	
	                // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
	                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
	                    fullAddr = data.roadAddress;
	
	                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
	                    fullAddr = data.jibunAddress;
	                }
	
	                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
	                if(data.userSelectedType === 'R'){
	                    //���������� ���� ��� �߰��Ѵ�.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // �ǹ����� ���� ��� �߰��Ѵ�.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }
	
	                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
	                document.getElementById('postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
	                document.getElementById('address').value = fullAddr;
	
	                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
	                document.getElementById('address_detail').focus();
	            },
	        
	            theme: {
	    	 		bgColor: "#ECECEC", //���� ����
	    	 		searchBgColor: "#0B65C8", //�˻�â ����
	    	 		contentBgColor: "#FFFFFF", //���� ����(�˻����,��l������,ùȭ��,�˻�������Ʈ)
	    	 		pageBgColor: "#FAFAFA", //������ ����
	    	 		textColor: "#333333", //�⺻ ���ڻ�
	    	 		queryTextColor: "#FFFFFF", //�˻�â ���ڻ�
	    	 		postcodeTextColor: "#FA4256", //�����ȣ ���ڻ�
	    	 		emphTextColor: "#008BD3", //���� ���ڻ�
	    	 		outlineColor: "#E0E0E0" //�׵θ�
	    		}   
            
	        }).open();
	    }

	</script>
<style type="text/css">
 	#body{	 	
 	
 	/* background-color: #EDEDED; */
      	background-color: #ffffff;
      	margin-top:100px;
      	margin-bottom:5px;
      	padding-top: -50px;
 	    /* padding-top: 10px;
	    padding-bottom: 10px; */
	    /*padding-left: 20px;
	    padding-right: 20px; */
	    /* margin-left: 1px;
	    margin-right: 1px; */
	    padding-bottom: 10px;
	    border-radius: 15px;
	    border-color:#000000;
	    border-width: 30px;
 	    box-shadow:inset 0 0 10px #a0a0a0; 

 	}
 	html{
	        height: auto;
	  	}
	.btn {
	  display: inline-block;
	  margin-bottom: 0;
	  font-weight: normal;
	  text-align: center;
	  vertical-align: middle;
	  touch-action: manipulation;
	  cursor: pointer;
	  background-image: none;
	  border: 1px solid transparent;
	  white-space: nowrap;
	  padding: 6px 12px;
	  font-size: 14px;
	  line-height: 1.42857143;
	  border-radius: 4px;
	  -webkit-user-select: none;
	  -moz-user-select: none;
	  -ms-user-select: none;
	  user-select: none;
	    margin-left: 30px;
	}	
	.btn-info {
	  color: #ffffff;
	  background-color: #1B516E;
	  border-color: #3A199C;
	  margin-left: 30px;
	}
		  	
	.form .form__name {
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
	color: #000000;
	padding: 9px 18px 10px !important;
	}

</style>
</html>