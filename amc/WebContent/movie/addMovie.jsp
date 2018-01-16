<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@page import="com.amc.service.domain.User"%>

<%@page import="java.util.Arrays"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%> 
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   
<html lang="UTF-8">	

<head>
   <meta charset="UTF-8">
   
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width,initial-scale=1">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/sunny/jquery-ui.css">
	    <link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-/1.7.1/css/bootstrap-datepicker.css" />
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.14.1/css/ui.jqgrid.min.css">

      <!-- Mobile Specific Metas-->
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   
   	  <!-- Stylesheets -->

        <!-- Mobile menu -->
        <link href="/css/gozha-nav.css" rel="stylesheet" />
         <!-- Custom -->
        <link href="/css/jqGridStyle.css?v=1" rel="stylesheet" /> 
        <!-- Modernizr --> 
         <script src="/js/external/modernizr.custom.js"></script> 
        
        <!-- JavaScript-->
		<!-- jQuery 3.1.1 --> 
          <script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate  -->
        <script src="/js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- Bootstrap 3 --> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

        <!-- Slider Revolution core JavaScript files -->
        <script type="text/javascript" src="/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script type="text/javascript" src="/revolution/js/jquery.themepunch.revolution.min.js"></script>
       
        <!-- Mobile menu -->
        <script src="/js/jquery.mobile.menu.js"></script>
        <!-- Bootstrap Dropdown Hover JS -->
   		<script src="/javascript/bootstrap-dropdownhover.min.js"></script>   
   
 </head>
 
<body>


<div class="wrapper">
    	<c:set var="who" value=""/>
    	<c:if test="${sessionScope.user.role ne 'admin'}">
    		<c:set var="who" value="search"/>	
    	</c:if>
    	<c:if test="${sessionScope.user eq null || sessionScope.user eq ''}">
    		<c:set var="who" value="search"/>	
    	</c:if>
    	<c:if test="${sessionScope.user.role eq 'admin'}">
    		<c:set var="who" value="admin"/>	
    	</c:if>
        <!-- Banner -->
        <div class="banner-top">
            <img alt='top banner' src="../images/banners/space.jpg">
        </div>
        <header class="header-wrapper header-wrapper--home">
			<!-- ToolBar Start /////////////////////////////////////-->
			
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
                         <a href="#">영화</a>
                         <ul>
                             <li class="menu__nav-item"><a href="/movie/getMovieList?menu=movie">현재 상영 영화</a></li>
                             <li class="menu__nav-item"><a href="/movie/getMovieList?menu=commingsoon">상영 예정 영화</a></li>
                             <li class="divider"></li>
                             <li class="menu__nav-item"><a href="/movie/getMovieList?menu=preview">시사회</a></li>

                         </ul>
                     </li>
                     <li>
                         <span class="sub-nav-toggle plus"></span>
                         <a href="#">예매</a>
                         <ul>
                             <li class="menu__nav-item"><a href="/booking/getScreenMovieList">영화 예매</a></li>
                             <li class="menu__nav-item"><a href="/booking/getPreviewList">시사회 예매</a></li>
                         </ul>
                     </li>
                     <li>
                         <span class="sub-nav-toggle plus"></span>
                         <a href="/cinema/theaterInfo.jsp">영화관</a>
                     </li>
                     <li>
                         <span class="sub-nav-toggle plus"></span>
                         <a href="/community/getFreeBoardList">커뮤니티</a>
                     </li>
                     <li>
                         <span class="sub-nav-toggle plus"></span>
                         <a href="#">스토어</a>
                         <ul>
                             <li class="menu__nav-item"><a href="/product/getGoodsList?menu=search&searchKeyword=G">굿즈</a></li>
                             <li class="menu__nav-item"><a href="/product/getSnackList?menu=search&searchKeyword=S">스낵바</a></li>
                         </ul>
                     </li>
                     <c:if test="${!empty sessionScope.user}">
						<c:if test="${sessionScope.user.role eq 'admin'}">
	                     <li>
	                         <span class="sub-nav-toggle plus"></span>
	                         <a href="#">[관리자 메뉴]</a>
							<ul class="mega-menu__list">
	                                 <li class="mega-menu__nav-item"><a href="/user/getUserList">회원 관리</a></li>
	                                 <li class="mega-menu__nav-item"><a href="/product/getGoodsList?menu=manage&searchKeyword=G">상품 관리</a></li>
	                                 <li class="mega-menu__nav-item"><a href="/purchase/getSaleList?searchKeyword=saleList">판매 관리</a></li>
	                                 <li class="mega-menu__nav-item"><a href="/movie/getMovieList?menu=manage">영화 관리</a></li>
	                                 <li class="mega-menu__nav-item"><a href="/screen/getScreenList">상영 관리</a></li>
	                                 <li class="mega-menu__nav-item"><a href="/booking/getAdminBookingList">예매 관리</a></li>
	                             </ul>
	                     </li>
	                     </c:if>
                     </c:if>
                 </ul>
             </nav>
             
             <!-- Additional header buttons / Auth and direct link to booking-->
             <div class="control-panel">
                 <div class="auth auth--home">
                   <div class="auth__show">
                   </div>
                   <a href="#" class="btn btn--sign btn--singin">
                       	MyPage
                   </a>
                     <ul class="auth__function">
                         <li><a href="/user/getUser" class="auth__function-item">내 정보 보기</a></li>
                         <li><a href="/booking/getBookingList?searchCondition=now" class="auth__function-item">예매 목록</a></li>
                         <li><a href="/movie/getWishList" class="auth__function-item">위시리스트</a></li>
                         <li><a href="/alarm/getCancelAlarmList?alarmFlag=C" class="auth__function-item">취소표 알리미</a></li>
                         <li><a href="/alarm/getOpenAlarmList?alarmFlag=O" class="auth__function-item">티켓오픈시간 알리미</a></li>
                         <li><a href="/purchase/getPurchaseList" class="auth__function-item">스토어 구매 목록</a></li>
                     </ul>
                 </div>
                 <!-- <a href="#" class="btn btn-md btn--warning btn--book btn-control--home login-window">Book a ticket</a> -->
        	<!-- 유저가 비로그인 상태일 시 -->	
 			<c:if test="${empty sessionScope.user}">		
					<!-- <form class="navbar-form navbar-right"> -->
					<form class="navbar-form navbar-right">						
						<a href="#" class="btn btn-md btn--warning btn--book btn-control--home login-window">Book a ticket</a> 
					</form>
			</c:if>	
			
			<c:if test="${!empty sessionScope.user}">
				<ul class="nav navbar-nav navbar-right">
					<a href="#" class="user-info">[${sessionScope.user.userName}] 님</a>&emsp;
					<a href="/user/logoutUser">로그아웃</a>
				</ul>
			</c:if> 
        	
        	
        	</div>
        	
         	
	 </div>
