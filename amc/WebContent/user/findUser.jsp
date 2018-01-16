<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">
<head>
   <!-- Basic Page Needs -->
        <meta charset="euc-kr">
        <title>아이디/비밀번호 찾기</title>
<!--     Mobile Specific Metas
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="telephone=no" name="format-detection">
    
    Fonts
        Font awesome - icon font
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        Roboto
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>
    
    Stylesheets
    jQuery UI 
        <link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="stylesheet">

        Mobile menu
        <link href="/css/gozha-nav.css" rel="stylesheet" />
        Select
        <link href="/css/external/jquery.selectbox.css" rel="stylesheet" />
        Swiper slider
        <link href="/css/external/idangerous.swiper.css" rel="stylesheet" />
    
        Custom
        <link href="/css/style.css?v=1" rel="stylesheet" />

        Modernizr 
        <script src="/js/external/modernizr.custom.js"></script>
    
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
   
          Sweetalert2 CDN 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.0/sweetalert2.all.min.js"></script>
   
          semantic UI 
        <link rel="stylesheet" type="text/css" href="../semantic/semantic.min.css">
        <script
        src="https://code.jquery.com/jquery-3.1.1.min.js"
        integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
        crossorigin="anonymous"></script>
        <script src="../semantic/semantic.min.js"></script> -->
        
        <!--   Sweetalert2 CDN  -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.0/sweetalert2.all.min.js"></script>
        

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
   			<div class="container" id="body">
        		<div class="page-header text-center">	
		        	<h3 class="text-info" >아이디 / 패스워드 찾기</h3>
		        </div>
		     		<form id="findId" method='post' novalidate="" class="form contact-info" name="findId">	
						<fieldset>
							<legend class="screen_out">아이디 찾기</legend>
								<div class="row">
							  		<label for="userName" class="col-sm-offset-1 col-sm-4 control-label"><strong>이 름</strong></label>
							 	 		<div class="col-sm-3">
							  				<input type="text" class="form__name" name="userName" id="userName" placeholder="이름" >
							  			</div>
								</div>   
								<div class="row">
							  		<label for="birth" class="col-sm-offset-1 col-sm-4 control-label"><strong>생 년 월 일</strong></label>
							 	 		<div class="col-sm-3">
							  				<input type="text" class="inputtype" name="birth" id="birth" placeholder="생년월일" >
							  			</div>
								</div>
						  		<div class="row">
						    		<label for="phone" class="col-sm-offset-1 col-sm-4 control-label"><strong>휴대전화번호</strong></label>
			     					<div class="contact-info__fieldrow col-sm-2">
					      				<select class="search-sort" name="phone1" id="phone1">
										  	<option value="010" ${ ! empty user.phone1 && user.phone1 == "010" ? "selected" : ""  } >010</option>
											<option value="011" ${ ! empty user.phone1 && user.phone1 == "011" ? "selected" : ""  } >011</option>
											<option value="016" ${ ! empty user.phone1 && user.phone1 == "016" ? "selected" : ""  } >016</option>
											<option value="018" ${ ! empty user.phone1 && user.phone1 == "018" ? "selected" : ""  } >018</option>
											<option value="019" ${ ! empty user.phone1 && user.phone1 == "019" ? "selected" : ""  } >019</option>
										</select>
					    			</div>
							    	<div class="col-sm-2">
							      		<input type="text" class="form__name" id="phone2" value="${ ! empty user.phone2 ? user.phone2 : ''}" name="phone2" placeholder="번호" maxlength="5">
							    	</div>
							    	<div class="col-sm-2">
							      		<input type="text" class="form__name" id="phone3" value="${ ! empty user.phone3 ? user.phone3 : ''}" name="phone3" placeholder="번호" maxlength="5">
							    	</div>
					    			<!-- <input type="hidden" name="phone"  /> -->
						  		</div>
								<div class="row">
								    <div class="col-sm-offset-4  col-sm-4 text-center">
								      <button type="button" id="findIdbtn" class="btn btn-md btn--info"  >확 &nbsp;인</button>
								    </div>
								</div>
							 	<div class="row">
							  		<div class="col-sm-offset-4  col-sm-4 text-center">
								  		<i class="glyphicon glyphicon-ok" ></i>
								  		<%-- <input type="text" id= "uer" value="${user.userId}"> --%>
								  	</div>
								</div>
						</fieldset>
					</form><br/><br/><br/>
			
			   		<form method='post' novalidate="" class="form contact-info" id="findPassword" name="findPassword">
				   		<fieldset>			
				   			<legend class="screen_out">비밀번호 찾기</legend>
								<div class="row">
						  			<label for="userId" class="col-sm-offset-1 col-sm-4 control-label"><strong>이메일 아이디</strong></label>
							 	 		<div class="col-sm-3">
							  				<input type="text" class="form__name" name="userId" id="email" placeholder="이름">
							  			</div>
								</div>
								<div class="row">
						  			<label for="userName" class="col-sm-offset-1 col-sm-4 control-label"><strong>이 름</strong></label>
							 	 		<div class="col-sm-3">
							  				<input type="text" class="form__name" name="userName" id="userName2" placeholder="이름" >
							  			</div>
								</div>
					  			<div class="row">
					    			<label for="phone" class="col-sm-offset-1 col-sm-4 control-label"><strong>휴대전화번호</strong></label>
					     			<div class="contact-info__fieldrow col-sm-2">
					      				<select class="search-sort" name="phone1" id="Mphone1">
										  	<option value="010" ${ ! empty user.phone1 && user.phone1 == "010" ? "selected" : ""  } >010</option>
											<option value="011" ${ ! empty user.phone1 && user.phone1 == "011" ? "selected" : ""  } >011</option>
											<option value="016" ${ ! empty user.phone1 && user.phone1 == "016" ? "selected" : ""  } >016</option>
											<option value="018" ${ ! empty user.phone1 && user.phone1 == "018" ? "selected" : ""  } >018</option>
											<option value="019" ${ ! empty user.phone1 && user.phone1 == "019" ? "selected" : ""  } >019</option>
										</select>
					    			</div>
								    <div class="col-sm-2">
								  		<input type="text" class="form__name" id="Mphone2" value="${ ! empty user.phone2 ? user.phone2 : ''}" name="phone2" placeholder="번호" maxlength="5">
								    </div>
								    <div class="col-sm-2">
								    	<input type="text" class="form__name" id="Mphone3" value="${ ! empty user.phone3 ? user.phone3 : ''}" name="phone3" placeholder="번호" maxlength="5">
								    </div>
					    			<!-- <input type="hidden" name="phone"  /> -->
					  			</div>
								<div class="row">
									<div class="col-sm-offset-4  col-sm-4 text-center">
								    	<button type="button" id="sendpassword" class="btn btn-md btn--info"  >비밀번호발송</button>
								    </div>
								</div>
						</fieldset>
					</form>
			</div><!-- //div container 끝 -->
			<div class="clearfix"></div>
	</div><!-- //div wrapepr 끝 -->
		
		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />

   <!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
