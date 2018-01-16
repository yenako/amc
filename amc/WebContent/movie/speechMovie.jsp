<!doctype html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<html class="no-js" lang="ko">
    <head>
        <meta charset="EUC-KR">
        
        <!-- 참조 : http://getbootstrap.com/css/   참조 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		
    
        <title>영화음성검색</title>
        <style>
            .no-js .content,
            .feature .no,
            .no-feature .yes,
            .no-feature .example {
                display: none;
            }
            input {
                width: 200px;
            }
            input[disabled] {
                cursor: default;
            }
            
            #voidSearchOk
	        {   color: #fff;       		
	    		text-shadow: 1px 1px 1px #ccc;
	    		font-size: 4.0em;
	        }
	        
	        #voidSearchNo
	        {   color: #fff;       		
	    		text-shadow: 1px 1px 1px #ccc;
	    		font-size: 2.5em;
	        }
	        
	        .center {
			    margin: auto;
			    width: 40%;
			    /* border: 3px solid #73AD21; */
			    padding: 10px;
			}
			
		
	         
        </style>
        
        <script type="text/javascript">
   
        function fncWebSpeech() {
    		// document.addPurchase.submit();
    		$("form").attr("method","POST").attr("action","/movie/getMovieList?menu=movie").submit();
    	}
    	
    	$(function() {
    			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
    			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
    			 $( "#voidSearchOk" ).on("click" , function() {
    					//Debug..
    					// <!-- <a href="javascript:history.go(-1)"></a> -->
    					//console.log("value : "+$("#voidSearchOk" ).val());
    					fncWebSpeech()
    			});
    	});	
    	
        </script>
 
        <script>
	      
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
        </script>
</head>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/topToolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<br/> <br/> <br/> <br/> <br/> <br/>
	
	
	<!-- <div class="center"> -->
	<div style="border: 1px dashed #BDBDBD; background-color: #F4D03F;  width: 1000px; height: 100px; margin-left: auto;
 	margin-right: auto; padding: 5px; text-align: center; line-height: 30px; vertical-align:middle;">
  	
    <noscript>Please <a href="http://www.enable-javascript.com/" target="_blank">enable JavaScript</a>. Thank You! :D</noscript>
    <div class="content" >
        <h3 class="yes">영화 음성 검색 중....</h3>
        <h3 class="no">인터넷 익스플로우는 지원되지 않는 Browser 입니다.</h3>
    </div>  
      
<form id="webspeech"  method="POST">  
	<br/> <br/>
	
	   <img src="../images/movie/speechListening2.gif">    

	<div class="widget" >
	
	
	    
        <div class="example">
             <!--   영화 검색 : -->
            <input type="search" name="abc" id="speech-transcript">          
                     
            <input type="button" value="클릭후 말해주세요 " id="speech-btn">   
            
            <hr/>          
               
        </div>
        
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <i class='glyphicon glyphicon-ok' id="voidSearchOk" style="color:green"></i>  &nbsp;&nbsp;&nbsp;&nbsp;	
    
  
    
   <!--  <i class='glyphicon glyphicon-remove' id="voidSearchNo" style="color:red"></i>	 -->
    
	
  	
  	<div class="form-group">    
    	<input type="hidden" class="form-control" id="searchCondition" name="searchCondition"  value="1" > 
        <input type="hidden" class="form-control" id="searchKeyword" name="searchKeyword"      value="" > 
    			
    </div>
    
    
   </div>
    
  </div>
 </form>

<script>
    
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
                    speechBtn.value = "말해주세요!";                             
                    
                };
                sr.onspeechstart = function () {
                    speechBtn.value = "듣고 있습니다....";
                };
                sr.onspeechend = function () {
                    speechBtn.value = '...그리고 끝내주세요...';
                };
                sr.onend = function () {
                    speechBtn.value = '계속 하려면 여기를 클릭해주세요!';
                    speechBtn.removeAttribute('disabled');
                };
                sr.onresult = function (event) {
                    speechTranscript.value = event.results[0][0].transcript;
                   
                    console.log("speechTranscript :: " + speechTranscript.value);
                    $("#voidSearchOk").val(speechTranscript.value);
                    //alert("speeach2 : "+$("#voidSearchOk").val()); 
                    
                    var voiceSearch = $("#voidSearchOk").val();
                    $("#searchKeyword").val(voiceSearch);
                    //alert("speeach2"  + voiceSearch);                  
                    
                };
            }
            
            
           
        })(window);
          
    </script>
    
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
     
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    
    
         
    <div class="bottom low ">
		<!-- ToolBar Start /////////////////////////////////////-->
		<%-- <jsp:include page="/layout/bottomToolbar.jsp" /> --%>
		<!-- ToolBar End /////////////////////////////////////-->
	</div>
    
</body>
</html>