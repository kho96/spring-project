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
import com.kh.project.vo.PagingDto;
import com.kh.project.vo.QnaVo;

@Service
public class QnaService {
	
	@Autowired private QnaDao qnaDao;
	@Autowired private QnaCommentDao qnaCommentDao;
	
	public boolean insertQna(QnaVo qnaVo) {
		System.out.println("QS:" + qnaVo);
		return qnaDao.insertQna(qnaVo);
	}
	
	public List<QnaVo> showQnaList(PagingDto pagingDto){
		return qnaDao.showQnaList(pagingDto);
	}
	
	public QnaVo showQnaDetail(int qna_no) {
		return qnaDao.showQnaDetail(qna_no);
	}
	
	public boolean modifyQnaContent(QnaVo qnaVo) {
		return qnaDao.modifyQnaContent(qnaVo);
	}
	
	@Transactional
	public boolean deleteQna(QnaVo qnaVo) {
		int qna_no = qnaVo.getQna_no();
		boolean commentResult = qnaCommentDao.deleteQnaComment(qna_no);
		System.out.println("commentResult: " + commentResult);
		boolean qnaResult = qnaDao.deleteQna(qnaVo);
		System.out.println("qnaResult:" + qnaResult);
		if(qnaResult == true) {
			return true;
		}
		return false;
	}
	
	public int getCount(PagingDto pagingDto) {
		int count = qnaDao.getCount(pagingDto);
		System.out.println("count:" + count);
		return count;
	}
}

