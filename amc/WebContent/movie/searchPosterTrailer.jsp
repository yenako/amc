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