<!--         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="/js/external/jquery-3.1.1.min.js"><\/script>')</script>
        Migrate 
        <script src="/js/external/jquery-migrate-1.2.1.min.js"></script>
        jQuery UI
        <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        Bootstrap 3 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

        Mobile menu
        <script src="/js/jquery.mobile.menu.js"></script>
         Select
        <script src="/js/external/jquery.selectbox-0.2.min.js"></script>
        Swiper slider
        <script src="/js/external/idangerous.swiper.min.js"></script>

        Form element
        <script src="/js/external/form-element.js"></script>
        Form validation
        <script src="/js/form.js"></script>
-->
		<script src="/js/external/jquery-migrate-1.2.1.min.js"></script>
		<!-- jQuery UI -->
		<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

       <!--  Custom -->
        <script src="/js/custom.js"></script> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.5/sweetalert2.all.js"></script>
</body>

    <script type='text/javascript'>
    

/* 	//============= "로그인"  Event 연결 =============
	$( function() {		
		$("button.btn.btn-primary").on("click" , function() {
			fncgetId();			
		});	
	});	
			
	function fncgetId() {
		var name=$("#userName").val(); 		alert(name);
		var birth=$("#birth").val(); 		alert(birth);
		var phone=$("#phone").val();	 	alert(phone);	
		
		if(name == null || name.length <1) {
			alert('이름을 입력하지 않으셨습니다.');
			$("#userName").focus();
			return;
		}
		
		if(birth == null || birth.length <1) {
			alert('생일을 입력하지 않으셨습니다.');
			$("#birth").focus();
			return;
		}
		
		if(phone == null || phone.length <1) {
			alert('휴대폰번호를 입력하지 않으셨습니다.');
			$("#phone").focus();
			return;
		}
		
		$("form").attr("method" , "POST").attr("action" , "/user/getId").submit();
	}
 */
	
		//============= "인증메일발송"  Event 연결 =============
 	$(function() {
		$( "#sendpassword" ).on("click" , function() {
			fncSendMail();
		});
	});	

	$(function() {

		$( "#findIdbtn" ).on("click" , function() {
			fncfindId();
		});
		
		date = new Date();
        
		$("input[name='birth']").datepicker({
        	dateFormat : 'yy-mm-dd',
            maxDate : date,
            yearRange : '1900:2030',
            changeMonth : true,
            changeYear : true,
            monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
        });
	});	



 
	//============= userId 에 회원정보보기  Event  처리 (double Click)=============
	function fncfindId() {
		/* $(function() { */
	/* 	$( 'button.btn.btn-primary' ).on("click" , function() { */
			var u = $("#userName").val();
			var b = $("#birth").val();
			var p1 = $("#phone1").val();
			var p2 = $("#phone2").val();
			var p3 = $("#phone3").val();
	
			if(u == null || u.length <1){
				alert("이름은 반드시 입력하셔야 합니다.");
				return;
			}
			if(b == null && b.length <1 ){
				alert("생일은 반드시 입력해야합니다..");
				return;
			}
			if(p1 == null || p1.length <1){
				alert("전화번호는 반드시 모두 입력하셔야 합니다.");
				/* return check=false; */
				return; 
			}
			if(p2 == null || p2.length <1){
				alert("전화번호는 반드시 모두 입력하셔야 합니다.");
				/* return check=false; */
				return; 
			}
			if(p3 == null || p3.length <1){
				alert("전화번호는 반드시 모두 입력하셔야 합니다.");
				/* return check=false; */
				return; 
			}
				$.ajax({
					url : "/user/json/getId/" ,
					method : "POST" ,							
					async : true,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					data : JSON.stringify({
						userName : u,
						birth : b,
						phone1 : p1,
						phone2 : p2,
						phone3 : p3
					}),
					/* dataType : "text",  */
					success : function(JSONData , status) {
						var role = JSONData.role
						if( role == 'not'){
							alert("탈퇴한 계정은 30일 후 재등록 가능합니다.");
						}else if( role == 'user'){
							var displayValue = "<h6>"
								+"아이디 : "+JSONData.userId+"<br/>"										
								+"</h6>";	
							swal('회원님의 아이디는 '+JSONData.userId+'입니다.');													
							/* $("h6").remove(); */
							 /* $("#findIdbtn").remove(); 	 */
							/* $( "#user" ).html(displayValue); */								
							/* $( "#user" ).text(JSONData); */	
						}else{
							swal('회원님의 계정은 등록되어 있지 않습니다.');
						}
						 
					}
				});
		
		/* }); */
		
/* 	}); */ 
 
	}
	function fncSendMail() {
		var userName=$("#userName2").val();
		var userId=$("input[name='userId']").val();	
		var pp1 = $("#Mphone1").val();
		var pp2 = $("#Mphone2").val();
		var pp3 = $("#Mphone3").val();
		
		
		if(userId != "" && (userId.indexOf('@') < 1 || userId.indexOf('.') == -1) || userId == ""){
   			alert("이메일 형식이 아닙니다.");
   			return;
   		}
		
		if(userName == null || userName.length <1){
			alert("이름은 반드시 입력하셔야 합니다.");
			return;
		}
		
	 	if (pp2 == "" || pp3 == "") {
            alert("휴대폰 번호는 반드시 모두 입력해야합니다.");
            return;
        }

        if (pp2.length < 3) {
            alert("휴대폰 번호는 3자리 이상 이여야합니다.");
            return;
        }

        if (pp3.length < 3) {
            alert("휴대폰 번호는 3자리 이상 이여야합니다.");
            return;
        }
      
        $.ajax({
			url : "/user/json/getId/" ,
			method : "POST" ,							
			async : true,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				userId : userId,
				userName : userName,
				phone1 : pp1,
				phone2 : pp2,
				phone3 : pp3
			}),
			/* dataType : "text",  */
			success : function(JSONData , status) {
				var role = JSONData.role
				alert(role);
				var flag = JSONData.deleteUserFlag
				alert(flag);
				if( role == 'not'){
					alert("탈퇴한 계정은 30일 후 재등록 가능합니다.");
				}else if( role == 'user' && flag == 'Y'){
					$("#findPassword").attr("method" , "POST").attr("action" , "/user/sendPassword").submit();
					swal("메일을 성공적으로 보냈습니다.");	
				}else if( flag == 'S'){
					swal('회원님은 SNS 계정으로 등록하셨습니다. SNS계정으로 로그인 해주세요.');
				}else{
					swal('회원님의 계정은 등록되어 있지 않습니다.');
				}
				 
			}
		});
		
	}

    </script>

<style type="text/css">

 	#body{ padding-top: 100px; }
 	input, select {
		margin-bottom: 0px;
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
		padding: 9px 18px 10px;
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
	
	
 	html{
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