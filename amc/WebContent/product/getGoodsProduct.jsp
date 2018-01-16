<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% int index = (int)(java.lang.Math.random()*3.0); %>

<!DOCTYPE html>

<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.5/sweetalert2.all.js"></script>


</head>

<body bgcolor="#ffffff" text="#000000">


	<div class="wrapper">
		<div class="container" id="body">
			<div class="col-md-9" role="main" >
				<h5><ul align="left">
					<li>
						<c:if test="${param.menu=='search'}">
							<strong>상품상세정보</strong>
						</c:if>
						<c:if test="${param.menu=='manage'}">
							수정된 정보
						</c:if>
					</li>
				</ul></h5>	

		
				<div class="row" id="tabs-1">
					<input type="hidden" name="prodType" value="${product.prodType}"/>
					<input type="hidden" name="prodNo" value="${product.prodNo}"/>
						<div class="col-xs-5">				
							<c:if test="${!empty product.prodImage}">
								<img src="../images/uploadFiles/${product.prodImage}" class="img-responsive"/>
							</c:if>
							<c:if test="${empty product.prodImage}">
								<img src="../images/uploadFiles/empty<%=index%>.GIF" class="img-responsive"/>
							</c:if>
						</div>
						<br/><br/><br/>
						<div class="col-xs-7">
							<dl class="dl-horizontal">
								<dt>상품명</dt>
								<dd>${product.prodName}</dd>
							</dl>
							<dl class="dl-horizontal">
								<dt>총 수량</dt>
								<dd>${product.totalStock} 개</dd>						
							</dl>
							<dl class="dl-horizontal">
								<dt>현재 재고수량</dt>
								<dd>${product.stock} 개</dd>
							</dl>
							<dl class="dl-horizontal">
								<dt>판매시작일</dt>
								<dd>${product.salesOpenDate}</dd>
							</dl>
							<dl class="dl-horizontal">
								<dt>판매종료일</dt>
								<dd>${product.salesEndDate}</dd>
							</dl>
							<dl class="dl-horizontal">
								<dt>가격</dt>
								<dd>${product.prodPrice} 원</dd>
							</dl>
							<dl class="dl-horizontal">
								<dt>상품상세정보</dt>
								<dd>${product.prodDetail}</dd>
							</dl>
							<dl class="dl-horizontal">
								<dt>상품구성정보</dt>
								<dd>${product.prodSetInfo}</dd>
							</dl>
							<div class="btn-group" role="group">
								<br/>
								<a href="#" class="btn btn-success" role="button">구매하러가기</a> 
							<%--  <c:if test="${param.menu=='search' && !empty user}">
								<a href="#" class="btn btn-success" role="button">구매하러가기</a>
							</c:if> --%> 
							</div>
						</div>
					</div><!-- 굿즈 상품정보 -->
			
				<!-- Progress bar -->
	                <div class="col-sm-4">
	                    <div class="progress">
	                      <!-- <p class="progress__info">현재 판매량</p> -->
	                      <p class="progress__info">
	                      	${param.menu eq 'search'? "현재 재고율" : "현재 판매율" }${product.salesStock}%
	                      </p>
	                      <div class="progress__bar" role="progressbar" data-level="${product.salesStock}">
	                          <div class="progress__current" style="width: 0%;"></div>
	                      </div>
	                    </div>
	                </div>
		
		</div>
	</div>
</div>	



