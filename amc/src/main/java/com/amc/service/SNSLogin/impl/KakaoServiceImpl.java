package com.amc.service.SNSLogin.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
/*import org.codehaus.jackson.type.TypeReference;*/
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.amc.common.util.RestApiUtil;
import com.amc.service.SNSLogin.KakaoService;






@Service("kakaoServiceImpl")
public class KakaoServiceImpl implements KakaoService{


	///////////////////////////////////////////////////////////////////////////////////////////////
	//Rest Api KEY
	private static final String RestApiKey = "23cb6e93a0ebb38a3ee3f59ebebe33a7";
	//redirect_uri
	private static final String Redirect_URL= "http://127.0.0.1:8080/sns/kakaoLogin";
	//Host
	private static final String keyHost = "https://kauth.kakao.com";
	
	
	//TODO : CODE 받기.
	/*GET /oauth/authorize?client_id={app_key}&redirect_uri={redirect_uri}&response_type=code HTTP/1.1
	Host:kauth.kakao.com
	* */

	@Override
	public String getCode() throws Exception {
		// TODO  : 코드받기
		System.out.println("KakaoserviceImpl 의 kakao get Code 메소드");
		String getcode = keyHost;
		getcode += "/oauth/authorize?client_id="+RestApiKey;
		getcode += "&redirect_uri="+Redirect_URL;
		getcode += "&response_type=code";
		
		return getcode;

	}

	@Override
	public String getAccessToken(String authorize_code) throws Exception {
	/*	RestApiUtil r = new RestApiUtil("http://127.0.0.1:8080/user/kakaologin", "POST");
		Map<String,String> header = new HashMap<String,String>();
		Map<String,String> body = new HashMap<String,String>();
		header.put("Content-Type", "application/json;charset=UTF-8");	
		String a = r.restApiResponse(header, body);*/
		
		// TODO : 사용자 토큰 받기
		/*
		curl -v -X POST https://kauth.kakao.com/oauth/token \
			 -d 'grant_type=authorization_code' \
			 -d 'client_id={app_key}' \
			 -d 'redirect_uri={redirect_uri}' \
			 -d 'code={authorize_code}'
			 */
		String 	getAccessToken = keyHost;
				getAccessToken += "/oauth/token?grant_type=authorization_code";
				getAccessToken += "&client_id="+RestApiKey;
				getAccessToken += "&redirect_uri="+Redirect_URL;
				getAccessToken += "&code="+authorize_code;
		return getAccessToken;

	}

	@Override
	public String getHtml(String accesstoken) throws Exception {
		// TODO : 요청한 값 읽어오기!!
		HttpURLConnection urlconn = null;
		String returnresult = null;
		try {
			URL url = new URL(accesstoken);
			//1.URL 객체 생성.
			urlconn = (HttpURLConnection)url.openConnection();
			//2.해당 url에 url.openConnection() 메서드를 통해서.
			// HttpURLConnection 접속객체를 생성하여 url에 접속합니다.
			urlconn.setRequestProperty("Content-Type","application/json;charset=UTF-8");
			//3.url 접속후 http 방식으로 요청하기위해서는 카카오톡이 지정한 방식으로 요청한다.
			//카카오톡(Response) : Content-Type: application/json;charset=UTF-8
			urlconn.setRequestMethod("POST");
			//4.POST방식으로 요청하기.
			urlconn.setDoOutput(true);
			//5.요청한 값을 읽어올것이다. true 로 지정.
			urlconn.connect();
			//6.연결하겠다.
			BufferedReader in = new BufferedReader(new InputStreamReader(urlconn.getInputStream(),"UTF-8"));
			//7.
			
			//*BufferdeReader : 문자를 읽어들이거나 문자 출력스트림으로 문자를 내보낼때 버퍼링 함으로써 문자를 효율적으로 처리가능 합니다.
			//*InputStreamReader : 한 문자씩 읽지만 버퍼링을 하게되면 입출력 스트림으로부터 미리 버퍼에 데이터를 갖다 놓기 때문에 보다 효율적으로 입출력할 수 있습니다.
			
			//8.urlconn.getInputStream(), "UTF-8"
			//연결한 url 으로 부터 UTF-8로 인코딩 되어서 읽어온다.
			//그리고 난뒤에 BufferedReader,InputStreamReader  을 통해서 문자를 읽어오고 in에 저장합니다. 
			StringBuffer sb = new StringBuffer();
			//9. StringBuffer 객체 생성
			
			//*StringBuffer : StringBuffer는 문자열을 추가하거나 변경 할때 주로 사용하는 자료형이다.
			
			String result = null;
			//10. 저장할 변수명 지정
			while ((result = in.readLine()) != null){
				//11.while 문을 통해서 모든 내용을 가지고올때까지 읽어오기 위해서 사용
				//BufferedReader의 readLine() 메서드를 이용해서 null 이 아닐 경우에 하나씩 읽어와 result에 저장해준다.
				sb.append(result);
				sb.append("\n");
			}
			returnresult = sb.toString();
			
		}catch(MalformedURLException e){
			/*	
			 * URL 객체를 생성할 때 해당 URL 자원이 존재하지 않거나 올바르지 않은 프로토콜일 경우에 
			MalformedURLException 예외가 발생합니다.
			이 예외는 catched exception이기 때문에 try-catch문으로 URL 생성코드를 감싸줘야합니다.
			*/
			e.printStackTrace();
		}catch(IOException e){
			/*
			urlconn = (HttpURLConnection) url.openConnection();
			연결이 실패 할경우가 있기때문에 IOException 처리를 해주었습니다. 
			*/
			e.printStackTrace();
		}
		
		return returnresult;
	}
	

