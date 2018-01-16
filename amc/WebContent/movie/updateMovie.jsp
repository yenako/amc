<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@page import="java.util.Arrays"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.amc.service.domain.User"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html lang="ko">

<head>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">



</head>
<body>

	<form id="updateMovie" enctype="multipart/form-data" method="POST">
		<input type="hidden" name="movieNo" value="${movie.movieNo}" />

		<div class="banner-top">
			<img alt='top banner' src="../images/banners/space.jpg">
		</div>

		<header class="header-wrapper header-wrapper--home">
			<!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="/layout/topToolbar.jsp" />

			<!-- ToolBar End /////////////////////////////////////-->
		</header>


		<div class="container">

			<br /> <br />

			<div class="page-header">
				<h2 class=" page-heading">${movie.movieNm}</h2>
			</div>

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>����</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<input type="text" name="directors" value="${movie.directors}" disabled class="ct_input_g" maxLength="30" />
				</div>
			</div>


			<div class="row">
				<div class="col-xs-4 col-md-2 ">
					<strong>���</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<input type="text" name="actors" value="${movie.actors}" disabled class="ct_input_g" maxLength="30" />
				</div>

			</div>


			<div class="row">
				<div class="col-xs-4 col-md-2 ">
					<strong>�帣</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<input type="text" name="genres" class="ct_input_g" value="${movie.genres}" disabled maxLength="30" />
				</div>

			</div>

			<div class="row">
				<div class="col-xs-4 col-md-2 ">
					<strong>�������</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<input type="text" name="watchGradeNm" class="ct_input_g" value="${movie.watchGradeNm}" maxLength="30" />
				</div>

			</div>

			<div class="row">
				<div class="col-xs-4 col-md-2 ">
					<strong>������¥ </strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<input type="date" value="${movie.openDt}" name="openDt" class="ct_input_g" maxLength="30" />
				</div>
			</div>

			<div class="row">
				<div class="col-xs-4 col-md-2 ">
					<strong>����Ÿ��</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<input type="text" name="showTm" class="ct_input_g" value="${movie.showTm}" maxLength="30" />
					&nbsp;��
				</div>

			</div>


			<div class="row">
				<div class="col-xs-4 col-md-2 ">
					<strong>�󿵸��� </strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<input type="date" name="endDt" class="ct_input_g" value="${movie.endDt}" maxLength="30" />
				</div>
			</div>


			<div class="row">
				<div class="col-xs-4 col-md-2 ">
					<strong>������</strong>
				</div>
				<div class="col-xs-4 col-md-3">
					<img class="poster" src="${movie.postUrl}" width="160px" ` align="left" />

					<input type="text" value="" name="postUrl" id="postUrlCheck" class="ct_input_g" maxLength="30" />

				</div>
				<div class="col-xs-4 col-md-3 ">
					<span href="#" id="searchPoster" class="searchPoster">������ �˻�</span>

				</div>
			</div>

			<hr />

			<div class="row">
				<div class="col-xs-4 col-md-2 ">
					<strong>�ٰŸ�</strong>
				</div>
				<div class="col-xs-8  col-md-10">
					<textarea name="synopsis" id="synopsis">${movie.synopsis} </textarea>
				</div>
			</div>

			<hr />



			<div class="row">
				<div class="col-xs-4 col-md-2 steelCut ">
					<strong>��ƿ��</strong>
				</div>
				<!-- <a class='thumbnail' style="text-decoration:none;"> -->
				<!-- <img src="file:C:/amcPoster/${movie.steelCut1}" width="160px" height="180px" align="left"/>  -->
				<div class="col-xs-2 col-md-3 ">
					<img src="../images/movie/${movie.steelCut1}" width="220" height="190" />
				</div>
				<div class="col-xs-2 col-md-3 ">
					<img src="../images/movie/${movie.steelCut2}" width="220" height="190" />
				</div>
				<div class="col-xs-2 col-md-3 ">
					<img src="../images/movie/${movie.steelCut3}" width="220" height="190" />
				</div>
			</div>


			<hr />

			<div><input class="ui-button ui-widget ui-corner-all"  type="file" id="file1" name="file" required="required" /></div>
			<div><input class="ui-button ui-widget ui-corner-all"  type="file" id="file2" name="file"  /></div>
			<div><input class="ui-button ui-widget ui-corner-all"  type="file" id="file3" name="file"  /></div>   
			

			<hr />

			<div class="row">
				<div class="col-xs-2 col-md-2 col-lg-2">
					<strong>Ʈ���Ϸ� URL</strong>
				</div>
				<div class="col-xs-4 col-md-6">
					<textarea name="trailerName" id="trailerId" rows="2" cols="60">${movie.trailer} </textarea>
					<input type="hidden" value="" name="trailer" id="trailerCheck" class="ct_input_g" maxLength="30" />
				</div>
				<div class="col-xs-4 col-md-4 ">
					<span href="#" id="searchTrailer" class="searchTrailer">������˻�</span>

				</div>
			</div>
			<hr />
			<div class="row">


				<div class="col-md-12 text-center ">
					<a href="#" id="list" class="btn btn-md btn--info" onclick="history.go(-1)">�������</a>
					<a href="#" id="updateMoviebtn" class="btn btn-md btn--info">����</a>
					<a href="#" class="btn btn-md btn--danger">����</a>
				</div>



			</div>

			<br />



		</div>
		<!--  ȭ�鱸�� div Start /////////////////////////////////////-->


		<div class="bottom low ">
			<!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="/layout/bottomToolbar.jsp" />
			<jsp:include page="/layout/loginModal.jsp" />
			<!-- ToolBar End /////////////////////////////////////-->
		</div>

	</form>
	<div class="container">


		<div class="ui modal searchTrailerModal">
			<i class="close icon"></i>
			<div>
				<span class="searchMovieNm">
					<i class="fa fa-search"></i>&nbsp; ${movie.movieNm}
				</span>
			</div>
			<div class="listTrailer scrolling content"></div>
			<input type="hidden" name="movieNm" value="${movie.movieNm}" />
		</div>



		<div class="ui modal searchPosterModal">
			<i class="close icon"></i>
			<div>
				<span class="searchMovieNm">
					<i class="fa fa-search"></i>&nbsp; ${movie.movieNm} ������
				</span>
			</div>
			<div class="row col-md-12">
				<div class="row col-md-3">
					<input type="text" name="searchPoster" placeholder="���ϴ� �˻������ ���� �� ������ּ���">
				</div>
				<div class="row col-md-2">
					<button type="button" name="searchClick">�˻�</button>
				</div>
			</div>

			<div class="listPoster scrolling content"></div>
			<input type="hidden" name="movieNm" value="${movie.movieNm}" />
		</div>


	</div>



	<script src="/js/external/jquery-migrate-1.2.1.min.js"></script>
	<!-- jQuery UI -->
	<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

	<!-- Custom -->
	<script src="/js/custom.js"></script>


	<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>


</body>


<!--  ///////////////////////// JavaScript ////////////////////////// -->

<script type="text/javascript">
    $('.boxshadow').css("box-shadow", "0 0 0px rgba(0, 0, 0, 0)")

    function unifiedSearch() {
        //POST�� �ٲ����
        $("form").attr("method", "POST").attr("action", "/cinema/unifiedSearch").submit();
        /* $(self.location).attr("href","/cinema/unifiedSearch"); */
    }

    function searchTrailer() {

        searchTrailer = movieNm + ' ������';
      
        searchTrailer =   encodeURI(encodeURIComponent(searchTrailer));

        $.ajax({
            url : "/movie/json/searchTrailer/" + searchTrailer,
            method : "GET",
            dataType : "json",
            headers : {
                "Content-Type" : "application/json"
            },
            success : function(JSONData, status) {

                displayValue = "";
                for (var i = 0; i < JSONData.list.length; i++) {

                    displayValue += '<div class="col-md-12 getTrailer"><div class="col-md-3"><img src="'+JSONData.list[i].thumbnail+'"></div>' + '<div class="col-md-9">' + '<div class="title">' + JSONData.list[i].title + '</div>' + '<div class="url">' + JSONData.list[i].url + '</div>' + '	</div></div>'
                }

                $(".listTrailer").html(displayValue);
            },
        })
    }

    function searchPosterResult() {

        $.ajax({
            url : "/movie/json/searchPoster/" + searchPoster,
            method : "GET",
            dataType : "json",
            headers : {
                "Content-Type" : "application/json"
            },
            success : function(JSONData, status) {

                displayValue = '<div class="row">';
                for (var i = 0; i < JSONData.list.length; i++) {

                    displayValue += '<div class="col-md-3 col-sm-3 getPoster"><img class="searchThumbnail" src="'+JSONData.list[i].thumbnail_url+'">' + '<input type="hidden" name="postUrlSearch" class="imageUrl" value="' + JSONData.list[i].image_url  + '"></div>'

                }
                displayValue += '</div>';

                $(".listPoster").html(displayValue);

            },
        })
    }

    $(document).ready(function() {

        movieNm = $("input[name='movieNm']").val();

        $(document).on('click', '.searchTrailer', function() {
            $(".searchTrailerModal").modal('show');
            searchTrailer();
        });

        $(document).on('click', '.getTrailer', function() {
            url = $(".url", $(this)).html();
            $("#trailerId").val(url);
            $("#trailerCheck").val(url);

            $(".searchTrailerModal").modal('hide');
        });

        $(document).on('click', '.getPoster', function() {

            image_url = $(".imageUrl", $(this)).val();

            $("#postUrlCheck").val(image_url);

            console.log(image_url);
            $(".poster").removeAttr("src");
            $(".poster").attr("src", image_url);
            $(".searchPosterModal").modal('hide');
        });

        $(".searchTrailerModal").modal({
            autofocus : false,
            closable : true,
            observeChanges : true,
            onApprove : function() {

                return false;
            },
            selector : {
                close : '.close.icon'
            }

        });

        $(document).on('click', '.searchPoster', function() {

            $(".searchPosterModal").modal('show');
            searchPoster = movieNm;
            searchPoster = encodeURI(encodeURIComponent(searchPoster));

            searchPosterResult();

        });

        $(document).on("click", "button[name='searchClick']", function() {
            searchPoster = $("input[name='searchPoster']").val();
            searchPoster =  encodeURI(encodeURIComponent(searchPoster))
            
         

            searchPosterResult();
        })

        $(".searchPosterModal").modal({
            autofocus : false,
            closable : true,
            observeChanges : true,
            onApprove : function() {

                return false;
            },
            selector : {
                close : '.close.icon'
            }

        });

    })
</script>



<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.page-heading {
	font-family: 'Jeju Gothic', sans-serif;
	margin-top: 50px
}

body, .row {
	font-family: 'Noto Sans KR', sans-serif;
}

.searchMovieNm {
	font-family: 'Jeju Gothic', sans-serif;
	font-size: 25px;
	font-weight: bold;
	color: #4c4145;
}

.title {
	font-weight: bold;
}

.listTrailer, .listPoster {
	margin-top: 10px;
	font-family: 'Jeju Gothic', sans-serif;
	font-size: 13px;
	color: #4c4145;
}

.listTrailer div, .listPoster div {
	font-size: 15px;
}

.searchThumbnail {
	margin: 5px 5px 5px 5px
}

input {
	height: 30px;
	width: 170px;
	border: none;
	box-shadow: none;
	border: 1px solid #dbdee1;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	font-size: 13px;
	color: #4c4145;
	margin-top: 5px;
	margin-bottom: 5px;
}

.getTrailer:hover {
	color: #fe505a;
}

.searchTrailer, .searchPoster {
	background-color: #4C4145;
	padding: 7px 7px 7px 7px;
	border-width: 1px;
	border-color: #4C4145;
	border-style: solid;
	border-radius: 5px;
	color: #ffffff;
}

.steelCut img {
	width: 100%;
	height: 100%
}

.thumbnail {
	width: 300px;
	height: 250px;
	overflow: auto;
}

.listTrailer>div {
	margin-bottom: 5px
}

#synopsis {
	width: 100%;
	min-height: 200px;
	padding: 8px 19px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	background-color: #ffffff;
	border: solid 2px #dbdee1;
	font-size: 13px;
	color: #4c4145;
}

#trailer {
	width: 100%;
	min-height: 50px;
	padding: 8px 19px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	background-color: #ffffff;
	border: solid 2px #dbdee1;
	font-size: 13px;
	color: #4c4145;
}

.searchTrailerModal, .searchPosterModal {
	padding: 10px 10px 10px 10px
}

.searchPosterModal input {
	font-size: 10px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
    $(function() {
        //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
        //==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
        $("#updateMoviebtn").on("click", function() {
            //alert("���� ��ư Ŭ�� Ȯ��");
            //Debug..
            // <!-- <a href="javascript:history.go(-1)"></a> -->
            fncUpdateMovie()
        });
        
        $("#list").on("click", function() {
            //alert("���� ��ư Ŭ�� Ȯ��");
            //Debug..
            // <!-- <a href="javascript:history.go(-1)"></a> -->
        	self.location = "/movie/getMovieList?menu=manage"
        });
        
    });

    $(function() {
        //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
        //==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
        $(".btn.btn-md.btn--danger").on("click", function() {
            //Debug..
            // <!-- <a href="javascript:history.go(-1)"></a> -->
            fncDeleteMovie()

        });
    });

    function fncUpdateMovie() {
        // document.fncAddProduct.submit();

        var movieNm = $("input[name='movieNm']").val();

        var directors = $("input[name='directors']").val();
        var actors = $("input[name='actors']").val();
        var genres = $("input[name='genres']").val();
        var watchGradeNm = $("input[name='watchGradeNm']").val();
        var openDt = $("input[name='openDt']").val();
        var showTm = $("input[name='showTm']").val();
        var endDt = $("input[name='endDt']").val();
        var synopsis = $("input[name='synopsis']").val();
        var trailer = $("input[name='trailerCheck']").val();
        var pster = $("input[name='postUrlCheck']").val();

        var defaultposterUrl = $(".poster").attr("src");
        var defaulttrainerUrl = $("#trailerId").val();
        var imgVal1 = $('#file1').val(); 
        var imgVal2 = $('#file2').val(); 
        var imgVal3 = $('#file3').val();         
 
  
        // $("#postUrlCheck").val(image_url); 
        // $("#trailerCheck").val(url);

        if (pster != null) {

        } else {
        	pster = defaultposterUrl;
        	//alert("pster url" + pster);
        	$("#postUrlCheck").val(pster);
               
         
        }

        if (trailer != null) {

        } else {
        	trailer = defaulttrainerUrl;
        	//alert("trailer url" + trailer);
        	$("#trailerCheck").val(trailer); 
               
          
        }

        if (directors == null || directors.length < 1) {
            alert("�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
            return;
        }
        if (actors == null || actors.length < 1) {
            alert("������ �ݵ�� �Է��Ͽ��� �մϴ�.");
            return;
        }
        if (genres == null || genres.length < 1) {
            alert("�帣���� �ݵ�� �Է��ϼž� �մϴ�.");
            return;
        }
        if (watchGradeNm == null || watchGradeNm.length < 1) {
            alert("��������� �ݵ�� �Է��ϼž� �մϴ�.");
            return;
        }
        if (openDt == null || openDt.length < 1) {
            alert("������¥��  �ݵ�� �Է��ϼž� �մϴ�.");
            return;
        }
        if (showTm == null || showTm.length < 1) {
            alert("����Ÿ����  �ݵ�� �Է��ϼž� �մϴ�.");
            return;
        }
        if (endDt == null || endDt.length < 1) {
            alert("�󿵸�����  �ݵ�� �Է��ϼž� �մϴ�.");
            return;
        }
        
        if (imgVal1 == null || imgVal1.length < 1) {
            alert("��ų�� ����1��   �ݵ��   �Է��ϼž� �մϴ�.");
            return;
        } 
        
        /*
        if (imgVal2 == null || imgVal2.length < 1) {
            alert("��ų�� ����2��   �ݵ��  3�� �Է��ϼž� �մϴ�.");
            return;
        }
        
        if (imgVal3 == null || imgVal3.length < 1) {
            alert("��ų�� ����3��   �ݵ��  3�� �Է��ϼž� �մϴ�.");
            return;
        } */
        

        /*   var $updateMovie = $('#updateMovie');
        	  var postUrl = $("input[name='postUrl']").val();
         */

        $("form").attr("method", "POST").attr("action", "/movie/updateMovie").submit();
    }

    //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
    function fncDeleteMovie() {

        var movieNo = $("input[name='movieNo']").val();
        //alert("movieNo" + movieNo);
       
        if(confirm("���� ���� �Ͻðڽ��ϱ�?")) {
        	$("form").attr("method", "POST").attr("action", "/movie/deleteMovie?movieNo=" + movieNo).submit();
        }

      
    }
</script>

</html>

