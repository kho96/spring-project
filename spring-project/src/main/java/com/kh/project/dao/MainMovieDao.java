package com.kh.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.vo.MovieVo;

@Repository
public class MainMovieDao {
	private final String NAMESPACE = "mappers.movie.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<MovieVo> getMovies() {
		List<MovieVo> list = sqlSession.selectList(NAMESPACE + "getMovies");
		return list;
	}
	
	public List<MovieVo> getPreMovies() {
		List<MovieVo> list = sqlSession.selectList(NAMESPACE + "getPreMovies");
		return list;
	}
	
	public MovieVo getDetail(int movie_no) {
		MovieVo vo = sqlSession.selectOne(NAMESPACE + "getDetail", movie_no);
		return vo;
	}
}
