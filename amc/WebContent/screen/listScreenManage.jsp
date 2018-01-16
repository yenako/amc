<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>



</head>

<body>
	<div class="wrapper">
		<!-- Banner -->
		<div class="banner-top">
			<img alt='top banner' src="../images/banners/space.jpg">
		</div>

		<!-- Header section -->
		<header class="header-wrapper header-wrapper--home">
			<jsp:include page="/layout/topToolbar.jsp" />
		</header>

		<div class="container">

			<!-- Main content -->
			<section class="container">

				<!-- Search bar -->
				<div class="col-sm-12">

					<h2 class="page-heading">상영관리</h2>
					<div class="tags-area tags-area--thin">
						<div class="container container--add">
							<div class="col-sm-6 text-left">
								<p class="countPage">전체 ${resultPage.totalCount } 건, 현재 ${resultPage.currentPage } 페이지</p>
							</div>
							<div class="col-sm-6 text-right">
								<form id='search-form'>
									<input type="text" placeholder="검색어입력" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
									<select name="searchCondition" id="movie-search-sort" class="" tabindex="0">
										<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>영화제목</option>
										<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>감독명</option>
									</select>
									<button type='submit' class="btn btn-md btn--danger search__button" name="search">검색하기</button>
									<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}" />
								</form>



							</div>
						</div>
					</div>



					<div class="cinema-wrap">
						<div class="row">
							<c:set var="i" value="0" />
							<c:forEach var="screen" items="${list }">
								<c:set var="i" value="${i+1 }" />
								<div class="col-xs-12 col-sm-3">
									<div class=" cinema-item">
										<div class="cinema">
											<a href='/screen/getScreenContentList/${screen.movieNo}' class="cinema__images">
												<img id="poster" alt='' src="${screen.postUrl }">
											</a>
											<a href="/screen/getScreenContentList/${screen.movieNo}" class="movieNm">${screen.movieNm }</a>
											<p>
												<strong>개봉일</strong>
												${screen.openDt }
												<br>
												<strong>상영마감일 </strong>
												${screen.endDt }
												<br>
												<strong>감독</strong>
												${screen.director }
											</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>



					<div class="coloum-wrapper">
						<div class="pagination paginatioon--full">
							<c:if test="${resultPage.currentPage != 1 }">
								<a href='#' class="pagination__prev">prev</a>
							</c:if>
						
							<c:if test="${resultPage.maxPage !=  resultPage.currentPage}">
								<a href='#' class="pagination__next">next</a>
							</c:if>
						</div>
					</div>



				</div>


			</section>

			<div class="clearfix"></div>

		</div>


		<div>
			<jsp:include page="/layout/bottomToolbar.jsp" />
			<jsp:include page="/layout/loginModal.jsp" />
		</div>
	</div>


	<!-- Custom 이게있어야지 스크롤내릴시top버튼있음!!!!!!!!!!! -->
	<script src="/js/custom.js"></script>
	<!-- ------------------------------------  -->


	<script type="text/javascript">
        function fncGetPageList(currentPage) {

            $("#currentPage").val(currentPage)
            $("#search-form").attr("method", "POST").attr("action", "/screen/getScreenList").submit();
            $("input[name='searchKeyword']").val(searchKeyword);
        }

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

                fncGetPageList(currentPage);

            });

        });

        function changeCSS() {
            if ($(document).innerWidth() < 768) {

                $(".cinema-item").css("width", "fit-content");
            } else {

                $(".cinema-item").css("width", "auto");
            }

            if ($(document).innerWidth() >= 768 && $(document).innerWidth() < 990) {
       
                $(".cinema-item").css("height", "500px");
            } else {
         
                $(".cinema-item").css("height", "auto");
            }

        }

        $(document).ready(function() {
            init_CinemaList();

            $('.boxshadow').css("box-shadow", "0 0 0px rgba(0, 0, 0, 0)")
            //width:fit-content;

            $("#movie-search-sort").css("width", "200px");
            changeCSS()
            $(window).resize(function() {
                changeCSS();
            })
        });
    </script>


</body>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.page-heading {
	font-family: 'Jeju Gothic', sans-serif;
	margin-top: 70px;
	font-size: 30px;
}

body {
	font-family: 'Jeju Gothic', sans-serif;
}

.countPage {
	font-size: 13px;
	margin-top: 10px;
}

.search {
	margin-right: 30px;
}

.page-heading {
	margin-top: 100px
}

#search-form {
	display: block;
	margin-top: 1em;
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

.movieNm {
	font-size: 16px;
	font-weight: bold;
	display: block;
	margin-bottom: 5px;
	margin-top: 5px;
}

#poster {
	height: calc(50vh - 100px);
	width: auto;
	height: 260px;
	margin-left: auto;
	margin-right: auto;
	display: table;
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

.cinema .cinema__images:before {
	content: '';
	width: 100%;
	height: 100%;
	background-color: rgba(250, 250, 250, 0);
	position: absolute;
	top: 0;
	left: 0;
	opacity: 1;
	-webkit-transition: 0.5s;
	-o-transition: 0.5s;
	transition: 0.5s;
}

.cinema-item {
	border: dashed 1px #969b9f;
	margin: 5px;
	padding-top: 15px;
	padding-left: 5px;
	padding-right: 5px;
	border-radius: 5px;
	/* 	border-radius: 10px; */
}

.movieNm {
	font-size: 15px;
	font-weight: lighter;
	text-shadow: 1px 1px 0 #D9D9D9;
}

p {
	font-size: 13px;
	font-weight: lighter;
}

p strong {
	font-weight: nomal;
}
</style>

</html>
