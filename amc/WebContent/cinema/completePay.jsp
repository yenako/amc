<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Standard Meta -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>Americode Cinema-completePay</title>
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
  </script>
</head>
<body>

<div class="ui middle aligned center aligned grid">
  <div class="column">
  	<h1>
  		&nbsp;
  	</h1>
    <h1 class="ui teal image header">
	    <div class="ui ignored info message">
			  <img src="../images/AMC_Logo.png" class="image">
		      <div class="content">
		        	Payment Success
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
			<div class="ui ignored info message" style="width:80%; margin:auto">	
				결제가 성공적으로 <br/> 완료되었습니다.
      		</div>
        </div>        
        <div class="row"><p/></div>
        <div class="row"><p/></div>
        <div class="row"><p/></div>
        <a href="confirm://impUid=${impUid}/${param.screenContentNo}/${param.bookingSeatNo}">
        <%-- <div class="ui fluid large teal button" style="width:50%; margin:auto;" onClick="javascript:goApp('${impUid}')">확인</div> --%>
        <div class="ui fluid large teal button" style="width:50%; margin:auto;" >확인</div>
        </a>
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
