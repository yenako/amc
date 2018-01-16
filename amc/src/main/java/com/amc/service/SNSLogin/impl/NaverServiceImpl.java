package com.amc.service.SNSLogin.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.amc.service.SNSLogin.NaverService;
import com.amc.service.user.UserDAO;

@Service("naverServiceImpl")
public class NaverServiceImpl implements NaverService{

	private static final String Client_ID = "P9KtaIc7ga6N4h6pDXqu";
	private static final String Client_Secret = "POsK08vOxm";
	private static final String SURVICE_URL = "http://127.0.0.1:8080/sns/start";
	private static final String Redirect_URL = "http://127.0.0.1:8080/sns/NaverLogin";
			
		
	@Override
	//TODO : �ڹٺ���
	public String generateState(){
		SecureRandom random = new SecureRandom();
		return new BigInteger(130, random).toString(32);

	}
	@Override
	//TODO : CODE�ޱ�.
	public String getCode() {
		System.out.println("naverserviceimpl�� getCode()");
		String getCode = "https://nid.naver.com/oauth2.0/authorize?client_id="+Client_ID;
				getCode += "&response_type=code";
				getCode += "&redirect_uri="+Redirect_URL;
				getCode += "&state="+generateState();
		return getCode;
	}
	
	@Override
	//TODO : Access_token�ޱ�.
	public String getAccessToken(String code, String state) {
		String getAccessToken = "https://nid.naver.com/oauth2.0/token?client_id="+Client_ID;
				getAccessToken += "&client_secret="+Client_Secret;
				getAccessToken += "&grant_type=authorization_code";
				getAccessToken += "&state="+state;
				getAccessToken += "&code="+code;
	
		String result=(String)getHtml(getAccessToken, null);
				
		return result;
	}
	
	//TODO : tokentype �� accessToken �� ������ ���� ����� Authorization�� �־� �����մϴ�. ������� xml�� ��µ˴ϴ�.
/*	public String getxml(String tokenType, String accessToken){
		String profileDataXml = getHtml(
				"https://apis.naver.com/nidlogin/nid/getUserProfile.xml",
				"https://openapi.naver.com/v1/nid/me",
				tokenType + " " +accessToken
				);
		
		return profileDataXml;
	}*/

	@Override
	//TODO : ��û�� �� �о����!!
	public String getHtml(String url, String authorization){
		HttpURLConnection httpRequest = null;
		String returnValue = null;
		try {
			URL u = new URL(url);

			httpRequest = (HttpURLConnection)u.openConnection();
			httpRequest.setRequestProperty("Content-Type","text/xml; charset=UTF-8");

			if(authorization != null){
				httpRequest.setRequestProperty("Authorization", authorization);
			}
			httpRequest.connect();
			BufferedReader in = new BufferedReader(new InputStreamReader(httpRequest.getInputStream(), "UTF-8"));
			
			StringBuffer sb = new StringBuffer();
			String line = null;
			
			while ((line = in.readLine()) != null){
				sb.append(line);
				sb.append("\n");
			}
			returnValue = sb.toString();
			
		}catch(IOException e){
			/*e.printStackTrace();*/
		}finally {
			if(httpRequest !=null){
				httpRequest.disconnect();
			}
		}
		return returnValue;
	}
	
	@Override
	//TODO : JSON �����;� ���Է� ���ʶ�
	public Map<String,String> JSONStringToMap(String str){
		Map<String, String> map = new HashMap<String, String>();
		ObjectMapper mapper = new ObjectMapper();
		try{
			map = mapper.readValue(str, new TypeReference<HashMap<String, String>>() {
			});
		}catch(JsonParseException e){
			e.printStackTrace();
		}catch(JsonMappingException e){
			e.printStackTrace();
		}catch(IOException e){
			e.printStackTrace();
		}

		
		return map;
	}
	
	@Override
	public String getAllList(String tokenType, String accessToken) throws Exception {

        String token = accessToken;// ���̹� �α��� ���� ��ū;
        String header = "Bearer " + token; // Bearer ������ ���� �߰�
        String result = null;
        try {
            String apiURL = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // ���� ȣ��
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // ���� �߻�
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println("#######################"+response.toString());
            result = response.toString();
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return result;
	}
}
	

