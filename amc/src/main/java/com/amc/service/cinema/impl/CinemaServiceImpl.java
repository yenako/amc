package com.amc.service.cinema.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.amc.common.Search;
import com.amc.service.cinema.CinemaDAO;
import com.amc.service.cinema.CinemaService;
import com.amc.service.domain.Movie;
import com.amc.service.domain.Product;
import com.amc.service.domain.ScreenContent;
import com.amc.service.movie.MovieDAO;

@Service("cinemaServiceImpl")
public class CinemaServiceImpl implements CinemaService {

	@Autowired
	@Qualifier("cinemaDAOImpl")
	CinemaDAO cinemaDAO;
	
	@Autowired
	@Qualifier("movieDAOImpl")
	MovieDAO movieDAO;
	
	Map<String, Object> addInfo = new HashMap<String,Object>();
	
	public CinemaServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> unifiedSearch(String searchKeyword) {
		
		Map<String, Object> unifiedSearch = new HashMap<String,Object>();
		
		//무비리스트 파라미터용 search
		Search search = new Search();
		search.setSearchKeyword(searchKeyword);
		
		
		
		//cinemaDAO 를 이용한 시사회,굿즈,스낵 리스트 데이터 가지고오기
		unifiedSearch = cinemaDAO.unifiedSearch(searchKeyword);
		
		List<ScreenContent> pv = (List<ScreenContent>)(unifiedSearch.get("uniPreviewList"));
		List<Product> goods = (List<Product>)(unifiedSearch.get("uniGoodsList"));
		List<Product> snack = (List<Product>)(unifiedSearch.get("uniSnackList"));
		
		for (ScreenContent screenContent : pv) {
			System.out.println("serviceImpl"+screenContent.getPreviewTitle());
		}
		
		for (Product product : goods) {
			System.out.println("serviceImpl"+product.getProdName());
		}
		for (Product product : snack) {
			System.out.println("serviceImpl"+product.getProdName());
		}
		
		
		
		
		//movieDAO 를 이용한 영화 리스트 데이터 가지고오기
		List<Movie> movie = movieDAO.uniMovieList(search);
		unifiedSearch.put("uniMovieList", movie);
		
		for (Movie mv : movie) {
			System.out.println("serviceImpl"+mv.getMovieNm());
		}
			
		return unifiedSearch;
	}

	@Override
	public Map<String, Object> index() throws Exception {
		Map<String, Object> index = new HashMap<String,Object>();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
        Calendar calendar = Calendar.getInstance();
        
		Search search = new Search();
		search.setSearchCondition("4"); //MovieMapper에서 조건(if문을 위한) 현재 상영중인 영화
		search.setSearchKeyword(simpleDateFormat.format(calendar.getTime())); //MovieMapper에서 조건(날짜) 현재 상영중인 영화
	
		
		index = cinemaDAO.index();
		List<Movie> movieList = movieDAO.uniMovieList(search);
		String rating = "";
		
		for(Movie movie : movieList){
			rating = movie.getWatchGradeNm();
			if(rating.startsWith("전체")){
				movie.setWatchGradeNm("ageAll");
			}else if(rating.startsWith("12세")){
				movie.setWatchGradeNm("age12");
			}else if(rating.startsWith("15세")){
				movie.setWatchGradeNm("age15");
			}else if(rating.startsWith("청소년")){
				movie.setWatchGradeNm("age19");
			}
		}
		
		index.put("mainMovieList", movieList); //MovieDAO에서 가지고 온 현재 상영중인 영화 List<Movie>를 풋
		
		List<String> commentCount = new ArrayList<String>();
				
		
		for(int i = 0 ; i < movieList.size(); i++){
			if(movieList.get(i) != null){
				commentCount.add(movieDAO.getTotalCount(movieList.get(i).getMovieNo())+"");
			}
		}
		index.put("commentCount", commentCount);
		
		//MovieDAO 에서 잘 가지고 왔나 확인용
		for (Movie movie : movieDAO.uniMovieList(search)) {
			System.out.println(movie.getMovieNm());
		}
		
		return index;
	}
	

	@Override
	public String checkPay(String impUid) throws Exception{
		
		//addInfo에 token 추가
		addInfo.put("access_token", this.getToken());
		
		//결제정보 확인
		JSONObject checkObj = 
				this.getImportResponseJSONObject(this.getConAndBody("https://api.iamport.kr/payments/"+impUid, "confirmPay",addInfo));
		
		return checkObj.get("status").toString()+","+checkObj.get("amount").toString();
	}
	
