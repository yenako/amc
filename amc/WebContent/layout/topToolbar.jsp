<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!doctype html>
<html>
<head>
<!-- Basic Page Needs -->
<meta charset="utf-8">
<title>AMovie</title>
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
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,700' rel='stylesheet' type='text/css'>
<!-- Open Sans -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:800italic' rel='stylesheet' type='text/css'>

<!-- Stylesheets -->

<!-- Mobile menu -->
<link href="/css/gozha-nav.css" rel="stylesheet" />
<!-- Select -->
<link href="/css/external/jquery.selectbox.css" rel="stylesheet" />

<!-- Slider Revolution CSS Files -->
<link rel="stylesheet" type="text/css" href="/revolution/css/settings.css">
<link rel="stylesheet" type="text/css" href="/revolution/css/layers.css">
<link rel="stylesheet" type="text/css" href="/revolution/css/navigation.css">

<!-- Custom -->
<link href="/css/style.css?v=1" rel="stylesheet" />


<!-- Modernizr -->
<script src="/js/external/modernizr.custom.js"></script>

<!-- JavaScript-->
<!-- jQuery 3.1.1 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
    window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')
</script>
<!-- Migrate  -->
<script src="/js/external/jquery-migrate-1.2.1.min.js"></script>
<!-- Bootstrap 3 -->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

<!-- Slider Revolution core JavaScript files -->
<script type="text/javascript" src="/revolution/js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="/revolution/js/jquery.themepunch.revolution.min.js"></script>

<!-- Slider Revolution extension scripts. -->
<script type="text/javascript" src="/revolution/js/extensions/revolution.extension.actions.min.js"></script>
<script type="text/javascript" src="/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
<script type="text/javascript" src="/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
<script type="text/javascript" src="/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script type="text/javascript" src="/revolution/js/extensions/revolution.extension.migration.min.js"></script>
<script type="text/javascript" src="/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
<script type="text/javascript" src="/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
<script type="text/javascript" src="/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
<script type="text/javascript" src="/revolution/js/extensions/revolution.extension.video.min.js"></script>

<!-- Mobile menu -->
<script src="/js/jquery.mobile.menu.js"></script>
<!-- Select -->
<script src="/js/external/jquery.selectbox-0.2.min.js"></script>
<!-- Stars rate -->
<script src="/js/external/jquery.raty.js"></script>

<!-- Form element -->
<script src="/js/external/form-element.js"></script>
<!-- Form validation -->
<!-- <script src="/js/form.js"></script> -->
<!--�̰��ּ�ó�����ϸ� �α��� �ȵ� -->

<!-- Twitter feed -->
<!-- <script src="/js/external/twitterfeed.js"></script> -->


<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
        <!-- Twitter feed -->
        <!-- <script src="/js/external/twitterfeed.js"></script> -->
	   
	   	<!-- īī�� �α��� -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
		<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

   
   
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   <!-- sweetalert -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.1/sweetalert2.all.min.js"></script>
</head>

<!--       <script type="text/javascript">
        <!-- <script src="/js/custom.js"></script> -->

<script type="text/javascript">
    $(document).ready(function() {
        init_Home();
    });
