<%-- <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> --%>
    <%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page import="org.springframework.util.StringUtils" %> --%>
<!doctype html>
<html>
<head>
   <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>스낵바 상품목록</title>
    <!-- Mobile Specific Metas-->
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="telephone=no" name="format-detection">
    <!-- Select -->
        <link href="/css/external/jquery.selectbox.css" rel="stylesheet" />
    
    <!-- Fonts -->
        <!-- Font awesome - icon font -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Roboto -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>
    
    <!-- Stylesheets -->
        <!--   Sweetalert2 CDN  -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.0/sweetalert2.all.min.js"></script>
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
     
        <script
        src="https://code.jquery.com/jquery-3.1.1.min.js"
        integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
        crossorigin="anonymous"></script>
		<!--아임포트 CDN -->
		<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>

<body>
   <div class="wrapper">
        <!-- Banner -->
         <div class="banner-top">
            <img alt='top banner' src="../images/banners/space.jpg">
        </div> 
        <header class="header-wrapper header-wrapper--home">
			<jsp:include page="/layout/topToolbar.jsp" />
   		</header>
  
	 <div class="container" id="body">
		<input type="hidden" name="menu" value="${param.menu}"/>
		<input type="hidden" name="maxPage" value="${resultPage.maxPage}"/>
		<input type="hidden" name="userId" value="${sessionScope.user.userId}"/>
		
	   	<!-- Main content -->
        <section class="container">
        	<!-- Search bar -->
        	<div class="col-sm-12">
                <h2 class="page-heading">${param.menu eq 'search'? "상품 목록조회" : "상품관리" }</h2>
                    <div>
                    	<div class="container container--add">
                   			<div class="col-sm-6 text-left">
                   				<p class="countPage">전체 ${resultPage.totalCount } 건, 현재 ${resultPage.currentPage } 페이지</p>
                   			</div>
                   			
	                   		<c:if test="${param.menu=='manage'}">
		       					<button type="button" class="btn btn-md btn--info"  id="btn1" 
		       						 onclick="location.href='/product/addProduct'">상 품 등 록
		       					</button>&emsp;
		       					<button type="button" class="btn btn-md btn--info"  id="btn2" 
		       						 onclick="location.href='/product/getSnackList?menu=manage&searchProdType=S'">스낵 상 품 관 리
		       					</button>&emsp;
		       					<button type="button" class="btn btn-md btn--info" id="btn3" 
		       						 onclick="location.href='/product/getGoodsList?menu=manage&searchProdType=G'">굿즈 상 품 관 리
		       					</button>	
		      				</c:if> 
				            	
 			            	<div class="col-sm-6 text-right">
				                <form id='search-form'>
				                    <input type="text" class="search__field" placeholder="검색어입력" name="searchKeyword" value="${search.searchKeyword}" onkeypress="if(event.keyCode==13) { fncGetPageList(1); return false;}"/>
					                    <select name="searchCondition" id="movie-search-sort" class="select__sort" tabindex="0">
					                        <option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
					                        <option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>가격</option>
					                    </select>
				                    <button type='button' class="btn btn-md btn--danger search__button" name="search">검색하기</button>
				                    <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}" />
				                </form>
			             	</div>
 				             
				             
			             </div>
			        </div>
		
		              <div class="tags-area tags-area--thin" style="height : 50px">
		                 <p>Welcome to Snack Bar!</p>
		
