package com.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.dao.SampleDao;
import com.kh.project.vo.SampleVo;

@Service
public class SampleService {
	
	@Autowired
	private SampleDao dao;
	
	public List<SampleVo> getSampleList() {
		return dao.getSampleList();
	}
}