</script>

	<script type="text/javascript">
    	//============= "�α���"  Event ���� =============
		$( function() {
			$(".userManage").on("click",function(){
				if( '${sessionScope.user.userId}' == ''){
					alert("�α����� �ٽ� ���ּ���");
				    $('.overlay').removeClass('close').addClass('open');
				}else{
					location.replace("/user/getUserList");
				}
			})
			
			$(".storeManage").on("click",function(){
				if( '${sessionScope.user.userId}' == ''){
					alert("�α����� �ٽ� ���ּ���");
				    $('.overlay').removeClass('close').addClass('open');
				}else{
					location.replace("/product/getGoodsList?menu=manage&searchProdType=G");
				}
				
			})
			
			$(".purchaseManage").on("click",function(){
				if( '${sessionScope.user.userId}' == ''){
					alert("�α����� �ٽ� ���ּ���");
				    $('.overlay').removeClass('close').addClass('open');
				}else{
					location.replace("/purchase/getSaleList?searchKeyword=saleList");
				}
			})
			
			$(".movieManage").on("click",function(){
				if( '${sessionScope.user.userId}' == ''){
					alert("�α����� �ٽ� ���ּ���");
				    $('.overlay').removeClass('close').addClass('open');
				}else{
					location.replace("/movie/getMovieList?menu=manage");
				}
			})
			
			$(".screenManage").on("click",function(){
				if( '${sessionScope.user.userId}' == ''){
					alert("�α����� �ٽ� ���ּ���");
				    $('.overlay').removeClass('close').addClass('open');
				}else{
					location.replace("/screen/getScreenList");
				}
			})
			$(".bookingManage").on("click",function(){
				if( '${sessionScope.user.userId}' == ''){
					alert("�α����� �ٽ� ���ּ���");
				    $('.overlay').removeClass('close').addClass('open');
				}else{
					location.replace("/booking/getAdminBookingList");
				}
			})
			
			$(".myInfo").on("click",function(){
				if( '${sessionScope.user.userId}' == ''){
					alert("�α����� �ٽ� ���ּ���");
				    $('.overlay').removeClass('close').addClass('open');
				}else{
					location.replace("/user/getUser?userId=${sessionScope.user.userId}");
				}
			})
			
			$(".myBooking").on("click",function(){
				if( '${sessionScope.user.userId}' == ''){
					alert("�α����� �ٽ� ���ּ���");
				    $('.overlay').removeClass('close').addClass('open');
				}else{
					location.replace("/booking/getBookingList?searchCondition=now");
				}
			})
			
			$(".myWish").on("click",function(){
				if( '${sessionScope.user.userId}' == '' || '${sessionScope.user}' == null){
					alert("�α����� �ٽ� ���ּ���");
				    $('.overlay').removeClass('close').addClass('open');
				}else{
					location.replace("/movie/getWishList");
				}
			})
			
			$(".myCancel").on("click",function(){
				if( '${sessionScope.user.userId}' == ''){
					alert("�α����� �ٽ� ���ּ���");
				    $('.overlay').removeClass('close').addClass('open');
				}else{
					location.replace("/alarm/getCancelAlarmList?alarmFlag=C");
				}
			})
			
			$(".myOpen").on("click",function(){
				if( '${sessionScope.user.userId}' == ''){
					alert("�α����� �ٽ� ���ּ���");
				    $('.overlay').removeClass('close').addClass('open');
				}else{
					location.replace("/alarm/getOpenAlarmList?alarmFlag=O");
				}
			})
			
			$(".myPurchase").on("click",function(){
				if( '${sessionScope.user.userId}' == ''){
					alert("�α����� �ٽ� ���ּ���");
				    $('.overlay').removeClass('close').addClass('open');
				}else{
					location.replace("/purchase/getPurchaseList?searchKeyword=purchaseList&searchCondition=${sessionScope.user.userId}");
				}
			})
			
		    $('.overlay-close').click(function (e) {
		        e.preventDefault;
		        $('.overlay').removeClass('open').addClass('close');
		
		        setTimeout(function(){
		            $('.overlay').removeClass('close');}, 500);
		    });
			
			
			$("#userId").focus();
			
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)	
			$("#login").on("click" , function() { 
				var id=$("#userId").val();
				var pw=$("input:password").val();
				

				
				if(id == null || id.length <1) {
					alert('ID �� �Է����� �����̽��ϴ�.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('�н����带 �Է����� �����̽��ϴ�.');
					$("#password").focus();
					return;
				}
				$.ajax({	
					url : "/user/json/loginUser",
					method : "POST" ,
					async : false,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					data : JSON.stringify({
						userId : id,
						password : pw
					}),
					success : function(JSONData , status) {
						console.log(JSONData.userId);
						if( JSONData.role == 'not' ){
							swal("Ż����ȸ���Դϴ�.");
						}else if( JSONData.userId ==null || JSONData=='' ){
							swal(JSONData+"���̵� , �н����带 Ȯ���Ͻð� �ٽ� �α��� ���ּ���."); 
						}else{
							window.parent.document.location.reload();
						}
					},
					error:function(request,status,error){
						//alert(error);
				    }
				}); 
			});
		 });	 
		 
		
		function loginUser() { 	
			console.log($("#userId").val());
			var id=$("#userId").val();
			var pw=$("input:password").val();
			
			if(id == null || id.length <1) {
				alert('ID �� �Է����� �����̽��ϴ�.');
				$("#userId").focus();
				return;
			}
			
			if(pw == null || pw.length <1) {
				alert('�н����带 �Է����� �����̽��ϴ�.');
				$("#password").focus();
				return;
			}
			
			$.ajax({	
				url : "/user/json/loginUser",
				method : "POST" ,
				async : false,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					userId : id,
					password : pw
				}),
				success : function(JSONData , status) {
					//Debug...
					//alert(status);
					//alert("JSONData : \n"+JSONData);
					//alert( "JSON.stringify(JSONData) : \n"+JSON.stringify(JSONData) );
					//alert("JSONData : "+ JSONData );
					//alert("status : "+ status );
						//alert(JSONData.role);
						console.log(JSONData.userId);
						
						if( JSONData.role == 'not' ){
							swal("Ż���� ȸ���� 30�� �� �簡���� �����մϴ�.");
						}else if( JSONData.userId ==null || JSONData=='' ){
						//$(window.parent.document.location).attr("href","/index.jsp");
						//$(self.location).attr("href","/index.jsp");  
							swal("���̵� , �н����带 Ȯ���Ͻð� �ٽ� �α��� ���ּ���."); 
						}else{
							window.parent.document.location.reload();
						}
					},
				error:function(request,status,error){
					//alert(error);
			    }
			}); 
		 } 
		//============= īī�� �α��� =============
		function loginWithKakao() {
			Kakao.init('fc5658887af25f840e94144f6722b228');
			// �α��� â�� ���ϴ�.
			Kakao.Auth.login({
				
				persistAccessToken: true,
				persistRefreshToken: true,
				
				success: function(authObj) {
		   			var accessToken = Kakao.Auth.getAccessToken();
		    		Kakao.Auth.setAccessToken(accessToken);
		    
		    		Kakao.API.request({
		    			url: '/v1/user/me',
		       			success: function(res) {
			        		console.log("response Ȯ�� :: " + res);
			           		var userId = res.kaccount_email;       
			           		/* var tempId = userId.replace(".", ","); */
			           		console.log("userId :: " + userId);
			           		/* console.log("tempId :: " + tempId); */
			           		$.ajax(
			            		{
			                   		/* url : "/user/json/loginUser/"+tempId, */
			                   		url : "/user/json/kakaoLogin", 
			                      	method : "POST",
			                      	/* dataType : "json", */
			                      	headers : {
			                       		"Accept" : "application/json",
			                       		"Content-Type" : "application/json"
			                      	},
									data : JSON.stringify({
										userId : userId
										/* password : pw */
									}),

			                      	 success : function(JSONData) { 
 			                      		//alert(JSONData.userId);
 			                      		//alert(JSONData.deleteUserFlag );
			                      		//alert(JSON.stringify(JSONData));
 			                       		if(JSONData == null || JSONData == '') {
			                       			alert("������ �����ϴ�. ȸ�������� ���ֽñ� �ٶ��ϴ�..");
			                       			$(self.location).attr("href","/user/addUser?email="+userId+"&snslogin=kakao");                 
			                         	}else if(JSONData.role == 'not'){
			                         		swal("Ż���� ȸ���� 30�� �� �簡�� ���� �մϴ�.");
			                         	}else if(JSONData.deleteUserFlag == 'R'){
			                         		swal("�̹� ���Ե� ���̵��Դϴ�.");		                         	               		
			                         	}else if(JSONData != ''){
			                         		swal("�ݰ����ϴ�.");  
			                       			$(self.location).attr("href","/user/loginUser");
			                       	  		location.reload();
			                         	}else{
			                       	  		location.reload();
			                         	}
			                      	}
			                });
		          		}                  
		      		});
			  	},
			   	fail: function(err) {
			   		alert(JSON.stringify(err));
			   	}
		  	});
		}
		
		
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a:contains('�α׾ƿ�')").on("click" , function() {
				logoutWithKakao();
			}); 
		});
	 
		function logoutWithKakao() {
			 /* Kakao.Auth.logout(); */
			 Kakao.Auth.logout(function(){
				var frm = document.applicationJoinForm;
				  frm.submit();
				setTimeout(function(){
					location.href="http://developers.kakao.com/logout";
					location.href="/user/logoutUser/"
				},300);
			}); 
		}
		
	   	function openHistory(){
	   		popWin = window.open("../openHistory.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	   	}

		//=============  �ֱ� �� ��ǰ  ó�� =============	
	 	$( "a:contains('�ֱ� �� ��ǰ')" ).on("click" , function() {
	 		openHistory();
		});
 	

/* 	    //============ ���̹� ==============
	    var naver_id_login = new naver_id_login("tbGcrisi6ld7O3IBg80N","http://127.0.0.1:8080");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 3,52);
		naver_id_login.setDomain(".service.com");
		naver_id_login.setState(state);
		naver_id_login.init_naver_id_login();
		function naverSignInCallback() {
			
			var userId=naver_id_login.getProfileData('email');    
		 	var tempId = userId.replace(".", ",");
		 	console.log("userId :: " + userId);
		 	console.log("tempId :: " + tempId);
	 
	 
	 		$.ajax(
	        	{
		        	url : '/user/checkUserId/'+tempId,
		            method : "POST",
		            dataType : "json",
		            headers : {
		                "Accept" : "application/json",
		                "Content-Type" : "application/json"
		            },
		            context : this,
		            success : function(JSONData, status) {     
		            	if(JSONData.user ==null ) {
		            		alert("������ �����ϴ�. ȸ�������� ���ֽñ� �ٶ��ϴ�.");
		            		self.location="/view/user/addUserView.jsp?userId="+userId;                 
	                }else if(JSONData.user.role == 4){
	              		alert("Ż���� �����Դϴ�.");
	              		$(self.location).attr("href","/user/logout");
	              		location.reload();
	                }else{
	              	  location.reload();
	                }
	             }
	       	});   
	    }                  
	    
	 	naver_id_login.get_naver_userprofile("naverSignInCallback()");
 */
		
 
	 $( function() {
			if( '${sessionScope.user.role}' == 'admin'){
				$("ul#navigation").css("padding","0 0 0 10px");
			}		
		$(window).resize(function name() {
			if( '${sessionScope.user.role}' == 'admin'){
				$("ul#navigation").css("padding","0 0 0 10px");
			}
		})
	})
		
	</script>		



</head>


<div class="navbar  navbar-inverse navbar-fixed-top">
<!-- Header section -->
         <div class="container">
             <!-- Logo link-->
             <a href='/cinema/index' class="logo">
                 <!-- <img alt='logo' src="/images/logo.png"> -->
                 <img src="/images/AMC_Logo.png">
             </a>
             <!-- Main website navigation-->
             <nav id="navigation-box">
                 <!-- Toggle for mobile menu mode -->
                 <a href="#" id="navigation-toggle">
                     <span class="menu-icon">
                         <span class="icon-toggle" role="button" aria-label="Toggle Navigation">
                           <span class="lines"></span>
                         </span>
                     </span>
                 </a>
                 
                 <!-- Link navigation -->
                 <ul id="navigation">
                     <li>
                         <span class="sub-nav-toggle plus"></span>
                         <a href="#">��ȭ</a>
                         <ul>
                             <li class="menu__nav-item"><a href="/movie/getMovieList?menu=movie">���� �� ��ȭ</a></li>
                             <li class="menu__nav-item"><a href="/movie/getMovieList?menu=commingsoon">�� ���� ��ȭ</a></li>
                             <li class="divider"></li>
                             <li class="menu__nav-item"><a href="/movie/getMovieList?menu=preview">�û�ȸ</a></li>

                         </ul>
                     </li>
                     <li>
                         <span class="sub-nav-toggle plus"></span>
                         <a href="#">����</a>
                         <ul>
                             <li class="menu__nav-item"><a href="/booking/getScreenMovieList">��ȭ ����</a></li>
                             <li class="menu__nav-item"><a href="/booking/getPreviewList">�û�ȸ ����</a></li>
                         </ul>
                     </li>
                     <li>
                         <span class="sub-nav-toggle plus"></span>
                         <a href="/cinema/theaterInfo.jsp">��ȭ��</a>
                     </li>
                     <li>
                         <span class="sub-nav-toggle plus"></span>
                         <a href="/community/getFreeBoardList">Ŀ�´�Ƽ</a>
                     </li>
                     <li>
                         <span class="sub-nav-toggle plus"></span>
                         <a href="#">�����</a>
                         <ul>
                             <li class="menu__nav-item"><a href="/product/getGoodsList?menu=search&searchProdType=G">����</a></li>
                             <li class="menu__nav-item"><a href="/product/getSnackList?menu=search&searchProdType=S">������</a></li>
                         </ul>
                     <c:if test="${!empty sessionScope.user}">
						<c:if test="${sessionScope.user.role eq 'admin'}">
	                     <li>
	                         <span class="sub-nav-toggle plus"></span>
	                         <a href="#">[������ �޴�]</a>
							<ul class="mega-menu__list">
	                                 <li class="mega-menu__nav-item userManage"><a href="#">ȸ�� ����</a></li>
	                                 <li class="mega-menu__nav-item storeManage"><a href="#">��ǰ ����</a></li>
	                                 <li class="mega-menu__nav-item purchaseManage"><a href="#">�Ǹ� ����</a></li>
	                                 <li class="mega-menu__nav-item movieManage"><a href="#">��ȭ ����</a></li>
	                                 <li class="mega-menu__nav-item screenManage"><a href="#">�� ����</a></li>
	                                 <li class="mega-menu__nav-item bookingManage"><a href="#">���� ����</a></li>
	                             </ul>
	                     </li>
	                     </c:if>
                     </c:if>
                     <c:if test="${!empty sessionScope.user}">
                     <li class="visible-xs hidden-sm hidden-md hidden-lg">
                     	<a href="#" class="btn--sign">[${sessionScope.user.userName}] ��&emsp;</a>
                     	<a href="/user/logoutUser" class="btn--sign">�α׾ƿ�</a> 
                     </li>
                     </c:if>
                 </ul>
             </nav>
             
             <!-- Additional header buttons / Auth and direct link to booking-->
             
             <div class="control-panel">
             	<c:if test="${!empty sessionScope.user}">
                 <div class="auth auth--home" margin='100%'>
                   <div class="auth__show">
                   </div>
                   <a href="#" class="btn btn--sign btn--singin">
                       	MyPage
                   </a>
                     <ul class="auth__function jeju">
                         <li class="myInfo"><a href="#" class="auth__function-item">�� ���� ����</a></li>
                         <li class="myBooking"><a href="#" class="auth__function-item">���� ���</a></li>
                         <li class="myWish"><a href="#" class="auth__function-item">���ø���Ʈ</a></li>
                         <li class="myCancel"><a href="#" class="auth__function-item">���ǥ �˸���</a></li>
                         <li class="myOpen"><a href="#" class="auth__function-item">Ƽ�Ͽ��½ð� �˸���</a></li>
                         <li class="myPurchase"><a href="#" class="auth__function-item">����� ���� ���</a></li>
                     </ul>
                 </div>
                 </c:if>
                      
                  <div id="user" margin='100%'>
		        	<!-- ������ ��α��� ������ �� -->	
		 			<c:if test="${empty sessionScope.user}" >		
							<form class="navbar-form navbar-right" >						
								<a href="#" class="btn btn-md btn--warning btn--book btn-control--home login-window">LOGIN</a> 
							</form>
					</c:if>	
					
					<c:if test="${!empty sessionScope.user}">
					<div class="hidden-xs">
						<a href="#" class="btn--sign">[${sessionScope.user.userName}] ��&emsp;</a> 
						<a href="/user/logoutUser" class="btn--sign">�α׾ƿ�</a>
					</div>
					</c:if> 
				</div>
        	
        	</div>
	 </div>
</div>

<style type="text/css">


</style>
<style>

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

a.no-uline { text-decoration:none }

ul#navigation {
	margin : auto;
	width : 50%;
	padding : 0 0 0 100px;
	float: none;
	/* min-width:200px; */
}
.auth--home {
  position: relative;
  top: -10px;
  right: 155px;
}

ul#user {
/* 	margin : auto;
	width : 10%;
	padding-top : 10px;
	padding-right : 10px;
	padding-bottom : 10px;
	padding-left : 10px;
	float: right; */
	/* min-width:200px; */
}

