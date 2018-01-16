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
							<strong>��ǰ������</strong>
						</c:if>
						<c:if test="${param.menu=='manage'}">
							������ ����
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
								<dt>��ǰ��</dt>
								<dd>${product.prodName}</dd>
							</dl>
							<dl class="dl-horizontal">
								<dt>�� ����</dt>
								<dd>${product.totalStock} ��</dd>						
							</dl>
							<dl class="dl-horizontal">
								<dt>���� ������</dt>
								<dd>${product.stock} ��</dd>
							</dl>
							<dl class="dl-horizontal">
								<dt>�ǸŽ�����</dt>
								<dd>${product.salesOpenDate}</dd>
							</dl>
							<dl class="dl-horizontal">
								<dt>�Ǹ�������</dt>
								<dd>${product.salesEndDate}</dd>
							</dl>
							<dl class="dl-horizontal">
								<dt>����</dt>
								<dd>${product.prodPrice} ��</dd>
							</dl>
							<dl class="dl-horizontal">
								<dt>��ǰ������</dt>
								<dd>${product.prodDetail}</dd>
							</dl>
							<dl class="dl-horizontal">
								<dt>��ǰ��������</dt>
								<dd>${product.prodSetInfo}</dd>
							</dl>
							<div class="btn-group" role="group">
								<br/>
								<a href="#" class="btn btn-success" role="button">�����Ϸ�����</a> 
							<%--  <c:if test="${param.menu=='search' && !empty user}">
								<a href="#" class="btn btn-success" role="button">�����Ϸ�����</a>
							</c:if> --%> 
							</div>
						</div>
					</div><!-- ���� ��ǰ���� -->
			
				<!-- Progress bar -->
	                <div class="col-sm-4">
	                    <div class="progress">
	                      <!-- <p class="progress__info">���� �Ǹŷ�</p> -->
	                      <p class="progress__info">
	                      	${param.menu eq 'search'? "���� �����" : "���� �Ǹ���" }${product.salesStock}%
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
/* 			$('a.add:contains("Ȯ��")').bind('click',function(){
				self.location.href = 'getGoodsList?menu=manage';
			});
			
			$('a.add:contains("�߰����")').bind('click',function(){
				self.location.href = 'addProduct';
			}); */
			
			$('a.btn-default:contains("�������")').bind('click',function(){
				alert("modal�� �巯�������� �Ǵ�?");
				self.location.href = 'getGoodsList?menu=${param.menu}'+'&searchKeyword=G';
			});

			$('a.btn-success:contains("�����Ϸ�����")').bind('click',function(){
				if('${sessionScope.user.userId}'== ''){				
					/* $('.overlay').removeClass('close').addClass('open'); */
					swal('�α��� �� ���Ű��� �մϴ�.');
					
					swal({
						  title: '�α��� �� ���� �����մϴ�.',
						  text: "'��'�� �����ø� �α��� �������� �̵��մϴ�!",
						  type: 'info',
						  showCancelButton: true,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  confirmButtonText: 'YES'
						}).then(function () {
						  swal({	   
							  type: 'success',
							  title: '�α��� �������� �̵��մϴ�.',
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
