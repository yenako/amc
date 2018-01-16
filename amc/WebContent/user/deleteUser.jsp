<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">
	
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>회원탈퇴</title>
</head>

<body bgcolor="#ffffff" text="#000000">
	<div class="wrapper">
        <div class="banner-top">
            <img alt='top banner' src="../images/banners/space.jpg">
        </div> 
        <header class="header-wrapper header-wrapper--home">
			<jsp:include page="/layout/topToolbar.jsp" />
   		</header>
		<!--  화면구성 div Start /////////////////////////////////////-->
		<div class="container" id="body">
			 <div class="clearfix"></div>
				<h2 class="page-heading"> 회 원 탈 퇴</h2>
				
		<!-- form Start /////////////////////////////////////-->
		<form id="deleteUser" method='post' novalidate="" class="form contact-info" name="deleteUser">
		  <fieldset>
		  <legend class="screen_out">회원 탈퇴</legend>
		  <div class="row">
		    <label for="userId" class="col-sm-offset-1 col-sm-4 control-label"><strong>아 이 디</strong></label>
		    <div class="col-sm-3">
		      <input type="text" class="form__name" id="userId" name="userId" placeholder="이메일ID입력" aria-describedby="helpBlock" >		       	      	
		    </div>	
		    <span id="helpBlock" class="help-block col-sm-6"></span>		    
		  </div>
		  
		  <c:if test='${user.password != null}'>
			  <div class="row">
			 	 <label for="password" class="col-sm-offset-1 col-sm-4 control-label"><strong>비밀번호</strong></label>
			  
			    <div class="col-sm-3">
			      <input type="password" class="form__name" id="password" name="password" placeholder="비밀번호">
			    </div>
			    <span id="helpBlock2" class="help-block2 col-sm-6"></span>
			  </div>
		  </c:if>
		  <div class="row">
		  	<label for="userName" class="col-sm-offset-1 col-sm-4 control-label"><strong>이  름</strong></label>
		    <div class="col-sm-4">
		      <input type="text" class="form__name" id="userName" name="userName" placeholder="회원이름">
		    </div>
		    <span id="helpBlock3" class="help-block3 col-sm-6"></span>
		  </div>
		 
			<!-- <h1>참조 : http://postcode.map.daum.net/guide</h1> -->
		  <div class="row">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-md btn--info"  >회 원 탈 퇴 </button>
		    </div>
		  </div>
		  </fieldset>
		</form>
		<!-- form Start /////////////////////////////////////-->
		</div>
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />

       	<!-- sweetalert -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.1/sweetalert2.all.min.js"></script>
        
	
</body>
	<script type="text/javascript">
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn--info" ).on("click" , function() {
				alert();
				fncDeleteUser();
			});
		});	
		
		function fncDeleteUser() {
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var name=$("input[name='userName']").val();
			
			
			if(id == null || id.length <1){
				alert("아이디는 반드시 입력하셔야 합니다.");
				return;
			}
			if(pw){
				if(pw == null || pw.length <1){
					alert("패스워드는  반드시 입력하셔야 합니다.");
					return;
				}
			}
			
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return;
			}
			
		  alert("여기는 ajax");
				$.ajax({
					url : "/user/json/deleteCheck/" ,
					method : "POST" ,							
					async : "true",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					data : JSON.stringify({
						userId : id,
						password : pw,
						userName : name
					}),
					/* dataType : "text", */
					success : function(JSONData , status) {
						if(JSONData.role=="not"||JSONData.deleteFlag=="Y"){
							alert("이미 탈퇴한 회원입니다.");
						}else if(JSONData.role=="user"||JSONData.deleteFlag=="N"){
							swal({
								  title: '탈퇴를 진행하시겠습니까?',
								  text: "'예'를 누르시면 탈퇴 후 메인페이지로 이동합니다!",
								  type: 'warning',
								  showCancelButton: true,
								  confirmButtonColor: '#3085d6',
								  cancelButtonColor: '#d33',
								  confirmButtonText: '예, 탈퇴하겠습니다!'
								}).then(function () {
								  swal({	   
									  type: 'success',
									  title: '그동안 이용해 주셔서 감사합니다.',
									  showConfirmButton: false,
									  timer: 1500
									})
									delay()
								})

						}else{
							alert("회원 정보가 없습니다.");
						}
					}
				});  
				
		}
 	
		function sleep(num){	//[1/1000초]
			 var now = new Date();
			   var stop = now.getTime() + num;
			   while(true){
				 now = new Date();
				 if(now.getTime() > stop)return;
			   }
		}
		
		function delay(){
			setTimeout(function move(){
				$("#deleteUser").attr("method" , "POST").attr("action" , "/user/deleteUser").submit();
			},1500) 
		}
		
	</script>
	<style type="text/css">
	 	#body{ padding-top: 100px; }
/* 		html{
	        height: auto;
	  	} */
		 
	</style>

</html>