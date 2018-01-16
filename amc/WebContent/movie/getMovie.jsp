<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
<meta charset="EUC-KR">

<!-- Mobile Specific Metas-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<link href="/css/style.css?v=1" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<script src="/js/external/modernizr.custom.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
<style type="text/css">
.ticketOpenDate {
	background-color: #dbdee1;
	margin-bottom: 10px;
	/* 	padding: 10px 10px 10px 10px;
	
	border-radius: 5px;*/
	width: 50%;
	margin-top: 10px;
}
</style>
</head>

<body>

	<div class="wrapper test">
		<!-- Banner -->
		<div class="banner-top">
			<img alt='top banner' src="../images/banners/space.jpg">
		</div>

		<!-- Header section -->
		<header class="header-wrapper header-wrapper--home">
			<jsp:include page="/layout/topToolbar.jsp" />
		</header>


		<section class="container">

			<div class="getMovie">
				<div class="movie">
					<c:if test="${menu == 'preview' }">
						<h2 class="page-heading">시사회 상세 정보</h2>
					</c:if>
					<c:if test="${menu != 'preview' }">
						<h2 class="page-heading">영화 상세 정보</h2>
					</c:if>

					<div class="movie__info col-md-12">
						<div class="col-md-4">
							<div class="movie__images">
								<img alt='' src="${movie. postUrl}">
							</div>

						</div>

						<div class="col-md-8 movieOption">


							<c:if test="${menu != 'preview' }">
								<p class="movie__title" style="font-size: 20px; color: #4c4145;">${movie.movieNm }</p>
							</c:if>

							<c:if test="${menu == 'preview' }">
								<p class="movie__PreviewTitle">${screenContent.previewTitle }<span class="movie__title"> (${movie.movieNm })</span>
								</p>
							</c:if>

							<p class="movie__time">&nbsp; ${movie.showTm }분</p>

							<p class="movie__option">
								<strong>개봉일 : </strong>${movie.openDt }</p>
							<p class="movie__option">
								<strong>감독 : </strong>${movie.directors }</p>
							<p class="movie__option">
								<strong>배우 : </strong>${movie.actors }</p>
							<p class="movie__option">
								<strong>장르 : </strong>${movie.genres }</p>
							<p class="movie__option">
								<strong>관람등급: </strong>${movie.watchGradeNm }</p>
							<c:if test="${menu == 'preview' }">
								<p class="movie__option">

									<strong>상영시간 : </strong>${screenContent.ticketOpenDate }
								</p>
							</c:if>
							<p class="buttons movie__option">
								<span id="wish">
									<i class="fa fa-heart-o fa-2x" id="heartempty" onClick="javascript:addWishList()"></i>
								</span>


								<span id="share">
									<i class="fa fa-facebook fa-2x" onClick="javascript:posting()"></i>
								</span>
								<c:if test="${menu == 'preview' }">
									<p class="movie__option text-center ticketOpenDate">
										<span id="dpTime">
											시간계산 중 입니다
											<br>
											잠시만 기다려주세요
										</span>
									</p>
								</c:if>
								<c:if test="${menu == 'preview' }">
									<div class="ticketOpenButton text-center">
										<div class="ui segment">
											<span class="noticeOpen text-center">
												<i class="fa fa-quote-left" aria-hidden="true"></i>
												티켓오픈시간 30분 전 알림을 받고싶다면?
												<i class="fa fa-quote-right" aria-hidden="true"></i>
											</span>
											<br>

											<span id="ticketOpen">
												<c:choose>
													<c:when test="${checkOpenAlarm eq  1}">

														<a class="ui primary button" tabindex="0" style="font-size: 10pt">
															<i class="fa fa-bell fa-2x" id="ticketIcon" style="color: #ffffff;"></i>
															티켓오픈신청알림취소
														</a>

													</c:when>
													<c:otherwise>

														<a class="ui  basic button" tabindex="0">
															<i class="fa fa-bell-o fa-2x" id="ticketIcon"></i>
															티켓오픈신청알림
														</a>

													</c:otherwise>
												</c:choose>
											</span>

										</div>
									</div>
								</c:if>
							<div class=" movie__btns--full">
								<c:if test="${menu != 'preview' }">
									<a href="#" class="btn btn-md btn--danger" name="booking">예매하기</a>
								</c:if>


								<c:choose>
									<c:when test="${menu == 'preview' }">
										<a href="#" class="btn btn-md btn--slow" name="listMovie" onClick="location.href='/movie/getMovieList?menu=preview'">
											<i class="fa bars"></i>
											&nbsp; 목록으로
										</a>

									</c:when>
									<c:otherwise>
										<a href="#" class="btn btn-md btn--slow" name="listMovie" onClick="history.go(-1);">
											<i class="fa fa-bars"></i>
											&nbsp; 목록으로
										</a>
									</c:otherwise>
								</c:choose>




							</div>



							<span id="listMovie"> </span>



						</div>
					</div>

					<div class="devider-huge col-md-12"></div>

					<div class="synopsis col-md-12">
						<h2 class="page-heading">줄거리</h2>
						<p class="movie__describe">${movie.synopsis }</p>
					</div>

					<div class="devider-huge col-md-12"></div>

					<div class="steelcut col-md-12 ">
						<h2 class="page-heading">스틸컷</h2>
						<div class="col-md-3 "></div>
						<div class="col-md-6 center-block " style="margin: 0 auto; padding: 0px, 10px, 0px, 10px">
							<c:if test="${movie.steelCut1 !=  null}">
								<div class="your-class ">
									<div>
										<div class="image">
											<img class="steelCut" src="/images/movie/${movie.steelCut1 }" />
										</div>
									</div>
									<c:if test="${movie.steelCut2 != null }">
										<div>
											<div class="image">
												<img class="steelCut" src="/images/movie/${movie.steelCut2 }" />
											</div>
										</div>
									</c:if>
									<c:if test="${movie.steelCut3 != null }">
										<div>
											<div class="image">
												<img class="steelCut" src="/images/movie/${movie.steelCut3 }" />
											</div>
										</div>
									</c:if>
								</div>
							</c:if>
						</div>
						<div class="col-md-3 "></div>
					</div>

					<div class="devider-huge col-md-12"></div>

					<div>
						<h2 class="page-heading  col-md-12 col-md-12">트레일러</h2>


						<c:if test="${fn:length(movie.trailer) > 10}">
							<div align="middle" class="trailer">
								<iframe src="${movie.trailer }" frameborder="0" allowfullscreen class="video"></iframe>
							</div>
						</c:if>

						<div class="devider-huge col-md-12"></div>

					</div>
					<div class='row col-md-12'>
						<div class='col-md-3'>
							<h2 class="page-heading">예매자 성별 차트</h2>

							<canvas id="genderChart" width="400" height="400"></canvas>
						</div>
						<div class='col-md-3'>
							<h2 class="page-heading">예매자 나이 차트</h2>

							<canvas id="ageChart" width="400" height="400"></canvas>
						</div>
						<div class='col-md-6'>
							<h2 class="page-heading">
								<span class="fa fa-twitter" id='twitterSearch'> </span>
								${movie.movieNm} 실시간 트위터 검색
							</h2>
							<div class='col-md-12'>
								<%-- <iframe id="realTimeSearch" src="http://127.0.0.1:1337/${movie.movieNm }" frameborder="0"> --%>
								<iframe id="realTimeSearch" src="http://183.98.215.171:1337/${movie.movieNm }" frameborder="0">
									<p>Your browser does not support iframes.</p>
								</iframe>
							</div>
						</div>
					</div>

				</div>

				<div class="devider-huge col-md-12"></div>
				<div class="choose-container">



					<h2 class="page-heading  col-md-12 commentHeader">감상평</h2>

					<div class="comment-wrapper">
						<div id="comment-form" class="comment-form">
							<c:if test="${user.userId !=null}">
								<textarea class="movieComment__text" id="addMovieCommentText" placeholder='부적절한 글은 블라인드 처리 될 수 있습니다.'></textarea>
							</c:if>

							<c:if test="${user.userId ==null}">
								<textarea class="movieComment__text" id="addMovieCommentText" placeholder='로그인 후 이용해주세요' readonly="readonly"></textarea>

							</c:if>
							<button type='submit' class="btn btn-md btn--danger movieComment__btn" <c:if test="${user.userId ==null}">disabled="disabled"</c:if> id="addButton">등록</button>

						</div>
						<input type="hidden" name='menu' value="${menu}">
						<div class="comment-sets"></div>
					</div>
				</div>
			</div>

		</section>

		<div class="clearfix">
			<div id="hidden">

				<input type="hidden" name='ticketOpenDate' value="${screenContent.ticketOpenDate }">
				<input type="hidden" name='movieNm' value="${movie.movieNm }">
				<input type="hidden" name='movieNo' value="${movie.movieNo }">
				<input type="hidden" name='userId' value="${user.userId }">
				<input type="hidden" name='userRole' value="${user.role }">
				<input type="hidden" name='menu' value="${menu}">
				<input type="hidden" name='movieComment2' value="">
				<input type="hidden" name='movieCommentNo2'>
				<input type="hidden" name='screenContentNo' value="${screenContent.screenContentNo }">
				<input type="hidden" name='openDt' value="${movie.openDt }">
				<input type="hidden" name='femaleCnt' value="${movie.femaleCnt}">
				<input type="hidden" name="maleCnt" value="${movie.maleCnt}" />
				<input type="hidden" name="age10s" value="${movie.age10s}" />
				<input type="hidden" name="age20s" value="${movie.age20s}" />
				<input type="hidden" name="age30s" value="${movie.age30s}" />
				<input type="hidden" name="age40s" value="${movie.age40s}" />
				<input type="hidden" name="age50s" value="${movie.age50s}" />
				<input type="hidden" name="age60s" value="${movie.age60s}" />
				<input type="hidden" name="age60sMore" value="${movie.age60sMore}" />
				<input type="hidden" name="buttonFlag" id="buttonFlag" value="">
				<input type="hidden" name="previewFlag" id="previewFlag" value="">
				<form class="search">
					<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}" />
					<input type="hidden" id="startRowNum" name="startRowNum" value="0" />

				</form>
			</div>

		</div>

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




	<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>

	<script src="/js/custom.js"></script>
	<script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
	<script type="text/javascript">
		var ctx1 = document.getElementById("genderChart").getContext('2d');
		var femaleCnt = $("input:hidden[name='femaleCnt']").val();
		var maleCnt = $("input:hidden[name='maleCnt']").val();
		console.log(femaleCnt)
		console.log(maleCnt)
		var genderData = {

			datasets : [ {
				data : [ maleCnt, femaleCnt ],
				backgroundColor : [ 'rgb(54, 162, 235)', 'rgb(255, 99, 132)' ],
				borderColer : [ 'rgb(255, 99, 132)', 'rgb(54, 162, 235)' ]
			} ],

			// These labels appear in the legend and in the tooltips when hovering different arcs
			labels : [ '남자', '여자' ]

		};

		var ageChart = new Chart(ctx1, {
			type : 'pie',
			data : genderData,
			options : {
				responsive : true

			}

		});

		var ctx2 = document.getElementById("ageChart").getContext('2d');

		var age10s = $("input:hidden[name='age10s']").val();
		var age20s = $("input:hidden[name='age20s']").val();
		var age30s = $("input:hidden[name='age30s']").val();
		var age40s = $("input:hidden[name='age40s']").val();
		var age50s = $("input:hidden[name='age50s']").val();
		var age60s = $("input:hidden[name='age60s']").val();
		var age60sMore = $("input:hidden[name='age60sMore']").val();

		var ageData = {
			labels : [ '10대', '20대', '30대', '40대', '50대', '60대', '60대+' ],

			datasets : [ {

				label : '예매인원수',
				data : [ age10s, age20s, age30s, age40s, age50s, age60s, age60sMore ],
				backgroundColor : '#808080',

			} ]
		};

		var barChart = new Chart(ctx2, {
			type : 'bar',
			data : ageData,
			options : {
				legend : {
					display : false
				},

				responsive : true,
				scales : {
					yAxes : [ {
						ticks : {
							min : 0,
							stepSize : 1
						}
					} ]
				}

			}
		});

		$(document).ready(function() {
			$('.your-class').slick({
				centerMode : true,

				edgeFriction : 2,
				dots : true,
				infinite : true,
				speed : 500,
				fade : true,
				prevArrow : '<button type="button" class="slick-prev">Previous</button>'
			});

		});

		window.fbAsyncInit = function() {
			FB.init({
				appId : '1956483321340947',
				xfbml : true,
				version : 'v2.10'
			});
			FB.AppEvents.logPageView();
		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.10&appId=1956483321340947';
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		function posting() {
			FB.ui({
				method : 'share_open_graph',
				action_type : 'og.shares',
				action_properties : JSON.stringify({
					object : {

						'og:title' : 'AMC',
						'og:description' : '영화 ' + movieNm + '상세보기',
						'og:url' : 'http://183.98.215.171:8000/movie/getMovie?movieNo=' + movieNo + '&menu=' + menu

					}
				}),

				mobile_iframe : true,

			}, function(response) {
			});

		}

		function dpTime() {

			console.log("open : " + ticketOpenDate);
			var templist = ticketOpenDate.split('.');
			console.log("오픈시간 : " + templist[0]);

			var now = new Date();
			var screenTime = new Date(templist[0]);
			//var screenTime = new Date('17/10/22 12:00:00');
			console.log("now : " + now); //mon oct 16 2017 10:51:31 GMT+0900
			console.log("now.getTime() : " + now.getTime()); //1508118721142

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

			if (diff < 1) {

				$("#dpTime").html("현재 티켓 구매 가능합니다.");
			}

			if (days < 1) {
				days = -1;
			}

			if (hours < 10) {
				hours = "0" + hours;
			}

			if (minutes < 10) {
				minutes = "0" + minutes;
			}

			if (seconds < 10) {
				seconds = "0" + seconds;
			}

			if (diff < 1) {
				display = '<a href="#" class="btn btn-md btn--danger" name="booking">예매하기</a>'
				document.getElementById("dpTime").innerHTML = display;
				$(".ticketOpenDate").css("background-color", "#ffffff");
				$(".ticketOpenDate").removeClass().addClass("movie__option ticketOpenDate");

				$(".ticketOpenButton").html("");

			} else {

				display = '<div class="column">' + '<div class="ui top attached info message"><strong>' + '${screenContent.ticketOpenDate}' + '</strong> 티켓오픈!</div>'
						+ '<div class="ui bottom attached segment"><span class="emptyTimeText">남은시간<span><br> <span class="emptyTime">'

				// display = '<strong>${screenContent.ticketOpenDate}</strong>' + ' 티켓 오픈!' + '	<br> ' + ' 남은 시간 <br>' + '<span class="emptyTime">'
				if (days == -1) {
					display += hours + ":" + minutes + ":" + seconds

				} else {

					display += days + "일 " + hours + ":" + minutes + ":" + seconds

				}

				// display += '</span>'
				display += '</div>' + '</div>'
				document.getElementById("dpTime").innerHTML = display;
				console.log("???" + display)
			}
		}

		function addWishList() {
			if (userId == null || userId == '') {
				alert("로그인 후 이용 가능합니다.");
				$('.overlay').removeClass('close').addClass('open');

			}
			$.ajax({
				/* url : "/movie/json/switchWishList?screenContent.screenContentNo="+screenContentNo+"&user.userId="
						+ "${sessionScope.user.userId}", //서버로 알림 체크 요청 */

				url : "/movie/json/switchWishList?movie.movieNo=" + movieNo + "&user.userId=" + userId + "&wishFlag=" + menu,
				type : 'GET',
			}).done(function(data) {
				//정상 통신인 경우
				if (data == 'add') {

					$("#heartempty").removeClass().addClass("fa fa-heart fa-2x");

				} else {

					$("#heartempty").removeClass().addClass("fa fa-heart-o fa-2x");
				}

			});
		} //end of addOpenAlarm function

		function getWishList() {

			$.ajax({
				/* url : "/movie/json/switchWishList?screenContent.screenContentNo="+screenContentNo+"&user.userId="
						+ "${sessionScope.user.userId}", //서버로 알림 체크 요청 */

				url : "/movie/json/checkWishList?movie.movieNo=" + movieNo + "&user.userId=" + userId + "&wishFlag=" + menu,
				type : 'GET',
			}).done(function(data) {
				//정상 통신인 경우
				if (data == 1) {

					$("#heartempty").removeClass().addClass("fa fa-heart fa-2x");

				} else {

					$("#heartempty").removeClass().addClass("fa fa-heart-o fa-2x ");

				}

			});
		} //end of addOpenAlarm function

		function addOpenAlarm() {
			$.ajax({
				url : "/alarm/json/switchOpenAlarm?screenContent.screenContentNo=" + screenContentNo + "&user.userId=" + userId, //서버로 알림 체크 요청

				type : 'GET',
			}).done(function(data) {
				//정상 통신인 경우
				if (data == 'add') {
					/* msg += '\n무슨영화 : ' + movie정보;
					 */

					display = '<a class="ui primary button" tabindex="0" style="font-size:10pt">' + '<i class="fa fa-bell fa-2x" id="ticketIcon" style="color: #ffffff; "></i> 티켓오픈신청알림취소' + '</a>'
					$("#ticketOpen").html(display);

				} else {

					display = '<a class="ui basic button" tabindex="0">' + '<i class="fa fa-bell-o fa-2x" id="ticketIcon" ></i> 티켓오픈신청알림' + '</a>'
					$("#ticketOpen").html(display);
				}
			});
		} //end of addOpenAlarm function

		function fncGetPageList(currentPage) {

			$('#watchlist').remove();
			$("#currentPage").val(currentPage)
			queryString = $(".search").serialize();

			$.ajax({
				url : "/movie/json/getMovieCommentList/" + movieNo,
				type : 'POST',
				data : queryString,
				dataType : 'json',
				success : function(JSONData, status) {
					var result = JSONData;
					userId = $("input[name='userId']").val();
					userRole = $("input[name='userRole']").val();
					displayValue = '<div class="comment">'
					$.each(result, function(idx, val) {
						displayValue += '<p class="comment__user">' + val.user.userId + '</p>' + '<p class="comment__movieComment" id="movieComment'+val.movieCommentNo+'" >'
						if (val.blindCommentFlag == 'Y') {
							displayValue += ' <span style="color:gray; font-size:12pt;">블라인드 처리된 게시글입니다.</span>'
							if (userRole == 'admin') {
								displayValue += '<br> ' + val.movieComment
							}
						} else {
							displayValue += val.movieComment
						}
						displayValue += '</p>' + ' <span class="comment__regDate">' + val.movieCommentRegDate + ' </span>'
						if (userId == val.user.userId || userRole == 'admin') {
							displayValue += '<span class="comment__update" >'
							if (val.blindCommentFlag == 'N') {
								displayValue += '<i class="fa fa-eraser fa-2x">  </i>'
							}
							displayValue += '<input type="hidden" id="movieCommentNo" value="'+val.movieCommentNo+'"> ' + '<input type="hidden" id="movieComment" value="'+val.movieComment+'"></span>'
									+ '<span class="comment__delete" ><i class="fa fa-times fa-2x">  </i>' + '<input type="hidden" id="movieCommentNo" value="'+val.movieCommentNo+'"></span>'
							if (userRole == 'admin') {
								displayValue += '<span class="comment__blind " >' + ' <input type="hidden" id="movieCommentNo" value="'+val.movieCommentNo+'">'
										+ '<input type="hidden" id="blindCommentFlag" value="'+val.blindCommentFlag+'">'
								if (val.blindCommentFlag == 'Y') {
									displayValue += '<i class="fa fa-eye fa-2x"> </i>'
								} else {
									displayValue += '<i class="fa fa-eye-slash fa-2x"> </i>'
								}
								displayValue += ' </span>'
							}
						}
						displayValue += ' <hr>'
					})
					displayValue += ' </div>'
					$.ajax({
						url : "/movie/json/getTotalCount/" + movieNo,
						method : "post",
						data : queryString,
						dataType : 'json',
						success : function(JSONData, status) {
							console.log(JSONData.currentPage);
							console.log(JSONData.totalCount);
							console.log(JSONData.endUnitPage);
							displayValue += '<div class="comment-more">'
							if (JSONData.endUnitPage != JSONData.currentPage) {
								displayValue += '<div id="watchlist"><i class="fa fa-comment"></i><span id="moreComment">댓글 더 보기</span><div>'
							}
							displayValue += '</div>'

							buttonFlag = $("input[name='buttonFlag']").val();

							if (buttonFlag != "more") {
								$(".comment-sets").html("");
								JSONData.currentPage = 1;
							} else {
								$("input[name='buttonFlag']").val("");
							}

							$(".comment-sets").html(displayValue);

							$(".totalCount").remove();

							display = '<span class="totalCount"> &nbsp; (' + JSONData.totalCount + ')</span>'

							$(".commentHeader").append(display);

							$("#currentPage").val(JSONData.currentPage);
							//$("input[name='buttonFlag']").val("");

						}
					});
				}
			});
		}

		function fncGetMovieComment() {
			$("div[name='update" + $("input[name='movieCommentNo2']").val() + "']").html($("input[name='movieComment2']").val());
			console.log(movieCommentNo);
			console.log(movieComment);
			var dispaly = '<div id="comment-form" class="movieComment" name="update'+movieCommentNo+'">' + '<input type="hidden" id="movieCommentNo" value="'+movieCommentNo+'">'
					+ '<textarea class="movieComment__text" id="updateMovieCommentText" value="">' + movieComment + '</textarea>' + '<button type="submit" class="btn btn-md btn--shine movieComment__btn" id="updateButton">수정</button></div>'
			//movieComment${movieComment.movieCommentNo }
			$("input[name='movieCommentNo2']").val(movieCommentNo);
			$("input[name='movieComment2']").val(movieComment);
			$("#movieComment" + movieCommentNo).html(dispaly);
		}

		function fncAddMovieComment() {
			var movieComment = $("#addMovieCommentText").val();
			if (movieComment == "") {
				alert("감상평을 입력해 주세요");
				return;
			}
			$.ajax({
				url : "/movie/json/addMovieComment/",
				type : 'POST',
				headers : {
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					movie : {
						movieNo : movieNo
					},
					user : {
						userId : userId
					},
					movieComment : movieComment
				}),
				dataType : "text",
				success : function(JSONData, status) {
					console.log("fncAddMovieComment()");
					$("#addMovieCommentText").val(null);
					//   fncMovieCommentList()
					fncGetPageList(currentPage)
				}
			})
		}

		function fncUpdateMovieComment() {
			$.ajax({
				url : "/movie/json/updateMovieComment/",
				type : 'POST',
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					movieComment : movieComment,
					movieCommentNo : movieCommentNo
				}),
				dataType : "text",
				success : function(JSONData, status) {
					var display = '<input type="hidden" id="movieComment">' + movieComment;
					//$("#movieComment"+movieCommentNo).html(dispaly);
					$("#movieComment" + movieCommentNo).html(movieComment);
					$("#movieComment2").val(movieComment);
					//  fncMovieCommentList()
					fncGetPageList(currentPage)
				}
			})
		}

		function fncDeleteMovieComment() {
			if (confirm("정말 삭제하시겠습니까?") == true) {
				$.ajax({
					url : "/movie/json/deleteMovieComment/" + movieCommentNo,
					type : 'GET',
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					dataType : "json",
					success : function(JSONData, status) {
						console.log("fncDeleteMovieComment() JSONData " + JSONData);
						// fncMovieCommentList()
						fncGetPageList(currentPage)
					}
				})
			} else {
				return;
			}
		}

		function fncBlindCommentFlag() {
			blindComment = "";
			if (blindCommentFlag == 'Y') {
				blindComment = '취소 '
			}
			console.log("fncBlindCommentFlag()의 movieCommentNo ==> " + movieCommentNo)
			console.log("fncBlindCommentFlag()의 blindCommentFlag ==> " + blindCommentFlag)
			console.log('dddd');
			if (confirm("정말 블라인드 처리를 " + blindComment + "하시겠습니까?") == true) {
				$.ajax({
					url : "/movie/json/blindMoiveComment",
					type : 'POST',
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					data : JSON.stringify({
						blindCommentFlag : blindCommentFlag,
						movieCommentNo : movieCommentNo
					}),
					dataType : "text",
					success : function(JSONData, status) {
						console.log("fncAddMovieComment()");
						// fncMovieCommentList()
						fncGetPageList(currentPage)
					}
				})
			} else {
				return;
			}
		}

		$(document).ready(function() {
			ticketOpenDate = $("input[name='ticketOpenDate']").val();

			setInterval("dpTime();", 1000);

			movieNo = $("input[name='movieNo']").val();
			menu = $("input[name='menu']").val();
			userId = $("input[name='userId']").val();
			screenContentNo = $("input[name='screenContentNo']").val();
			movieNm = $("input[name='movieNm']").val();
			currentPage = $("#currentPage").val();
			buttonFlag = $("input[name='buttonFlag']").val();
			getWishList();
			fncGetPageList(currentPage);
			$('.boxshadow').css("box-shadow", "0 0 0px rgba(0, 0, 0, 0)")

			//감상평 등록
			$(document).on("click", "#addButton", function() {
				currentPage = 1;
				fncAddMovieComment();

			})

			//감상평 삭제
			$(document).on("click", ".comment__delete", function() {
				movieCommentNo = $("#movieCommentNo", $(this)).val();
				currentPage = 1;
				fncDeleteMovieComment();

			})

			// 감상평 블라인드 처리
			$(document).on("click", ".comment__blind ", function() {
				movieCommentNo = $("#movieCommentNo", $(this)).val();
				blindCommentFlag = $("#blindCommentFlag", $(this)).val();
				$("#startRowNum").val(2);
				fncBlindCommentFlag();
				$("#buttonFlag").val('blind');

			})

			// 수정버튼 누르기
			$(document).on("click", ".comment__update", function() {
				movieCommentNo = $("#movieCommentNo", $(this)).val();
				movieComment = $("#movieComment", $(this)).val();
				fncGetMovieComment();
			})

			// 더보기
			$(document).on("click", "#watchlist", function() {
				currentPage = $("#currentPage").val();
				$("#buttonFlag").val('more');
				buttonFlag = $("input[name='buttonFlag']").val();
				currentPage = parseInt(currentPage) + 1
				fncGetPageList(currentPage);
			})

			//수정하기
			$(document).on("click", "#updateButton", function() {
				movieCommentNo = $(this).parent().find("#movieCommentNo").val();
				movieComment = $(this).parent().find("#updateMovieCommentText").val();
				$("#buttonFlag").val('update');
				$("#startRowNum").val(2);
				fncUpdateMovieComment();
			})

			$("a[name='booking']").on("click", function() {

				if (menu == "preview") {

					$(self.location).attr("href", "/booking/getPreviewList");
				} else {
					$(self.location).attr("href", "/booking/getScreenMovieList");
				}

			})
			$("#ticketOpen").on("click", function() {
				if (userId == "") {
					alert('로그인 후 이용가능합니다')
					$('.overlay').removeClass('close').addClass('open');
				} else {
					addOpenAlarm()
				}
			})
		});

		changeCSS()
		$(window).resize(function() {
			changeCSS();
		})

		function changeCSS() {

			imgwidth = $(".movie .movie__images img").css("width").split('px');

			if (parseInt(imgwidth[0]) < 200) {

				$(".movie .movie__images img").css("width", "265px")
			} else {
				$(".movie .movie__images img").css("width", "100%")
			}

			if ($(document).innerWidth() < 768) {

				$(".movie__btns--full").css("position", "relative");
				$(".ticketOpenDate").css("width", "100%");
				$(".ticketOpenButton").css("width", "100%")

			} else {

				$(".movie__btns--full").css("position", "absolute");
				$(".ticketOpenDate").css("width", "50%");
				$(".ticketOpenButton").css("width", "50%")
			}

		}
	</script>



