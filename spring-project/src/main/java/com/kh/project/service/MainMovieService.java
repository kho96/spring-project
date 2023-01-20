package com.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.dao.MainMovieDao;
import com.kh.project.vo.MovieVo;

@Service
public class MainMovieService {

	@Autowired private MainMovieDao dao;
	
	public List<MovieVo> getMovies() {
		return dao.getMovies();
	}
	
	public List<MovieVo> getPreMovies() {
		return dao.getPreMovies();
	}
	
	public MovieVo getDetail(int movie_no) {
		return dao.getDetail(movie_no);
	}
}
