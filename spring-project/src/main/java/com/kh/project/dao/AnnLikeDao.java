package com.kh.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.vo.AnnLikeVo;
import com.kh.project.vo.AnnVo;
import com.kh.project.vo.PagingDto;

 
@Repository
public class AnnLikeDao {
	private final String NAMESPACE = "mappers.annlike.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean insertHeart(AnnLikeVo annLikeVo) {
		int count = sqlSession.insert(NAMESPACE + "insertHeart", annLikeVo);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	public int getLikeCount(int ann_no) {
		return sqlSession.selectOne(NAMESPACE + "getLikeCount", ann_no);
	}
	
	public boolean checkLike(AnnLikeVo annLikeVo) {
		int count = sqlSession.selectOne(NAMESPACE + "checkLike", annLikeVo);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	public boolean cancleLike(AnnLikeVo annLikeVo) {
		int count = sqlSession.delete(NAMESPACE + "cancleLike", annLikeVo);
		if(count > 0) {
			return true;
		}
		return false;
	}
}

