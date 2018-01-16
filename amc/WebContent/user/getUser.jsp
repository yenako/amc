<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<!-- Basic Page Needs -->
<meta charset="utf-8">
<title>회원 정보 조회</title>
<meta name="description" content="A Template by Gozha.net">
<meta name="keywords" content="HTML, CSS, JavaScript">
<meta name="author" content="Gozha.net">

<!-- Mobile Specific Metas-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="telephone=no" name="format-detection">

<!-- Fonts -->
<!-- Font awesome - icon font -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<!-- Roboto -->
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'>

<!-- Stylesheets -->
<!-- jQuery UI -->
<link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="stylesheet">

<!-- Mobile menu -->
<link href="/css/gozha-nav.css" rel="stylesheet" />
<!-- Select -->
<link href="/css/external/jquery.selectbox.css" rel="stylesheet" />
<!-- Swiper slider -->
<link href="/css/external/idangerous.swiper.css" rel="stylesheet" />

<!-- Custom -->
<!-- <link href="/css/style.css?v=1" rel="stylesheet" /> -->

<!-- Modernizr -->
<!-- <script src="/js/external/modernizr.custom.js"></script> -->

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!--   Sweetalert2 CDN  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.0/sweetalert2.all.min.js"></script>

<!--   semantic UI  -->
<link rel="stylesheet" type="text/css" href="../semantic/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
<script src="../semantic/semantic.min.js"></script>

<!-- sweetalert -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.1/sweetalert2.all.min.js"></script>
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
			<h2 class="page-heading">회원정보조회</h2>
			<div class="col-sm-12">

				<h5 class="text-muted">
					내 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.
				</h5>

				<div class="row">
					<div class="col-xs-4 col-md-2">
						<strong>아 이 디</strong>
					</div>
					<div class="col-xs-8 col-md-4">${user.userId}</div>
				</div>
				<hr />

				<div class="row">
					<div class="col-xs-4 col-md-2 ">
						<strong>이 름</strong>
					</div>
					<div class="col-xs-8 col-md-4">${user.userName}</div>
				</div>
				<hr />

				<div class="row">
					<div class="col-xs-4 col-md-2 ">
						<strong>성별</strong>
					</div>
					<div class="col-xs-8 col-md-4">${user.gender}</div>
				</div>
				<hr />

				<div class="row">
					<div class="col-xs-4 col-md-2 ">
						<strong>주소</strong>
					</div>
					<div class="col-xs-8 col-md-8">${user.addr}</div>
				</div>
				<hr />

				<div class="row">
					<div class="col-xs-4 col-md-2 ">
						<strong>상세주소</strong>
					</div>
					<div class="col-xs-8 col-md-4">${user.addrDetail}</div>
				</div>
				<hr />

				<div class="row">
					<div class="col-xs-4 col-md-2 ">
						<strong>휴대전화번호</strong>
					</div>
					<div class="col-xs-8 col-md-4">${ !empty user.phone1 ? user.phone1 : ''}&emsp;${ !empty user.phone2 ? user.phone2 : ''}&emsp;${ !empty user.phone3 ? user.phone3 : ''}</div>
				</div>
				<hr />

				<div class="row">
					<div class="col-xs-4 col-md-2 ">
						<strong>가입일자</strong>
					</div>
					<div class="col-xs-8 col-md-4">${user.userRegDate}</div>
				</div>
				<hr />

				<div class="row">
					<div class="col-md-12 text-center ">
						<button id="update" class="btn pull-center" type="button" class="btn btn-primary">회원정보수정</button>

						<c:if test="${sessionScope.user.role eq 'admin'}">
							<button id="back" class="btn pull-center" type="button" class="btn btn-primary">목록으로</button>
						</c:if>

						<button id="delete" class="btn pull-right" type="button" class="btn btn-primary">회원탈퇴</button>
					</div>
					<br />
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/layout/bottomToolbar.jsp" />
	<jsp:include page="/layout/loginModal.jsp" />

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

	<!-- Mobile menu -->
	<script src="/js/jquery.mobile.menu.js"></script>
	<!-- Select -->
	<script src="/js/external/jquery.selectbox-0.2.min.js"></script>
	<!-- Swiper slider -->
	<script src="/js/external/idangerous.swiper.min.js"></script>

	<!-- Form element -->
	<script src="/js/external/form-element.js"></script>
	<!-- Form validation -->
	<script src="/js/form.js"></script>

	<!-- Custom -->
	<script src="/js/custom.js"></script>

</body>
<script type="text/javascript">
    //============= 회원정보수정 Event  처리 =============	
    $(function() {
        //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
        $("#update").on("click", function() {
            self.location = "/user/updateUser?userId=${user.userId}"
        });
    });

    //============= 회원탈퇴 Event  처리 =============	
    $(function() {
        //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
        $("#delete").on("click", function() {
            swal({
                title : '회원탈퇴를 진행하시겠습니까?',
                text : "'예'를 누르시면 회원탈퇴 페이지로 이동합니다!",
                type : 'warning',
                showCancelButton : true,
                confirmButtonColor : '#3085d6',
                cancelButtonColor : '#d33',
                confirmButtonText : 'YES'
            }).then(function() {
                /* swal({	   
                  type: 'success',
                  title: '회원탈퇴 페이지로 이동합니다.',
                  showConfirmButton: false,
                  timer: 1000
                }) */
                self.location = "/user/deleteUser";
                /* delay() */
            })

        });
    });

    function sleep(num) { //[1/1000초]
        var now = new Date();
        var stop = now.getTime() + num;
        while (true) {
            now = new Date();
            if (now.getTime() > stop)
                return;
        }
    }

    function delay() {
        setTimeout(function move() {
            self.location = "/user/deleteUser";
        }, 1500)
    }

    $(function() {
        $("#back").bind('click', function() {
        	self.location = "/user/getUserList";
        });
    });
</script>
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
#body {
	margin-top: 100px;
}

.text-muted{
font-family: 'Jeju Gothic', sans-serif;
font-size:15px;
}

html {
	height: auto;
}
</style>

</html>