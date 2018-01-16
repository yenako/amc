<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html>

<head>
<!-- Basic Page Needs -->
<meta charset="EUC-KR">
<title>회원 목록조회</title>
<!-- Select -->
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
			<jsp:include page="/layout/topToolbar.jsp" />
		</header>
		<div class="container">
			<div class="clearfix"></div>
			<section class="container">
				<div class="col-md-12">
					<h2 class="page-heading">회원 목록 조회</h2>




					<div class="tags-area tags-area--thin">
						<div class="container container--add">
							<div class="col-sm-6 text-left">
								<p class="countPage">전체 ${resultPage.totalCount } 건, 현재 ${resultPage.currentPage } 페이지</p>
							</div>
							<div class="col-sm-6 text-right">
								<form id='search-form'>
									<input type="text" placeholder="검색어입력" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
									<select name="searchCondition" id="movie-search-sort" class="" tabindex="0">
										<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>회원ID</option>
										<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>회원이름</option>
									</select>
									<button type='submit' class="btn btn-md btn--danger search__button" name="search">검색하기</button>
									<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}" />
								</form>
							</div>
						</div>
					</div>




					<table class="table table-hover table-striped hidden-xs">
						<thead class="userListField">
							<tr class="listTitle">
								<th align="center">No</th>
								<th align="left">회원 ID</th>
								<th align="left">회원명</th>
								<th align="left">주소</th>
								<th align="left">계정구분</th>
								<!-- <th align="left">간략정보</th> -->
							</tr>
						</thead>

						<tbody>
							<c:set var="i" value="0" />
							<c:forEach var="user" items="${list}">
								<c:set var="i" value="${ i+1 }" />
								<tr class="userListRecord">
									<td align="center">${ i }</td>
									<td align="left" title="Click : 회원정보 확인">${user.userId}</td>
									<td align="left">${user.userName}</td>
									<td align="left">${user.addr}</td>
									<td align="left">${user.role}</td>
									<!-- <td align="left"></td> -->
									<%-- <i class="glyphicon glyphicon-ok" id= "${user.userId}"></i> --%>
									<%-- <input type="hidden" value="${user.userId}"> --%>
								</tr>
							</c:forEach>

						</tbody>
					</table>





					<div class="xsDisplay">
						<div class="hidden-lg hidden-md hidden-sm ">

							<div class="listTitleXs col-xs-12">
								<div class="col-xs-12">회원아이디</div>
								<div class="col-xs-8">회원명</div>
								<div class="col-xs-4 text-center">계정구분</div>
							</div>

							<c:forEach var="user" items="${list}">
								<div class="col-xs-12">
									<div class="col-xs-12 xsUserId" title="Click : 회원정보 확인">${user.userId}</div>
									<div class="col-xs-8 xsUserName">${user.userName}</div>
									<div class="col-xs-4 xsUserRole">${user.role}</div>
									<hr class="col-xs-11">
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
		</div>
		<div class="clearfix"></div>

		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />
	</div>
	<!-- JavaScript-->
	<!-- jQuery 3.1.1-->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
	<script>
        window.jQuery || document.write('<script src="/js/external/jquery-3.1.1.min.js"><\/script>')
    </script>
	<!-- Migrate -->
	<script src="/js/external/jquery-migrate-1.2.1.min.js"></script>
	<!-- jQuery UI -->
	<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<!-- Bootstrap 3-->
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>

	<script src="/js/external/modernizr.custom.js"></script>

	<!-- Mobile menu -->
	<script src="/js/jquery.mobile.menu.js"></script>
	<!-- Select -->
	<script src="/js/external/jquery.selectbox-0.2.min.js"></script>


	<!-- Custom -->
	<script src="/js/custom.js"></script>

</body>

