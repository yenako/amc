<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>

<head>
<meta charset="EUC-KR">

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.5/sweetalert2.min.css">

</head>

<body>

	<div class="wrapper">
		<!-- Banner -->
		<div class="banner-top">
			<img alt='top banner' src="/images/banners/space.jpg">
		</div>

		<!-- Header section -->
		<header class="header-wrapper header-wrapper--home">
			<jsp:include page="/layout/topToolbar.jsp" />
		</header>

		<div class="toolBar"></div>
		<section class="container ">
			<div class="movie">
				<h2 class="page-heading">��ȭ �� ����</h2>

				<div class="movie__info">
					<div class="col-sm-4 col-md-3 movie-mobile">
						<div class="movie__images">
							<img alt='' src="${movie. postUrl}" width='250px'>
						</div>
					</div>
					<div class="col-sm-8 col-md-9">
						<p class="movie__title" style="font-size: 18px;">${movie.movieNm }</p>
						<p class="movie__time">
							<input type="hidden" name='showTm' value="${movie.showTm }">
							${movie.showTm }��
						</p>

						<p class="movie__option">
							<strong>������ : </strong>
							<input type="hidden" name='openDt' value="${movie.openDt }">${movie.openDt }</p>
						<p class="movie__option">
							<strong>�󿵸����� : </strong>
							<input type="hidden" name='endDt' value="${movie.endDt }">${movie.endDt }</p>
						<p class="movie__option">
							<strong>���� : </strong>${movie.directors }</p>
						<p class="movie__option">
							<strong>��� : </strong>${movie.actors }</p>
						<p class="movie__option">
							<strong>�帣 : </strong>${movie.genres }</p>
						<p class="movie__option">
							<strong>�������: </strong>${movie.watchGradeNm }</p>
						<p class="movie__option">
							<i class="fa fa-bars" onclick="location.href='/screen/getScreenList'"> &nbsp;&nbsp; �󿵸������</i>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-12 col-sm-12 text-right">
				<button class="btn btn-md btn--default" type="button" id="addButton">�󿵵��</button>
			</div>
			<div class="screenContentList">
				<table class="screenContentTable">
					<tr class="row col-md-12 col-sm-12 listTitle text-center">
						<td class="col-md-2 col-sm-2">�󿵹�ȣ</td>
						<td class="col-md-1 col-sm-1">������</td>
						<td class="col-md-1 col-sm-1">�󿵽ð�</td>
						<td class="col-md-1 col-sm-1">�󿵰�</td>
						<td class="col-md-1 col-sm-1">����</td>
						<td class="col-md-1 col-sm-1">�û�ȸ</td>
						<td class="col-md-2 col-sm-2">�û�ȸ����</td>
						<td class="col-md-2 col-sm-2">Ƽ�Ͽ��³�¥</td>
						<td class="col-md-1 col-sm-1">�ʴ���</td>
					</tr>

				</table>

			</div>
		</section>
		<div>
			<input type="hidden" name="screenOpenTime">
			<input type="hidden" name="screenEndTime2">
			<input type="hidden" name="previewFlag">
			<input type="hidden" name="ticketOpenDate">
			<input type="hidden" name='movieNo' value='${movie.movieNo }'>
		</div>


		<jsp:include page="/layout/bottomToolbar.jsp" />
		<jsp:include page="/layout/loginModal.jsp" />
	</div>

	<jsp:include page="/screen/addScreenContent.jsp" />

	<jsp:include page="/screen/updateScreenContent.jsp" />


</body>


<script src="/js/external/jquery-migrate-1.2.1.min.js"></script>
<!-- jQuery UI -->
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<!-- Custom -->
<script src="/js/custom.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.5/sweetalert2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>


