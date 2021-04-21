package com.green.ffee.naver.api.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import com.sun.org.apache.xerces.internal.util.URI.MalformedURIException;


public class GetNaverLocal {

	
	private String clientId = "JE6RRUWsEKD9OvyJ9APy";
	private String clientSecret = "qt4I3yDGW2";
	
	
	
	public String searchLocal(String keyword, int display, int start) {
		
		String text = null;
		
		try {
			text = URLEncoder.encode(keyword,"utf-8");
		}catch (UnsupportedEncodingException e){
			e.printStackTrace();
		}
		
		//String apiURL = "https://openapi.naver.com/v1/search/local.xml";
		String apiURL = "https://openapi.naver.com/v1/search/local.json";
		apiURL += "?query="+text; //키워드를 인코딩한 text
		apiURL += "&display="+display;
		apiURL += "&start="+start;
		apiURL += "&sort=random";
		
		Map<String, String> requestHeads = new HashMap<>();
		requestHeads.put("X-Naver-Client-Id", clientId);
		requestHeads.put("X-Naver-Client-Secret", clientSecret);
		requestHeads.put("Content-Type", "application/json");
		
		String responseBody = get(apiURL, requestHeads);
		return responseBody;
	}

	private String get(String apiURL, Map<String, String> requestHeads) {
		HttpURLConnection con = connection(apiURL);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeads.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());			
			}
			
			int responseCode = con.getResponseCode();
			if(responseCode == HttpURLConnection.HTTP_OK) {  
				// 200
				return readBody(con.getInputStream());
			} else { 
				// error일때
				return readBody(con.getErrorStream());
			}
		} catch(IOException e) {
			throw new RuntimeException("API 요청과 응답 실패:" + e);
		} finally {
			con.disconnect();
		}
		
	}
	
	
	private HttpURLConnection connection(String apiURL) {
		try {
			URL url = new URL(apiURL);
			return (HttpURLConnection)url.openConnection();
			
		}catch (MalformedURIException e) {
			throw new RuntimeException("API URL 잘못"+apiURL,e);
		}catch (IOException e) {
			throw new RuntimeException("연결실패"+e);
		}finally {
			
		}
	}

	private String readBody(InputStream body) {
		InputStreamReader isr =new InputStreamReader(body);
		
		try(BufferedReader br = new BufferedReader(isr)) {
			StringBuilder responseBody = new StringBuilder();
			String line = ""; 
			while ((line = br.readLine()) != null) {responseBody.append(line);
			}
			return responseBody.toString();
			
		} catch (IOException e) {
			throw new RuntimeException("API 응답 읽는데 실패"+e);		
		}
	}


}




















