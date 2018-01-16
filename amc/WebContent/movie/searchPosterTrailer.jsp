<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
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
					<i class="fa fa-search"></i>&nbsp; ${movie.movieNm} 포스터
				</span>
			</div>
			<div class="row col-md-12">
				<div class="row col-md-3">
					<input type="text" name="searchPoster" placeholder="원하는 검색결과가 없을 때 사용해주세요">
				</div>
				<div class="row col-md-2">
					<button type="button" name="searchClick">검색</button>
				</div>
			</div>


			<div class="listPoster scrolling content"></div>
			<input type="hidden" name="movieNm" value="${movie.movieNm}" />
		</div>


	</div>