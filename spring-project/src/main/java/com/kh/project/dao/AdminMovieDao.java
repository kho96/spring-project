package com.kh.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.vo.MovieVo;

@Repository
public class AdminMovieDao {
	private final String NAMESPACE = "mappers.admin.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<MovieVo> getMovieList() {
		List<MovieVo> list = sqlSession.selectList(NAMESPACE + "getMovieList");
		return list;
	}
	
	public List<String> getTitleList() {
		List<String> list = sqlSession.selectList(NAMESPACE + "getTitleList");
		return list;
	}
	
	public MovieVo getMovieDetail(int movie_no) {
		MovieVo movieVo = sqlSession.selectOne(NAMESPACE + "getMovieDetail", movie_no);
		return movieVo;
	}

	public boolean insertMovie(MovieVo movieVo) {
		int count = sqlSession.insert(NAMESPACE + "insertMovie", movieVo);
		if (count > 0) return true;
		return false;
	}
	
	public boolean updateMovie(MovieVo movieVo) {
		int count = sqlSession.update(NAMESPACE + "updateMovie", movieVo);
		if (count > 0) return true;
		return false;
	}
	
	public boolean deleteMovie(int movie_no) {
		int count = sqlSession.delete(NAMESPACE + "deleteMovie", movie_no);
		if (count > 0) return true;
		return false;
	}
	
	// 상영관 관리
	public List<String> getCinemaList() {
		List<String> list = sqlSession.selectList(NAMESPACE + "getCinemaList");
		return list;
	}
	
	public boolean insertCinemaName(String cinema_name) {
		int count = sqlSession.insert(NAMESPACE + "insertCinemaName", cinema_name);
		if (count > 0) return true;
		return false;
	}
	
}