</body>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.page-heading {
	font-family: 'Jeju Gothic', sans-serif;
	font-size: 25px;
	padding-left: 30px;
	margin-top: 10px;
	margin-bottom: 10px;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}

html {
	height: auto;
}

.your-class img {
	max-width: 500px;
	width: auto;
	margin: 0 auto;
}

.slick-prev:before, .slick-next:before {
	color: #ffd564;
}

.comment-form {
	margin-bottom: 60px;
}

.comment-form .movieComment__text {
	width: 100%;
	min-height: 78px;
	padding: 8px 19px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	background-color: #ffffff;
	border: solid 1px #dbdee1;
	font-size: 13px;
	color: #b4b1b2;
}

.comment-form .movieComment__info {
	margin-top: 19px;
	font: 13px 'Roboto', sans-serif;
	color: #969b9f;
	display: inline-block;
}

.comment-form .movieComment__btn {
	float: right;
	margin-top: 9px;
}

.comment {
	margin-bottom: 40px;
}

.comment .movieComment__text {
	width: 100%;
	min-height: 78px;
	padding: 8px 19px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	background-color: #ffffff;
	border: solid 1px #dbdee1;
	font-size: 13px;
	color: #b4b1b2;
}

.comment .movieComment__info {
	margin-top: 19px;
	font: 13px 'Roboto', sans-serif;
	color: #969b9f;
	display: inline-block;
}

