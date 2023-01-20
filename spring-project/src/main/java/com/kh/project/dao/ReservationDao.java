package com.kh.project.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.project.vo.CinemaVo;
import com.kh.project.vo.ReservationVo;

@Repository
public class ReservationDao {
	private final String NAMESPACE = "mappers.reservation.";

	@Autowired
	private SqlSession sqlSession;
	
	public boolean reservation(ReservationVo vo) {
		int count = sqlSession.insert(NAMESPACE + "reservation", vo);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	
}
