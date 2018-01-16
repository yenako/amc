<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">

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
    <div class="container" id="body">
        
        <!-- Main content -->
        <!--  <section class="container"> -->
        
                <!-- Search bar -->
 			<div class="col-sm-12">
 			
                <h1 class="page-heading"> �û�ȸ ��ȭ  </h1>                
				
			       <div class="col-md-2 text-right">          
                    <form class="form-inline" name="detailForm">
                 
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				     size="15"	 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  	 </form>
				   </div>
				   		
				  <i class='fa fa-search' id="searchIcon" style="color:grey"></i>  &nbsp; 	
				  <i class='fa fa-microphone' id="voidSearchIcon" style="color:grey"></i>	  
			        
             		  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  <!-- Login Common PlugIn -->
				  <jsp:include page="/layout/loginModal.jsp" />   
				  
				  <hr/>   
				  
				  <div class="widget" align="center">	
					  <button type="button" class="btn btn-thumnail">����Ϸ� ����</button>
					  <button type="button" class="btn btn-calendar">Ķ������ ����</button>
					 
					  <!-- <input type="submit" value="Ķ������">   -->
					
				  </div>
              
                <div class="cinema-wrap">
	            	<div class="row">
				 		<c:set var="i" value="0" />
                		 <c:forEach var="preview" items="${list}">
                		 <c:set var="i" value="${i+1 }" />
                		 	   	<div class="col-xs-12 col-sm-3">
								 <div class=" cinema-item">
	                                <div class="cinema">
	                             
	                                    <a href='/movie/getMovie?movieNo=${preview.movie.movieNo}&menu=preview' class="cinema__images">
	                                        <img id="poster"alt='' src="${preview.movie.postUrl}">                                        
	                                    
	                                    </a>
	                                    <a href="/movie/getMovie?movieNo=${preview.movie.movieNo}&menu=preview" class="movieNm">${preview.previewTitle}</a>
	                                    <style>P{margin-top:0px;margin-bottom:0px;}</style>
	                                    <p ><strong>���� :${preview.movie.directors} </strong> </p>
	                                    <p ><strong>���³�¥ :${preview.ticketOpenDate} </strong> </p>
	                                    <p ><strong>�󿵳�¥ :${preview.screenOpenTime} </strong> </p>
	                    	     		<p ><strong>����  :${preview.ticketPrice} </strong> </p>
	                    	     		
	                    	    <div style="text-align: left;">
    						    
    						    </div>								
    							 
    							 <input type='hidden' name='test${preview.movie.movieNo }'  value='${preview.movie.movieNo }'>
     							
							    <span style="line-height:0%">
							    <c:set var="name" value="${preview.movie.wishList.wishNo}"/>
							 
	 								<c:if test="${empty name}">
								<%-- bootstrap icon�� �۵��� ���� ����      --%>
								<%-- <i class='glyphicon glyphicon-heart-empty' id="${movie.movieNo}" style="color:#FF5733;
										text-align : center; margin:0 auto;">   --%>	
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='fa fa-heart-o' id="${preview.movie.movieNo}" style="color:#FF5733;text-align : center; margin:0 auto;"> 	 
											<input type='hidden' id='scMovieNo' 	 value="${preview.movie.movieNo}">	 
							    			<input type='hidden' id='userId'  	 	 value="${user.userId}">	
									     </i> 						
								    </c:if>	
								    
								    <c:if test="${!empty name}">
									    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='fa fa-heart' id="${preview.movie.movieNo}" style="color:#FF5733; text-align : center; margin:0 auto;">
									    	<input type='hidden' id='scMovieNo' 	 value="${preview.movie.movieNo}">	 
							    			<input type='hidden' id='userId'  	 	 value="${user.userId}">	 
									    </i> 						
									</c:if>	
							   </span>                                                   

	                             &nbsp;&nbsp;

	                            <span style="line-height:0%">
	                             
	                            <input type='hidden' name='screenMovieNo'  value='"+val.movieNo+"'>	                                                  
	                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='fa fa-phone' id='reserve-ticket' style="color:#FB1D04; text-align : center; margin:0 auto;">���� </i>   
	                            </span>
	                          
	                           
	                                    	     
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
              
              
        
      
    </div>
    	 <div class="clearfix"></div>	
	
	</div>	
	
	   
        
	 
		<jsp:include page="/layout/bottomToolbar.jsp" />
		
		
        <!-- Custom �̰��־���� ��ũ�ѳ�����top��ư����!!!!!!!!!!! -->
       
		<!-- ------------------------------------  -->
		<script src="/js/custom.js"></script>
		
		<!--  Semantic UI modal windows pop-up ��  -->
		<div class="ui mini modal" >
		<!-- <div class="center"> -->	
		<div style="border: 1px dashed #BDBDBD; background-color: #FBFCFC;   margin-left: auto;
 		 margin-right: auto; padding: 5px; text-align: center; line-height: 30px; vertical-align:middle;">
		 <div class="header">��ȭ ���� �˻� ��....</div>
		  <div class="content" >
		   	<p>
		   		<form id="webspeech"  method="POST">  
		   		   <div class="image content">
		   				 <img class="image">
						       <img src="../images/movie/speechListening2.gif"> 
						         <div class="description">
						            
						            <div class="ui loading search">
									  <div class="ui icon input">
									     <input type="text" class="prompt" name="abc" id="speech-transcript" placeholder="Search...">
									     <i class="search icon"></i>
									  </div>
									  <div class="results"></div>
									</div>
						            
						             
						            <input type="button" value="Ŭ���� �����ּ��� " id="speech-btn" class="positive ui button">  
						            
						            <br/><br/>
						        
						        	<div class="actions">
						        		   <i class='fa fa-check fa-3x' id="voidSearchOk" style="color:#3498DB"></i>  &nbsp;	
     								 
						        	  <div class="ui red deny button">
									              ������ 
							     	 </div>
						           </div>
						             
						         	<div class="form-group">    
							    	<input type="hidden" class="form-control" id="searchCondition" name="searchCondition"  value="1" > 
							        <input type="hidden" class="form-control" id="voiceSearchKeyword" name="searchKeyword" value="" > 
    			
      							 </div>
      							 </div>
						 </div>
		   			</form>
				  </div>
			</div>
		</div>
	
