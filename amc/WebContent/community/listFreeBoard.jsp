<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <c:if test="${ indexList eq null }">
 	<jsp:forward page="/cinema/index"/>
</c:if> --%>

<!doctype html>
<html>
<head>
<meta charset="EUC-KR">

<link href="/css/external/jquery.selectbox.css" rel="stylesheet" />
</head>

<body>
	<div class="wrapper">
		<c:set var="who" value="" />
		<c:if test="${sessionScope.user.role ne 'admin'}">
			<c:set var="who" value="search" />
		</c:if>
		<c:if test="${sessionScope.user eq null || sessionScope.user eq ''}">
			<c:set var="who" value="search" />
		</c:if>
		<c:if test="${sessionScope.user.role eq 'admin'}">
			<c:set var="who" value="admin" />
		</c:if>
		<!-- Banner -->
		<div class="banner-top">
			<img alt='top banner' src="../images/banners/space.jpg">
		</div>
		<header class="header-wrapper header-wrapper--home">
			<!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="/layout/topToolbar.jsp" />
			<!-- ToolBar End /////////////////////////////////////-->
		</header>


		<!-- Main content -->
		<div class="container">


			<div class="clearfix"></div>

			<section class="container">
				<div class="col-md-12">
					<h2 class="page-heading">자유게시판</h2>
					<div class="col-md-12 tags-area tags-area--thin">
						<div class="col-md-12 col-sm-12 container container--add">
							<div class="col-md-6 col-sm-6 text-left count">
								<p class="countPage">전체 ${resultPage.totalCount } 건, 현재 ${resultPage.currentPage } 페이지</p>
							</div>
							<div class=" col-md-6 col-sm-6 text-right">

								<form id='search-form'>
									<input type="text" placeholder="검색어입력" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
									<select name="searchCondition" id="movie-search-sort" class="" tabindex="0">
										<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>제목</option>
										<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>내용</option>
										<option value="3" ${ ! empty search.searchCondition && search.searchCondition==3 ? "selected" : "" }>작성자</option>
									</select>
									<button type='submit' class="btn btn-md btn--danger search__button" name="search">검색하기</button>
									<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}" />
								</form>

							</div>
						</div>
					</div>

					<div class="col-md-12 text-right write">
						<c:if test="${user.userId != null }">
							<button type="button" class="btn btn-md btn--warning btn--wider" id='writeButton'>
								<i class="fa fa-pencil"></i> 글쓰기
							</button>
						</c:if>
					</div>




					<div class="freeBoardTable hidden-xs">
						<table>
							<tr class="col-md-12 col-sm-12 freeBoardField">
								<td class="col-md-1 col-sm-1 text-center">번호</td>
								<td class="col-md-6 col-sm-6">제목</td>
								<td class="col-md-2 col-sm-2 text-center">글쓴이</td>
								<td class="col-md-1 col-sm-1 text-center">HIT</td>
								<td class="col-md-2 col-sm-2 text-center">등록일</td>
							</tr>
						</table>

						<div>
							<table>

								<c:set var="i" value="0" />
								<c:forEach var="noticeList" items="${map.noticeList }">
									<tr class="col-md-12 col-sm-12 freeBoardRecordNotice">
										<td class="col-md-1 col-sm-1  text-center "><i class="fa fa-bullhorn" aria-hidden="true"></i></td>
										<td class="col-md-6 col-sm-6 title">
											<a href="/community/getFreeBoard?freeBoardNo=${noticeList.freeBoardNo}">${ noticeList.freeBoardTitle}</a>
											(${map.noticeCommentCount[i]})
										</td>
										<td class="col-md-2 col-sm-2 text-center">${ noticeList.user.userId}</td>
										<td class="col-md-1 col-sm-1 text-center">${ noticeList.freeBoardViews}</td>
										<td class="col-md-2 col-sm-2 text-center">${ noticeList.freeBoardRegDate}</td>
									</tr>

									<c:set var="i" value="${i+1 }" />
								</c:forEach>


								<c:set var="i" value="0" />
								<c:forEach var="freeBoard" items="${map.list }">
									<tr class="col-md-12 col-sm-12 freeBoardRecord">
										<td class="col-md-1 col-sm-1  text-center ">${ freeBoard.freeBoardNo}</td>
										<td class="col-md-6 col-sm-6 title">
											<a href="/community/getFreeBoard?freeBoardNo=${freeBoard.freeBoardNo}">${ freeBoard.freeBoardTitle}</a>
											(${map.freeBoardCommentCount[i]})


										</td>
										<td class="col-md-2 col-sm-2 text-center">${ freeBoard.user.userId}</td>
										<td class="col-md-1 col-sm-1 text-center">${ freeBoard.freeBoardViews}</td>
										<td class="col-md-2 col-sm-2 text-center">${ freeBoard.freeBoardRegDate}</td>
									</tr>
									<c:set var="i" value="${i+1 }" />
								</c:forEach>
							</table>
						</div>
					</div>

					<div class="freeBoardTable hidden-md hidden-sm hidden-lg">


						<div class="freeBoardFieldXS text-center" style="height: 50px; font-size: 10px;">
							<div class="col-xs-12">제목</div>
							<div class="col-xs-4">글쓴이</div>
							<div class="col-xs-4">HIT</div>
							<div class="col-xs-4">등록일</div>
						</div>

						<div>
							<div>
								<c:set var="i" value="0" />
								<c:forEach var="noticeList" items="${map.noticeList }">
									<div class="freeBoardRecordXS">
										<div class="col-xs-2 notice"><i class="fa fa-bullhorn text-center " aria-hidden="true"></i></div>
										<div class="col-xs-10 title">
											<a href="/community/getFreeBoard?freeBoardNo=${noticeList.freeBoardNo}">${ noticeList.freeBoardTitle}</a>
											(${map.noticeCommentCount[i]})
										</div>
										<div class="col-xs-12 text-center recordXs">
											<div class="col-xs-4"></div>
											<div class="col-xs-3">${ noticeList.user.userId}</div>
											<div class="col-xs-2">${ noticeList.freeBoardViews}</div>
											<div class="col-xs-3">${ noticeList.freeBoardRegDate}</div>
										</div>
										<div class="col-xs-12 xsHr">
											<hr />
										</div>
									</div>
									<c:set var="i" value="${i+1 }" />
								</c:forEach>
							</div>
							<div>

								<c:set var="i" value="0" />
								<c:forEach var="freeBoard" items="${map.list }">
									<div class="freeBoardRecordXS">
										<div class="col-xs-2 boardNo">${ freeBoard.freeBoardNo}</div>
										<div class="col-xs-10 title">
											<a href="/community/getFreeBoard?freeBoardNo=${freeBoard.freeBoardNo}">${ freeBoard.freeBoardTitle}</a>
											(${map.freeBoardCommentCount[i]})
										</div>
										<div class="col-xs-12 text-center recordXs">
											<div class="col-xs-4"></div>
											<div class="col-xs-3">${ freeBoard.user.userId}</div>
											<div class="col-xs-2">${ freeBoard.freeBoardViews}</div>
											<div class="col-xs-3">${ freeBoard.freeBoardRegDate}</div>
										</div>
										<div class="col-xs-12 xsHr">
											<hr />
										</div>
									</div>
									<c:set var="i" value="${i+1 }" />
								</c:forEach>
							</div>
						</div>

					</div>

					<div class="clearfix"></div>

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

            $("#search-form").attr("method", "POST").attr("action", "/community/getFreeBoardList").submit();
            $("input[name='searchKeyword']").val(searchKeyword);
        }

        $(document).ready(function() {
            init_MovieList();

            if ($('html').height() < window.outerHeight) {
                $('html').css('height', '100%');
            }

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

            $(document).on("click", "#writeButton", function() {

                $(self.location).attr("href", "/community/addFreeBoard");

            })

        });
    </script>


