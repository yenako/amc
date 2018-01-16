package com.amc.service.domain;

import com.amc.service.domain.onetime.MovieListResult;

public class MovieAPI {

	private MovieListResult movieListResult;
	private String movieCd;
	private String movieEndDate;
	private String syonpsis;
	private String trailer;
	
	public 	String getMovieEndDate() {
		return movieEndDate;
	}

	public void setMovieEndDate(String movieEndDate) {
		this.movieEndDate = movieEndDate;
	}

	public String getSyonpsis() {
		return syonpsis;
	}

	public void setSyonpsis(String syonpsis) {
		this.syonpsis = syonpsis;
	}

	public String getTrailer() {
		return trailer;
	}

	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}


	public MovieListResult getMovieListResult() {
		return movieListResult;
	}

	public String getMovieCd() {
		return movieCd;
	}

	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}

	public void setMovieListResult(MovieListResult movieListResult) {
		this.movieListResult = movieListResult;
	}

}
