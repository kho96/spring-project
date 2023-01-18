package com.kh.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.vo.AnnVo;
import com.kh.project.vo.QnaCommentVo;
import com.kh.project.vo.QnaVo;


@Repository
public class QnaCommentDao {
	private final String NAMESPACE = "mappers.qnacomment.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean insertQnaComment(QnaCommentVo qnaCommentVo) {
		int count = sqlSession.insert(NAMESPACE + "insertQnaComment", qnaCommentVo);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	public QnaCommentVo showQnaComment(int qna_no) {
		System.out.println("QCD_qna_no: " + qna_no);
		 return sqlSession.selectOne(NAMESPACE + "showQnaComment", qna_no);
	}
	
	public boolean modifyQnaComment(QnaCommentVo qnaCommentVo) {
		int count = sqlSession.update(NAMESPACE + "modifyQnaComment", qnaCommentVo);
		if(count > 0) {
			return true; 
		}
		return false;
	}
	
	public boolean deleteQnaComment(int qna_no) {
		int count = sqlSession.delete(NAMESPACE + "deleteQnaComment", qna_no);
		if(count > 0) {
			return true;
		}
		return false;
	}
}