</body>
       
    
  <!--  ///////////////////////// JavaScript ////////////////////////// -->   
   
    <script type="text/javascript">
			    function fncGetPageList(currentPage) {
			    	
			    	//alert("222")
			        $("#currentPage").val(currentPage)
			        $(".form-inline").attr("method","POST").attr("action", "/movie/getMovieList?menu=preview").submit();
			    }
			    
			     //============= "�˻�"  Event  ó�� =============	
				 $(function() {
					 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$( "button.btn.btn-default" ).on("click" , function() {
						fncGetPageList(1);
					});
					
				 });
			     
				 //============= "�˻� Icon"  Event  ó�� =============	
				 $(function() {
					 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$( ".btn.btn-md.btn--danger.search__button").on("click" , function() {
						
						//alert("searchbutton called")
						fncGetPageList(1);
					});
					
				 });
				
				//============= "�˻� Icon"  Event  ó�� =============	
				 $(function() {
					 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$( "#searchIcon").on("click" , function() {
						
						//alert("searchbutton called")
						fncGetPageList(1);
					});
					
				 });
				
				
				//============= "�˻� Enter KeyDown "  Event  ó�� =============	
				 $(function() {
					 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$( "input[name=searchKeyword]").keydown(function(key) {
						
						if(key.keyCode == 13) { //Ű�� 13�̸� ���� ) Enter Key�� 13
							fncGetPageList(1);					
						}
					});
					
				 });
				
				
				
				//============= "Banner Top Clieck "  Event  ó�� =============	
				 $(function() {
					 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$( ".banner-top").on("click" , function() {
						
						//alert("Banner Top Clieck ")
						self.location = "/index.jsp";
					});
					
				 });
				
				   
				//============= "Ķ������ ����"  Event  ó�� =============	
				$(function() {
					 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$( "button.btn.btn-calendar" ).on("click" , function() {	
						self.location = "/movie/getMovieList?menu=calendar_preview";	
						 
					});	
				});
				
				//============= "����Ϸ� ����"  Event  ó�� =============	
				$(function() {
					 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$( "button.btn.btn-thumnail" ).on("click" , function() {	
						 self.location = "/movie/getMovieList?menu=preview";	
					});	
				});
				
				$(function() {
	    			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	    			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	    			 $( "#voidSearchOk" ).on("click" , function() {
	    					//Debug..
	    					// <!-- <a href="javascript:history.go(-1)"></a> -->
	    					//console.log("value : "+$("#voidSearchOk" ).val());
	    					fncWebSpeech()
	    			});
	    	   });	
			
			   //============= "���� �˻� ���� �Լ� " ó�� =============	
			   function fncWebSpeech() {
		    		// document.addPurchase.submit();
		    		// alert("speech post call...")
		    		$("#webspeech").attr("method","POST").attr("action","/movie/getMovieList?menu=preview").submit();
		       }
				
			//============= "WishList(��) Event ó��" DeleteWish Event  ó�� =============	
			$(function() {
				 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 
				  $(document).on("click", ".fa-heart-o", function () {
					  
					  var movieNo = $(this).find('#scMovieNo').val();		
					  var userId = $(this).find('#userId').val();	
					  
					  //alert($(this).attr('class'));
					  //var movieNo = $(this).next().val();		
					  //var movieNo = $($(this).find('glyphicon glyphicon-heart-empty')).val();					 
	
				
					
					  //alert("movieNo: " + movieNo); 					
					  //alert("userId: " + userId);  
					  
					 
					  
					  if(userId == null || userId == ''){
							alert("�α��� �� �̿� �����մϴ�.");
							$('.overlay').removeClass('close').addClass('open');
							return 
						} else {
						
	
							alert($(this).attr('class'));
							//var movieNo = $(this).next().val();		
							//var movieNo = $($(this).find('glyphicon glyphicon-heart-empty')).val();					 
			
						
							
							//alert("movieNo: " + movieNo); 					
							//alert("userId: " + userId);  
							
					 	    $(this).removeClass('fa fa-heart-o').addClass('fa fa-heart');
						    
										
							$.ajax( 
									{
										url : "/movie/json/switchWishList?movie.movieNo="+movieNo+"&user.userId="+userId+"&wishFlag=preview",									
										type : "GET" ,							
									}).done(function(data) {
								//���� ����� ���
								if (data == 'add') {
									var msg = '���ϱ� ��û fa fa-heart-o�� ���';
									alert(msg);
								} else {
									alert("���ϱ� ���");
								}
							})
						}
					})
				 
				 $(document).on("click", ".fa-heart", function () {
					 
				 var movieNo = $(this).find('#scMovieNo').val();		
				 var userId = $(this).find('#userId').val();	
					 
					 
				 if(userId == null || userId == ''){
							alert("�α��� �� �̿� �����մϴ�.");
							exit();
				} else {
						
					 alert($(this).attr('class'));	
					 //var movieNo = $(this).next().val();		
					 //var movieNo = $($(this).find('glyphicon glyphicon-heart-empty')).val();					 
				
					//alert("movieNo: " + movieNo); 					
					//alert("userId: " + userId); 
					
					
					$(this).removeClass('fa fa-heart').addClass('fa fa-heart-o');
				
					
					
								
					$.ajax( 
							{
								url : "/movie/json/switchWishList?movie.movieNo="+movieNo+"&user.userId="+userId+"&wishFlag=preview",									
								type : "GET" ,							
							}).done(function(data) {
						//���� ����� ���
						if (data == 'delete') {
							var msg = '���ϱ� ���';
							alert(msg);
						} else {
							alert("���ϱ� ��û  fa-heart");
						}
					})
				}
			})
		});
					 
		//============= "����  Event ó��"  Event  ó�� =============	
		$(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("span:contains('����')" ).on("click" , function() {
				 self.location = "/booking/getScreenMovieList";	
			});	
		});
			
	    $(function() {
	        //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	        $("button[name='search']").on("click", function() {
	        	// alert("222")
	      
	            fncGetPageList(1);
	        });
     
	    });

         $(document).ready(function() {
             init_CinemaList();
             
             //alert($('html').height() )
             //alert(window.outerHeight)
             if($('html').height() < window.outerHeight){
             	$('html').css('height', '100%');
             }
             
             $("#movie-search-sort").css("width","200px");
         });
         

  	   (function (window, undefined) {
              "use strict";
              
              var document = window.document,
                  docElement = document.documentElement,
                  SpeechRecognition = window.webkitSpeechRecognition ||
                                      window.mozSpeechRecognition ||
                                      window.msSpeechRecognition ||
                                      window.oSpeechRecognition ||
                                      window.SpeechRecognition;
              function addClass(className) {
                  docElement.className = docElement.className + ' ' + className;
              }
              docElement.className = docElement.className.replace(/(^|\s)no-js(\s|$)/, '$1js$2');
              if ( SpeechRecognition !== undefined ) {
                  addClass('feature');
              } else {
                  addClass('no-feature');
              }
          })(window);
  	   
  	   
  	   var speech_text ="";   
  	    
         (function speechFunction(window, undefined) {
             "use strict";
             var speechBtn = document.getElementById('speech-btn'),
                 SpeechRecognition = window.webkitSpeechRecognition ||
                                     window.mozSpeechRecognition ||
                                     window.msSpeechRecognition ||
                                     window.oSpeechRecognition ||
                                     window.SpeechRecognition,
                 speechTranscript = document.getElementById('speech-transcript'),
                 
                
                 sr;
             if ( SpeechRecognition !== undefined ) {
                 sr = new SpeechRecognition();
                 speechBtn.addEventListener('click', function () {
                     sr.start();
                 });
                 sr.onaudiostart = function () {
                     speechBtn.setAttribute('disabled', 'disabled');
                     speechBtn.value = "�����ּ���!";                             
                     
                 };
                 sr.onspeechstart = function () {
                     speechBtn.value = "��� �ֽ��ϴ�....";
                 };
                 sr.onspeechend = function () {
                     speechBtn.value = '...�׸��� �����ּ���...';
                 };
                 sr.onend = function () {
                     speechBtn.value = '��� �Ϸ��� ���⸦ Ŭ�����ּ���!';
                     speechBtn.removeAttribute('disabled');
                 };
                 sr.onresult = function (event) {
                     speechTranscript.value = event.results[0][0].transcript;
                    
                     console.log("speechTranscript :: " + speechTranscript.value);
                     $("#voidSearchOk").val(speechTranscript.value);
                     // alert("speeach2 : "+$("#voidSearchOk").val()); 
                     
                     var voiceSearch = $("#voidSearchOk").val();
                     $("#voiceSearchKeyword").val(voiceSearch);
                     //alert("speeach2"  + voiceSearch);                  
                     
                 };
             }
        })(window);
         
         
     	//============= "���� �˻� Icon"  Event  ó�� =============	
		  $(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#voidSearchIcon").on("click" , function() {
				//alert("modal start...")
				$('.ui.modal')  
				  .modal('show')
				;
				/* self.location = "/movie/getMovieList?menu=voiceRegniiton"; */
			});
			
		 }); 
	    	

         
         
	            
		</script>
		
		<!--  ///////////////////////// CSS ////////////////////////// -->
