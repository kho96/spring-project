package com.kh.project.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationBeanNameGenerator;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.project.dao.AnnDao;
import com.kh.project.vo.AnnVo;
import com.kh.project.vo.PagingDto;
 
@Service
public class AnnService {
	
	@Autowired
	private AnnDao annDao;
	
	public boolean insertArticle(AnnVo annVo) {
		return annDao.insertArticle(annVo);
	}
	
	public List<AnnVo> getList(PagingDto pagingDto){
		return annDao.getList(pagingDto);
	}
	
	public AnnVo getDetail(int ann_no) {
		annDao.updateViewCnt(ann_no);
		AnnVo annVo = annDao.getDetail(ann_no);
		return annVo;
	}
	
	public boolean updateAnn(AnnVo annVo) {
		return annDao.updateAnn(annVo);
	}
	
	public boolean deleteAnn(int ann_no) {
		return annDao.deleteAnn(ann_no);
	}
	
	public int getCount(PagingDto pagingDto) {
		return annDao.getCount(pagingDto);
	}
}

