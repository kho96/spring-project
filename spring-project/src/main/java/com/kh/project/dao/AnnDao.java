package com.kh.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.vo.AnnVo;
import com.kh.project.vo.PagingDto;

 
@Repository
public class AnnDao {
	private final String NAMESPACE = "mappers.ann.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean insertArticle(AnnVo annVo) {
		int count = sqlSession.insert(NAMESPACE + "insert_article", annVo);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	public List<AnnVo> getList(PagingDto pagingDto){
		return sqlSession.selectList(NAMESPACE + "getList", pagingDto);
	}
	
	public AnnVo getDetail(int ann_no) {
		return sqlSession.selectOne(NAMESPACE + "getDetail", ann_no);
	}
	
	public boolean updateAnn(AnnVo annVo) {
		int count = sqlSession.update(NAMESPACE + "modifyAnn", annVo);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	public boolean deleteAnn(int ann_no) {
		int count = sqlSession.delete(NAMESPACE + "deleteAnn", ann_no);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	public int getCount(PagingDto pagingDto) {
		return sqlSession.selectOne(NAMESPACE + "getCount", pagingDto);
	}
	
	public void updateViewCnt(int ann_no) {
		sqlSession.update(NAMESPACE + "updateViewCnt", ann_no);
	}
}

