package com.amc.web.cinema;

import java.io.DataOutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class HttpRequestToNode {
	
public static int httpRequest(String urlStr, String body) throws Exception{
		
	    URL url = new URL(urlStr);
	    HttpURLConnection conn = (HttpURLConnection)url.openConnection();
	    int intResponse =-2;
	    if ( conn != null ) {
    		    	
    		String strPostData = body;
    		System.out.println("strPostData : "+strPostData);

            conn.setRequestMethod("POST");
            conn.setRequestProperty("Accept-Language", "en-GB,en;q=0.5");
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            conn.setRequestProperty("Content-length", Integer.toString(strPostData.length()));
            conn.setRequestProperty("charset", "utf-8");
            conn.setUseCaches(false);
            conn.setDoOutput(true);
            conn.setDoInput(true);
            
            DataOutputStream dos = new DataOutputStream(conn.getOutputStream());
            dos.writeBytes(strPostData);
            dos.flush();
            dos.close();
            
            System.out.println("DataOutputStream closed");
            intResponse = conn.getResponseCode();
            System.out.println("\nCompleted Sending 'POST' to " + url.toString() + 
                    ", data: " + strPostData + ", rc: "+intResponse );
            
	    }
	    return intResponse;
	}
}
