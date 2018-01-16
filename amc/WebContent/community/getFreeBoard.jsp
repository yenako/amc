<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.amc.service.domain.User"%>
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
					<div class="col-md-12 getFreeBoard">
						<input type="hidden" name="freeBoardNo" value="${freeBoard.freeBoardNo }">
						<input type="hidden" name="userId" value="${user.userId }">
						<input type="hidden" name="role" value="${user.role }">

						<div class="col-md-12 col-sm-12 title">${freeBoard.freeBoardTitle }</div>
						<div class="row freeBoardInfo hidden-xs">
							<div class="col-md-1 col-sm-1 text-right">작성자</div>
							<div class="col-md-1 col-sm-1 text-left">${freeBoard.user.userId }</div>
							<div class="col-md-5 col-sm-5"></div>
							<div class="col-md-1 col-sm-1 text-right">작성일</div>
							<div class="col-md-2 col-sm-2 text-left">${freeBoard.freeBoardRegDate }</div>
							<div class="col-md-1 col-sm-1 text-right">HIT</div>
							<div class="col-md-1 col-sm-1 text-left">${freeBoard.freeBoardViews }</div>
						</div>

						<div class="row freeBoardInfo hidden-sm hidden-md hidden-lg">
							<div class="col-xs-4 text-center">작성자</div>
							<div class="col-xs-8 text-center">${freeBoard.user.userId }</div>
							<div class="col-xs-4 text-center">작성일</div>
							<div class="col-xs-8 text-center">${freeBoard.freeBoardRegDate }</div>
							<div class="col-xs-4 text-center">HIT</div>
							<div class="col-xs-8 text-center">${freeBoard.freeBoardViews }</div>
						</div>
						<div class="col-md-12">
							<hr>
						</div>
						<div class="col-md-12 content">
							<div>
								<c:if test="${freeBoard.freeBoardImage != null}">
									<img id="freeBoardImage" src="/images/community/${freeBoard.freeBoardImage}">
								</c:if>
							</div>
							<div>${freeBoard.freeBoardContent }</div>
						</div>
						<div class="col-md-12">
							<hr>
						</div>
						<div class="col-md-12" style="margin-bottom: 20px;">
							<div class="row freeBoardInfo hidden-xs">
								<div class="col-md-1 text-right">첨부파일</div>
								<div class="col-md-11 text-left">
									<c:if test="${freeBoard.freeBoardImage == null }">
                			첨부파일이 없습니다.
                			</c:if>
									<c:if test="${freeBoard.freeBoardImage != null}">	
                			${freeBoard.freeBoardImage}
                			</c:if>
								</div>
							</div>
							<div class="row freeBoardInfo hidden-sm hidden-md hidden-lg">
								<div class="col-xs-3 text-left" style="font-size: 10px;">첨부파일</div>
								<div class="col-xs-9 text-left" style="font-size: 10px;">
									<c:if test="${freeBoard.freeBoardImage == null }">
		                				첨부파일이 없습니다.
		                			</c:if>
									<c:if test="${freeBoard.freeBoardImage != null}">	
                						${freeBoard.freeBoardImage}
                					</c:if>
								</div>
							</div>



						</div>

					</div>


				</div>

				<div class="col-md-12 text-right button">

					<button type="button" class="btn btn-md btn--warning btn--wider" id='listButton'>
						<i class="fa fa-bars"></i> &nbsp; 목록으로
					</button>
					<c:if test="${user.userId != null }">
						<button type="button" class="btn btn-md btn--warning btn--wider" id='writeButton'>
							<i class="fa fa-pencil"></i> &nbsp;글쓰기
						</button>
					</c:if>
					<c:if test="${user.userId == freeBoard.user.userId || user.role == 'admin' }">
						<button type="button" class="btn btn-md btn--warning btn--wider" id='updateButton'>
							<i class="fa fa-eraser"></i> &nbsp;수정
						</button>
						<button type="button" class="btn btn-md btn--warning btn--wider" id='deleteButton'>
							<i class="fa fa-times"></i>삭제
						</button>
					</c:if>

				</div>





			</section>





			<section class="container">
				<div class="container col-md-12">
					<h2 class="page-heading commentHeader">댓글</h2>
					<div class="comment-wrapper col-md-12">
						<div id="comment-form" class="comment-form">
							<c:if test="${user.userId !=null}">
								<textarea class="comment__text" id="addCommentText" placeholder='댓글을 등록해 주세요'></textarea>
							</c:if>
							<c:if test="${user.userId ==null}">
								<textarea class="comment__text" id="addCommentText" placeholder='로그인 후 이용해주세요' readonly="readonly"></textarea>
							</c:if>
							<button type='submit' class="btn btn-md btn--danger comment__btn" <c:if test="${user.userId ==null}">disabled="disabled"</c:if> id="addCommentButton">등록</button>

						</div>

						<div class="comment-sets"></div>

					</div>


				</div>
				<div class="clearfix">
					<input type="hidden" name='commentNo2'>
					<input type="hidden" name='comment2'>
					<input type="hidden" name="parentCommentNo2">
					<input type="hidden" name="buttonFlag" id="buttonFlag" value="">
					<form class="search">
						<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}" />
						<input type="hidden" id="startRowNum" name="startRowNum" value="0" />
					</form>
				</div>
			</section>

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


	<!-- Custom -->
	<script src="/js/custom.js"></script>


	<script type="text/javascript">
		  function fncAddComment() {


     	
         	 if(comment == ""){
         		 alert("댓글을 입력해 주세요");
         		 return;
         	 }
         		 $.ajax({
         				url : "/community/json/addComment/",
         				type : 'POST',

         				headers : {
         				   "Accept" : "application/json",
						"Content-Type" : "application/json"
         				},
         				data : JSON.stringify({
         					freeBoard : {
         						freeBoardNo : freeBoardNo
         					},
         					user : {
         						userId : userId
         					},
         					commentContent : comment,
         					parentCommentNo : parentCommentNo

         				}),
         				dataType : "text",

         				success : function(JSONData, status) { 					
         					console.log("fncAddComment()");
         					$("#addCommentText").val(null);
         					//fncGetCommentList() 
         					
         					fncGetPageList(currentPage) 
         				}
         			}) 
 	     }
		  
	
		
		function fncTextareaReplyComment() {
			
			 $("#comment"+$("input[name='commentNo2']").val()).html($("input[name='comment2']").val());

			$("div[name='reply-form']").remove();
	
			 
			var dispaly = '<div id="comment-form" class="comment-form" name="reply-form">'+
			'<textarea class="comment__text" id="addReplyCommentText" placeholder="답글을 등록해 주세요"></textarea>'+
			'<button type="submit" class="btn btn-md btn--danger comment__btn" id="addReplyCommentButton">등록</button></div>'

			
			$(".comment_reply"+parentCommentNo).after(dispaly);

		}
		
		
		function fncGetComment() {
			console.log(commentNo);
			console.log(comment);
		
        	 
			 $("#comment"+$("input[name='commentNo2']").val()).html($("input[name='comment2']").val());

			var dispaly =  '<div id="comment-form" class="comment-form update" name="update'+commentNo+'">'+
			'<input type="hidden" id="commentNo" value="'+commentNo+'">'+
			'<textarea class="comment__text" id="updateCommentText" value="">'+comment+'</textarea>'+
			'<button type="submit" class="btn btn-md btn--shine comment__btn" id="updateCommentButton">수정</button></div>'

		 		$("#comment"+commentNo).html(dispaly);
				
			$("input[name='commentNo2']").val(commentNo);
			$("input[name='comment2']").val(comment);
		}
		
		
		
		 function fncUpdateComment() {
    	

				$.ajax({
					url : "/community/json/updateComment/",
					type : 'POST',

					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					data : JSON.stringify({
						commentContent : comment,
						commentNo : commentNo
					}),
					dataType : "text",

					success : function(JSONData, status) {
						 
						///fncGetCommentList()
						//$("#startRowNum").val(0);
						$("#startRowNum").val(2);


						fncGetPageList(currentPage) 
						$("input[name='commentNo2']").val(commentNo);
						$("input[name='comment2']").val(comment);
						
					}
				})
			
		}
		 
		 
		
		
		function fncDeleteComment() {
			
			 
			 if(confirm("정말 삭제하시겠습니까?") ==true){
				 $.ajax({
						url : "/community/json/deleteComment/"+ commentNo,
						type : 'GET',
	
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
	
						dataType : "text",
	
						success : function(JSONData, status) {
							console.log("fncDeleteComment() JSONData "+ JSONData);
							
							if(JSONData == 0){
								alert("답글이 달린 댓글은 삭제가 불가능 합니다.");
							}
							//fncGetCommentList();
							currentPage = 1;
							fncGetPageList(currentPage) 
						}
					})
			 }else{
				 return;
			 }
	}
		
		
		
		
		
		 function fncGetPageList(currentPage) {
			 
			 	$('#watchlist').remove();
		        $("#currentPage").val(currentPage)		  
		        queryString = $(".search").serialize();
		        
		        
		         $.ajax({
                 url: "/community/json/getCommentList/" + freeBoardNo,
                 method: "post",          
                data : queryString,
                 dataType : 'json',
                 success: function(JSONData, status) {
              	   var result = JSONData;
              	 
              	   displayValue = '';
              	   
              	 $.each(result, function(idx, val) {
              		 if(val.commentNo == val.parentCommentNo){
              			displayValue += '<div class="comment">'+		
                 		'<p class="commentUserId">'+
                 		'<span class="commentFreeBoardNo">'+
                 		val.commentNo+
                 		'</span>'+
                 		val.user.userId
                 		
                 		displayValue += '</p>'
              			 
              		 }else{
              			displayValue += '<div class="comment comment-answer">'+		
                     		'<p class="commentUserId">'+
                     		'<span class="replyIcon">'+
                     		'<i class="fa fa-level-up"></i>'+
                     		'</span>'+
                     		val.user.userId+'</p>'
              		 }
              		displayValue += '<p class="comment__content" id="comment'+val.commentNo+'">'+
              		val.commentContent +
              		'</p>'+
              		'<span class="comment__regDate">'+
              		val.commentRegDate +
              		'</span>'
              		if(userId == val.user.userId || role == 'admin'){
              			displayValue += '<span class="comment__update" >'+
                   		'<i class="fa fa-eraser fa-2x"></i> '+
                   		'<input type="hidden" id="commentNo" value="'+val.commentNo+'">'+
                    	'<input type="hidden" id="comment" value="'+val.commentContent+'">'+
                     '</span>'+
                     '<span class="comment__delete" >'+
                     '<i class="fa fa-times fa-2x"></i>'+
                   	'<input type="hidden" id="commentNo" value="'+val.commentNo+'">'+
                     '</span>'
              		}
              		if(val.commentNo == val.parentCommentNo){
              			if(userId != null){
              				
            
              			displayValue += '<span class="comment_reply comment_reply'+val.commentNo+'" >'+
                        '<i class="fa fa-plus-square-o"> 답글달기 </i>'+
                       	'<input type="hidden" id="parentCommentNo" value="'+val.commentNo+'">'+
                         '</span>'
              			 }
              		}
              		displayValue+= '</div>'
              		
              	
              	 });
              	   
 
              	 
              	 $.ajax({
                     url: "/community/json/getFreeBoardTotalCount/" + freeBoardNo,
                     method: "post",          
                    data : queryString,
                     dataType : 'json',
                     success: function(JSONData, status) {
                    	 console.log(JSONData.currentPage);
                    	 console.log(JSONData.totalCount); 
                    	 console.log(JSONData.endUnitPage);
                    	 
                    	 displayValue += '<div class="comment-more">'
               
                    	 if(JSONData.endUnitPage != JSONData.currentPage ){
                    		 displayValue +='<div id="watchlist"><i class="fa fa-comment"></i><span id="moreComment">댓글 더 보기</span><div>'
                    	 }
                    	 

                    	 displayValue += '</div>'
                    	 
                    		 buttonFlag = $("input[name='buttonFlag']").val();
      
                    	 
                    		 if(buttonFlag != "more"){
                    		 $(".comment-sets").html("");
                    		 JSONData.currentPage = 1;
                    		 }else{
                    			 $("input[name='buttonFlag']").val("");           			 
                    		 }
                    	 
                    	 $(".comment-sets").html(displayValue);
                    	 
                    	 $(".totalCount").remove();
                    	
                    	 display = '<span class="totalCount"> &nbsp; ('+JSONData.totalCount+')</span>'
                     	
                    	
                    	 $(".commentHeader").append(display);
                    	 
                    	 $("#currentPage").val(JSONData.currentPage);
                    	 //$("input[name='buttonFlag']").val("");
                    	
                     }
              	 });
              	 


                 }

             });
		        
		        
		     
		    }
		    
		 
		 
            $(document).ready(function() {
            	
                init_MovieList();
                freeBoardNo = $("input[name='freeBoardNo']").val();
                userId = $("input[name='userId']").val();
                role = $("input[name='role']").val();
                currentPage = $("#currentPage").val();
                buttonFlag = $("input[name='buttonFlag']").val();	
               
               // fncGetCommentList()
              fncGetPageList(currentPage) 
                if($('html').height() < window.outerHeight){
                	$('html').css('height', '100%');
                }
                
                $(document).on("click", "#listButton", function () {
        			
    				$(self.location).attr("href","/community/getFreeBoardList");
    		
    			})
                
    			$(document).on("click", "#writeButton", function () {
    			
    				$(self.location).attr("href","/community/addFreeBoard.jsp");
    		
    			})
    			   $(document).on("click", "#deleteButton", function () {
    				if(confirm("정말 삭제하시겠습니까?")==true){
    					$(self.location).attr("href","/community/deleteFreeBoard?freeBoardNo="+freeBoardNo);
    				}else{
    					return;
    				}
    			})
    			
    			$(document).on("click", "#updateButton", function () {
    			
    				$(self.location).attr("href","/community/updateFreeBoard?freeBoardNo="+freeBoardNo);
    		
    			})
    			
    			
    			
    			//댓글달기
    			$(document).on("click", "#addCommentButton", function () {
    				parentCommentNo =  0;
    				comment = $("#addCommentText").val();    
    				$("#buttonFlag").val('add');	
    				currentPage = 1;
    				fncAddComment(); 		
    			})
    			//댓글/답글 삭제
    			$(document).on("click", ".comment__delete", function () {
    				commentNo=  $("#commentNo",$(this)).val();			
    				
					fncDeleteComment();     			
				})
            });
            //댓글/답글 수정 아이콘누르기
			$(document).on("click", ".comment__update", function () {
				
				commentNo=  $("#commentNo",$(this)).val();
				comment=  $("#comment",$(this)).val();	 
       		 	
       		 	fncGetComment();
		
			})
			//댓글/답글수정
			$(document).on("click", "#updateCommentButton", function () {
			    $("#startRowNum").val(2);
				
       		 	commentNo = $(this).parent().find("#commentNo").val();
       		 	comment =  $(this).parent().find("#updateCommentText").val();
       		 	fncUpdateComment();
		
			})
			// 답글버튼누르기
			$(document).on("click", ".comment_reply", function () {
				
				
				parentCommentNo = $("#parentCommentNo",$(this)).val();

				$("input[name='parentCommentNo2']").val(parentCommentNo);
				if(userId == ""){
					alert("로그인 후 이용해주세요");
					return
				}else{
					fncTextareaReplyComment();
				}
		
				
			})
			
			//답글 달기
			$(document).on("click", "#addReplyCommentButton", function () {
				parentCommentNo = 	$("input[name='parentCommentNo2']").val();
	
       		 	comment =  $("#addReplyCommentText").val();
       		 $("#startRowNum").val(2);
			
				fncAddComment(); 		
 
			})
			
			//댓글더보기
			
			$(document).on("click", "#watchlist", function () {
				
				currentPage = $("#currentPage").val();
				test = 'more';
				buttonFlag  = $("input[name='buttonFlag']").val();
				
				$("#buttonFlag").val('more');	

				currentPage = parseInt(currentPage)+1
				
				fncGetPageList(currentPage);
				
 
			})
			
			
			
			
			
		</script>