<!-- 		                    <div class="tags tags--unmarked tags--aside">
		                        <span class="tags__label">Sorted by:</span>
		                            <ul>
		                                <li class="item-wrap"><a href="#" class="tags__item item-active" data-filter='all'>all</a></li>
		                                <li class="item-wrap"><a href="#" class="tags__item" data-filter='name'>name</a></li>
		                                <li class="item-wrap"><a href="#" class="tags__item" data-filter='popularity'>popularity</a></li>
		                            </ul>
		                    </div> -->
		              </div>
 
					 <div class="cinema-wrap">
		            	<div class="row">
					 		<c:set var="i" value="0" />
	                		 <c:forEach var="product" items="${list }">
	               	 			 <c:set var="i" value="${i+1 }" />
		                 
		                            <div class="col-xs-6 col-sm-3 cinema-item">
		                                <div class="cinema">
		                                    <a href="/product/getGoodsProduct?prodNo=${product.prodNo}&menu=${param.menu}&prodMenu=${param.menu}" class="cinema__images info-modal-link">
		                                    <!-- //모달 ui를 클래스에 넣어줌 -->
		                                        <img id="poster"alt='' src="../images/uploadFiles/${product.prodImage }" >
		                                        <input type="hidden" id="prodNo" value="${product.prodNo}"/>
		                                    </a>
		                                    <a href="/product/getGoodsProduct?prodNo=${product.prodNo}&menu=${param.menu}" class="movieNm info-modal-link">${product.prodName }</a>
		                                    <p><strong>가격</strong>  ${product.prodPrice }<br/><strong>판매시작일   </strong>${product.salesOpenDate}<br/><strong>판매마감일</strong>  ${product.salesEndDate }</p>	     
                                	        <!-- <div class="col-sm-6"> -->
							                    <div class="progress">
								                      <p class="progress__info">
								                      		${param.menu eq 'search'? "현재 재고율" : "현재 판매율" }${product.salesStock}%
								                      </p>
								                      <div class="progress__bar" role="progressbar" data-level="${product.salesStock}">
								                          <div class="progress__current" style="width: 0%;"></div>
								                      </div>
							                    </div><br/><br/><br/>
							                <!-- </div> -->
		                             	</div>
	                   		       	</div>
	                		 </c:forEach>
						</div>
		            </div>     
 				</div>
 					
 					<!-- 모달 컨텐츠가 나오는 부분 인건가 -->
					<div class="ui thin info modal" id="snackmodal"> 
					  <i class="close icon"></i>
					    <div class="content" ></div>
					</div>  
 			
 					<div class="coloum-wrapper">
	                    <div class="pagination paginatioon--full">
	                    	<c:if test="${resultPage.currentPage != 1 }">
	                            <a href='#' class="pagination__prev">prev</a>
	                    	</c:if>
	                     	<c:if test="${resultPage.endUnitPage !=  resultPage.currentPage}">	            
	                            <a href='#' class="pagination__next">next</a>
	                      	</c:if>
	                    </div>
	                </div>
			</section>
		</div>
		
		<div class="clearfix"></div>
	</div>
		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />


	<!-- JavaScript-->
        <!-- jQuery 3.1.1--> 
        <script>window.jQuery || document.write('<script src="js/external/jquery-3.1.1.min.js"><\/script>')</script>
        <!-- Migrate --> 
        <script src="../js/external/jquery-migrate-1.2.1.min.js"></script>
        <!-- jQuery UI -->
        <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <!-- Bootstrap 3--> 
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script> 
        <!-- Inview -->
        <!-- <script src="js/external/jquery.inview.js"></script> -->
        <script src="../js/external/jquery.waypoints.min.js"></script>
        <script src="../js/external/inview.min.js"></script>
         <!-- Select -->
        <script src="/js/external/jquery.selectbox-0.2.min.js"></script>
        <!-- Swiper slider -->
        <script src="/js/external/idangerous.swiper.min.js"></script>
        <!-- Mobile menu -->
        <script src="../js/jquery.mobile.menu.js"></script>
        <!-- Select -->
        <script src="../js/external/jquery.selectbox-0.2.min.js"></script>
        <!-- Form element -->
        <script src="../js/external/form-element.js"></script>
        <!-- Form validation -->
        <script src="../js/form.js"></script>
        <!-- Custom -->
        <script src="../js/custom.js"></script>
          	<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