.comment .movieComment__btn {
	float: right;
	margin-top: 9px;
}

.comment .comment__user {
	font-size: 18px;
	margin-bottom: 20px;
	font-weight: bold;
	position: relative;
	overflow: hidden;
}

.comment .comment__movieComment {
	font-size: 14px;
	line-height: 14px;
}

.comment .comment__regDate {
	font-size: 12px;
	color: #969b9f;
	line-height: 14px;
}

.trailer {
	position: relative;
	width: 100%;
	height: 0;
	padding-bottom: 56.25%;
}

.video {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

#realTimeSearch {
	width: 100%;
	height: 250px;
}

section {
	padding-top: 30px
}

#heartempty {
	padding: 5px, 5px, 5px, 5px;
	color: #fe505a;
}

#wish {
	margin-top: 50px;
}

.movie .movie__title {
	position: relative;
	font-size: 17px;
	font-family: 'Jeju Gothic', sans-serif;
	color: #969b9f;
	margin-bottom: 0px;
}

.movie .movie__PreviewTitle {
	font-size: 20px;
	color: #4c4145;
	font-family: 'Jeju Gothic', sans-serif;
	margin-bottom: 0px;
}

.movie .movie__images {
	position: relative;
	border: 3px solid #ffd564;
	width: fit-content;
}