</body>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.page-heading {
	font-family: 'Jeju Gothic', sans-serif;
	margin-top: 70px
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}

html {
	height: auto;
}

section {
	padding-bottom: 30px
}

.xsHr hr {
	margin-top: 0px;
	margin-bottom: 0px;
	border: solid 0.5px #4c4145;
}

.count {
	margin-top: 10px;
	margin-buttom: 10px;
}

#writeButton {
	font-size: 13px;
	text-align: center;
	margin-right: 20px;
	color: #4C4145;
	padding: 10px 10px 10px 10px;
}

.countPage {
	font-size: 13px;
	margin-top: 10px;
}

.freeBoardField, .freeBoardFieldXS {
	font-size: 14px;
	font-weight: bold;
	height: 150%;
	vertical-align: middle;
	padding-top: 5px;
	color: #FFFFFF;
	background-color: #4C4145;
}

.freeBoardField td {
	height: 100%;
	padding-top: 8px;
	padding-bottom: 10px;
}

.freeBoardFieldXS div {
	padding-top: 1px;
	padding-bottom: 1px;
	height: 50%;
	background-color: #4C4145;
}

.freeBoardRecord, freeBoardRecordXS, .freeBoardRecordNotice {
	font-size: 13px;
	height: 50px;
	vertical-align: middle;
	padding-top: 5px;
	color: #4C4145;
}

.freeBoardRecordXS div {
	margin-bottom: 5px;
}

.freeBoardRecordXS .title {
	margin-top: 5px;
}

.freeBoardRecord>td, .freeBoardRecordNotice>td {
	border-bottom: 1px solid #969b9f;
	padding: 15px;
}

.freeBoardRecordNotice .title {
	font-size: 13px;
	font-weight: bold;
}

.recordXs {
	font-size: 10px;
}

.boardNo {
	margin-top: 5px;
	font-size: 10px;
	color: #969b9f;
}

.title a :hover {
	color: #fe505a;
}

.tags-area {
	border-top: 1px solid #dbdee1;
	border-bottom: 1px solid #dbdee1;
	margin-top: inherit;
	padding-top: inherit;
}

.tags-area--thin {
	padding-top: inherit;
	padding-bottom: inherit;
	margin-top: inherit;
}

.write {
	margin-top: 10px;
	margin-bottom: 10px;
}

#search-form {
	display: block;
	margin-top: 1em;
	margin-bottom: 1em;
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
