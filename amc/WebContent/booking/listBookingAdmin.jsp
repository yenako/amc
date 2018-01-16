<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html>
<head>
	<!-- Basic Page Needs -->
     <meta charset="utf-8">
     <title>관리자용 예매목록</title>
     <meta name="description" content="A Template by Gozha.net">
     <meta name="keywords" content="HTML, CSS, JavaScript">
     <meta name="author" content="Gozha.net">
 
 	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<link href="/css/external/jquery.selectbox.css" rel="stylesheet" />	
</head>

<body>
    <div class="wrapper">
        <!-- Banner -->
        <div class="banner-top">
            <img alt='top banner' src="../images/banners/space.jpg">
        </div>
        <header class="header-wrapper header-wrapper--home">
			<!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="/layout/topToolbar.jsp" />
			<!-- ToolBar End /////////////////////////////////////-->
   		</header>
   		
   		<br><br><br>

        
        <!-- Main content -->
        <div class="container">
            
            
            <div class="clearfix"></div>
			
			<section class="container">
            <div class="col-md-12">
                <h2 class="page-heading">예매 목록</h2>
                	<div class="col-md-12 tags-area tags-area--thin">
			             <div class="col-md-12 container container--add">
			                <div class="col-sm-6 text-left">
			            		 <p class="countPage">전체 ${resultPage.totalCount } 건, 현재 ${resultPage.currentPage } 페이지</p>
			            	</div>
   							<div class="search-wrapper">   						
    			            	<div class="col-sm-6 text-right">
				                <form id='search-form' class="search ">
				                    <input type="text" class="search__field" placeholder="검색어입력" name="searchKeyword"
				                    value="${!empty search.searchKeyword ? search.searchKeyword : '' }">
				                    <select name="searchCondition" id="movie-search-sort" class="select__sort" tabindex="0">
				                        <option value="userId" ${ ! empty search.searchCondition && search.searchCondition eq "userId" ? "selected" : "" }>회원아이디</option>
				                        <option value="movieTitle" ${ ! empty search.searchCondition && search.searchCondition eq "movieTitle" ? "selected" : "" }>영화제목</option>
				                        <option value="bookingNo" ${ ! empty search.searchCondition && search.searchCondition eq "previewFlag" ? "selected" : "" }>예매번호</option>	                     
				                    </select>
				                    <button type='button' class="btn btn-md btn--danger search__button" name="search">검색하기</button>
				                    <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}" />
				                </form>
				             </div>				            
							</div>		
			             </div>
			        </div>
			        
			        <div class ="col-md-12 text-right">
			        </div>
			        
				<div class ="col-md-12 col-xs-12 freeBoardTable">
			        <table  class ="col-md-12">
			        	<tr class=" col-md-12 freeBoardField">
			        		<td class="col-md-1 text-center" >NO</td>
			        		<td class="col-md-2 text-center" >회원아이디</td>
			        		<td class="col-md-3 text-center">예매번호</td>
			        		<td class="col-md-3 text-center">영화제목</td>
			        		<td class="col-md-3 text-center" >예매일시</td>
			        	</tr>
			        	
			        <c:set var="i" value="0" />	
	        		 <c:forEach var="booking" items="${list }">    
	        		   <c:set var="i" value="${ i+1 }" />        
		   	     		 <tr class ="col-md-12 freeBoardRecord">                        
	                     	<td class="col-md-1 text-center ">${i}</td>
	                     	<td class="col-md-2 text-center">${booking.userId}</td>
	                     	<td class="col-md-3 title bookingNo"> ${booking.bookingNo}
							  <input type="hidden" name="bookingNo" value="${booking.bookingNo}"></td>					     	
					     	<td class="col-md-3 text-center movieName">${booking.movie.movieNm} 
							   <input type="hidden" name="movieNo" value="${booking.movie.movieNo}"></td>	
					    	<td class="col-md-3 text-center">${booking.bookingRegDate}</td>	
					 	 </tr>
                     </c:forEach>			        
			        </table>

	
	              <div class="clearfix"></div>
	                    
	                <div class="coloum-wrapper">
	                    <div class="pagination paginatioon--full">
	                    <c:if test="${resultPage.currentPage != 1 }">
	                            <a href='javascript:fncGetPrePage();' class="pagination__prev">prev</a>
	                    </c:if>
	                     <c:if test="${resultPage.maxPage !=  resultPage.currentPage}">	            
	                            <a href='javascript:fncGetNextPage();' class="pagination__next">next</a>
	                      </c:if>
	                    </div>
	                </div>
	
	            </div>
            </div>

        </section>      
        </div>
        
        <div class="clearfix"></div>

     	<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />
      
    </div>

		
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
		
	 function fncGetPageList(currentPage) {
	        $("#currentPage").val(currentPage)		  		      
	        $("#search-form").attr("method", "POST").attr("action", "/booking/getAdminBookingList").submit();
	 }
	 
	 function fncGetNextPage() {
	 	var currentPage = ${resultPage.currentPage};
        $("#currentPage").val(currentPage+1)		  		      
        $("#search-form").attr("method", "POST").attr("action", "/booking/getAdminBookingList").submit();
	 }
	 function fncGetPrePage() {
		 var currentPage = ${resultPage.currentPage};   
		 $("#currentPage").val( currentPage-1)		  		      
	     $("#search-form").attr("method", "POST").attr("action", "/booking/getAdminBookingList").submit();
	 }
	 
           $(document).ready(function() {
               init_MovieList();

               if($('html').height() < window.outerHeight){
               	$('html').css('height', '100%');
               }
   			
           });
           
   		
   		//A. 예매번호 클릭시 예매상세페이지 이동
   		$(document).on("click", ".bookingNo",  function(){
   			
   			var bookingNo =  $($(this).find("input[name='bookingNo']")).val();
   			self.location = "/booking/getBooking?bookingNo="+bookingNo;
   		});
   		
   		//B. 영화제목 클릭시 영화상세페이지 이동
   		$(document).on("click", ".movieName",  function(){
   			
   			var movieNo =  $($(this).find("input[name='movieNo']")).val();
   			self.location = "/movie/getMovie?movieNo="+movieNo+"&menu=search";
   		});
   		
   		//C. 검색
		$("button[name='search']").on("click", function() {
               	
               	fncGetPageList(1);
	    });

	</script>

