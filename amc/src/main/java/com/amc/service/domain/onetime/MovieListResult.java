package com.amc.service.domain.onetime;

import java.util.List;

public class MovieListResult {

	private String totCnt;
	private String source;
	private List<MovieList> movieList;

	public String getTotCnt() {
		return totCnt;
	}

	public void setTotCnt(String totCnt) {
		this.totCnt = totCnt;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public List<MovieList> getMovieList() {
		return movieList;
	}

	public void setMovieList(List<MovieList> movieList) {
		this.movieList = movieList;
	}

	

}