.btn--sign {
  font: 13px 'Jeju Gothic', sans-serif;
  font-weight: bold;
  line-height:0%
  text-transform: uppercase;
  color: #CFD2D4;
  position: relative;
  padding-bottom : 50px;
  margin-right: 3px;
  -webkit-transition: 0.3s;
  -o-transition: 0.3s;
  transition: 0.3s;
  text-decoration:none;
  top: 2px;
}

div#user {
  position: relative;
  top: -24px;
  right: 10px;
  text-decoration:none;
}

.btn-control--home {
  margin-top: 25px;
}


.jeju{
	font-family: 'Jeju Gothic', sans-serif;
}

.auth .auth__function .auth__function-item:before {
  content: "\f111";
  color: #b4b1b2;
  font: 5px "FontAwesome";
  position: absolute;
  top: 7px;
  left: 0;
  -webkit-transition: 0.3s;
  -o-transition: 0.3s;
  transition: 0.3s;
}

.auth .btn--singin {
    position: absolute;
    top: 14px;
    left: 39px;
    padding-right: 20px;
    z-index: 15;
    color: #B4B1B2;
}

ul#navigation a {
    font: 16px 'Jeju Gothic', sans-serif;
    color: #b4b1b2;
    -webkit-transition: 0.3s;
    -o-transition: 0.3s;
    transition: 0.3s;
}


/* �޴� ��ġ */ 
ul#navigation > li {
    padding: 3px 12px 10px;
}


/* �޴� */ 
#navigation .menu__nav-item:before {
  content: "\f111";
  color: #b4b1b2;
  font: 5px "FontAwesome";
  position: absolute;
  top: 7px;
  left: 0;
  -webkit-transition: 0.3s;
  -o-transition: 0.3s;
  transition: 0.3s;
}


</style>
<!-- <script>
 $( function() {
		if( '${sessionScope.user.role}' == 'admin'){
			$("ul#navigation").css("padding","0 0 0 10px");
		}		
	$(window).resize(function name() {
		if( '${sessionScope.user.role}' == 'admin'){
			$("ul#navigation").css("padding","0 0 0 10px");
		}
	})
}) 
</script> -->
</html>

