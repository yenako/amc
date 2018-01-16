package com.amc.service.SNSLogin;

import java.util.Map;

public interface NaverService {
	
	// TODO Auto-generated method stub
	public String getCode() throws Exception; 
	
	public String generateState() throws Exception;
		
	public String getAccessToken(String code, String state) throws Exception;
		
	public String getHtml(String url, String authorization) throws Exception;
	
	/*public String getxml(String tokenType, String accessToken) throws Exception;*/
	
	public Map<String,String> JSONStringToMap(String str) throws Exception;
	
	public String getAllList(String tokenType, String accessToken) throws Exception;
	
}
