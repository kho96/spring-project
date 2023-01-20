package com.kh.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kh.project.vo.UserVo;

@Repository
public class UserDao {
	private final String NAMESPACE = "mappers.user.";

	@Autowired
	private SqlSession sqlSession;
	
	public boolean insertUser(UserVo vo) {
		System.out.println(vo);
		int count = sqlSession.insert(NAMESPACE+ "insertUser", vo);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	public List<UserVo> getUserList() {
		List<UserVo> list =  sqlSession.selectList(
				NAMESPACE + "getUserList");
		return list;
	}
	
	public UserVo getUserById(String userid) {
		UserVo vo = sqlSession.selectOne(
				NAMESPACE + "getUserById", userid);
		return vo;
	}
	public int checkDupId(String userid) {
		System.out.println("dao, userid" + userid);
		int count = sqlSession.selectOne(NAMESPACE + "checkDupId", userid);
		System.out.println("dao,"+count);
		return sqlSession.selectOne(NAMESPACE + "checkDupId", userid);
	}
	
	public boolean userModify(UserVo vo) {
		int count = sqlSession.update(NAMESPACE + "userModify", vo);
		System.out.println("modcount얼마"+count);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	public boolean userDelete(String userid) {
		int count = sqlSession.update(NAMESPACE + "userDelete", userid);
		System.out.println("delcount"+count);
		if (count > 0) {
			return true;
		}
		return false;
	}
}
