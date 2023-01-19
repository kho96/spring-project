package com.kh.project.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationBeanNameGenerator;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.project.dao.AnnDao;
import com.kh.project.dao.AnnLikeDao;
import com.kh.project.vo.AnnLikeVo;
import com.kh.project.vo.AnnVo;
import com.kh.project.vo.PagingDto;
 
@Service
public class AnnLikeService {
	
	@Autowired
	private AnnLikeDao annLikeDao;
	
	public boolean insertHeart(AnnLikeVo annLikeVo) {
		return annLikeDao.insertHeart(annLikeVo);
	}
	
	public int getLikeCount(int ann_no) {
		return annLikeDao.getLikeCount(ann_no);
	}
	
	public boolean checkLike(AnnLikeVo annLikeVo) {
		return annLikeDao.checkLike(annLikeVo);
	}
	
	public boolean cancleLike(AnnLikeVo annLikeVo) {
		return annLikeDao.cancleLike(annLikeVo);
	}
}

