package com.kh.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.vo.AnnVo;
import com.kh.project.vo.PagingDto;
import com.kh.project.vo.QnaVo;


@Repository
public class QnaDao {
	private final String NAMESPACE = "mappers.qna.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean insertQna(QnaVo qnaVo) {
		System.out.println("QD:" + qnaVo);
		int count = sqlSession.insert(NAMESPACE + "insertQna", qnaVo);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	public List<QnaVo> showQnaList(PagingDto pagingDto){
		return sqlSession.selectList(NAMESPACE + "showQnaList", pagingDto);
	}
	
	public QnaVo showQnaDetail(int qna_no) {
		return sqlSession.selectOne(NAMESPACE + "showQnaDetail", qna_no);
	}
	
	public boolean modifyQnaContent(QnaVo qnaVo) {
		int count = sqlSession.update(NAMESPACE + "modifyQnaContent", qnaVo);
		if(count > 0) {
			return true;
		}
		return false;
	}
	public boolean deleteQna(QnaVo qnaVo) {
		int count = sqlSession.update(NAMESPACE + "deleteQna", qnaVo);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	public int getCount(PagingDto pagingDto) {
		return sqlSession.selectOne(NAMESPACE + "getCount", pagingDto);
	}
}

