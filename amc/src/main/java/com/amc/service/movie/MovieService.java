package com.amc.service.movie;

import java.util.List;
import java.util.Map;

import com.amc.common.Search;
import com.amc.service.domain.Movie;
import com.amc.service.domain.MovieComment;
import com.amc.service.domain.User;
import com.amc.service.domain.WishList;
import com.amc.service.domain.onetime.MovieList;
import com.amc.service.domain.onetime.MovieOnScheule;


public interface MovieService {

	// 전체 영화 목록 불러오기 (관리자용)
	public List<Movie> getMoiveAdminList(Search search);

	// 현재 상영 영화 목록 불러오기
	public Map<String, Object> getMovieList(Search search) throws Exception;

	// 상영 예정 영화 목록 불러오기
	public List<Movie> getMoviePreviewList(Search search);

	// 시사회 영화 목록 불러오기
	public List<Movie> getCommingSoonList(Search search);
	
	public List<MovieOnScheule> getScreenCalendar(Search search) throws Exception;
		
	public Movie getMovie(int movieNo) throws Exception;

	// 영화 수정
	public int updateMovie(Movie movie) throws Exception;

	// 영화 삭제
	public int deleteMovie(int movieNo) throws Exception;

	// RESTCONTROLLER 타는 부분

	// 등록을 누른 후 외부 영화 API 목록 불러오기
	public List<MovieList> getAPIMoiveList() throws Exception;

	// submit을 누른후 외부 영화 API 상세 + 네이버 영화 포스터 API를 가져온 후 DB등록
	public int addMovie(Movie movie);
	// 관리목록에서 클릭한경우는 수정화면으로, 영화목록에서 클릭한경우는 상세정보화면으로

	// 영화에 대한 감상평 입력
	public int addMoiveComment(MovieComment movieComment);

	// 부적절한 감상평 블라인드 처리 유무
	public int blindMoiveComment(MovieComment movieComment);

	// 감상평 수정
	public int updateMovieComment(MovieComment movieComment);

	// 감상평 삭제
	public int deleteMovieComment(int movieCommentNo);
	
	// 감상평 보기
	public Map<String, Object> getMovieCommentList(Search search, int movieNo) throws Exception;



	public MovieComment getMovieComment(int movieCommentNo);
	
	public int dupMovieChk(Search search) throws Exception;
	
	// 위시리스트 체크 온오프
	public String switchWishList(WishList wishList);
	
	//나의 위시리스트에서 삭제하기 위해
	public int deleteWishList(WishList wishList);

	public Map<String,Object> getWishList(Map<String,Object> map);

	public String checkWishList(WishList wishList);


	public String searchTrailer(String searchTrailer) throws Exception;

	public String searchPoster(String searchPoster) throws Exception;

	public int getTotalCount(int movieNo) throws Exception;

	
	// 현재 상영영화와 상영예정 영화목록에서  위시리스트 불러오기
	// public List<WishList> getWishListMovie(Search search, User user);

}
