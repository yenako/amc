<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>


<head>
   <meta charset="UTF-8">
   
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
 <!-- The jQuery library is a prerequisite for all jqSuite products -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- This is the Javascript file of jqGrid -->   
    
     
    <script type="text/ecmascript" src="../javascript/trirand/src/jquery.jqGrid.js"></script>
    
   
    <!-- This is the localization file of the grid controlling messages, labels, etc.
    <!-- We support more than 40 localizations -->
    <script type="text/ecmascript" src="../javascript/trirand/i18n/grid.locale-en.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.js"></script>
  
 
    
	
	<script type="text/javascript" language="javascript" src="//cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <!-- A link to a jQuery UI ThemeRoller theme, more than 22 built-in and many more custom -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/sunny/jquery-ui.css">
     
   <!--  <link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-/1.7.1/css/bootstrap-datepicker.css" /> -->
    <link rel="stylesheet" type="text/css" media="screen" href="../css/bootstrap-datepicker.css" />
   
    <!-- The link to the CSS that the grid needs -->
    <link rel="stylesheet" type="text/css" media="screen" href="../css/trirand/ui.jqgrid.css" />
    <meta charset="utf-8" />
    <title>jqGrid Export to CSV, PDF, Excel</title>
    
<script>



    $(window.document).ready(function() {
    	
		    $("#export").on("click", function(){
					alert("called ");
				$("#movie_list").jqGrid("exportToExcel",{
					includeLabels : true,
					includeGroupHeader : true,
					includeFooter: true,
					fileName : "jqGridExport.xlsx",
					maxlength : 5000 // maxlength for visible string data 
				})
			});

    	
		    
		    
		    
    	
    	
    	  $("#movie_list").empty().jqGrid({     
         	 url:"/movie/json/getAPIMoiveList",
         	 caption : "Movie API register",
         	 mtype:"post",
         	 datatype:"json",
         	 colNames:['영화CD','영화명','제작국가','상영마감','줄거리','트레일러'],
               
         	  colModel:[
                        {name:'movieCd', key: true,index:'movieCd',align:"left",sorttype:"int",width:90, sortable:true,editable:true},
                        {name:'movieNm', index:'movieNm', align:"left",width:90, sortable:true, editable:true},                       
 	                    {name:'nationAlt', index:'nationAlt',align:"left", width:90,sortable:true, editable:true},              
                        {name:'movieEndDate', index:'movieEndDate',align:"left",                         	    
                      	      editable:true, editoptions:{size:10, 
                                dataInit:function(el){ 
                                      $(el).datepicker({dateFormat:'yy-mm-dd'}); 
                                }, 
                                defaultValue: function(){ 
                                  var currentTime = new Date(2017,10,1); 
                                  var month = parseInt(currentTime.getMonth() + 1); 
                                  month = month <= 9 ? "0"+month : month; 
                                  var day = currentTime.getDate(); 
                                  day = day <= 9 ? "0"+day : day; 
                                  var year = currentTime.getFullYear(); 
                                  return year+"-"+month + "-"+day; 
                                } 
                              }                	     
                        },
                  
                        {name:'synopsis', index:'synopsis',align:"left", width:90,sortable:true, editable:true, 
                      	     edittype: "textarea",editoptions: { rows: 3, wrap: "off",style: 'overflow-x: hidden',}},                     
                        {name:'trailer', index:'trailer',align:"left", width:90,editable:true}
                        ],
                        
                        sortable: true,
                        sortname: 'movieCd',
                        pager:"#pager",
                    	rowNum:20,
                       	rowList:[10,20,30],             
                        autowidth:true,
                        // total record no, current record no
                        multiselect: true,
                        viewrecords:true,
                        height:"auto",
                        
                      
                        editurl: "/movie/json/addMovie",    
            
                        mtype:"post",
                        
                        afterSubmit : function(response, postdata) {
                        	alert("aaa");
                            return [false, response.responseText, ""];
                            // Tried with return [true, response.responseText, ""]; and few more
                         } ,
                      
                     	loadComplete: function(response, postdata) {
                     		alert("response" + response.responseText);
                  			// alert ("records="+$("#movie_list").getGridParam("records"));
                        },  
                  
                        sortable: true,
                        sortorder: "desc",
                        loadonce : true,
                        
                        
               
              
              jSonReader : {
              	root:"rows",
              	page:"page",
              	total:"total",
              	records:"records",
              	repeatitems:false,
              	cell:"cell",
              	id:"movieCd"
              }                    
    	  
    	  
    	 
            
    	  }).navGrid('#pager', {
              search : true,
              edit : true,
              add : true,
              del : true
          });
      });
  

	function pickdates(id){
		jQuery("#"+id+"_movieEndDate","#movie_list").datepicker({dateFormat:"yy-mm-dd"});
	}


    
    
    
 	
</script>
<title>jqGrid</title>
</head>
<body>














    <table id = "movie_list"></table>
    <div id = "pager"></div>
     <button id="export">Export to Excel</button>
</body>
</html>

