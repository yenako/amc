<%@ page language="java" contentType="text/html;"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<c:if test="${ indexList eq null }">
 	<jsp:forward page="/cinema/index"/>
</c:if>

<!doctype html>
<html>
<head>

</head>

<body>
    <div class="wrapper">
   		 <!-- 세션체크 -->
    	 <c:set var="who" value=""/>
    	<c:if test="${sessionScope.user.role ne 'admin'}">
    		<c:set var="who" value="search"/>	
    	</c:if>
    	<c:if test="${sessionScope.user eq null || sessionScope.user eq ''}">
    		<c:set var="who" value="search"/>	
    	</c:if>
    	<c:if test="${sessionScope.user.role eq 'admin'}">
    		<c:set var="who" value="admin"/>	
    	</c:if> 
    	
    	<!-- ------- -->
        <!-- Banner -->
        <div class="banner-top">
            <img alt='top banner' src="../images/banners/space.jpg">
        </div>
        <header class="header-wrapper header-wrapper--home">
			<!-- ToolBar Start /////////////////////////////////////-->
			<jsp:include page="/layout/topToolbar.jsp" />
			<!-- ToolBar End /////////////////////////////////////-->
   		</header>
        <!-- Slider -->
        <div class="bannercontainer rev_slider_wrapper">
 
            <!-- the ID here will be used in the JavaScript below to initialize the slider -->
            <div id="rev_slider_1" class="banner rev_slider" style="display:none">
 
                <!-- BEGIN SLIDES LIST -->
                <ul>
                
					<!-- SLIDE 1 -->
                    <li data-transition="fade" class="slide" data-title='Comming Cinema. Travel MovieWorld.'>
 
                        <!-- SLIDE'S MAIN BACKGROUND IMAGE -->
                        <img class="rev-slidebg" alt='' src="../images/bg-video.jpg">
                        <div class="rs-background-video-layer" 
                             data-forcerewind="on" 
                             data-volume="mute" 
                             data-videowidth="100%" 
                             data-videoheight="100%" 
                             data-videomp4="../video/thor.mp4" 
                             data-videopreload="auto" 
                             data-videoloop="loop" 
                             data-forceCover="1" 
                             data-aspectratio="16:9" 
                             data-autoplay="true" 
                             data-autoplayonlyfirsttime="false" 
                        ></div>
                        <div class="tp-caption slide__name slide__name--smaller" 
                             data-x="center" 
                             data-y="160" 

                             data-splitin="chars"
                             data-elementdelay="0.1"

                             data-speed="700" 
                             data-start="1400" 
                             data-easing="easeOutBack"

                             data-frames='[{
                               "delay":1400,
                               "speed":700,
                               "split":"chars",
                               "splitdelay":0.1,
                               "frame":"0",
                               "from":"opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                            Movie, Watch, Touched.
                        </div>
                        <div class="tp-caption slide__time" 
                             data-x="center"
                             data-hoffset='-130' 
                             data-y="242" 
                             data-frames='[{
                               "delay":1800,
                               "speed":300,
                               "frame":"0",
                               "from":"x:[50%];opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             From
                        </div>
                        <div class="tp-caption slide__date position-center postion-place--two lfb ltb" 
                             data-x="center"                              
                             data-hoffset='-65'                                       
                             data-y="242" 
                             data-frames='[{
                               "delay":2200,
                               "speed":500,
                               "frame":"0",
                               "from":"y:100px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             May 31 
                        </div>
                        <div class="tp-caption slide__time" 
                             data-x="center" 
                             data-hoffset='-10' 
                             data-y="242" 
                             data-frames='[{
                               "delay":1800,
                               "speed":300,
                               "frame":"0",
                               "from":"x:[50%];opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             - till
                        </div>
                        <div class="tp-caption slide__date" 
                             data-x="center"                              
                             data-hoffset='60'
                             data-y="242" 
                             data-frames='[{
                               "delay":2200,
                               "speed":500,
                               "frame":"0",
                               "from":"y:100px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             November 24
                        </div>

                        <div class="tp-caption slider-wrap-btn" 
                             data-x="center"
                             data-y="310" 
                             data-frames='[{
                               "delay":2800,
                               "speed":400,
                               "frame":"0",
                               "from":"y:100px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             <a href="/movie/getMovieList?menu=movie" class="btn btn-md btn--danger btn--wide slider--btn">Browse Now Playing</a>
                        </div>
                    </li>
                                    
                    <!-- SLIDE 2 -->
                    <li data-transition="fade" class="slide" data-title='JAVA 95.'>
 
                        <!-- SLIDE'S MAIN BACKGROUND IMAGE -->
                        <img class="rev-slidebg" alt='' src="../images/slides/cinema.jpg">

                        <div class="tp-caption slide__name margin-slider" 
                             data-x="right" 
                             data-y="80"
                             data-frames='[{
                               "delay":300,
                               "split":"chars",
                               "splitdelay":0.1,
                               "speed":700,
                               "frame":"0",
                               "from":"x:[-100%];opacity:0;",
                               "mask":"x:0px;y:0px;s:inherit;e:inherit;",
                               "to":"o:1;",
                               "ease":"Power4.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                            AMC
                        </div>
                        <div class="tp-caption n slide__time margin-slider" 
                            data-x="right" 
                            data-hoffset='230' 
                            data-y="186" 
                            data-frames='[{
                               "delay":1200,
                               "speed":300,
                               "frame":"0",
                               "from":"x:[50%];opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                            From
                        </div>

                        <div class="tp-caption  slide__date margin-slider" 
                             data-x="right" 
                             data-hoffset='149' 
                             data-y="186" 
                             data-frames='[{
                               "delay":1700,
                               "speed":500,
                               "frame":"0",
                               "from":"y:100px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             May 31
                        </div>
                        <div class="tp-caption slide__time margin-slider" 
                             data-x="right" 
                             data-hoffset='120' 
                             data-y="186" 
                             data-frames='[{
                               "delay":1200,
                               "speed":300,
                               "frame":"0",
                               "from":"x:[50%];opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             till
                        </div>
                        <div class="tp-caption slide__date margin-slider" 
                             data-x="right" 
                             data-y="186" 
                             data-frames='[{
                               "delay":1700,
                               "speed":500,
                               "frame":"0",
                               "from":"y:100px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             November 24
                        </div>
                        <div class="tp-caption slide__text margin-slider text-right" 
                             data-x="right" 
                             data-y="250"
                             data-frames='[{
                               "delay":2300,
                               "speed":400,
                               "frame":"0",
                               "from":"y:100px;skX:50px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             <!-- Two-time Academy Award winner Ron Howard, teams once again with fellow two-time Academy<br> Award nominee, writer Peter Morgan , on Rush, a spectacular big-screen re-creation of the merciless<br> 1970s rivalry between James Hunt and Niki Lauda -->
                             Made in Room number 403
                        </div>
                        <div class="tp-caption margin-slider" 
                             data-x="right" 
                             data-y="324"
                             data-frames='[{
                               "delay":2600,
                               "speed":400,
                               "frame":"0",
                               "from":"y:100px;opacity:0;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                             <a href="#" class="btn btn-md btn--danger slider--btn">Sign in</a>
                             <!-- <a href="#" class="slide__link">Sign in</a> -->
                        </div>
 
                    </li>
 

                    <!-- SLIDE 3 -->
                    <li data-transition="fade" class="slide" data-title='Sanck and, Goods sales.'>
 
                        <!-- SLIDE'S MAIN BACKGROUND IMAGE -->
                        <img class="rev-slidebg" alt='' src="../images/slides/pop_corn.jpg">
                        <div class="tp-caption slide__name slide__name--smaller slide__name--specific" 
                          data-x="center" 
                          data-y="160" 
                          data-frames='[{
                               "delay":1400,
                               "speed":700,
                               "frame":"0",
                               "from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;",
                               "mask":"x:0px;y:[100%];s:inherit;e:inherit;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                            Snack <span class="highlight">and,</span> Goods <span class="highlight"> sales.</span> 
                        </div>

                        <div class="tp-caption slide__descript" 
                            data-x="center" 
                            data-y="240"
                            data-frames='[{
                               "delay":2000,
                               "speed":500,
                               "frame":"0",
                               "from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;",
                               "mask":"x:0px;y:[100%];s:inherit;e:inherit;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                            find your goods and snack with Store
                        </div>

                        <div class="tp-caption slider-wrap-btn" 
                            data-x="center" 
                            data-y="310" 
                            data-frames='[{
                               "delay":2500,
                               "speed":500,
                               "frame":"0",
                               "from":"y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;",
                               "mask":"x:0px;y:[100%];s:inherit;e:inherit;",
                               "to":"o:1;",
                               "ease":"Power3.easeInOut"
                               },{
                               "delay":"wait",
                               "speed":300,
                               "frame":"999",
                               "to":"opacity:0;",
                               "ease":"Power3.easeInOut"
                             }]'>
                            <a href="#" class="btn btn-md btn--danger slider--btn">visit Store</a>
                        </div>
                    </li>

 
                </ul><!-- END SLIDES LIST -->
 
            </div><!-- END SLIDER CONTAINER -->
 
        </div><!-- END SLIDER CONTAINER WRAPPER -->
        <!--end slider -->
        
        
        <!-- Main content -->
        <div class="container">
            <div class="movie-best">
                 <div class="col-sm-10 col-sm-offset-1 movie-best__rating">Today Best choice</div>
                 <div class="col-sm-12 change--col">
                 <c:forEach var="count" begin="1" end="6">
                 <c:if test="${count <=2 }">
                     <div class="movie-beta__item jeju">
                     	<c:if test="${indexList.mainMovieList[count-1].postUrl eq null}">
                     	<img alt='' src="../images/comming_soon.jpg" style="width:100%; height:264px;">
                     	</c:if>
                     	<c:if test="${indexList.mainMovieList[count-1].postUrl ne null}">
                        <%-- <img alt='' src="${indexList.mainMovieList[count-1].postUrl}" style="width:185px; height:264px;"> --%>
                        <a href="/movie/getMovie?movieNo=${indexList.mainMovieList[count-1].movieNo}&menu=movie">
                        <img alt='' src="${indexList.mainMovieList[count-1].postUrl}" style="width:100%; height:264px;">
                        </a>
                        <ul class="movie-beta__info">
                             <li><span class="best-voted"><strong>${indexList.mainMovieList[count-1].movieNm}</strong></span></li>
                             <li>
                                <p class="movie__time">${indexList.mainMovieList[count-1].showTm} min</p>
                                <p>${indexList.mainMovieList[count-1].genres}</p>
                                <p>${indexList.commentCount[count-1]} comments</p>
                             </li>
                             <li class="last-block">
                             	 <p>누적관객 수 : ${indexList.mainMovieList[count-1].maleCnt+indexList.mainMovieList[count-1].femaleCnt}명</p>
                                 <a href="/movie/getMovie?movieNo=${indexList.mainMovieList[count-1].movieNo}&menu=${who}" class="slide__link">more</a>
                             </li>
                         </ul>
                        </c:if>
                     </div>
                 </c:if>
                 <c:if test="${count == 3 }">
                     <div class="movie-beta__item third--item jeju">
                        <c:if test="${indexList.mainMovieList[count-1].postUrl eq null}">
                     	<img alt='' src="../images/comming_soon.jpg" style="width:100%; height:264px;">
                     	</c:if>
                     	<c:if test="${indexList.mainMovieList[count-1].postUrl ne null}">
                     	<a href="/movie/getMovie?movieNo=${indexList.mainMovieList[count-1].movieNo}&menu=movie">
                        <img alt='' src="${indexList.mainMovieList[count-1].postUrl}" style="width:100%; height:264px;">
                        </a>
                        <ul class="movie-beta__info">
                             <li><span class="best-voted jeju"><strong>${indexList.mainMovieList[count-1].movieNm}</strong></span></li>
                             <li>
                                <p class="movie__time">${indexList.mainMovieList[count-1].showTm} min</p>
                                <p>${indexList.mainMovieList[count-1].genres}</p>
                                <p>${indexList.commentCount[count-1]} comments</p>
                             </li>
                             <li class="last-block">
                            	 <p>누적관객 수 : ${indexList.mainMovieList[count-1].maleCnt+indexList.mainMovieList[count-1].femaleCnt}명</p>
                                 <a href="/movie/getMovie?movieNo=${indexList.mainMovieList[count-1].movieNo}&menu=${who}" class="slide__link">more</a>
                             </li>
                         </ul>
                        </c:if>
                     </div>
                 </c:if>
				 <c:if test="${count == 4}">
                     <div class="movie-beta__item hidden-xs jeju">
                         <c:if test="${indexList.mainMovieList[count-1].postUrl eq null}">
                     	<img alt='' src="../images/comming_soon.jpg" style="width:100%; height:264px;">
                     	</c:if>
                     	<c:if test="${indexList.mainMovieList[count-1].postUrl ne null}">
                     	<a href="/movie/getMovie?movieNo=${indexList.mainMovieList[count-1].movieNo}&menu=movie">
                        <img alt='' src="${indexList.mainMovieList[count-1].postUrl}" style="width:100%; height:264px;">
                        </a>
                        <ul class="movie-beta__info">
                             <li><span class="best-voted jeju"><strong>${indexList.mainMovieList[count-1].movieNm}</strong></span></li>
                             <li>
                                <p class="movie__time">${indexList.mainMovieList[count-1].showTm} min</p>
                                <p>${indexList.mainMovieList[count-1].genres}</p>
                                <p>${indexList.commentCount[count-1]} comments</p>
                             </li>
                             <li class="last-block">
                             	 <p>누적관객 수 : ${indexList.mainMovieList[count-1].maleCnt+indexList.mainMovieList[count-1].femaleCnt}명</p>
                                 <a href="/movie/getMovie?movieNo=${indexList.mainMovieList[count-1].movieNo}&menu=${who}" class="slide__link">more</a>
                             </li>
                         </ul>
                        </c:if>
                     </div>
                </c:if>
                <c:if test="${count > 4 }">
                     <div class="movie-beta__item hidden-xs hidden-sm jeju">
                        <c:if test="${indexList.mainMovieList[count-1].postUrl eq null}">
                     	<img alt='' src="../images/comming_soon.jpg" style="width:100%; height:264px;">
                     	</c:if>
                     	<c:if test="${indexList.mainMovieList[count-1].postUrl ne null}">
                     	<a href="/movie/getMovie?movieNo=${indexList.mainMovieList[count-1].movieNo}&menu=movie">
                        <img alt='' src="${indexList.mainMovieList[count-1].postUrl}" style="width:100%; height:264px;">
                        </a>
                 	      <ul class="movie-beta__info">
                             <li><span class="best-voted jeju"><strong>${indexList.mainMovieList[count-1].movieNm}</strong></span></li>
                             <li>
                                <p class="movie__time">${indexList.mainMovieList[count-1].showTm} min</p>
                                <p>${indexList.mainMovieList[count-1].genres}</p>
                                <p>${indexList.commentCount[count-1]} comments</p>
                             </li>
                             <li class="last-block">
                             	 <p>누적관객 수 : ${indexList.mainMovieList[count-1].maleCnt+indexList.mainMovieList[count-1].femaleCnt}명</p>
                                 <a href="/movie/getMovie?movieNo=${indexList.mainMovieList[count-1].movieNo}&menu=${who}" class="slide__link">more</a>
                             </li>
                         </ul>
                        </c:if>
                     </div>
				</c:if>
                </c:forEach>
                </div>
                <div class="col-sm-10 col-sm-offset-1 movie-best__check">check all movies now playing</div>
            </div>

            <div class="col-sm-12">
                <div class="mega-select-present mega-select-top mega-select--full">
                    <div class="mega-select-marker">
                        <div class="marker-indecator location">
                            <p class="select-marker"><span>searching anythings</span> <br>in AMC</p>
                        </div>
                    </div>

                      <div class="mega-select pull-right">
                          <span class="mega-select__point">Search by</span>
                          <ul class="mega-select__sort">
                              <li class="filter-wrap"><a href="#" class="mega-select__filter filter--active jeju" data-filter='location'>통합검색</a></li>
                          </ul>

						  <form id='search-form' action="/cinema/unifiedSearch" method='post' class="search" accept-charset="EUC-KR">
	                          <input name="searchKeyword" type="text" class="select__field">
	                          <div class="select__btn" onClick="javascript:unifiedSearch()">
	                          <div class="btn btn-md btn--danger location">find <span class="hidden-exrtasm">unified</span></div>
	                          </div>
                          </form>
                          
                          

                          <div class="select__dropdowns">
                              <ul class="select__group location">
                                <li class="select__variant" data-value='London'>London</li>
                                <li class="select__variant" data-value='New York'>New York</li>
                                <li class="select__variant" data-value='Paris'>Paris</li>
                                <li class="select__variant" data-value='Berlin'>Berlin</li>
                                <li class="select__variant" data-value='Moscow'>Moscow</li>
                                <li class="select__variant" data-value='Minsk'>Minsk</li>
                                <li class="select__variant" data-value='Warsawa'>Warsawa</li>
                              </ul>
                          </div>
                      </div>
                  </div>
            </div>
            
            <div class="clearfix"></div>
			
			<div class="col-sm-12">
			<div class="col-sm-9">
            <h2 id='target' class="page-heading heading--outcontainer">Now in the cinema</h2>
			</div>
			<div class="col-sm-3 hidden-xs " >
			<h2 id='target' class="page-heading heading--outcontainer">Best Product</h2>
			</div>
			
            <div class="col-sm-12">
                <div class="row">
                    <div class="col-sm-8 col-md-9">
                    <c:set var="i" value="0"/>
                    <c:set var="count" value="1"/>
                    <c:forEach var="movie" items="${indexList.mainMovieList }">
                   	<c:if test="${count == 1}">
                    	<!-- Movie variant with time -->
                            <div class="movie movie--test movie--test--dark movie--test--left">
                                <div class="movie__images">
                                    <a href="/movie/getMovie?movieNo=${movie.movieNo}&menu=${who}" class="movie-beta__link">
                                        <img alt='' src="${movie.postUrl}" style="width:100%; height:280px;">
                                        <%-- <img alt='' src="${movie.postUrl}"> --%>
                                    </a>
                                </div>

                                <div class="movie__info">
                                    <a href='/movie/getMovie?movieNo=${movie.movieNo}&menu=${who}' class="movie__title jeju">${movie.movieNm}</a>&nbsp;
                                    <c:if test="${movie.watchGradeNm eq 'ageAll'}">
                                    	<img src="/images/ageAll.png" style="width:25px; height:25px;">
                                    </c:if>
                                    <c:if test="${movie.watchGradeNm eq 'age12'}">
                                    	<img src="/images/age12.png" style="width:25px; height:25px;">
                                    </c:if>
                                    <c:if test="${movie.watchGradeNm eq 'age15'}">
                                    	<img src="/images/age15.png" style="width:25px; height:25px;">
                                    </c:if>
                                    <c:if test="${movie.watchGradeNm eq 'age19'}">
                                    	<img src="/images/age19.png" style="width:25px; height:25px;">
                                    </c:if>
									<br/>
									
                                    <p class="movie__time jeju">${movie.showTm} Min</p>

                                    <p class="movie__option jeju">${movie.genres}</p>
                                    
                                    <p class="movie__option jeju">${movie.openDt} 개봉</p>
                                    
                                    <p class="movie__option jeju">${requestScope.indexList.commentCount[i]} comments</p>
                                    <c:set var="i" value="${i+1}"/>
                                    
                                    <p class="movie__option jeju">감독 : ${movie.directors}</p>
                                    
                                </div>
                            </div>
                         <!-- Movie variant with time -->
                    	</c:if>
                	    <c:if test="${count == 2}">
                    	<!-- Movie variant with time -->
                            <div class="movie movie--test movie--test--light movie--test--left">
                                <div class="movie__images">
                                    <a href="/movie/getMovie?movieNo=${movie.movieNo}&menu=${who}" class="movie-beta__link">
                                        <img alt='' src="${movie.postUrl}" style="width:100%; height:280px;">
                                        <%-- <img alt='' src="${movie.postUrl}"> --%>
                                    </a>
                                </div>

                                <div class="movie__info">
                                    <a href='movie-page-left.html' class="movie__title jeju">${movie.movieNm}</a>&nbsp;
                                    <c:if test="${movie.watchGradeNm eq 'ageAll'}">
                                    	<img src="/images/ageAll.png" style="width:25px; height:25px;">
                                    </c:if>
                                    <c:if test="${movie.watchGradeNm eq 'age12'}">
                                    	<img src="/images/age12.png" style="width:25px; height:25px;">
                                    </c:if>
                                    <c:if test="${movie.watchGradeNm eq 'age15'}">
                                    	<img src="/images/age15.png" style="width:25px; height:25px;">
                                    </c:if>
                                    <c:if test="${movie.watchGradeNm eq 'age19'}">
                                    	<img src="/images/age19.png" style="width:25px; height:25px;">
                                    </c:if>
									<br/>
									
                                    <p class="movie__time jeju">${movie.showTm} Min</p>

                                    <p class="movie__option jeju">${movie.genres}</p>
                                    
                                    <p class="movie__option jeju">${movie.openDt} 개봉</p>
                                    
                                    <p class="movie__option jeju">${requestScope.indexList.commentCount[i]} comments</p>
                                    <c:set var="i" value="${i+1}"/>
                                    
                                    <p class="movie__option jeju">감독 : ${movie.directors}</p>
                                </div>
                            </div>
                         <!-- Movie variant with time -->
                    	</c:if>
						<c:if test="${count == 3}">
                         <!-- Movie variant with time -->
                            <div class="movie movie--test movie--test--light movie--test--right">
                                <div class="movie__images">
                                    <a href="/movie/getMovie?movieNo=${movie.movieNo}&menu=${who}" class="movie-beta__link">
                                    <img alt='' src="${movie.postUrl}" style="width:100%; height:280px;">
                                    <%-- <img alt='' src="${movie.postUrl}"> --%>
                                    </a>
                                </div>

                                <div class="movie__info">
                                    <a href='movie-page-left.html' class="movie__title jeju">${movie.movieNm}</a>&nbsp;
                                    <c:if test="${movie.watchGradeNm eq 'ageAll'}">
                                    	<img src="/images/ageAll.png" style="width:25px; height:25px;">
                                    </c:if>
                                    <c:if test="${movie.watchGradeNm eq 'age12'}">
                                    	<img src="/images/age12.png" style="width:25px; height:25px;">
                                    </c:if>
                                    <c:if test="${movie.watchGradeNm eq 'age15'}">
                                    	<img src="/images/age15.png" style="width:25px; height:25px;">
                                    </c:if>
                                    <c:if test="${movie.watchGradeNm eq 'age19'}">
                                    	<img src="/images/age19.png" style="width:25px; height:25px;">
                                    </c:if>
									<br/>
									
                                    <p class="movie__time jeju">${movie.showTm} Min</p>

                                    <p class="movie__option jeju">${movie.genres}</p>
                                    
                                    <p class="movie__option jeju">${movie.openDt} 개봉</p>
                                    
                                    <p class="movie__option jeju">${requestScope.indexList.commentCount[i]} comments</p>
                                    <c:set var="i" value="${i+1}"/>
                                    
                                    <p class="movie__option jeju">감독 : ${movie.directors}</p>
                                </div>
                            </div>
                         <!-- Movie variant with time -->
                         </c:if>
                         <c:if test="${count == 4}">
                         <!-- Movie variant with time -->
                            <div class="movie movie--test movie--test--dark movie--test--right">
                                <div class="movie__images">
                                    <a href="/movie/getMovie?movieNo=${movie.movieNo}&menu=${who}" class="movie-beta__link">
                                    <img alt='' src="${movie.postUrl}" style="width:100%; height:280px;">
                                    <%-- <img alt='' src="${movie.postUrl}"> --%>
                                    </a>
                                </div>

                                <div class="movie__info">
                                   <a href='movie-page-left.html' class="movie__title jeju">${movie.movieNm}</a>&nbsp;
                                   <c:if test="${movie.watchGradeNm eq 'ageAll'}">
                                    	<img src="/images/ageAll.png" style="width:25px; height:25px;">
                                    </c:if>
                                    <c:if test="${movie.watchGradeNm eq 'age12'}">
                                    	<img src="/images/age12.png" style="width:25px; height:25px;">
                                    </c:if>
                                    <c:if test="${movie.watchGradeNm eq 'age15'}">
                                    	<img src="/images/age15.png" style="width:25px; height:25px;">
                                    </c:if>
                                    <c:if test="${movie.watchGradeNm eq 'age19'}">
                                    	<img src="/images/age19.png" style="width:25px; height:25px;">
                                    </c:if>
									<br/>
									
                                    <p class="movie__time jeju">${movie.showTm} Min</p>

                                    <p class="movie__option jeju">${movie.genres}</p>
                                    
                                    <p class="movie__option jeju">${movie.openDt} 개봉</p>
                                    
                                    <p class="movie__option jeju">${requestScope.indexList.commentCount[i]} comments</p>
                                    <c:set var="i" value="${i+1}"/>
                                    
                                    <p class="movie__option jeju">감독 : ${movie.directors}</p>
                                </div>
                            </div>
                         <!-- Movie variant with time -->
                         </c:if>
                         <c:set var="count" value="${count+1}"/>
                         <c:if test="${count == 5}">
                         	<c:set var="count" value="1"/>
                         </c:if>
                         </c:forEach>
                        <div class="row">

                        </div>
                    </div>

                    <aside class="col-sm-4 col-md-3">
                        <div class="sitebar first-banner--left">
                            <div class="banner-wrap first-banner--left">
                                <img alt='banner' src="../images/uploadFiles/${indexList.bestProductList[0].prodImage}">
                            </div>

                             <div class="banner-wrap">
                                <img alt='banner' src="../images/uploadFiles/${indexList.bestProductList[1].prodImage}">
                            </div>

                             <div class="banner-wrap banner-wrap--last">
                                <img alt='banner' src="../images/uploadFiles/${indexList.bestProductList[2].prodImage}">
                            </div>

                            <div class="promo marginb-sm">
                              <div class="promo__head">AMC app</div>
                              <div class="promo__describe">in AndroidPhone<br> You can receive push alarm!</div>
                              <div class="promo__content">
                                  <ul>
                                  	  <li class="store-variant"><a href="#"><img alt='' src="../images/google-play.svg"></a></li>
                                  </ul>
                              </div>
                          </div>
    
                        </div>
                    </aside>
                </div>
            </div>
                
        </div>
        
        <div class="clearfix"></div>

		
		<jsp:include page="/layout/loginModal.jsp" />
        
    </div> <!--컨테이너 끝 -->
    <jsp:include page="/layout/bottomToolbar.jsp" />

    	

        
</div>

		    <script src="/js/custom.js"></script>
		<script>
		function unifiedSearch(){
	   		$("form").attr("method" , "POST").attr("action" , "/cinema/unifiedSearch").attr("accept-charset","EUC-KR").submit();
	   	}
		</script>
</body>
 <style>
 @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
      html{
 	     height: auto;
      }
      .movie-best .movie-beta__info {
	    width: 100%;
	  }
	  

	.jeju {
		font-family: 'Jeju Gothic', sans-serif;
	}
 </style>
</html>
