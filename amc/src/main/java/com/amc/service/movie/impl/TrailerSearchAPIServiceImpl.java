package com.amc.service.movie.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.amc.common.Search;
import com.amc.service.domain.Movie;
import com.amc.service.domain.MovieComment;
import com.amc.service.domain.WishList;
import com.amc.service.domain.onetime.MovieList;
import com.amc.service.domain.onetime.MovieOnScheule;
import com.amc.service.movie.MovieService;

@Service("trailerSearchAPIServiceImpl")
public class TrailerSearchAPIServiceImpl implements MovieService {

	@Override
	public String searchTrailer(String searchTrailer) throws Exception {

		System.out.println("searchTrailer ->" + searchTrailer);
		/*String decodedData = URLDecoder.decode(searchTrailer, "UTF-8");
		System.out.println("decodedData => " + decodedData);*/
		searchTrailer = URLEncoder.encode(searchTrailer, "UTF-8");
		String daumOpenAPIURL = "https://dapi.kakao.com/v2/search/vclip?query=" + searchTrailer+"&size=30";

		// java API 를 이용 HttpRequest
		URL url = new URL(daumOpenAPIURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("Authorization", "KakaoAK 5ea5214d3a8efd5c2f1b4e86ff7c372c");

		// Response Code GET
		int responseCode = con.getResponseCode();

		BufferedReader br = null;

		if (responseCode == 200) {
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}

		// JSON Data 읽기
		String jsonData = "";
		StringBuffer response = new StringBuffer();

		while ((jsonData = br.readLine()) != null) {
			response.append(jsonData);
		}

		br.close();

		// Console 확인
		System.out.println(response.toString());

		return response.toString();
	}
	
	
	@Override
	public String searchPoster(String searchPoster) throws Exception {

		System.out.println("searchTrailer ->" + searchPoster);

		searchPoster = URLEncoder.encode(searchPoster, "UTF-8");
		String daumOpenAPIURL = "https://dapi.kakao.com/v2/search/image?query=" + searchPoster+"&size=80";

		// java API 를 이용 HttpRequest
		URL url = new URL(daumOpenAPIURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("Authorization", "KakaoAK 5ea5214d3a8efd5c2f1b4e86ff7c372c");

		// Response Code GET
		int responseCode = con.getResponseCode();

		BufferedReader br = null;

		if (responseCode == 200) {
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}

		// JSON Data 읽기
		String jsonData = "";
		StringBuffer response = new StringBuffer();

		while ((jsonData = br.readLine()) != null) {
			response.append(jsonData);
		}

		br.close();

		// Console 확인
		System.out.println(response.toString());

		return response.toString();
	}
	
	

	@Override
	public List<Movie> getMoiveAdminList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getMovieList(Search search) throws Exception {
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
	public List<MovieOnScheule> getScreenCalendar(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Movie getMovie(int movieNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMovie(Movie movie) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMovie(int movieNo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MovieList> getAPIMoiveList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addMovie(Movie movie) {
		// TODO Auto-generated method stub
		return 0;
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
	public Map<String, Object> getMovieCommentList(Search search, int movieNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MovieComment getMovieComment(int movieCommentNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dupMovieChk(Search search) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String switchWishList(WishList wishList) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteWishList(WishList wishList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, Object> getWishList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String checkWishList(WishList wishList) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalCount(int movieNo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
