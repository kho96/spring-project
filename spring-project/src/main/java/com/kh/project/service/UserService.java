package com.kh.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.project.dao.UserDao;
import com.kh.project.vo.UserVo;



@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	// 회원 추가
	public boolean insertUser(UserVo vo) {
		
		return userDao.insertUser(vo);
	}
	
	public UserVo getUserById(String userid) {
		return userDao.getUserById(userid);
		
	}
	
	public List<UserVo> getUserList() {
		return userDao.getUserList();
		
	}

	public int checkDupId(String userid) {
		return userDao.checkDupId(userid);
	}
}
