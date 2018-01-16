<!doctype html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>


<html class="no-js" lang="ko">
    <head>
        <meta charset="EUC-KR">
        
        <!-- ���� : http://getbootstrap.com/css/   ���� -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		
    
        <title>��ȭ�����˻�</title>
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
    			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
    			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
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
        <h3 class="yes">��ȭ ���� �˻� ��....</h3>
        <h3 class="no">���ͳ� �ͽ��÷ο�� �������� �ʴ� Browser �Դϴ�.</h3>
    </div>  
      
<form id="webspeech"  method="POST">  
	<br/> <br/>
	
	   <img src="../images/movie/speechListening2.gif">    

	<div class="widget" >
	
	
	    
        <div class="example">
             <!--   ��ȭ �˻� : -->
            <input type="search" name="abc" id="speech-transcript">          
                     
            <input type="button" value="Ŭ���� �����ּ��� " id="speech-btn">   
            
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