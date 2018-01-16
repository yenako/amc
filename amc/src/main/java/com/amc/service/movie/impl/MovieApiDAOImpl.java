package com.amc.service.movie.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.amc.common.Search;
import com.amc.service.domain.Movie;
import com.amc.service.domain.MovieAPI;
import com.amc.service.domain.MovieComment;
import com.amc.service.domain.User;
import com.amc.service.domain.WishList;
import com.amc.service.domain.onetime.MovieList;
import com.amc.service.domain.onetime.MovieOnScheule;
import com.amc.service.movie.MovieDAO;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;


@Repository("movieApiDAOImpl")
public class MovieApiDAOImpl implements MovieDAO {	
	
	//Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("::" + getClass() +" .setSqlsession Call....");
		this.sqlSession = sqlSession;
	}

	//Constructor
	public MovieApiDAOImpl() {
		System.out.println("::" + getClass() +" default Construcor call....");
	}
	
	// RESTCONTROLLER 타는 부분
	// 등록을 누른 후 외부 영화 API 목록 불러오기
	
	public List<MovieList> getAPIMoiveList(	HttpServletRequest request, 
											HttpServletResponse response
											) throws Exception{
		
			System.out.println("movieApiDaoImpl called ...");
			System.out.println("/movie/json/listMovie : GET");
			
			String curPage = request.getParameter("curPage")==null?"1":request.getParameter("curPage");					    //현재페이지
			String itemPerPage = request.getParameter("itemPerPage")==null?"200":request.getParameter("itemPerPage");		//결과row수
			String movieNm = request.getParameter("movieNm")==null?"":request.getParameter("movieNm");						//영화명
			String directorNm = request.getParameter("directorNm")==null?"":request.getParameter("directorNm");				//감독명
			String openStartDt = request.getParameter("openStartDt")==null?"":request.getParameter("openStartDt");			//개봉연도 시작조건 ( YYYY )
			String openEndDt = request.getParameter("openEndDt")==null?"":request.getParameter("openEndDt");				//개봉연도 끝조건 ( YYYY )	
			String prdtStartYear = request.getParameter("prdtStartYear")==null?"2017":request.getParameter("prdtStartYear");	//제작연도 시작조건 ( YYYY )
			String prdtEndYear = request.getParameter("prdtEndYear")==null?"":request.getParameter("prdtEndYear");			//제작연도 끝조건    ( YYYY )
			String repNationCd = request.getParameter("repNationCd")==null?"":request.getParameter("repNationCd");			//대표국적코드 (공통코드서비스에서 '2204'로 조회된 국가코드)
			String[] movieTypeCdArr = request.getParameterValues("movieTypeCdArr")==null? null:request.getParameterValues("movieTypeCdArr");	//영화형태코드 배열 (공통코드서비스에서 '2201'로 조회된 영화형태코드)
			
			// 발급키
			String key = "430156241533f1d058c603178cc3ca0e";
			// KOBIS 오픈 API Rest Client를 통해 호출
		    KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

		    
			// 영화코드조회 서비스 호출 (boolean isJson, String curPage, String itemPerPage,String directorNm, String movieCd, String movieNm, String openStartDt,String openEndDt, String ordering, String prdtEndYear, String prdtStartYear, String repNationCd, String[] movieTypeCdArr)
		    String movieCdResponse = service.getMovieList(true, curPage, itemPerPage, movieNm, directorNm, openStartDt, openEndDt, prdtStartYear, prdtEndYear, repNationCd, movieTypeCdArr);
		
			ObjectMapper mapper = new ObjectMapper();
		    System.out.println("movieCdResponse" + movieCdResponse);
		    
		
		    MovieAPI movieAPI = mapper.readValue(movieCdResponse, MovieAPI.class);
		    //System.out.println("매핑테스트");
		    List<MovieList> list =  movieAPI.getMovieListResult().getMovieList();
		    
		    //System.out.println("MoveList list :: " + list);
		
			return list;
		}

	@Override
	public List<Movie> getMoiveAdminList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Movie> getMovieList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

		
	
	@Override
	public List<Movie> getMoviePreviewList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Movie> getCommingSoonList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public ArrayList<MovieOnScheule> getScreenCalendar(Search search) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Movie getMovie(int movieNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMovie(Movie movie) throws Exception {
		
		return 0;
	}

	@Override
	public int deleteMovie(int movieNo) {
		return 0;
		
	}

	@Override
	public List<WishList> getWishList(Search search, String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MovieList> getAPIMoiveList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int addMoiveComment(MovieComment movieComment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int blindMoiveComment(MovieComment movieComment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMovieComment(MovieComment movieComment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMovieComment(int movieCommentNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MovieComment> getMovieCommentList(Search search, int movieNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int existWish(int moiveNo, String userId) {
		// TODO Auto-generated method stub
		return 0;
	}


	// submit을 누른후 외부 영화 API 상세 + 네이버 영화 포스터 API를 가져온 후 DB등록
	public int addMovie(Movie movie) 	 {
			System.out.println("MovieAPIDAOImpl called ....");
		
			return sqlSession.insert("MovieMapper.addMovie",movie);
			
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 관리목록에서 클릭한경우는 수정화면으로, 영화목록에서 클릭한경우는 상세정보화면으로
	
	@Override
	public List<Movie> uniMovieList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalCount(int movieNo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MovieComment getMovieComment(int movieCommentNo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int  dupMovieChk(Search search) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String checkWishList(WishList wishList) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addWishList(WishList wishList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteWishList(WishList wishList) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public Map<String, Object> getWishList(Map<String, Object> map) {
		Map<String,Object> tempMap = new HashMap<String,Object>();
		tempMap.put("totalCount", sqlSession.selectOne("WishListMapper.getTotalCount",map));
		tempMap.put("list", sqlSession.selectList("WishListMapper.getWishList",map));
		return tempMap;
	}

	@Override
	public List<Movie> screenMovieList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	
	/*public List<WishList> getWishListMovie(Search search, User user) {
		// TODO Auto-generated method stub
		return null;
	}*/
}