.movie .movie__time:before {
	content: "\f017";
	font: 16px "FontAwesome";
	color: #fe505a;
	position: inherit;
	top: 2px;
	left: 0;
}

.movie .movie__time {
	position: relative;
	font-size: 13px;
	color: #fe505a;
	margin-bottom: 20px;
	padding-left: 0;
}

.getMovie {
	margin-top: 50px;
}

.fa-twitter {
	color: #537f9b;
}

.devider-huge {
	width: 100%;
	height: 3px;
	background-color: #ffd564;
	margin-bottom: 30px;
	margin-top: 30px;
}

.buttons span {
	padding-left: 10px;
	padding-right: 10px;
	margin-top: 20px;
}

#ticketIcon {
	color: #4c4145;
	padding-right: 10px;
}

#share {
	color: #4267b2;
}

.movie__btns--full {
	position: absolute;
	top: 0;
	right: 0;
	margin-top: 10px;
}

.movieOption {
	margin-top: 10px;
}

.fa-2x {
	font-size: 1.5em;
}

.movie .movie__images {
	max-width: 100%;
}

.movie .movie__images img {
	max-width: 100%;
}

.emptyTime {
	font-family: 'Jeju Gothic', sans-serif;
	font-size: 25px;
}

.emptyTimeText {
	font-family: 'Jeju Gothic', sans-serif;
	font-size: 18px;
}

#dpTime {
	font-family: 'Jeju Gothic', sans-serif;
}

.noticeOpen {
	font-family: 'Jeju Gothic', sans-serif;
	font-size: 12px;
	color: #969b9f;
}

.ticketOpenButton {
	width: 50%;
	margin-top: 10px;
}

#ticketOpen {
	font-family: 'Jeju Gothic', sans-serif;
	font-size: 15px;
}

.ui.button, .ui.buttons .button, .ui.buttons .or {
	font-size: 13px;
	width: 210px;
	height: 45px;
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>

</html>