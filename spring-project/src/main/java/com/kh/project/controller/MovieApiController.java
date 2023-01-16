package com.kh.project.controller;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.project.util.MovieSearchApi;

import lombok.RequiredArgsConstructor;

// https://miinsun.tistory.com/149
@RequiredArgsConstructor
@RestController
@RequestMapping("/movie/admin/*")
public class MovieApiController {
	private final String KMDB_URL = "https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&title=";

	@Autowired MovieSearchApi movieApi = new MovieSearchApi();

    @RequestMapping(value = "movie/search")
    public ResponseEntity<JSONObject> search(String keyword) {
    	ResponseEntity<JSONObject> result = parser(KMDB_URL, keyword);
    	return result;
    }
    
    private ResponseEntity<JSONObject> parser(String url, String keyword) {
    	JSONParser parser = new JSONParser();
    	try {
    		Object obj = parser.parse(movieApi.search(url, keyword));
    		JSONObject jsonObj = (JSONObject)obj;
    		return ResponseEntity.ok(jsonObj);
    	} catch (ParseException e) {
    		System.out.println("파싱 에러 발생");
    		e.printStackTrace();
    	}
    	return null;
    }
}