<script src="../js/custom.js"></script>
</body>

	<script type="text/javascript">
	
		$(function(){
/* 			$('a.add:contains("확인")').bind('click',function(){
				self.location.href = 'getGoodsList?menu=manage';
			});
			
			$('a.add:contains("추가등록")').bind('click',function(){
				self.location.href = 'addProduct';
			}); */
			
			$('a.btn-default:contains("목록으로")').bind('click',function(){
				alert("modal로 드러왔을때도 되니?");
				self.location.href = 'getGoodsList?menu=${param.menu}'+'&searchKeyword=G';
			});

			$('a.btn-success:contains("구매하러가기")').bind('click',function(){
				if('${sessionScope.user.userId}'== ''){				
					/* $('.overlay').removeClass('close').addClass('open'); */
					swal('로그인 후 구매가능 합니다.');
					
					swal({
						  title: '로그인 후 구매 가능합니다.',
						  text: "'예'를 누르시면 로그인 페이지로 이동합니다!",
						  type: 'info',
						  showCancelButton: true,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: 'YES'
						}).then(function () {
						  swal({	   
							  type: 'success',
							  title: '로그인 페이지로 이동합니다.',
							  showConfirmButton: false,
							  timer: 1500
							})
							delay()
						})
					
					
				}else{
					self.location.href = '/purchase/addPurchase?prodNo='+$('input:hidden[name="prodNo"]').val();
				} 
			});
		});
		
		
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
				self.location.href = '/user/loginUser.jsp';
			},1500) 
		}
		
		
		
		
		

    	//6. Progressbar
  		//Count function for progressbar
  		function init_progressBar(duration) {
             $('.progress').each(function() {
                 var value = $(this).find('.progress__bar').attr('data-level');
                 var result = value + '%';
                 if(duration) {
                     $(this).find('.progress__current').animate({width : value + '%'}, duration);
                 }
                 else {
                     $(this).find('.progress__current').css({'width' : value + '%'});
                 }
                 
             });
          }

//           inview progress bars
//            $('.progress').one('inview', function (event, visible) {
//                if (visible == true) {
                     
//                }
//            });

          var inview = new Waypoint.Inview({
            element: $('.progress')[0],
            enter: function(direction) {
              init_progressBar(2000);
            }
          });
	</script>

<style type="text/css">
 	#body{ padding-top: 100px; }
 	.countPage {
	  	font-size: 13px;
	   	margin-top: 10px;
	}
	 
 	.search{
		margin-right : 30px;
	} 
	
 	section{
		margin-bottom : 30px
	}
	
	.movieNm {
		  font-size: 0px;
		  font-weight: bold;
		  display: block;
		  margin-bottom: 0px;
		  margin-top: 0px;
	}
		html{
	        height: auto;
	  	}
	  	
.ui.modal > .close {
  cursor: pointer;
  position: absolute;
  top: -2.5rem;
  right: -2.5rem;
  z-index: 1;
  opacity: 0.8;
  font-size: 1.25em;
  color: #FFFFFF;
  width: 2.25rem;
  height: 2.25rem;
  padding: 0.625rem 0rem 0rem 0rem;
}  	  


.ui.modal > .header {
  display: block;
  font-family: 'Lato', 'Helvetica Neue', Arial, Helvetica, sans-serif;
  background: #FFFFFF;
  margin: 0em;
  padding: 1.25rem 1.5rem;
  box-shadow: none;
  color: rgba(0, 0, 0, 0.85);
  border-bottom: 1px solid rgba(34, 36, 38, 0.15);
}

button:-moz-focusring,
[type="button"]:-moz-focusring,
[type="reset"]:-moz-focusring,
[type="submit"]:-moz-focusring {
  outline: 0px dotted ButtonText;
}

.ui.modal {
  display: none;
  position: fixed;
  z-index: 1001;
  top: 00%;
  left: 50%;
  text-align: left;
  background: #000000;
  border: none;
  box-shadow: 1px 3px 3px 0px rgba(0, 0, 0, 0.2), 1px 3px 15px 2px rgba(0, 0, 0, 0.2);
  -webkit-transform-origin: 00% 25%;
  transform-origin: 50% 25%;
  border-radius: 0.28571429rem;
  -webkit-user-select: text;
  -moz-user-select: text;
  -ms-user-select: text;
  user-select: text;
  will-change: top, left, margin, transform, opacity;
}

.col-xs-7 {
  width: 58.33333333%;
  font-size: 15px;
}

progress {
	margin-top:0px;
  display: inline-block;
  /* 1 */
  vertical-align: baseline;
  /* 2 */
}
.progress__bar {
  margin-bottm:30px;
  /* height: 15px; */
  padding: 1px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  background-color: #4c4145;
}
.progress .progress__info {
  font-weight: bold;
  margin-bottom: 0px;
    margin-top: 0px;
}
.btn-success {
    color: #ffffff;
    background-color: #582cb9;
    border-color: #582cb9;
    position: relative;
    left: 80px;
}
.btn-success:hover {
  color: #ffffff;
  background-color: #be41e8;
  border-color: #be41e8;
}
 

</style>



</html>