<script type="text/javascript">
	function fncAddTime() {

		$("input[name='screenContentEndTime']").val(null);

		showTm += 30;

		$("input:hidden[name='screenOpenTime']").val(screenOpenTime);
		var date = new Date(Date.parse(screenOpenTime) + showTm * 1000 * 60);
		var yyyy = date.getFullYear();
		var mm = date.getMonth() + 1;
		var dd = date.getDate();
		var hh = date.getHours();
		var mi = date.getMinutes();
		function ten(n) { // ���� ���� ���ڸ��������϶�
			return n < 10 ? "0" + n : n;
		}

		$("input[name='screenContentEndTime']").val(ten(hh) + ":" + ten(mi));

		$("input:hidden[name='screenEndTime2']").val(ten(yyyy) + "/" + ten(mm) + "/" + ten(dd) + " " + ten(hh) + ":" + ten(mi));
		var screenEndTime = $("input:hidden[name='screenEndTime2']").val();

	}

	function fncCheckScreenDupTime() {
		screenDate = $("input[name='screenDate']").val();
		screenTheater = $("option:selected").val();
		screenOpenTime = $("input[name='screenDate']").val() + " " + $("input[name='screenContentOpenTime']").val();
		screenEndTime = $("input:hidden[name='screenEndTime2']").val();

		$.ajax({
			url : "/screen/json/checkScreenDupTime/",
			method : 'POST',
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				screenDate : screenDate,
				screenOpenTime : screenOpenTime,
				screenEndTime : screenEndTime,
				screenTheater : screenTheater
			}),
			dataType : "text",
			success : function(JSONData, status) {

				$(".dupTime").remove();
				display = '<div class="dupTime">' + '<div class="col-md-12 col-sm-12 checkDupTime  text-center"  '
				if (JSONData == "true") {
					display += 'style="color:blue;font-size:13px;" >' + '��� ������ �ð��Դϴ�.'
				} else {
					display += 'style="color:red;font-size:13px;" >' + '�ߺ��� �ð��Դϴ� �ٸ��ð��� �������ּ���'
				}
				display += '</div>'
				$(".endTime").append(display);
			}
		});
	}

	function fncCheckScreenDupPreview() {
		movieNo = $("input[name='movieNo']").val();

		$.ajax({
			url : "/screen/json/checkScreenDupPreview/",
			method : 'post',
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				movie : {
					movieNo : movieNo
				}
			}),
			dataType : "text",
			success : function(JSONData, status) {
				if (JSONData != 0) {
					$(".checkPreview").remove();
					$(".checkPreviewWrapper").html("<span style='color:red' class='checkPreview'>�̹� �� ��ȭ�� �û�ȸ�� �ֽ��ϴ�.</span>");

				}
			}
		})
	}

	//����̳� �����Ϸ�� input�ڽ� �����
	function funClearInputBox() {
		$("input[name='screenDate']").val(null);
		$("select[name='screenTheater']").val("1");
		$("input[name='screenContentOpenTime']").val(null);
		$(".screenContentEndTime").val(null);

		$("span .checkbox").css("background-position", "0px 0px")

		$("input[name='previewTitle']").val(null);
		$("input[name='previewOpenDate']").val(null);
		$("input[name='previewOpenTime']").val(null);
		$("input[name='inviteActor']").val(null);

		$("input[name='ticketPrice']").val(null);
		$("input[name='previewFlag']").val(null);
		$("input[name='ticketOpenDate']").val(null);

		$("input[name='previewTitle']").attr("readonly", true);
		$("input[name='previewOpenTime']").attr("readonly", true);
		$("input[name='inviteActor']").attr("readonly", true);

		$("select[name='screenTheater']").attr("disabled", "disabled");
		$("input[name='screenContentOpenTime']").attr("readonly", true);
		$(".dupTime").remove();
		$(".checkPreview").remove();

		$("input[name='previewOpenDate']").datepicker("option", "disabled", true);
	}

	function fncAddScreenContent() {
		movieNo = $("input[name='movieNo']").val();
		screenDate = $("input[name='screenDate']").val();
		screenOpenTime = $("input[name='screenDate']").val() + " " + $("input[name='screenContentOpenTime']").val();
		screenEndTime = $("input:hidden[name='screenEndTime2']").val();
		screenTheater = $("option:selected").val();
		ticketPrice = $("input[name='ticketPrice']").val();
		previewChecked = $("input[name='previewChecked']").is(":checked");
		previewTitle = $("input[name='previewTitle']").val();
		ticketOpenDate = $("input[name='previewOpenDate']").val() + " " + $("input[name='previewOpenTime']").val();
		inviteActor = $("input[name='inviteActor']").val();
		previewFlag = ""

		var screenContentOpenTime = $("input[name='screenContentOpenTime']").val();
		var screenContentEndTime = $("input:hidden[name='screenEndTime2']").val();

		if (screenDate == null || screenDate.length < 1) {
			alert("�����ڸ� �Է����ּ���");
			return;
		}
		if (screenContentOpenTime == null || screenContentOpenTime.length < 1) {
			alert("�󿵽��� �ð��� �Է����ּ���");
			return;
		}
		if (screenContentEndTime == null || screenContentEndTime.length < 1) {
			alert("������ �ð��� �Է����ּ���");
			return;
		}
		if (ticketPrice == null || ticketPrice.length < 1) {
			alert("������ �Է����ּ���");
			return;
		}
		if (!$.isNumeric(ticketPrice)) {
			alert(' ������ ���ڸ� �Է��� �����մϴ�');
			return;
		}

		var previewTitle = $("input[name='previewTitle']").val();
		var previewOpenDate = $("input[name='previewOpenDate']").val();
		var previewOpenTime = $("input[name='previewOpenTime']").val();

		if (previewChecked == true) {

			if (previewTitle == null || previewTitle.length < 1) {
				alert("�û�ȸ ������ �Է����ּ���");
				return;
			}
			if (previewOpenDate == null || previewOpenDate.length < 1) {
				alert("Ƽ�� ���� ��¥�� �Է����ּ���");
				return;
			}
			if (previewOpenTime == null || previewOpenTime.length < 1) {
				alert("Ƽ�� ���� �ð��� �Է����ּ���");
				return;
			}
			if (inviteActor == null || inviteActor.length < 1) {
				alert("�ʴ��츦 �Է����ּ���");
				return;
			}
		}

		if (previewChecked == true) {
			previewFlag = "Y";
		} else {
			previewFlag = "N";
		}
		$("input:hidden[name='screenOpenTime']").val(screenOpenTime);
		$("input:hidden[name='previewFlag']").val(previewFlag);
		$("input:hidden[name='ticketOpenDate']").val(ticketOpenDate);

		$.ajax({
			url : "/screen/json/addScreenContent/",
			method : 'POST',
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				screenDate : screenDate,
				screenOpenTime : screenOpenTime,
				screenEndTime : screenEndTime,
				screenTheater : screenTheater,
				ticketPrice : ticketPrice,
				previewTitle : previewTitle,
				ticketOpenDate : ticketOpenDate,
				inviteActor : inviteActor,
				previewFlag : previewFlag,
				movie : {
					movieNo : movieNo
				}
			}),
			dataType : "text",
			success : function(JSONData, status) {

				if (JSONData == -1) {
					swal("<span style='font-size:15px;'>�󿵽ð��� �ߺ��Ǿ����ϴ�. �ٽ� �������ּ���</span>");
				} else if (JSONData == -2) {
					swal("<span style='font-size:15px;'>�̹� �̿�ȭ�� �û�ȸ�� ��ϵǾ� �ֽ��ϴ�.</span>");

				} else if (JSONData == -3) {
					swal("<span style='font-size:15px;'>����DB�������!</span>");

				} else {
					// fncGetScreenContentList();
					swal("<span style='font-size:15px;'>��ϿϷ�</span>");
					fncGetScreenContentList();
					funClearInputBox()

				}

			}
		});

	}

	function fncGetScreenContent() { //  ������ ���� �� ��������

		$.ajax({
			url : "/screen/json/updateScreenContent/" + screenContentNo,
			method : "GET",
			dataType : "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData, status) {

				var screenDateTest = JSONData.screenDate;
				screenDateTest = screenDateTest.replace(/\//gi, "-");
				$(".updateScreenContentModal input[name='screenDate' ]").val(screenDateTest);
				$(".updateScreenContentModal input[name='screenContentOpenTime' ]").val(JSONData.screenOpenTime);
				$(".updateScreenContentModal  input[name='screenContentEndTime' ]").val(JSONData.screenEndTime);
				$(".updateScreenContentModal select[name='screenTheater' ]").val(JSONData.screenTheater);
				$(".updateScreenContentModal input[name='ticketPrice' ]").val(JSONData.ticketPrice);
				$("input[name='screenContentNo']").val(screenContentNo);
				$(".updateScreenContentModal input[name='previewTitle' ]").val(null);
				$(".updateScreenContentModal input[name='previewOpenDate' ]").val(null);
				$(".updateScreenContentModal input[name='previewOpenTime' ]").val(null);
				$(".updateScreenContentModal input[name='inviteActor' ]").val(null);

				if (JSONData.previewFlag == 'Y') {
					$(".updateScreenContentModal input[name='screenContentOpenTime' ]").removeAttr("readonly");
					$(".updateScreenContentModal select[name='screenTheater']").removeAttr("disabled");

					display = ' <i class="fa fa-check-square-o" aria-hidden="true"></i>'
					$("input[name='previewFlag']").val("on");
					$(".checkFlag").html(display);

				} else {
					display = '<i class="fa fa-square-o" aria-hidden="true"></i>'
					$("input[name='previewFlag']").val(null);
					$(".checkFlag").html(display);
				}
				previewChecked = $("#previewChecked").is(":checked");

				if (JSONData.previewFlag == 'Y') {
					/*   $("input[name='previewChecked']").prop("checked", true); */
					// $("input[name='previewChecked']").prop("checked");
					//  $("#previewChecked").attr("checked", true);
					// $(".updateScreenContentModal input[name='previewChecked']").prop("checked", true);
					var previewOpenDate = JSONData.ticketOpenDate;
					previewOpenDate = previewOpenDate.substr(0, 10);
					previewOpenDate = previewOpenDate.replace(/\//gi, "-");
					var previewOpenTime = JSONData.ticketOpenDate;
					previewOpenTime = previewOpenTime.substr(11, 15);
					$(".updateScreenContentModal input[name='previewTitle' ]").val(JSONData.previewTitle);
					$(".updateScreenContentModal input[name='previewOpenDate' ]").val(previewOpenDate);
					$(".updateScreenContentModal input[name='previewOpenTime' ]").val(previewOpenTime);
					$(".updateScreenContentModal input[name='inviteActor' ]").val(JSONData.inviteActor);

					$(".updateScreenContentModal input[name='previewTitle' ]").removeAttr("readonly");
					$(".updateScreenContentModal input[name='previewOpenTime' ]").removeAttr("readonly");
					$(".updateScreenContentModal input[name='inviteActor' ]").removeAttr("readonly");

				} else {

					$(".updateScreenContentModal input[name='previewChecked']").prop("checked", false);

					$(".updateScreenContentModal input[name='previewTitle' ]").attr("readonly", true);
					$(".updateScreenContentModal input[name='previewOpenDate' ]").attr("readonly", true);
					$(".updateScreenContentModal input[name='previewOpenTime' ]").attr("readonly", true);
					$(".updateScreenContentModal input[name='inviteActor' ]").attr("readonly", true);
				}

			},
		})

	}

	function fncUpdateScreenContent() { //������ ���� 

		screenDate = $(".updateScreenContentModal input[name='screenDate']").val();

		screenOpenTime = $(".updateScreenContentModal input[name='screenDate']").val() + " " + $(".updateScreenContentModal input[name='screenContentOpenTime']").val();
		// var screenEndTime = $("input[name='screenDate']").val() + " " + $("input[name='screenContentEndTime']").val();

		screenTheater = $(".updateScreenContentModal option:selected").val();

		ticketPrice = $(".updateScreenContentModal input[name='ticketPrice']").val();

		previewChecked = $(".updateScreenContentModal input[name='previewChecked']").is(":checked");

		previewTitle = $(".updateScreenContentModal input[name='previewTitle']").val();

		ticketOpenDate = $(".updateScreenContentModal input[name='previewOpenDate']").val() + " " + $(".updateScreenContentModal input[name='previewOpenTime']").val();

		inviteActor = $(".updateScreenContentModal input[name='inviteActor']").val();

		movieNo = $("input[name='movieNo']").val();

		screenContentNo = $("input[name='screenContentNo']").val();

		screenEndTime = $("input:hidden[name='screenEndTime2']").val();

		screenEndTime = $(".updateScreenContentModal input[name='screenDate']").val() + " " + $(".updateScreenContentModal input[name='screenContentEndTime']").val();

		var screenContentOpenTime = $(".updateScreenContentModal input[name='screenContentOpenTime']").val()
		var screenContentEndTime = $(".updateScreenContentModal input[name='screenContentEndTime']").val();

		if (screenDate == null || screenDate.length < 1) {
			alert("�����ڸ� �Է����ּ���");
			return;
		}
		if (screenContentOpenTime == null || screenContentOpenTime.length < 1) {
			alert("�󿵽��� �ð��� �Է����ּ���");
			return;
		}
		if (screenContentEndTime == null || screenContentEndTime.length < 1) {
			alert("������ �ð��� �Է����ּ���");
			return;
		}
		if (ticketPrice == null || ticketPrice.length < 1) {
			alert("������ �Է��� �ּ���");
			return;
		}
		if (!$.isNumeric(ticketPrice)) {
			alert(' ������ ���ڸ� �Է��� �����մϴ�');
			return;
		}
		var previewTitle = $(".updateScreenContentModal input[name='previewTitle']").val();
		var previewOpenDate = $(".updateScreenContentModal input[name='previewOpenDate']").val();
		var previewOpenTime = $(".updateScreenContentModal input[name='previewOpenTime']").val();

		if (previewChecked == true) {

			if (previewTitle == null || previewTitle.length < 1) {
				alert("�û�ȸ ������ �Է��� �ּ���");
				return;
			}
			if (previewOpenDate == null || previewOpenDate.length < 1) {
				alert("Ƽ�� ���� ��¥�� �Է��� �ּ���");
				return;
			}
			if (previewOpenTime == null || previewOpenTime.length < 1) {
				alert("Ƽ�� ���� �ð��� �Է��� �ּ���");
				return;
			}
			if (inviteActor == null || inviteActor.length < 1) {
				alert("�ʴ��츦 �Է��� �ּ���");
				return;
			}
		}
		previewFlagCheck = $("input[name='previewFlag']").val();

		if (previewFlagCheck == "on") {
			var previewFlag = "Y";
		} else {
			var previewFlag = "N";
		}
		$("input:hidden[name='screenOpenTime']").val(screenOpenTime);
		$("input:hidden[name='screenEndTime2']").val(screenEndTime);
		$("input:hidden[name='previewFlag']").val(previewFlag);
		$("input:hidden[name='ticketOpenDate']").val(ticketOpenDate);

		$.ajax({
			url : "/screen/json/updateScreenContent/",
			method : 'POST',
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				screenContentNo : screenContentNo,
				screenDate : screenDate,
				screenOpenTime : screenOpenTime,
				screenEndTime : screenEndTime,
				screenTheater : screenTheater,
				ticketPrice : ticketPrice,
				previewTitle : previewTitle,
				ticketOpenDate : ticketOpenDate,
				inviteActor : inviteActor,
				previewFlag : previewFlag,
				movie : {
					movieNo : movieNo
				}
			}),
			dataType : "text",
			success : function(JSONData, status) {

				if (JSONData == -1) {
					swal("<span style='font-size:15px;'>�󿵽ð��� �ߺ��Ǿ����ϴ�. �ٽ� �������ּ���</span>");
				} else if (JSONData == -2) {
					swal("<span style='font-size:15px;'>�̹� �̿�ȭ�� �û�ȸ�� ��ϵǾ� �ֽ��ϴ�.</span>");

				} else if (JSONData == -3) {
					swal("<span style='font-size:15px;'>����DB�������!</span>");

				} else {
					// fncGetScreenContentList();

					fncGetScreenContentList();

				}

				window.location.reload()
			}
		});

	}

	function fncDeleteScreenContent() { // �󿵻���

		if (confirm("���� �������� ����ڽ��ϱ�? ") == true) {
			$.ajax({
				url : "/screen/json/deleteScreenContent/" + screenContentNo,
				method : "GET",
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData, status) {

					fncGetScreenContentList();
				},
				error : function(error, status) {
					console.log(error);
					console.log(status);
					swal("<span style='font-size:15px;'>�� ��ȭ/�û�ȸ�� ���� ������ �Ұ����մϴ�</span>");

				}
			})
		} else {
			return;
		}

	}

	function fncGetScreenContentList() { // �ѿ�ȭ�� ��ϵǾ��ִ� �󿵿� ���� ���� ����Ʈ�� ������
		var movieNo = $("input[name='movieNo']").val();
		$.ajax({
			url : "/screen/json/getScreenContentList/" + movieNo,
			method : "GET",
			dataType : "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData, status) {
				$(".listData").remove();
				display = '';
				result = JSONData;
				$.each(result, function(idx, val) {

					display += '<tr class="row col-md-12 col-sm-12 listData text-center">' + '<td class="col-md-2 col-sm-2">' + val.screenContentNo + '<i class="fa fa-eraser"> </i> <i class="fa fa-times"> </i>'
							+ '<input type="hidden" name="screenContentNo" value="'+val.screenContentNo+'">' + '</td>' + '<td class="col-md-1 col-sm-1">' + val.screenDate + '</td>' + '<td class="col-md-1 col-sm-1">' + val.screenOpenTime
							+ '-' + val.screenEndTime + '</td>' + '<td class="col-md-1 col-sm-1">' + val.screenTheater + '</td>' + '<td class="col-md-1 col-sm-1">' + val.ticketPrice + '</td>' + '<td class="col-md-1 col-sm-1">'
							+ val.previewFlag + '</td>' + '<td class="col-md-2 col-sm-2">'
					if (val.previewTitle != null) {
						display += val.previewTitle
					}
					display += '</td>' + '<td class="col-md-2 col-sm-2">'
					if (val.previewTitle != null) {
						display += val.ticketOpenDate
					}
					display += '</td>' + '<td class="col-md-1 col-sm-1">'
					if (val.previewTitle != null) {
						display += val.inviteActor
					}
					display += '</td>' + '</tr>'

				})

				console.log("display + " + display);

				$(".listTitle").after(display);

			}
		});
	}

	$(document).ready(
			function() {

				$(document).on("click", ".fa-square-o", function() {

					display = ' <i class="fa fa-check-square-o" aria-hidden="true"></i>'

					$("input[name='previewTitle']").removeAttr("readonly");
					$("input[name='previewOpenTime']").removeAttr("readonly");
					$("input[name='inviteActor']").removeAttr("readonly");

					$("input[name='previewFlag']").val("on");
					$(".checkFlag").html(display);

					$("input[name='previewOpenDate']").datepicker({
						dateFormat : 'yy-mm-dd',
						minDate : today,
						maxDate : screenDate
					});
				})

				$(document).on("click", ".fa-check-square-o", function() {
					display = '<i class="fa fa-square-o" aria-hidden="true"></i>'
					$("input[name='previewFlag']").val(null);
					$(".checkFlag").html(display);
					$("input[name='previewTitle']").attr("readonly", true);
					$("input[name='previewOpenTime']").attr("readonly", true);
					$("input[name='inviteActor']").attr("readonly", true);
					$(".checkPreview").remove();
				})

				fncGetScreenContentList();
				openDt = $("input[name='openDt']").val();
				endDt = $("input[name='endDt']").val();

				var today = new Date();

				var year = today.getFullYear();
				var month = today.getMonth();
				var date = today.getDate();
				month = (month < 10) ? '0' + month : month;
				date = (date < 10) ? '0' + date : date;
				today = new Date(year, month, date);

				openDt = new Date(openDt);
				endDt = new Date(endDt);

				minDate = openDt

				if (openDt < today) {
					date = today.getDate() + 1;
					today.setDate(date);
					minDate = today
				}

				$("input[name='screenDate']").datepicker({
					dateFormat : 'yy-mm-dd',
					minDate : minDate,
					maxDate : endDt
				});

				var movieNo = $("input[name='movieNo']").val();
				$('.boxshadow').css("box-shadow", "0 0 0px rgba(0, 0, 0, 0)")

				var screenDate = $("input[name='screenDate']").val();

				$(document).on(
						"click",
						".ui-state-disabled",
						function() {

							swal('<span style="font-size:18px">�����Ͻ� ��¥�� ��/Ƽ�Ͽ��³�¥ ����� �Ұ��� �մϴ�</span><br>' + '<span style="color:red;font-size:12px;font-weight:normal"><������><br>���� �� ��ȭ - ������ ���� ������ ���� ��ϰ���'
									+ '<br>���� ��ȭ - ���� ���ĺ��� �����ϱ��� ��� ����' + '<br><Ƽ�Ͽ��³�¥><br>���ú��� ������ ������ �������� ��ϰ���' + '</span>');
						})

				$(document).on("change", "input[name='screenDate']", function() {
					screenDate = $("input[name='screenDate']").val();

					if ($("input[name='screenContentOpenTime']").val() != "") {
						fncCheckScreenDupTime()
					}

					$("select[name='screenTheater']").removeAttr("disabled");
					$("input[name='screenContentOpenTime']").removeAttr("readonly");
					$("input[name='previewOpenDate']").val("");
					$(document).on("click", "span.checkbox", function() {
						previewChecked = $("input[name='previewChecked']").is(":checked");

						var today = new Date();

						var year = today.getFullYear();
						var month = today.getMonth();
						var date = today.getDate();
						month = (month < 10) ? '0' + month : month;
						date = (date < 10) ? '0' + date : date;
						today = new Date(year, month, date);

						screenDate = new Date(screenDate);
						date = screenDate.getDate() - 1;
						screenDate.setDate(date);

						if (previewChecked == true) {
							$("input[name='previewOpenDate']").datepicker({
								dateFormat : 'yy-mm-dd',
								minDate : today,
								maxDate : screenDate
							});
						} else {
							$("input[name='previewOpenDate']").val("");
							//$("input[name='previewOpenDate']").datepicker("option", "disabled", true);

						}
					});
				})

				$(document).on("change", "select[name='screenTheater']", function() {

					screenDate = $("input[name='screenDate']").val();
					if ($("input[name='screenContentOpenTime']").val() != "") {
						fncCheckScreenDupTime()
					}
					$("select[name='screenTheater']").removeAttr("disabled");
					$("input[name='screenContentOpenTime']").removeAttr("readonly");
				})

				$(document).on("change", "input[name='screenContentOpenTime']", function() {
					screenDate = $("input[name='screenDate']").val();
					screenTheater = $("option:selected").val();
					screenOpenTime = $("input[name='screenDate']").val() + " " + $("input[name='screenContentOpenTime']").val();
					showTm = parseInt($("input[name='showTm']").val());

					if ($("input[name='screenDate']").val().length == 0) {

						screenOpenTime = $(".updateScreenContentModal input[name='screenDate']").val() + " " + $(".updateScreenContentModal input[name='screenContentOpenTime']").val();
						fncAddTime();
					} else {
						fncAddTime();
						fncCheckScreenDupTime()
					}

				})

				$(document).on("click", ".actionAddButton", function() {
					fncAddScreenContent();
				})

				$(document).on("click", ".actionUpdateButton", function() {
					fncUpdateScreenContent();
				})

				$(document).on("click", ".fa-times", function() {
					screenContentNo = ($(this).next().val());
					fncDeleteScreenContent();
				})

				$(document).on("click", ".fa-eraser", function() {
					screenContentNo = ($(this).next().next().val());

					fncGetScreenContent();

					$(".updateScreenContentModal").modal('show');
				})

				$(document).on("click", "span.checkbox", function() {
					previewChecked = $("input[name='previewChecked']").is(":checked");

					if (previewChecked == true) {
						$("input[name='previewTitle']").removeAttr("readonly");
						$("input[name='previewOpenTime']").removeAttr("readonly");
						$("input[name='inviteActor']").removeAttr("readonly");
						//fncCheckScreenDupPreview()
					} else {
						$("input[name='previewTitle']").attr("readonly", true);
						$("input[name='previewOpenTime']").attr("readonly", true);
						$("input[name='inviteActor']").attr("readonly", true);
						$(".checkPreview").remove();
					}
				});

				$("#addButton").click(function() {
					$(".addScreenContentModal").modal('show');
				});

				$(".addScreenContentModal").modal({
					autofocus : false,
					closable : false,
					onApprove : function() {

						return false;
					},
					onDeny : function() {
						/*  funClearInputBox() */
						window.location.reload()
					}
				});

				$(".updateScreenContentModal").modal({
					autofocus : false,
					closable : false,
					onApprove : function() {

						return false;
					},
					onDeny : function() {
						/* funClearInputBox() */
						window.location.reload()
					}
				});

			});