	@Override
	public Map<String, String> JsonStringMap(String data) throws Exception {
		// TODO JSON 데이터야 내게로 오너라
		System.out.println("ddddddddddddddddddddd"+data);
		Map<String, String> map = new HashMap<String, String>();
		//1. map에 담아서 리턴해주기위해서 map 을 생성
		ObjectMapper mapper = new ObjectMapper();
		//2. ObjectMapper 객체 생성 ObjectMapper의 readValue() 를 통해서 Json 데이터를 변환시켜줄것이다. 
		
		try{
			map = mapper.readValue(data, new TypeReference<HashMap<String, String>>(){
			//3. 받아온 data를 TypeReference를 통해서 map으로 변환시켜준뒤에 mapper.readValue를 통해서 map에 저장해준다.
			});
		}catch(JsonParseException e){
		
			e.printStackTrace();
		}catch(JsonMappingException e){
		
			e.printStackTrace();
		}catch(IOException e){
		
			e.printStackTrace();
		}
		//4.예외처리 까지 해준다.

		return map;
		//5. 마지막으로 받아온 data를 map 에 저장이 완료되었으므로 map을 리턴시켜준다.
	}
	
	@Override
	public String getAllList(String access_token) throws Exception {
		// TODO : 요청한 값 읽어오기!!
		HttpURLConnection urlconn = null;
		String returnresult = null;
		
		try {
			URL url = new URL("https://kapi.kakao.com/v1/user/me");			
			urlconn = (HttpURLConnection) url.openConnection();				
			urlconn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");				
			urlconn.setRequestProperty("Authorization", "Bearer " + access_token);
			urlconn.setRequestMethod("GET");
			urlconn.setDoOutput(true);				
			
			int responseCode = urlconn.getResponseCode();

			BufferedReader in = null;
			
			if(responseCode == 200){
				in = new BufferedReader(new InputStreamReader(urlconn.getInputStream(),"utf-8"));
			}else{
				in = new BufferedReader(new InputStreamReader(urlconn.getErrorStream(),"utf-8"));
			}
			
			String result = "";
			StringBuffer sb = new StringBuffer();				
			
		
			while ((result = in.readLine()) != null){
				sb.append(result);
			}
			returnresult = sb.toString();
			in.close();
			
		}catch(MalformedURLException e){
			e.printStackTrace();
		}catch(IOException e){
			e.printStackTrace();
		}
		
		System.out.println(returnresult);

		JSONObject jsonObj = (JSONObject)JSONValue.parse(returnresult);
		System.out.println("JSON OBJECT 확인 : "+ returnresult);
		
		System.out.println(jsonObj.get("kaccount_email"));
		

		return returnresult;
	}

}
