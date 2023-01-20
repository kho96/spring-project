package com.kh.project.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

@Configuration
@PropertySource("classpath:setting.properties")
public class MovieSearchApi {
	@Value("${NAVER-CLIENT}")
	private String clientId;
	@Value("${NAVER-KEY}")
	private String clientSecret;
	@Value("${KMDB-KEY}")
	private String ServiceKey;
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer(){
		return new PropertySourcesPlaceholderConfigurer();
	}
	
	public String search(int command, String url, String keyword) {
		// 검색어 인코딩
		try {
			keyword = URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			System.out.println("검색어 인코딩 실패");
		}
		// URL 세팅
		// String apiURL = "https://openapi.naver.com/v1/search/movie?query=" + keyword;
		String apiURL = "";
		Map<String, String> requestHeaders = new HashMap<>();
		String responseBody = "";
		switch (command) {
		case 0:
			apiURL = url + keyword + "&ServiceKey=" + ServiceKey;	
			requestHeaders.put("ServiceKey", ServiceKey);
			break;
		case 1:
			apiURL = url + keyword;	
			requestHeaders.put("X-Naver-Client-Id", clientId);
			requestHeaders.put("X-Naver-Client-Secret", clientSecret);
			break;
		}
		
		responseBody = get(apiURL, requestHeaders);
		return responseBody;

	} // search
	
	private String get(String apiUrl, Map<String, String> requestHeaders) {
		// get 호출
		HttpURLConnection conn = getConnection(apiUrl);
		try {
			conn.setRequestMethod("GET");
			for(Map.Entry<String, String> header : requestHeaders.entrySet()) {
				conn.setRequestProperty(header.getKey(), header.getValue());
			}
			int responseCode = conn.getResponseCode();
			// 응답 코드가 200 OK라면 -> 정상 호출
			if (responseCode == HttpURLConnection.HTTP_OK) {
				return readBody(conn.getInputStream());
			} 
			// 에러 발생했다면
			else {
				return readBody(conn.getErrorStream());
			}
		} catch (IOException e) {
			System.out.println("API 요청 및 응답 실패");
			e.printStackTrace();
		} finally {
			conn.disconnect();
		}
		return null;
	} // get
	
	// HTTP 연결
	private HttpURLConnection getConnection(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection)url.openConnection();
		} catch (MalformedURLException e) {
			System.out.println("API URL 잘못됨");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("연결 실패");
			e.printStackTrace();
		}
		return null;
	} // getConnection
	
	// 응답 결과 가공
	private String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);
		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();
			String line;
			while((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}
			return responseBody.toString();
		} catch (IOException e) {
			System.out.println("API 응답 읽기 실패");
			e.printStackTrace();
		}
		return null;
	} // readBody

} // MovieSearchApi