</body>
<script type="text/javascript">
			   
	$(function () {
	    $('.info-modal-link').each(function () {
	        $(this).on('click', function (e) {                   
	            e.preventDefault();
	            var url = $(this).attr('href'); 
	            $.get(url, function (data) {
	                $('.info.modal .content').html(data);
	                $(".info.modal").modal({closable:true,observeChanges:true}).modal('show'); 
	            });
	        });              
	    });
	});			   
			   
	function fncGetPageList(currentPage) {
		$("#currentPage").val(currentPage)
	    $("#search-form").attr("method", "POST").attr("action", "/product/getSnackList?menu="+$("input[name='menu']").val()+"&searchProdType=S").submit();
	    $("input[name='searchKeyword']").val(searchKeyword); 
	}


	    $('.boxshadow').css("box-shadow","0 0 0px rgba(0, 0, 0, 0)")
	    $(function() {
	        //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	        $("button[name='search']").on("click", function() {
	            fncGetPageList(1);
	        });

	        $(".pagination__next").on("click", function() {
	        	
            	searchKeyword = $("input[name='searchKeyword']").val(); 

	            var currentPage = $("#currentPage").val()
	            
	            currentPage = parseInt(currentPage) + 1
	          
	            fncGetPageList(currentPage);
	        });

	        $(".pagination__prev").on("click", function() {
	            var currentPage = $("#currentPage").val()
	      
	            currentPage = parseInt(currentPage) - 1
	            
	            fncGetPageList(currentPage);
	        	
	        });
	    });
	    
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
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.page-heading {
	font-family: 'Jeju Gothic', sans-serif;
	margin-top: 100px
}
#btn1 {
    position: absolute;
    background-color: #6dc5dd;
    border: solid 1px #6ac7f7;
    left: 1050px;
    bottom:50px;
}
#btn2 {
    position: absolute;
    background-color: #6dc5dd;
    border: solid 1px #6ac7f7;
    left: 900px;
    bottom:50px;
}
#btn3 {
    position: absolute;
    background-color: #6dc5dd;
    border: solid 1px #6ac7f7;
    left: 750px;
    bottom:50px;
}
#search-form {
    position: static;
    display: block;
    margin-top: 1em;
    right: 300px;
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
		  font-size: 16px;
		  font-weight: bold;
		  display: block;
		  margin-bottom: 5px;
		  margin-top: 5px;
	} 
 	html{
        height: auto;
  	}
 

.cinema .cinema__images:before {
    content: '';
    width: 100%;
    height: 100%;
    background-color: rgba(76, 65, 69, 0.0);
    position: absolute;
    top: 0;
    left: 0;
    opacity: 1;
    -webkit-transition: 0.5s;
    -o-transition: 0.5s;
    transition: 0.5s;
}
progress {
	margin-top:0px;
  display: inline-block;
  /* 1 */
  vertical-align: baseline;
  /* 2 */
}
.progress__bar {
position:relative;
bottom: 30px;
  margin-bottm:30px;
  /* height: 15px; */
  padding: 1px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  background-color: #4c4145;
}

.progress .progress__info {
position:relative;
bottom: 30px;
  font-weight: bold;
  margin-bottom: 0px;
    margin-top: 0px;
}

 #snackmodal{
  display: fade in;
    position: fixed;
  bottom : 750px;
  z-index: 1001;
  left: 50%;
  text-align: center;
  vertical-align: top;
  background: #000000;
  border: none;
  box-shadow: 1px 3px 3px 0px rgba(0, 0, 0, 0.2), 1px 3px 15px 2px rgba(0, 0, 0, 0.2);
  -webkit-transform-origin: 50% 25%;
  transform-origin: 50% 25%;
  border-radius: 0.28571429rem;
  -webkit-user-select: text;
  -moz-user-select: text;
  -ms-user-select: text;
  user-select: text;
  will-change: top, left, margin, transform, opacity;
}
.col-xs-7 {
    position: relative;
    width: 58.33333333%;
    font-size: 13px;
    left: 50px;
}

p {
	font: 'Jeju Gothic', sans-serif;
    font-size: 13px;
    line-height: 28px;
    color: #4c4145;
    margin-bottom: 28px;
}

.search__button {
	padding: 5px 5px 5px 5px;
}

input, select {
	height: 30px;
	width: auto;
	border: none;
	box-shadow: none;
	border: 1px solid #dbdee1;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	font-size: 13px;
	color: #b4b1b2;
}

select {
	font-family: 'Jeju Gothic', sans-serif;
}

option {
	width: 140px;
	top: 37px !important;
	border: none;
	padding: 14px 7px;
	z-index: 23;
	background-color: #4c4145;
	-webkit-box-shadow: 0 0 10px rgba(0, 0, 0, 0.16);
	-moz-box-shadow: 0 0 10px rgba(0, 0, 0, 0.16);
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.16);
}

 
</style>
</html>