</div>
			<!-- ToolBar End /////////////////////////////////////-->
   		</header>

        
        <!-- Main content -->
        <div class="container">
           
    	 <h2 class=" text-info">영화 등록</h2>
    	 
			<form id="uploadForm" method="POST">  
			
				<table id="movie_list"></table>    
				<br/>
		
			    <div id="pager777" class="scroll" style="text-align:center"></div>
			    <div id="load_time" class="scroll" style="text-align:center"></div>
			 
			
			</form>
 
                
        </div>
  
        
        <jsp:include page="/layout/bottomToolbar.jsp" />
        
         
          <div class="overlay overlay-hugeinc">
            
            <section class="container">

                <div class="col-sm-4 col-sm-offset-4">
                    <button type="button" class="overlay-close">Close</button>
                    <form id="login-form" class="login" method='get' novalidate=''>
                        <p class="login__title">로그인<br><span class="login-edition">welcome to Americode Cinema!</span></p>

                        <div class="social social--colored">
                                <a href='#' class="social__variant fa fa-facebook"></a>
                                <a href='#' class="social__variant fa fa-twitter"></a>
                                <a href='#' class="social__variant fa fa-tumblr"></a>
                        </div>

                        <p class="login__tracker">환영합니다<br/> 좋은시간보내세요!</p>
                        
                        <div class="field-wrap">
                        <input type='email' placeholder='Email'  id='userId' name='userId' class="login__input">
                        <input type='password' placeholder='Password' id='password' name='password' class="login__input">

                        <input type='checkbox' id='#informed' class='login__check styled'>
                        <label for='#informed' class='login__check-info'>아이디 저장</label>
                         </div>
                        
                        <div class="login__control">
                            <button type='button' id ='login' class="btn btn-md btn--warning btn--wider">로그인</button>
                            <a href="/user/authForm.jsp" class="login__tracker form__tracker">회원 가입</a>
                            <a href="#" class="login__tracker form__tracker">아이디/비밀번호 찾기</a>
                        </div>
                    </form>
                </div>

            </section>
        </div>
        
  		
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqgrid/4.6.0/js/i18n/grid.locale-kr.js"></script>  
    <!--  <script src="/javascript/trirand/i18n/grid.locale-kr.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.14.1/jquery.jqgrid.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.js"></script>    
       
 <script type="text/javascript">
 
	//============= "로그인"  Event 연결 =============
	$( function() {
		$("#userId").focus();
		
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#login").on("click" , function() {
			var id=$("#userId").val();
			var pw=$("input:password").val();
			
			if(id == null || id.length <1) {
				alert('ID 를 입력하지 않으셨습니다.');
				$("#userId").focus();
				return;
			}
			
			if(pw == null || pw.length <1) {
				alert('패스워드를 입력하지 않으셨습니다.');
				$("#password").focus();
				return;
			}
			
			$.ajax( 
					{	
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
									alert("탈퇴한회원입니다.");
								}else if( JSONData !='' ){
								//$(window.parent.document.location).attr("href","/index.jsp");
								/* $(self.location).attr("href","/index.jsp"); */ 
								window.parent.document.location.reload();
								
								}else{
									alert("아이디 , 패스워드를 확인하시고 다시 로그인 해주세요.");
								}
							},
						error:function(request,status,error){
							//alert(error);
							//alert("아이디 , 패스워드를 확인하시고 다시 로그인2...");
					    }
				}); 
			
		});
	});	
 
 
         $(document).ready(function(){
         	
        	function setClickRowColor(gridNm, rowId){
	    	    var ids = $('#'+gridNm).getDataIDs();

        	    $.each(ids, function(idx){
        	        idx+=1;
        	        if(idx==rowId){
        	            $('#'+gridNm).setRowData(idx, false, {background:'#DDFFFF'});
        	        }else{
        	            $('#'+gridNm).setRowData(idx, false, {background:'#FFFFFF'});
        	        }
        	    });
        	}
       	 
        	function formatImage(cellValue, options, rowObject) {

        		
        		 alert("cellValue" + cellValue)
                 //var imageHtml = "<img src='images/" + cellValue + "' originalValue='" + cellValue + "' />";
                 //var imageHtml = "<img src='cellValue'/>";
                 
                 //var imageHtml = "<img src='../images/movie/tax1.jpg' originalValue='tax1.jpg'/>";
                 
                 var imageHtml = "<img src='cellValue'/>";
                  
                 return imageHtml;
            }

        
        	function pickdates(id){
        		jQuery("#"+id+"_movieEndDate","#movie_list").datepicker({dateFormat:"yy-mm-dd"});
        	}
   	
        	var getVaueByName = function (directors, colName) {
                var i, count = directors.length, item;
                
                console.log("directors.length", directors.length);
                
                for (i = 0; i < count; i += 1) {
                    item = directors[i];
                    
                	//console.log("item" + item.peopleNm);
                    
                    
                    if (item.colname === colName) {
                    	
                    	console.log("item" + item.peopleNm);
                        return item.peopleNm;
                    }
                    
                    return item.peopleNm; 
                }
                return '';
            };
        
      
         $("#movie_list").jqGrid( 
        		{         			
        
            	// ajax 요청주소
                url:"/movie/json/getAPIMoiveList",
                caption : "영화 API 등록",
                // 요청방식
                mtype:"post",
                // 결과물 받을 데이터 타입
                datatype:"json",   
          
                // 그리드 높이
                height:"auto",
               
                // 컬럼명
                //  colNames:['영화CD','영화명','제작국가','상영마감','줄거리','트레일러'], 
                colNames:['영화명','영화CD','제작국가','개봉날짜','줄거리','트레일러'],
                // 컬럼 데이터(추가, 삭제, 수정이 가능하게 하려면 autoincrement컬럼을 제외한 모든 컬럼을 editable:true로 지정)
                // edittyped은 text, password, ... input type명을 사용
                     
                colModel:[
                          {name:'movieNm', index:'movieNm', align:"left",width:90, sortable:true, editable:true},   
                          {name:'movieCd', key: true,index:'movieCd',align:"left",sorttype:"int",width:90, sortable:true,editable:true},                                            
   	                      {name:'nationAlt', index:'nationAlt',align:"left", width:90,sortable:true, editable:true},  
   	                  	  {name:'openDt', index:'openDt',align:"left", width:90,sortable:true, editable:true},  
	                      
   	                      
                          /* {name:'movieEndDate', index:'movieEndDate',align:"left",                         	    
                        	      editable:true, editoptions:{size:10, 
                                  dataInit:function(el){ 
                                        $(el).datepicker({dateFormat:'yy-mm-dd'}); 
                                  }, 
                                  defaultValue: function(){ 
                                    var currentTime = new Date(2017,10,1); 
                                    var month = parseInt(currentTime.getMonth() + 1); 
                                    month = month <= 9 ? "0"+month : month; 
                                    var day = currentTime.getDate(); 
                                    day = day <= 9 ? "0"+day : day; 
                                    var year = currentTime.getFullYear(); 
                                    return year+"-"+month + "-"+day; 
                                  } 
                                }                	      
                          }, */                   
                          
                          //{name:'postUrl', index:'postUrl', width:60, align:'center',
                          // formatter:formatImage},                        	 
                          
                          
                        
                          {name:'synopsis', index:'synopsis',align:"left", width:90,sortable:true, editable:true, 
                        	     edittype: "textarea",editoptions: { rows: 3, wrap: "off",style: 'overflow-x: hidden',}},                     
                          {name:'trailer', index:'trailer',align:"left", width:90,editable:true}
                          ],
                          
                          
                       
         
         	  // 네비게이션 도구를 보여줄 div요소
                hidegrid : true,                        // grid 전체를 접는 오른쪽 상단 아이콘 disable
            	beforeSelectRow : function(invid) {                // 선택한 로우 색상 변경
                setClickRowColor('movie_list', invid);
                    return true;
               }, 
               
          

               	sortable: true,
                sortname: 'movieCd',
                pager:"#pager777",
            	rowNum:10,
               	//rowList:[10,20,30],             
                autowidth:true,
                // 전체 레코드수, 현재레코드 등을 보여줄지 유무
                multiselect: true,
                viewrecords:true,
                
                // 추가, 수정, 삭제 url
                editurl: "/movie/json/addMovie",    
    
                mtype:"post",
                // 결과물 받을 데이터 타입
                datatype:"json",
          
                //sortable: true 
                sortorder: "desc",
                loadonce : true,
               
                jSonReader : {
                	root:"rows",
                	page:"page",
                	total:"total",
                	records:"records",
                	repeatitems:false,
                	cell:"cell",
                	id:"movieCd"
                },
                 
               	loadComplete: function(data) {
          			// alert ("records="+$("#movie_list").getGridParam("records"));
                },  
                
                
          		loadError: function (jqXHR, textStatus, errorThrown) {
                    alert('HTTP status code: ' + jqXHR.status + '\n' +
                          'textStatus: ' + textStatus + '\n' +
                          'errorThrown: ' + errorThrown);
                    alert('HTTP message body (jqXHR.responseText): ' + '\n' + jqXHR.responseText);
                },

        		});
         
    	    
	      // 네비게시션 도구 설정
	  $("#movie_list").jqGrid(
	         		"navGrid",
	                "#pager777",

	                {search:true, edit:true, add:true, del:true},
	                
	                {   //EDIT
	               	    reloadAfterSubmit: true,
	                	closeAfterAdd: true,
	                	closeAfterEdit: true, reloadAfterSubmit: true,
	                    closeOnEscape: true,//Closes the popup on pressing escape key
	                    closeAfterEdit: true,
	                    
	                 	afterSubmit: function (response, postdata) {
	                 		
	                 		if (response.statusText = "OK")
	                    	alert("성공적으로 입력되었습니다 !!!" + response.statusText); 
	                 		else 
	                 		alert("오류 발생 " +response.statusText);
                   
	                    }
	                 
	                
	                 }
	                
            
			  );
		  }) 
		

    </script>
    
</body>
</html>