<style type="text/css">

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);


	.page-heading {
		font-family: 'Jeju Gothic', sans-serif;
		margin-top: 100px
	}
	
	body {
		font-family: 'Noto Sans KR', sans-serif;
	}


	 #body {
           padding-top: 70px;
           }
           .thumbnail {
           width: 300px;
           height: 250px;
           overflow: auto;
     }	
     
      .cinema .cinema__images:before {
	    content: '';
	    width: 100%;
	    height: 100%;
	    background-color: rgba(76, 65, 69, 0);
	    position: absolute;
	    top: 0;
	    left: 0;
	    opacity: 1;
	    -webkit-transition: 0.5s;
	    -o-transition: 0.5s;
	    transition: 0.5s;
	   }
     
     #searchIcon
      {     color: #fff;       		
   			text-shadow: 1px 1px 1px #ccc;
   			font-size: 1.5em;
      }
      
    #voidSearchIcon
      {     color: #fff;       		
   			text-shadow: 1px 1px 1px #ccc;
   			font-size: 1.5em;
      }
     

	.countPage {
 		 	font-size: 13px;
   		 	margin-top: 10px;
	}

	.search{
		 	margin-right : 30px;
	}


	.movieNm {
		  font-size: 16px;
		  font-weight: bold;
		  display: block;
		  margin-bottom: 5px;
		  margin-top: 5px;

	}
	
	#poster{
		height : calc(50vh - 100px);	
		width : auto;	
		height:260px; 
		margin-left: auto;
		margin-right: auto; 
		display: table;

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
		

	p {
		font-size: 13px;
		font-weight: lighter;
	}
	
	p strong {
		font-weight: nomal;
	}
	
		.search {
		margin-right: 30px;
	}
	
	.page-heading {
		margin-top: 100px
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
	

	

    html{
     height: auto;
    }
      
</style>	


 <!-- Semantic  UI Applied -->
 <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>


</html>
