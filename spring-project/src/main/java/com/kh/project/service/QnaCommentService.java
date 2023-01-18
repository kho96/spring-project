package com.kh.project.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.project.dao.AnnDao;
import com.kh.project.dao.QnaCommentDao;
import com.kh.project.dao.QnaDao;
import com.kh.project.vo.AnnVo;
import com.kh.project.vo.QnaCommentVo;
import com.kh.project.vo.QnaVo;

@Service
public class QnaCommentService {
	
	@Autowired
	private QnaCommentDao qnaCommentDao;
	
	public boolean insertQna(QnaCommentVo qnaCommentVo) {
		return qnaCommentDao.insertQnaComment(qnaCommentVo);
	}
	
	public QnaCommentVo showQnaComment(int qna_no) {
		return qnaCommentDao.showQnaComment(qna_no);
	}
	
	public boolean modifyQnaComment(QnaCommentVo qnaCommentVo) {
		return qnaCommentDao.modifyQnaComment(qnaCommentVo);
	}
	
	public boolean deleteQnaComment(int qna_no){
		return qnaCommentDao.deleteQnaComment(qna_no);
	}
}

