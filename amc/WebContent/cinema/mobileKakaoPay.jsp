<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <!-- Standard Meta -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>Americode Cinema-mobileKakaoPay</title>
  <link rel="stylesheet" type="text/css" href="../semantic/components/reset.css">
  <link rel="stylesheet" type="text/css" href="../semantic/components/site.css">

  <link rel="stylesheet" type="text/css" href="../semantic/components/container.css">
  <link rel="stylesheet" type="text/css" href="../semantic/components/grid.css">
  <link rel="stylesheet" type="text/css" href="../semantic/components/header.css">
  <link rel="stylesheet" type="text/css" href="../semantic/components/image.css">
  <link rel="stylesheet" type="text/css" href="../semantic/components/menu.css">

  <link rel="stylesheet" type="text/css" href="../semantic/components/divider.css">
  <link rel="stylesheet" type="text/css" href="../semantic/components/segment.css">
  <link rel="stylesheet" type="text/css" href="../semantic/components/form.css">
  <link rel="stylesheet" type="text/css" href="../semantic/components/input.css">
  <link rel="stylesheet" type="text/css" href="../semantic/components/button.css">
  <link rel="stylesheet" type="text/css" href="../semantic/components/list.css">
  <link rel="stylesheet" type="text/css" href="../semantic/components/message.css">
  <link rel="stylesheet" type="text/css" href="../semantic/components/icon.css">

  <!-- import -->
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  
  <!--   semantic UI  -->
  <link rel="stylesheet" type="text/css" href="../semantic/semantic.min.css">
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"
   integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
   crossorigin="anonymous"></script>
  <script src="../semantic/semantic.min.js"></script>

  <style type="text/css">
    body {
      background-color: #DADADA;
    }
    body > .grid {
      height: 100%;
    }
    .image {
      margin-top: -100px;
    }
    .column {
      max-width: 600px;
    }
  </style>
  <script>
  	IMP.init('imp41659269');
  	
	 function kakaoPay(){
		    var screenContentNo = '${param.screenContentNo}' 
		  	var bookingSeatNo = '${originSeat}'
		  	var price = '${param.totalTicketPrice}'
		  	var title = '${title}'

		  		IMP.request_pay({
				    pg : 'kakao',
				    pay_method : 'kapy',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : "예매 : "+title,
				    amount : price,
				    buyer_tel : 123456789,
				    buyer_email : screenContentNo,
				    buyer_addr : bookingSeatNo
				}, function(rsp) {
					
				    if ( rsp.success ){
				    	var impUid = rsp.imp_uid;
				    	alert(impUid)
				    	alert("amc://process/"+impUid+"?"+rsp.buyer_email+"&"+rsp.buyer_addr)
				    	self.location = "amc://process/"+impUid+"/"+rsp.buyer_email+"/"+rsp.buyer_addr
				    
				    } else {
				        
				        self.location = "amc://cancel"
				        
				    }//end of rsp.success else 
					
					
				}); //end of Imp.request_pay
			}//end of kakaoPay function
	 
  </script>
</head>
<body>

<div class="ui middle aligned center aligned grid">
  <div class="column">
  	<h1>
  		&nbsp;
  	</h1>
  	<br/><br/><br/><br/><br/><br/><br/><br/>
  	<p/>
  	<p/>
  	<p/>
  	<p/>
  	<p/>
  	<p/>
    <h1 class="ui teal image header">
	    <div class="ui ignored info message">
			  <img src="../images/AMC_Logo.png" class="image">
		      <div class="content">
		        	Check your payment
		      </div>
	    </div>
    </h1>
<!--      <h2 class="ui teal image header">
      <img src="../images/amc_logo_mini.png" class="image">
      <div class="content">
        Check your payment
      </div>
    </h2> -->
    <form class="ui large form">
      <div class="ui stacked segment">
        <div class="field">
        <div class="ui horizontal label" style="width:100%">영화/시사회 제목</div>
            <div class="ui left icon input">
	            <i class="record icon"></i>
	            <input type="text" name="title" placeholder="title" readOnly="readonly" value="${title}">
            </div>
        </div>
        <div class="field">
        <div class="ui horizontal label" style="width:100%">상영날짜</div>
            <div class="ui left icon input">
	            <i class="checked calendar icon"></i>
	            <c:set var="title" value="${param.screenOpenTime}"/>
	            <script>
	            </script>
	            
	            <input type="text" name="screenOpenTime" placeholder="screenOpenTime" readOnly="readonly" value="${param.screenOpenTime}">
            </div>
        </div>
        <div class="field">
        <div class="ui horizontal label" style="width:100%">상영관</div>
            <div class="ui left icon input">
	            <i class="sign in icon"></i>
	            <input type="text" name="theater" placeholder="theater" readOnly="readonly" value="${param.theater} 상영관">
            </div>
        </div>
        <div class="field">
        <div class="ui horizontal label" style="width:100%">예매좌석</div>
            <div class="ui left icon input">
	            <i class="street view icon"></i>
	            <input type="text" name="bookingSeatNo" placeholder="bookingSeatNo" readOnly="readonly" value="${param.bookingSeatNo}">
            </div>
        </div>
        <div class="field">
        <div class="ui horizontal label" style="width:100%">티켓수</div>
            <div class="ui left icon input">
	            <i class="ticket icon"></i>
	            <input type="text" name="headCount" placeholder="headCount" readOnly="readonly" value="${param.headCount} 장">
            </div>
        </div>
        <div class="field">
        <div class="ui horizontal label" style="width:100%">금액</div>
            <div class="ui left icon input">
	            <i class="won icon"></i>
	            <input type="text" name="ticketPrice" placeholder="ticketPrice" readOnly="readonly" value="${param.totalTicketPrice} 원">
            </div>
        </div>
        <div class="row"><p/></div>
        <div class="row"><p/></div>
        <div class="row"><p/></div>
        <input type="hidden" name="screenContentNo" value="${param.screenContentNo}">
        <div class="ui fluid large teal button" onClick="javascript:kakaoPay();">결제하기</div>
      </div>
    </form>

  </div>
</div>

</body>
<style>
.ui.horizontal.labels .label,
.ui.horizontal.label {
  margin: 0em 0.5em 0em 0em;
  padding: 0.4em 0.833em;
  min-width: 3em;
  text-align: center;
  border-radius : 15px 15px 0px 0px; 
}
</style>
</html>