</body>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.page-heading {
	font-family: 'Jeju Gothic', sans-serif;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}

html {
	height: auto;
}

section {
	margin-bottom: 30px
}

.page-heading {
	margin-top: 70px;
	font-size: 30px;
}

hr {
	border: solid 0.5px #dbdee1;
}

.title {
	font-size: 20px;
	font-weight: bold;
	height: auto;
	padding-bottom: 10px;
}

.getFreeBoard div {
	color: #4C4145;
}

.content {
	height: auto;
	margin-bottom: 10px;
}

.button button {
	padding: 5px 5px 5px 5px;
}

.freeBoardInfo>div {
	padding-top: 10px;
	padding-botton: 10px;
}

#freeBoardImage {
	width: 100%;
	margin-bottom: 20px;
}

.comment-form {
	margin-bottom: 60px;
}

.comment-form .update {
	margin-top: 40px;
}

.comment-form .comment__text {
	width: 100%;
	min-height: 78px;
	padding: 8px 19px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	background-color: #ffffff;
	border: solid 1px #dbdee1;
	font-size: 13px;
	color: #4C4145;
}

.comment-form .comment__btn {
	float: right;
	margin-top: 9px;
	margin-bottom: 9px;
}

.commentUserId {
	font-size: 18px;
	margin-bottom: 5px;
	font-weight: bold;
	color: #4C4145;
}

