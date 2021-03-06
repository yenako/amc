<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<!-- Basic Page Needs -->
    <meta charset="utf-8">
    <title>AMovie - (Preview)Booking step 1</title>
    <meta name="description" content="A Template by Gozha.net">
    <meta name="keywords" content="HTML, CSS, JavaScript">
    <meta name="author" content="Gozha.net">
        
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>   
    
	<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">

   
    <script type="text/javascript">
    
   </script>

</head>

<body>

   <!--  <div class="wrapper"> -->
 	<!-- Banner -->
	<div class="banner-top">
		<img alt='top banner' src="../images/banners/space.jpg">
	</div>
	<header class="header-wrapper header-wrapper--home">
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/layout/topToolbar.jsp" />
		<!-- ToolBar End /////////////////////////////////////-->
	</header>
   		
    <input type="hidden" name="flag" value="1"> 
        <!-- Main content -->
	<br><br><br>
        <!-- <section class="container" id="body"> -->
        <section class="container">
            <div class="order-container">
                <div class="order">
                    <img class="order__images" alt='' src="/images/tickets.png">
                    <p class="order__title">Book a ticket <br><span class="order__descript">and have fun movie time</span></p>
                    <div class="order__control">
                        <a href="#" class="order__control-btn active">Booking</a>
                        <!-- <a href="#" class="order__control-btn">Reserve</a> -->
                    </div>
                </div>
            </div>
               <div class="order-step-area">
                   <div class="order-step first--step">1. What &amp; Where &amp; When</div>
               </div>
        </section>
        


        <section class="container">
            <div class="col-sm-12">
                <br>
                <h2 class="page-heading">Movie</h2>

                <div class="time-select time-select--wide">
                        <div class="time-select__group group--first">
                            <div class="col-sm-3">
                                <p class="time-select__place abc">영화 제목</p>
                            </div>
                            
                            <ul class="col-sm-6 items-wrap">
                            <c:set var="i" value="0" />
							  <c:forEach var="movie" items="${movieList}">
								<c:set var="i" value="${ i+1 }" />										  
								  <li class="time-select__item abc" name="movieName">${movie.movieNm}
								  	<input type="hidden" name="movieNo" value="${movie.movieNo}">
								  	<input type="hidden" name="movieName" value="${movie.movieNm}">
								  </li>
					          </c:forEach> 
                            </ul>                        
                        </div>
                   </div>

                <div class="time-select time-select--wide">
                        <div class="time-select__group group--first">
                            <div class="col-sm-3">
                                <p class="time-select__place abc">날짜</p>
                            </div>
                            <ul class="col-sm-6 items-wrap">
                            </ul>
                        </div>
                   </div>

                <div class="time-select time-select--wide">
                        <div class="time-select__group group--first">
                            <div class="col-sm-3">
                                <p class="time-select__place abc">시간</p>
                            </div>
                            <ul class="col-sm-6 items-wrap">

                            </ul>
                        </div>
                    </div>

				<br><br>
                <div class="choose-indector choose-indector--time abc">
                    <strong>Choosen : </strong>
                    <span class="choosen-area">
                    	<span class="item"></span>
						<span class="item"></span>
						<span class="item"></span>
						<input type="hidden" class="item"></input>
					</span>
                </div>
            </div>

        </section>

        <div class="clearfix"></div>

        <form id='film-and-time' class="booking-form" method='get' action='book2.html'>
            <input type='text' name='choosen-movie' class="choosen-movie">

            <input type='text' name='choosen-city' class="choosen-city">
            <input type='text' name='choosen-date' class="choosen-date">
            
            <input type='text' name='choosen-cinema' class="choosen-cinema">
            <input type='text' name='choosen-time' class="choosen-time">
        

            <div class="booking-pagination">
                    <a href="#" class="booking-pagination__prev hide--arrow">
                        <span class="arrow__text arrow--prev"></span>
                        <span class="arrow__info"></span>
                    </a>
                    <a class="booking-pagination__next" id="gotoSeat">
                        <span class="arrow__text arrow--next" >next step</span>
                        <span class="arrow__info">choose a sit</span>
                    </a>
            </div>

        </form>
        
        <div class="clearfix"></div>


    <!-- </div> -->

        <div class="clearfix"></div>        
        
        <jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />
        

	<!-- JavaScript-->
	<script src="/js/external/modernizr.custom.js"></script>
	
	<script src="/js/external/jquery-migrate-1.2.1.min.js"></script>
	
	<!-- jQuery UI -->
	<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<!-- Bootstrap 3--> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
	
	<!-- Mobile menu -->
	<script src="/js/jquery.mobile.menu.js"></script>
	 <!-- Select -->
	<script src="/js/external/jquery.selectbox-0.2.min.js"></script>
	
	<!-- Custom -->
	<script src="/js/custom.js"></script>
			
	<script type="text/javascript">
	          $(document).ready(function() {
	              //init_BookingOne();
	              if($('html').height() < window.outerHeight){
	              	$('html').css('height', '100%');
	              }
	
	              
	          });
	</script>
	<script type="text/javascript">
	$( function() {
		
		$("li[name='movieName']").on("click" , function() {
			
			//클릭시 색깔 변하게
			//$("li[name='movieName']").removeClass('active');
			$(this).addClass('active2');
			
			var movieNo =  $($(this).find("input[name='movieNo']")).val();
			var movieName =  $($(this).find("input[name='movieName']")).val();
			$(".item").eq(3).text("");
			$(".item").eq(2).html("");
			$(".item").eq(1).html("");
			$(".item").eq(0).html("&nbsp;&nbsp;"+movieName);

			var flag = $("input:hidden[name='flag']").val();
			
			$.ajax(
					{
						url : "/booking/json/getScreenDate/"+movieNo+"/"+flag,						
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {
							console.log('히히 : '+JSONData);								
	                        var str = "";
	                        if(JSONData != ""){
	                            $(JSONData).each(
	                               function(){	
	                            	   
	                            	   str+=  '<li class="time-select__item abc" name="screenDay">'+this+'일'
	                            	   str+=    '<input type="hidden" name="day" value='+this+'>'	
									   str+=  '</li>'; //this.substring(3,5)를 this로 바꿈
	                               });//end of each fnc                            
	                        }//end of if문
	                       
	                        $(".col-sm-6.items-wrap").eq(1).find(".time-select__item").remove();
	                        $(".col-sm-6.items-wrap").eq(2).find(".time-select__item").remove();
	                        $(".col-sm-6.items-wrap").eq(1).html(str);
	                        
						}
				});//end of ajax
		});

	});
   
	//2. 날짜 클릭시
	$(document).on("click", "li[name='screenDay']",  function(){
		
		var date =  $($(this).find("input[name='day']")).val();
		$(".item").eq(2).html("");
		$(".item").eq(1).html("&nbsp;&nbsp;"+date+"일");
		$(".item").eq(3).text("");
		
		$.ajax(
				{
					url : "/booking/json/getScreenTime/"+date,						
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					}, 
					async : false,
					success : function(JSONData, status) {
						console.log('screenTime 받아옴 : '+JSONData);								
                       var str = "";
                       if(JSONData != ""){
                           $(JSONData).each(
                              function(){
                            	  
                           	   str+= '<li class="time-select__item abc" name="screenTime">시간 : '+this.screenOpenTime
							 /*+     ', 상영번호 : '+this.screenContentNo+'' */
                           	   +'<input type="hidden" name="contNo" value="'+this.screenContentNo+'">'
                           	   +'<input type="hidden" name="screenTime" value="'+this.screenOpenTime+'">'
                           	   +'</li>' ;				

                              }//end of function
                            );
                       }//end of if문
                       
                      
                       
                       $(".col-sm-6.items-wrap").eq(2).find(".time-select__item").remove();
                       $(".col-sm-6.items-wrap").eq(2).html(str);

					}
			});//end of ajax
	});
	
	//3. 시간클릭시
	$(document).on("click", "li[name='screenTime']",  function(){
		
		var screenTime = $($(this).find("input[name='screenTime']")).val();
		var contNo = $($(this).find("input[name='contNo']")).val();
		$(".item").eq(2).html("&nbsp;&nbsp;"+screenTime);
		$(".item").eq(3).text(contNo);

	});
		
	 $(document).on("click", "#gotoSeat",  function(e){
		 
		
		 //로그인 여부 체크
		if( ${sessionScope.user==null} ){
			
			e.preventDefault();
	        $('.overlay').removeClass('close').addClass('open');
			
		}else{
			
			var screenContentNo = $(".item").eq(3).text();
			if(screenContentNo.length<1){
				alert('영화정보를 먼저 선택해주세요');
			}else{
				self.location = "/booking/selectSeat?screenContentNo="+screenContentNo;	
			}
			
		}

	}); 
   </script> 