</body>

<style type="text/css">
html{
  height: auto;
}
			
    
section{
	margin-bottom : 30px
}
.page-heading{
	margin-top : 100px
}

.search .search__field {
  display: inline-block;
  width: 400px;
  padding: 9px 30px 9px 19px;
  margin-top: 14px;
  line-height: 18px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  border: solid 1px #dbdee1;
  background-color: #fff;
  color: #4c4145;
  font-size: 13px;
}
.search .search__sort {
  opacity: 0;
}
.search .search__button {
  position: absolute;
  top: 14px;
  right: 0;
  z-index: 3;
}
.search .sbHolder {
  display: inline-block;
  position: absolute;
  top: 15px;
  right: 100px;
  width: 100px;
  height: 35px;
  border: none;
  border-left: 1px solid #dbdee1;
  background-color: #fff;
}

.search .sbHolder .sbSelector {
	display: block;
	height: 30px;
	left: 0;
	line-height: 30px;
	outline: none;
	overflow: hidden;
	position: absolute;
	text-indent: 10px;
	top: 0;
	width: 100px;
	
  margin-top: 4px;
  margin-right: 150px;
  color: #4c4145;
  font-size: 13px;
}
.search .sbHolder .sbOptions {
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

.search .sbHolder .sbToggle {
  top: 10px;
  right: 50px;
}
.search .sbHolder .sbToggle:before {
  content: "\f078";
  color: #4c4145;
  font-family: "FontAwesome";
  font-size: 12px;
  position: absolute;
  top: 0px;
  left: 0px;
}
.search .sbHolder .sbToggleOpen:before {
  content: "\f077";
}
.sbHolder {
  outline: none;
}


.search-wrapper {
  background-color: #ffffff;
  height: 50px;
}
    	  #writeButton {
			font-size: 13px;
			 text-align : center;
  			margin-top: 10px;
  			margin-bottom: 10px;
  		margin-right: 20px;
  			color : #4C4145;
  			padding : 10px 10px 10px 10px;
			}
    .countPage {
		  font-size: 13px;
		   margin-top: 10px;
		}
		.search{
			margin-right : 30px;
		}
		
		.freeBoardField{

			font-size : 15px;
			font-weight: bold;
			height:40px;	
			vertical-align : middle;
			padding-top : 10px;
			color:#FFFFFF;
			background-color : #4C4145;
		}
		.freeBoardRecord{
			font-size : 13px;
			height:50px;
		
			vertical-align : middle;
			padding-top : 5px;
			color:#4C4145;
		}


	.freeBoardRecord>td{
   	border-bottom : 1px solid #969b9f;
   	padding : 15px;
	}
 
.title {
  font-size: 13px;
  font-weight: bold;
}
.title:hover {
  color: #fe505a;
}


</style>

</html>