</script>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.page-heading {
	font-family: 'Jeju Gothic', sans-serif;
	font-size: 25px;
}

body {
	font-family: 'Jeju Gothic', sans-serif;
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

.toolBar {
	margin-top: 100px
}

input, select {
	margin-bottom: 10px;
	height: 100%;
	width: 100%;
	border: none;
	box-shadow: none;
	border: 1px solid #dbdee1;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	font-size: 13px;
	color: #4C4145;
	padding: 5px 5px 5px;
}

.addScreenContentWrapper, .updateScreenContentWrapper {
	padding: 10px 10px 10px 10px;
}

.addScreenContentWrapper>div, .updateScreenContentWrapper>div {
	height: 40px;
	margin: 10px 10px 10px 10px;
}

.addScreenContentWrapper button, .updateScreenContentWrapper button {
	padding: 5px 5px 5px 5px;
}

#addButton {
	padding: 5px 5px 5px 5px;
	margin-top: 20px;
	margin-bottom: 20px;
}

.addScreenContentTitle, .updateScreenContentTitle {
	color: #4C4145;
	font-size: 13px;
}

.listTitle {
	font-size: 10px;
	font-weight: bold;
	height: 40px;
	vertical-align: middle;
	padding-top: 5px;
	color: #FFFFFF;
	background-color: #4C4145;
}

.listData {
	font-size: 10px;
	height: 40px;
	vertical-align: middle;
	padding-top: 5px;
	color: #4C4145;
}

.checkDupTime {
	color: #4C4145;
	height: 40px;
	vertical-align: middle;
}

input[readonly="readonly"], select[disabled="disabled"] {
	background-color: #dbdee1;
}

.fa-bars {
	background-color: #4C4145;
	padding: 7px 7px 7px 7px;
	border-width: 1px;
	border-color: #4C4145;
	border-style: solid;
	border-radius: 5px;
	color: #ffffff;
}

.ui-datepicker {
	border: none;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
	padding: 0;
	margin-left: auto;
	margin-top: 15px;
	background-color: #4c4145;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.17);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.17);
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.17);
	position: relative;
}

.checkFlag {
	font-size: 1.5em;
}
</style>
</html>