package com.amc.service.domain;

import com.amc.common.Search;

public class MovieComment {
	
	private WishList wishList;	
	private int movieCommentNo;
	private User user;
	private Movie movie;
	private Search search;
	private String movieComment;
	private String movieCommentRegDate;
	private String blindCommentFlag;
	
	public WishList getWishList() {
		return wishList;
	}
	public void setWishList(WishList wishList) {
		this.wishList = wishList;
	}
	
	public int getMovieCommentNo() {
		return movieCommentNo;
	}
	public void setMovieCommentNo(int movieCommentNo) {
		this.movieCommentNo = movieCommentNo;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	public Search getSearch() {
		return search;
	}
	public void setSearch(Search search) {
		this.search = search;
	}
	public String getMovieComment() {
		return movieComment;
	}
	public void setMovieComment(String movieComment) {
		this.movieComment = movieComment;
	}
	public String getMovieCommentRegDate() {
		return movieCommentRegDate;
	}
	public void setMovieCommentRegDate(String movieCommentRegDate) {
		this.movieCommentRegDate = movieCommentRegDate;
	}
	public String getBlindCommentFlag() {
		return blindCommentFlag;
	}
	public void setBlindCommentFlag(String blindCommentFlag) {
		this.blindCommentFlag = blindCommentFlag;
	}
	@Override
	public String toString() {
		return "MovieComment [wishList=" + wishList + ", movieCommentNo=" + movieCommentNo + ", user=" + user
				+ ", movie=" + movie + ", search=" + search + ", movieComment=" + movieComment
				+ ", movieCommentRegDate=" + movieCommentRegDate + ", blindCommentFlag=" + blindCommentFlag + "]";
	}


}