	@Override
	public String cancelPay(String impUid) throws Exception {
		
		String result = "fail";
		
		if(((this.checkPay(impUid)).split(","))[0].equals("paid")){
			
			//addInfo에 token 추가
			addInfo.put("access_token", this.getToken());
			addInfo.put("impUid", impUid);
			JSONObject cancelObj = 
					this.getImportResponseJSONObject(this.getConAndBody("https://api.iamport.kr/payments/cancel", "cancelPay",addInfo));
			
			if(cancelObj != null){
				return cancelObj.get("status").toString();	
			}else{
				return result;
			}
		}
		return result;
	}
	
	public String getToken() throws Exception{
		
		//token 받기
		JSONObject tokenObj = 
				this.getImportResponseJSONObject(this.getConAndBody("https://api.iamport.kr/users/getToken/", "getAccessToken"));
		
		//token 리턴
		return (tokenObj.get("access_token").toString());
		
	}

	public JSONObject getImportResponseJSONObject(Map<String,Object> conAndBody) throws Exception{
		
		HttpsURLConnection con = (HttpsURLConnection)conAndBody.get("con");
		
		String body = (String)conAndBody.get("body");
        
        OutputStreamWriter writer = new OutputStreamWriter(con.getOutputStream());
                
	    writer.write(body);
	    writer.flush();
	    writer.close();
	    
	    System.out.println("con : "+con.toString());
	    System.out.println("body : "+body);
	    
	    int responseCode = con.getResponseCode();
        
        BufferedReader br = null;
        
        if(responseCode==200) {
        	System.out.println("송수신 성공 : 200");
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else {  // 에러 발생
        	System.out.println("송수신 실패 : " + responseCode);
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        
        //JSON Data 읽기
        String oneLine = "";
        StringBuffer response = new StringBuffer();
        
        while ((oneLine = br.readLine()) != null) {
            response.append(oneLine);
        }
        
        br.close();
        con.disconnect();
        
        String firstJsonData = response.toString();
        
        JSONObject jsonObj = (JSONObject)JSONValue.parse(firstJsonData);
        
        System.out.println("취소시 jsonObj String : " + jsonObj);
        //jsonData중에 response내용 추출(response가 json형식임)
        if(jsonObj.get("response") != null){
        	String res = jsonObj.get("response").toString();
            System.out.println("res : " + res);
            return (JSONObject)JSONValue.parse(res);
        }else{
        	return null;
        }
	}
	
	public Map<String,Object> getConAndBody(String inputUrl, String behavior) throws Exception{
		
		Map<String,Object> conAndBody = new HashMap<String, Object>();
		
		URL url = new URL(inputUrl);
		StringBuffer body = new StringBuffer();
		
			
		HttpsURLConnection con = (HttpsURLConnection)url.openConnection();
				
		con.setDoInput(true);
        con.setDoOutput(true);
        con.setUseCaches(false);

        if(behavior.equals("getAccessToken")){

        	con.setRequestMethod("POST");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
					
	        body.append( "imp_key=0683462591653622");
	        body.append( "&imp_secret=ayIf8zscfkAHWOeVVPukrMxUX9sUr9RBIzRQ9j2oED6Askwoa0IBNgwKpYFR7wtQ6kGfDJDinKTP4pde" );
	        
        }
        
        conAndBody.put("con", con);
        conAndBody.put("body", body.toString());
        
        con.disconnect();
        
        return conAndBody;
	}
	
	public Map<String,Object> getConAndBody(String inputUrl, String behavior, Map<String,Object> addInfo) throws Exception{
		
		Map<String,Object> conAndBody = new HashMap<String, Object>();
		
		URL url = new URL(inputUrl);
		StringBuffer body = new StringBuffer();
			
		HttpsURLConnection con = (HttpsURLConnection)url.openConnection();
				
		con.setDoInput(true);
        con.setDoOutput(true);
        con.setUseCaches(false);

        if(behavior.equals("confirmPay")){
        	
        	con.setRequestMethod("GET");
    		con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
    		con.setRequestProperty("Authorization", (String)addInfo.get("access_token"));
        	
        }else if(behavior.equals("cancelPay")){
        	
        	con.setRequestMethod("POST");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			con.setRequestProperty("Authorization", (String)addInfo.get("access_token"));
					
	        body.append( "imp_uid="+(String)addInfo.get("impUid"));
        }

        conAndBody.put("con", con);
        conAndBody.put("body", body.toString());
        
        con.disconnect();
        
		return conAndBody;
	}

	@Override
	public Map<String, Object> getTransportListAtStation(double x, double y, int radius) throws Exception{

		System.out.println("impl의 xyradius"+x+"::"+y+"::"+radius);
		StringBuilder urlBuilder = new StringBuilder("https://api.odsay.com/api"+"/pointSearch?x="+x+"&y="+y+"&radius="+radius+"&apiKey=9Y8umSFLTjBabpZyQD9MSJZ/GpAV/XJrRHAGwBVmguw");
		
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		
		System.out.println("Response Code :: "+conn.getResponseCode());
		
		BufferedReader rd;
		
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		}else{
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while((line = rd.readLine()) != null){
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		
		System.out.println(sb.toString());
		
		JSONObject stationJsonObj = (JSONObject)JSONValue.parse(sb.toString()); 
		
		JSONObject stationResultJsonObj = (JSONObject)stationJsonObj.get("result");
		
		JSONArray stationResultJsonArray = (JSONArray)stationResultJsonObj.get("station");

		
		List<Integer> stationIDList = new ArrayList<Integer>();
		List<String> stationNameList = new ArrayList<String>();
		List<Integer> stationClassList = new ArrayList<Integer>(); 
		
		for (int i = 0; i < stationResultJsonArray.size(); i++){
			JSONObject returnStationJsonObj = (JSONObject)stationResultJsonArray.get(i);
			stationNameList.add(returnStationJsonObj.get("stationName").toString());
			stationIDList.add(Integer.parseInt(returnStationJsonObj.get("stationID").toString())); 
			stationClassList.add(Integer.parseInt(returnStationJsonObj.get("stationClass").toString()));
		}
		
		List<String> busNoList = new ArrayList<String>();
		List<String> subwayList = new ArrayList<String>();
		
		
		for(int i = 0; i < stationIDList.size(); i++){
			
			if(stationClassList.get(i) == 1){
				
				urlBuilder = new StringBuilder("https://api.odsay.com/api/"+"busStationInfo?stationID="+stationIDList.get(i)+"&apiKey=9Y8umSFLTjBabpZyQD9MSJZ/GpAV/XJrRHAGwBVmguw");
				url = new URL(urlBuilder.toString());
				conn = (HttpURLConnection)url.openConnection();
				
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Content-type", "application/json");
				
				
				if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
					rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
				}else{
					rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
				}
				
				sb = new StringBuilder();
				while((line = rd.readLine()) != null){
					sb.append(line);
				}
				rd.close();
				conn.disconnect();
				
		
				JSONObject busJsonObj = (JSONObject)JSONValue.parse(sb.toString()); 
				
				JSONObject busResultJsonObj = (JSONObject)busJsonObj.get("result");
				
				
				JSONArray busResultJsonArray = (JSONArray)busResultJsonObj.get("lane");
				
				for(int j = 0; j < busResultJsonArray.size(); j++){
					JSONObject returnBusNoJsonObj = (JSONObject)busResultJsonArray.get(j);
					if(!busNoList.contains(returnBusNoJsonObj.get("busNo").toString())){ 
						busNoList.add(returnBusNoJsonObj.get("busNo").toString());
					}
				}

			}else if(stationClassList.get(i) == 2){
				
				// https://api.odsay.com/api/subwayStationInfo?stationID=550
				
				urlBuilder = new StringBuilder("https://api.odsay.com/api/"+"subwayStationInfo?stationID="+stationIDList.get(i)+"&apiKey=9Y8umSFLTjBabpZyQD9MSJZ/GpAV/XJrRHAGwBVmguw");
				url = new URL(urlBuilder.toString());
				conn = (HttpURLConnection)url.openConnection();
				
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Content-type", "application/json");
				
//				System.out.println("Response Code :: "+conn.getResponseCode());
				
				if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
					rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
				}else{
					rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
				}
				
				sb = new StringBuilder();
				while((line = rd.readLine()) != null){
					sb.append(line);
				}
				rd.close();
				conn.disconnect();
				
//				System.out.println(line);
//				System.out.println(rd);
//				System.out.println("\n\nsb :: \n"+sb);
				
				JSONObject subwayJsonObj = (JSONObject)JSONValue.parse(sb.toString());
//				System.out.println("\n\nsubwayJsonObj :: \n"+subwayJsonObj); 
				
				JSONObject subwayResultJsonObj = (JSONObject)subwayJsonObj.get("result");
//				System.out.println("\n\nsubwayResultJsonObj :: \n"+subwayResultJsonObj);
				
				
				String laneNameSubwayResultJSonObj = (String)subwayResultJsonObj.get("laneName");

				subwayList.add(laneNameSubwayResultJSonObj);
				
				
			}
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stationNameList", stationNameList);
		map.put("stationIDList", stationIDList);
		map.put("busNoList", busNoList);
		map.put("subwayList", subwayList);
		
		return map;

	}
	
}
