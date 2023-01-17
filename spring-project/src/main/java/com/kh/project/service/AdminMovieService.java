package com.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.dao.AdminMovieDao;
import com.kh.project.vo.MovieVo;

@Service
public class AdminMovieService {
	
	@Autowired
	private AdminMovieDao dao;
	
	public List<MovieVo> getMovieList() {
		return dao.getMovieList();
	}
	
	public MovieVo getMovieDetail(int movie_no) {
		return dao.getMovieDetail(movie_no);
	}

	public boolean insertMovie(MovieVo movieVo) {
		return dao.insertMovie(movieVo);
	}
	
	public boolean updateMovie(MovieVo movieVo) {
		return dao.updateMovie(movieVo);
	}
	
	public boolean deleteMovie(int movie_no) {
		return dao.deleteMovie(movie_no);
	}
}