.commentFreeBoardNo {
	font-size: 10px;
	color: #969b9f;
	font-weight: normal;
	margin-right: 5px;
}

.replyIcon {
	font-size: 13px;
	font-weight: normal;
	margin-right: 5px;
}

.fa-level-up {
	-ms-transform: rotate(90deg);
	-webkit-transform: rotate(90deg);
	transform: rotate(90deg);
}

.comment__content {
	font-size: 15px;
	line-height: 14px;
	margin-bottom: 5px;
	margin-left: 10px;
	color: #4C4145;
}

.comment .comment__regDate {
	font-size: 12px;
	color: #969b9f;
	line-height: 14px;
	padding-right: 7px;
	margin-left: 10px;
}

.comment {
	padding-top: 15px;
	padding-bottom: 15px;
}

.comment-answer {
	padding-left: 20px;
}

.comment-answer .comment__content, .comment-answer .comment__regDate {
	padding-left: 20px;
}

.comment .comment_reply {
	right: 0;
	font-size: 12px;
	color: #fe505a;
	margin-left: 10px;
}

.comment .comment_reply:before {
	font-size: 12px;
	color: #fe505a;
	font-family: "FontAwesome";
	margin-left: 10px;
}

.comment .comment_reply:hover, .comment .comment_reply:hover:before {
	opacity: 0.7;
}

#moreComment {
	padding-left: 10px
}

#watchlist {
	font-size: 13px;
	color: #4c4145;
	border: 1px solid #4c4145;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	position: relative;
	padding: 10px 20px 10px 20px;
	-webkit-transition: 0.5s;
	-o-transition: 0.5s;
	transition: 0.5s;
	display: inline-block;
	margin-bottom: 15px;
}

#watchlist:before {
	font-size: 13px;
	left: 21px;
}

#watchlist:hover {
	background-color: #dbdee1;
}

.fa-2x {
    font-size: 1.5em;
}
</style>

</html>
