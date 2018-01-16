package com.amc.service.SNSLogin;

import java.util.Map;

public interface KakaoService {
	
	//kakao
	public String getCode() throws Exception;
		
	public String getAccessToken(String authorize_code) throws Exception;
	
	public String getHtml(String accesstoken) throws Exception;
	
	public Map<String,String> JsonStringMap(String data) throws Exception;
	
	public String getAllList(String access_token) throws Exception;

}