</body>

<style>
/* #body{ padding: 100px} */

html{
  height: auto;
}

.time-select .time-select__item {
  position: relative;
  z-index: 10;
  display: inline-block;
  font-size: 12px;
  background-color: #ffd564;
  padding: 9px 15px 8px 14px;
  margin: 5px 16px 5px 0;
  cursor: pointer;
}
.time-select .time-select__item:hover {
  background-color: #fe505a;
}
.time-select .time-select__item:before {
  content: '';
  width: 95%;
  height: 28px;
  border: 1px solid #ffffff;
  position: absolute;
  top: 3px;
  left: 3px;
}
.time-select .time-select__item:after {
  content: '';
  width: 64px;
  height: 34px;
  background-image: url(../images/components/bg-time.png);
  background-repeat: no-repeat;
  -webkit-background-size: 64px 34px;
  background-size: 64px 34px;
  position: absolute;
  top: 0px;
  left: -2px;
  z-index: -1;
}
.time-select .time-select__item:hover:after {
  background-image: url(../images/components/bg-time-hover.png);
}
.time-select .time-select__item.active{
  background-color: #fe505a;
}
.time-select .time-select__item.active:after { 
  background-image: url(../images/components/bg-time-hover.png);
}
.time-select .time-select__item.active{
  background-image: url(../images/components/bg-time-hover.png);
}
.choose-indector {
  position: relative;
  z-index: 13;
  width: 100%;
  background-color: #4c4145;
  color: #ffffff;
  font-size: 18px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  padding: 12px 21px 12px;
  cursor: pointer;
  }
.choose-indector:before {
  content: "\f077";
  font: 18px "FontAwesome";
  color: #ffffff;
  position: absolute;
  top: 8px;
  right: 21px;

}
.abc{
	  font-family: 'Jeju Gothic', sans-serif;
}

</style>
</html>
