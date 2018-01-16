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
	
	
	//TODO : CODE �ޱ�.
	/*GET /oauth/authorize?client_id={app_key}&redirect_uri={redirect_uri}&response_type=code HTTP/1.1
	Host:kauth.kakao.com
	* */

	@Override
	public String getCode() throws Exception {
		// TODO  : �ڵ�ޱ�
		System.out.println("KakaoserviceImpl �� kakao get Code �޼ҵ�");
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
		
		// TODO : ����� ��ū �ޱ�
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
		// TODO : ��û�� �� �о����!!
		HttpURLConnection urlconn = null;
		String returnresult = null;
		try {
			URL url = new URL(accesstoken);
			//1.URL ��ü ����.
			urlconn = (HttpURLConnection)url.openConnection();
			//2.�ش� url�� url.openConnection() �޼��带 ���ؼ�.
			// HttpURLConnection ���Ӱ�ü�� �����Ͽ� url�� �����մϴ�.
			urlconn.setRequestProperty("Content-Type","application/json;charset=UTF-8");
			//3.url ������ http ������� ��û�ϱ����ؼ��� īī������ ������ ������� ��û�Ѵ�.
			//īī����(Response) : Content-Type: application/json;charset=UTF-8
			urlconn.setRequestMethod("POST");
			//4.POST������� ��û�ϱ�.
			urlconn.setDoOutput(true);
			//5.��û�� ���� �о�ð��̴�. true �� ����.
			urlconn.connect();
			//6.�����ϰڴ�.
			BufferedReader in = new BufferedReader(new InputStreamReader(urlconn.getInputStream(),"UTF-8"));
			//7.
			
			//*BufferdeReader : ���ڸ� �о���̰ų� ���� ��½�Ʈ������ ���ڸ� �������� ���۸� �����ν� ���ڸ� ȿ�������� ó������ �մϴ�.
			//*InputStreamReader : �� ���ھ� ������ ���۸��� �ϰԵǸ� ����� ��Ʈ�����κ��� �̸� ���ۿ� �����͸� ���� ���� ������ ���� ȿ�������� ������� �� �ֽ��ϴ�.
			
			//8.urlconn.getInputStream(), "UTF-8"
			//������ url ���� ���� UTF-8�� ���ڵ� �Ǿ �о�´�.
			//�׸��� ���ڿ� BufferedReader,InputStreamReader  �� ���ؼ� ���ڸ� �о���� in�� �����մϴ�. 
			StringBuffer sb = new StringBuffer();
			//9. StringBuffer ��ü ����
			
			//*StringBuffer : StringBuffer�� ���ڿ��� �߰��ϰų� ���� �Ҷ� �ַ� ����ϴ� �ڷ����̴�.
			
			String result = null;
			//10. ������ ������ ����
			while ((result = in.readLine()) != null){
				//11.while ���� ���ؼ� ��� ������ ������ö����� �о���� ���ؼ� ���
				//BufferedReader�� readLine() �޼��带 �̿��ؼ� null �� �ƴ� ��쿡 �ϳ��� �о�� result�� �������ش�.
				sb.append(result);
				sb.append("\n");
			}
			returnresult = sb.toString();
			
		}catch(MalformedURLException e){
			/*	
			 * URL ��ü�� ������ �� �ش� URL �ڿ��� �������� �ʰų� �ùٸ��� ���� ���������� ��쿡 
			MalformedURLException ���ܰ� �߻��մϴ�.
			�� ���ܴ� catched exception�̱� ������ try-catch������ URL �����ڵ带 ��������մϴ�.
			*/
			e.printStackTrace();
		}catch(IOException e){
			/*
			urlconn = (HttpURLConnection) url.openConnection();
			������ ���� �Ұ�찡 �ֱ⶧���� IOException ó���� ���־����ϴ�. 
			*/
			e.printStackTrace();
		}
		
		return returnresult;
	}
	

	@Override
	public Map<String, String> JsonStringMap(String data) throws Exception {
		// TODO JSON �����;� ���Է� ���ʶ�
		System.out.println("ddddddddddddddddddddd"+data);
		Map<String, String> map = new HashMap<String, String>();
		//1. map�� ��Ƽ� �������ֱ����ؼ� map �� ����
		ObjectMapper mapper = new ObjectMapper();
		//2. ObjectMapper ��ü ���� ObjectMapper�� readValue() �� ���ؼ� Json �����͸� ��ȯ�����ٰ��̴�. 
		
		try{
			map = mapper.readValue(data, new TypeReference<HashMap<String, String>>(){
			//3. �޾ƿ� data�� TypeReference�� ���ؼ� map���� ��ȯ�����صڿ� mapper.readValue�� ���ؼ� map�� �������ش�.
			});
		}catch(JsonParseException e){
		
			e.printStackTrace();
		}catch(JsonMappingException e){
		
			e.printStackTrace();
		}catch(IOException e){
		
			e.printStackTrace();
		}
		//4.����ó�� ���� ���ش�.

		return map;
		//5. ���������� �޾ƿ� data�� map �� ������ �Ϸ�Ǿ����Ƿ� map�� ���Ͻ����ش�.
	}
	
	@Override
	public String getAllList(String access_token) throws Exception {
		// TODO : ��û�� �� �о����!!
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
		System.out.println("JSON OBJECT Ȯ�� : "+ returnresult);
		
		System.out.println(jsonObj.get("kaccount_email"));
		

		return returnresult;
	}

}
