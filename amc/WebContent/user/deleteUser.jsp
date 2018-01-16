<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">
	
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>ȸ��Ż��</title>
</head>

<body bgcolor="#ffffff" text="#000000">
	<div class="wrapper">
        <div class="banner-top">
            <img alt='top banner' src="../images/banners/space.jpg">
        </div> 
        <header class="header-wrapper header-wrapper--home">
			<jsp:include page="/layout/topToolbar.jsp" />
   		</header>
		<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
		<div class="container" id="body">
			 <div class="clearfix"></div>
				<h2 class="page-heading"> ȸ �� Ż ��</h2>
				
		<!-- form Start /////////////////////////////////////-->
		<form id="deleteUser" method='post' novalidate="" class="form contact-info" name="deleteUser">
		  <fieldset>
		  <legend class="screen_out">ȸ�� Ż��</legend>
		  <div class="row">
		    <label for="userId" class="col-sm-offset-1 col-sm-4 control-label"><strong>�� �� ��</strong></label>
		    <div class="col-sm-3">
		      <input type="text" class="form__name" id="userId" name="userId" placeholder="�̸���ID�Է�" aria-describedby="helpBlock" >		       	      	
		    </div>	
		    <span id="helpBlock" class="help-block col-sm-6"></span>		    
		  </div>
		  
		  <c:if test='${user.password != null}'>
			  <div class="row">
			 	 <label for="password" class="col-sm-offset-1 col-sm-4 control-label"><strong>��й�ȣ</strong></label>
			  
			    <div class="col-sm-3">
			      <input type="password" class="form__name" id="password" name="password" placeholder="��й�ȣ">
			    </div>
			    <span id="helpBlock2" class="help-block2 col-sm-6"></span>
			  </div>
		  </c:if>
		  <div class="row">
		  	<label for="userName" class="col-sm-offset-1 col-sm-4 control-label"><strong>��  ��</strong></label>
		    <div class="col-sm-4">
		      <input type="text" class="form__name" id="userName" name="userName" placeholder="ȸ���̸�">
		    </div>
		    <span id="helpBlock3" class="help-block3 col-sm-6"></span>
		  </div>
		 
			<!-- <h1>���� : http://postcode.map.daum.net/guide</h1> -->
		  <div class="row">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-md btn--info"  >ȸ �� Ż �� </button>
		    </div>
		  </div>
		  </fieldset>
		</form>
		<!-- form Start /////////////////////////////////////-->
		</div>
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />

       	<!-- sweetalert -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.1/sweetalert2.all.min.js"></script>
        
	
</body>
	<script type="text/javascript">
	
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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
				alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw){
				if(pw == null || pw.length <1){
					alert("�н������  �ݵ�� �Է��ϼž� �մϴ�.");
					return;
				}
			}
			
			if(name == null || name.length <1){
				alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
		  alert("����� ajax");
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
							alert("�̹� Ż���� ȸ���Դϴ�.");
						}else if(JSONData.role=="user"||JSONData.deleteFlag=="N"){
							swal({
								  title: 'Ż�� �����Ͻðڽ��ϱ�?',
								  text: "'��'�� �����ø� Ż�� �� ������������ �̵��մϴ�!",
								  type: 'warning',
								  showCancelButton: true,
								  confirmButtonColor: '#3085d6',
								  cancelButtonColor: '#d33',
								  confirmButtonText: '��, Ż���ϰڽ��ϴ�!'
								}).then(function () {
								  swal({	   
									  type: 'success',
									  title: '�׵��� �̿��� �ּż� �����մϴ�.',
									  showConfirmButton: false,
									  timer: 1500
									})
									delay()
								})

						}else{
							alert("ȸ�� ������ �����ϴ�.");
						}
					}
				});  
				
		}
 	
		function sleep(num){	//[1/1000��]
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