<script type="text/javascript">
    //=============    검색 / page 두가지 경우 모두  Event  처리 =============	

    function fncGetPageList(currentPage) {

        $("#currentPage").val(currentPage)
        $("#search-form").attr("method", "POST").attr("action", "/user/getUserList").submit();
        $("input[name='searchKeyword']").val(searchKeyword);
    }

    //============= userId 에 회원정보보기  Event  처리(Click) =============	
    $(function() {
        $('.boxshadow').css("box-shadow", "0 0 0px rgba(0, 0, 0, 0)")
        //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
        $("td:nth-child(2)").on("click", function() {
            self.location = "/user/getUser?userId=" + $(this).text().trim();
        });

        $(".xsUserId").on("click", function() {
            self.location = "/user/getUser?userId=" + $(this).text().trim();
        });

        //==> userId LINK Event End User 에게 보일수 있도록 
        $("td:nth-child(2)").css("color", "red");

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

    //============= userId 에 회원정보보기  Event  처리 (double Click)=============
    $(function() {

        //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
        $("td:nth-child(5) > i").on("click", function() {

            /* var userId = $(this).next().val(); */
            var userId = $(this).next().val().trim();
            var tempId = userId.split(".");
            console.log("tempId :: " + tempId);
            $.ajax({
                url : "/user/json/getUser/" + tempId,
                method : "GET",
                dataType : "json",
                headers : {
                    "Accept" : "application/json",
                    "Content-Type" : "application/json"
                },
                success : function(JSONData, status) {

                    var displayValue = "<h6>" + "아이디 : " + JSONData.userId + "<br/>" + "이  름 : " + JSONData.userName + "<br/>" + "주소 : " + JSONData.addr + "<br/>" + "ROLE : " + JSONData.role + "<br/>" + "등록일 : " + JSONData.regDate + "<br/>" + "</h6>";
                    $("h6").remove();
                    $("#" + userId + "").html(displayValue);
                }
            });
            ////////////////////////////////////////////////////////////////////////////////////////////

        });

        //==> userId LINK Event End User 에게 보일수 있도록 
        $(".ct_list_pop td:nth-child(3)").css("color", "red");
        $("h7").css("color", "red");

        //==> 아래와 같이 정의한 이유는 ??
        $(".ct_list_pop:nth-child(4n+6)").css("background-color", "whitesmoke");
    });
</script>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.page-heading {
	font-family: 'Jeju Gothic', sans-serif;
	margin-top: 100px
}

#body {
	padding-top: 100px;
}

.listTitle, .listTitleXs {
	font-size: 10px;
	font-weight: bold;
	height: auto;
	vertical-align: middle;
	padding-top: 5px;
	color: #FFFFFF;
	background-color: #4C4145;
}

.listTitleXs {
	font-size: 13px;
}

.listTitleXs  div {
	padding: 5px 0px 5px 0px
}

html {
	height: auto;
}

section {
	margin-bottom: 30px
}

#writeButton {
	font-size: 13px;
	text-align: center;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-right: 20px;
	color: #4C4145;
	padding: 10px 10px 10px 10px;
}

.countPage {
	font-size: 13px;
	margin-top: 10px;
}

.search {
	margin-right: 30px;
}

.title {
	font-size: 13px;
	font-weight: bold;
}

.title:hover {
	color: #fe505a;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
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

.userListTable {
	margin-top: 15px;
}

.userListField th {
	height: 100%;
	padding-top: 8px;
	padding-bottom: 10px;
	font-size: 13px;
	padding-left: 5px;
}

.userListRecord td {
	font-size: 13px;
	height: 40px;
	vertical-align: middle;
	padding-top: 5px;
	color: #4C4145;
	border-bottom: 1px solid #969b9f;
	padding: 15px;
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

hr {
	margin-top: 5px;
	margin-bottom: 5px;
	border: solid 0.1px #4c4145;
}

.xsUserId {
	font-size: 10pt;
}

.xsUserRole, .xsUserName {
	font-size: 9pt
}

.xsDisplay {
	margin: 20px 0px 20px 0px
}
</style>


</html>