<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

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

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html lang="UTF-8">
	

   <meta charset="UTF-8">
   
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/ui-darkness/jquery-ui.css" >  -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/sunny/jquery-ui.css">
    <link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.css" />
    
     
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.14.1/css/ui.jqgrid.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.14.1/jquery.jqgrid.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.js"></script>
 
   
 <script type="text/javascript">
        $(document).ready(function(){
        	
        	$(function() {
        		$("#btn-upload").on("click", function(){
        			if(($("#file1").val() == "" || $("#file1").val() == null)) {
        			    alert("파일 첫 번째가 없습니다.");
        			} 
        			
        			//else if(($("#file2").val() == "" || $("#file2").val() == null)) {
        			//    alert("파일 두 번째가 없습니다.");
        			//} else {
        				
        			  var formdata = new FormData();
    				  	  formdata.append("movieNo", $('#movieNo').val());
    				  	  formdata.append("file", $("#file1")[0].files[0]);

        			   var form = new FormData(document.getElementById('uploadForm'));
        			    $.ajax({
        				      url: "/movie/json/upload", //컨트롤러 URL
        				      data: form,
        				      dataType: 'json',
        				      processData: false,
        				      contentType: false,
        				      type: 'POST',
        				      success: function (response) {
        				    	  alert("성공적으로 파일 업로드되었습니다.");
        				    	  console.log(response);
        				      },error: function (jqXHR) {
        				    	   //alert("성공적으로 파일 업로드되었습니다.");
        					       alert(jqXHR.responseText);
        					       console.log(jqXHR.responseText);
        				      }
        
        			});
        		});
        	});
        });
        	
        

    </script>
	
</head>

<body>
<form id="uploadForm" enctype="multipart/form-data" method="POST">  
	<br/> <br/>
	<table id="movie_list"></table>    
    <div id="pager" class="scroll" style="text-align:center"></div>
    <div id="load_time" class="scroll" style="text-align:center"></div>
	
	<p> 스킬컷 파일 업로드 (최대3개 순차적으로 선택가능) </p>

    <div class="widget" >
	
	
	
	<div><input class="ui-button ui-widget ui-corner-all"  type="file" id="file1" name="file" required="required" /></div>
	<div><input class="ui-button ui-widget ui-corner-all"  type="file" id="file2" name="file"  /></div>
	<div><input class="ui-button ui-widget ui-corner-all"  type="file" id="file2" name="file"  /></div>   
    
    <br/> 
  	<div> <button id="btn-upload">파일 업로드</button></div>
	
	
    </div>	
 
</form>
</body>
</html>

