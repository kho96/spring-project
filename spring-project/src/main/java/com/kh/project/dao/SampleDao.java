package com.kh.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.vo.SampleVo;

@Repository
public class SampleDao {
	private final String NAMESPACE = "mappers.sample.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<SampleVo> getSampleList() {
		List<SampleVo> list = sqlSession.selectList(NAMESPACE + "getSampleList");
		return list;
	}
}
