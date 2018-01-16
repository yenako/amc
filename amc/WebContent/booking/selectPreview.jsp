<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
	<!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>시사회선택하기</title>
        <meta name="description" content="A Template by Gozha.net">
        <meta name="keywords" content="HTML, CSS, JavaScript">
        <meta name="author" content="Gozha.net">
    
     	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  		<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
		<!--  ///////////////////////// Sweetalert CDN ////////////////////////// -->
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
		
  <script type="text/javascript">
//타이머셋팅
  var ticketOpenDate="";
  var runCount;
  function dpTime(){  	
  	
  	console.log("open : "+ticketOpenDate);
  	var templist = ticketOpenDate.split('.');
  	console.log("오픈시간 : "+templist[0]);
  	
  	var now = new Date();
  	var screenTime = new Date(templist[0]);
	   //var screenTime = new Date('17/10/22 12:00:00');
	  	console.log("now : "+now);  //mon oct 16 2017 10:51:31 GMT+0900
	  	console.log("now.getTime() : "+now.getTime()); //1508118721142
	 
	  	var _second = 1000;
	  	var _minute = _second * 60;
	  	var _hour = _minute * 60;
	  	var _day = _hour * 24;
	  	var timer;

	   var diff = (screenTime.getTime() - now.getTime());
	  	
	  	var days = Math.floor(diff / _day);
	  	var hours = Math.floor((diff % _day) / _hour);
	  	var minutes = Math.floor((diff % _hour) / _minute);
	  	var seconds = Math.floor((diff % _minute) / _second);
	  	
	  	
      if(diff<1){
      	$("#gotoSeat").removeClass("disabled");
      	$("#randomSeat").removeClass("disabled");
      	$("#dpTime").html("현재 티켓 구매 가능합니다.");
      } 
		
	 	 if (days < 1){
	         days = -1;
	     }
      
      if (hours < 10){
          hours = "0" + hours;
      }
      
      if (minutes < 10){
          minutes = "0" + minutes;
      }
      
      if (seconds < 10){
          seconds = "0" + seconds;
      }
     
      if(diff<1){
      	
      }else{
    	  if(days==-1){
    		  document.getElementById("dpTime").innerHTML =hours + ":" + minutes + ":" + seconds;
    	  }else{
    		  document.getElementById("dpTime").innerHTML =days+ "일 " + hours + ":" + minutes + ":" + seconds;  
    	  }		
      }
      
     /*  if(minutes < 10){ */
	      if(seconds%2==0){
	    	  console.log('ㅁ');
	    	  $("#dpTime").css("color","#ff0000");
	      }else{
	    	  $("#dpTime").css("color","#ffffff");
	      }
      /* } */
  }
  
  
   $( function() {
		
		$("li[name='movieName']").on("click" , function() {
			
			var movieNo =  $($(this).find("input[name='movieNo']")).val();
			var movieName =  $($(this).find("input[name='movieName']")).val();
			$(".item").eq(1).html("");
			$(".item").eq(2).html("");
			$(".item").eq(0).html("&nbsp;&nbsp;"+movieName);
			
			$("#gotoSeat").addClass("disabled");
	      	$("#randomSeat").addClass("disabled");
	      	clearInterval(runCount);
	      	$("#dpTime").html("");
	      	//ticketOpenDate  = '0,0';

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
									   str+=  '</li>';
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
                            	  
                           	   str+= '<li class="time-select__item abc" name="screenTime">상영시간 : '+this.screenOpenTime
                           	   +     ' '+'&nbsp;'+' 티켓오픈시간 : '+this.ticketOpenDate.substr(0,19)+'&nbsp;&nbsp;'
                           	   +'<input type="hidden" name="contNo" value="'+this.screenContentNo+'">'
                           	   +'<input type="hidden" name="ticketOpenDate" value="'+this.ticketOpenDate+'">'
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
		ticketOpenDate = $($(this).find("input[name='ticketOpenDate']")).val();
		
		$(".item").eq(2).html("&nbsp;&nbsp;"+screenTime);
		$(".item").eq(3).text(contNo);
		
		runCount = setInterval("dpTime();",1000);
	});
		
	
	
	
	$(document).on("click", "#gotoSeat",  function(e){
		
		//로그인 여부 체크
		if( ${sessionScope.user==null} ){
			
			//alert('로그인 후 이용해 주세요');
			//로그인 창 모달로 띄우기
			e.preventDefault();
	        $('.overlay').removeClass('close').addClass('open');
			
		}else{
		
			var screenContentNo = $(".item").eq(3).text();	
			self.location = "/booking/selectSeat?screenContentNo="+screenContentNo;
		}

	});
	
	$( function(){

		$("#randomSeat").on("click", function(e){
			//로그인 여부 체크
			if( ${sessionScope.user==(null)} ){
				 
		        e.preventDefault();
		        $('.overlay').removeClass('close').addClass('open');
				    
				
			}else{
	    		var screeContentNo = $(".item").eq(3).text();
				var headCount = $("select[name=randomCount]").val();
				
				if( headCount==0){
	    			alert("인원수를 먼저 선택해주세요.");
	    		}else{
	    			alert("랜덤좌석을 "+headCount+"석 신청합니다.");
	    			self.location="/booking/selectRandomSeat?screenContentNo="+screeContentNo+"&headCount="+headCount;
				}
			}
	    });
		
    });
	
	
   </script> 

</head>

<body>

        <div class="banner-top">
            <img alt='top banner' src="../images/banners/space.jpg">
        </div>
       <header class="header-wrapper header-wrapper--home">
			<!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="/layout/topToolbar.jsp" />
			<!-- ToolBar End /////////////////////////////////////-->
		</header>
   <!--  <div class="wrapper"> -->
	
    <input type="hidden" name="flag" value="2"> 
    <input type="hidden" name="openTime" value="2017-10-27 12:00:00">



	<br><br><br>
        
        <!-- Main content -->

        <section class="container">
            <div class="order-container">
                <div class="order">
                    <img class="order__images" alt='' src="/images/tickets.png">
                    <p class="order__title">Book a ticket <br><span class="order__descript">and have fun movie time</span></p>
                    <div class="order__control">
                        <a href="#" class="order__control-btn active">Booking</a>
                    </div>
                </div>
            </div>
               <div class="order-step-area">
                   <div class="order-step first--step">1. What &amp; Where &amp; When</div>
               </div>
        </section>
        <br>


        <section class="container">
            <div class="col-sm-12">
                
                <h2 class="page-heading abc">시사회</h2>

                <div class="time-select time-select--wide">
                        <div class="time-select__group group--first">
                            <div class="col-sm-3">
                                <p class="time-select__place abc">시사회제목</p>
                            </div>
                            
                            <ul class="col-sm-6 items-wrap">
                            <c:set var="i" value="0" />
							  <c:forEach var="screenContent" items="${screenContentList}">
								<c:set var="i" value="${ i+1 }" />										  
								  <li class="time-select__item abc" name="movieName">${screenContent.previewTitle} 
								  	<input type="hidden" name="movieNo" value="${screenContent.screenContentNo}">
								  	<input type="hidden" name="movieName" value="${screenContent.previewTitle}">
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
               
              <div class="time-select time-select--wide">
                        <div class="time-select__group group--first">
                            <div class="col-sm-3" >
                              <p class="time-select__place abc">랜덤좌석수(선택) &nbsp;&nbsp; </p>                                                           
                            </div>
                            
                            <div class="col-sm-6 items-wrap">				                            		  							  
							  <select name="randomCount" id="randomCount" class="select__sort" tabindex="0">
					              <option value="0">선택</option>
					              <option value="1">1석</option>
					              <option value="2">2석</option>	                     
					          </select>
					          <div class="abc"> 
					          	<br>랜덤으로 선택되는 좌석의 범위는 뒤에서 4번째 줄까지입니다.
					          	<br>랜덤좌석은 결제페이지로 이동하지 않아도 바로 좌석이 홀딩됩니다.</div>
                            </div>                    
                        </div>
                   </div>
          
               

				<br><br>
                <div class="choose-indector choose-indector--time abc">
                <div class="row" style="padding:10px;">
                    <strong>Choosen : &nbsp; </strong>
                    <span class="choosen-area">
                    	<span class="item"></span>
						<span class="item"></span>
						<span class="item"></span>
						<input type="hidden" class="item"></input>
					</span>
				</div >
				<div class="row abc important" style="padding:10px;">
					<strong>티켓 오픈까지 남은시간 : &nbsp; </strong>
                    <span class="choosen-area">
                    	<span id="dpTime"></span>
					</span>
				</div >
                </div>
                
            
       
           </div>
        </section>

        <div class="clearfix"></div>

            <div class="booking-pagination">
                    <a class="booking-pagination__next disabled" id="randomSeat">
                        <span class="arrow__text ">random seat</span>
                        <span class="arrow__info">get random sit</span>
                    </a>
                    <a class="booking-pagination__next disabled" id="gotoSeat">
                        <span class="arrow__text arrow--next" >next step</span>
                        <span class="arrow__info">choose a sit</span>
                    </a>
            </div>


        
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

</body>
<style>
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
.time-select .time-select__item.active {
  background-color: #fe505a;
}
.time-select .time-select__item.active:after {
  background-image: url(../images/components/bg-time-hover.png);
}
a.disabled {
   pointer-events: none;
   cursor: default;
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
.important{
	font-size: 29px; 
}

</style>
</html>
