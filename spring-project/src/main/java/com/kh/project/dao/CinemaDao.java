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
import com.kh.project.vo.SeatDto;

@Repository
public class CinemaDao {
	private final String NAMESPACE = "mappers.cinema.";
	
	@Autowired
	private SqlSession sqlSession;
	
	// 영화 리스트
	public List<String> getMovieList() {
		List<String> list = sqlSession.selectList(NAMESPACE + "getMovieList");
		return list;
	}

	public List<String> getCinemaList() {
		List<String> list = sqlSession.selectList(NAMESPACE + "getCinemaList");
		return list;
	}

	public List<Date> getTimeList() {
		List<Date> list = sqlSession.selectList(NAMESPACE + "getTimeList");
		return list;
	}
	
	public List<Date> getDateList() {
		List<Date> list = sqlSession.selectList(NAMESPACE + "getDateList");
		return list;
	}

	public List<String> getCinemaList(String cinema_movie) {
		List<String> list = sqlSession.selectList(NAMESPACE + "getCinemaListByMovie", cinema_movie);
		return list;
	}

	public List<Date> getDateList(String cinema_name, String cinema_movie) {
		Map<String, String> map = new HashMap<>();
		map.put("cinema_name", cinema_name);
		map.put("cinema_movie", cinema_movie);
		List<Date> list = sqlSession.selectList(NAMESPACE + "getDateListByCinema", map);
		return list;
	}

	public List<Date> getTimeList(String cinema_name, String cinema_movie, String day) {
		Map<String, String> map = new HashMap<>();
		map.put("cinema_name", cinema_name);
		map.put("cinema_movie", cinema_movie);
		map.put("day", day);
		List<Date> list = sqlSession.selectList(NAMESPACE + "getTimeListByCinema", map);
		return list;
	}
	
	// Col값 얻기
	public int getSeatCol(String cinema_name, String cinema_movie, String cinema_time) {
		Map<String, String> map = new HashMap<>();
		map.put("cinema_name", cinema_name);
		map.put("cinema_movie", cinema_movie);
		map.put("cinema_time", cinema_time);
		int count = sqlSession.selectOne(NAMESPACE + "getSeatCol", map);
		return count;
	}
	
	// 좌석정보 얻기
	public List<CinemaVo> getSeatAll(String cinema_name, String cinema_movie, String cinema_time) {
		Map<String, String> map = new HashMap<>();
		map.put("cinema_name", cinema_name);
		map.put("cinema_movie", cinema_movie);
		map.put("cinema_time", cinema_time);
		List<CinemaVo> list = sqlSession.selectList(NAMESPACE + "getSeatAll", map);
		return list;
	}
	
	// 극장 업데이트
	public boolean updateCinema(ReservationVo vo, List<SeatDto> seatList) {
		Map<String, Object> map = new HashMap<>();
		map.put("vo", vo);
		map.put("seatList", seatList);
		String day = vo.getRe_day();
		String time = vo.getRe_time();
		String cinema_time = "2023/" + day + " " + time; // 시간 알아내서 만들기
		map.put("cinema_time", cinema_time);
		int count = sqlSession.update(NAMESPACE + "updateCinema", map);
		if (count > 0) {
			return true;
		}
		return false;
		
	}

	// 남은 좌석 수 얻기
	public int getSeatsLeft(String cinema_name, String cinema_movie, String cinema_time) {
		Map<String, String> map = new HashMap<>();
		map.put("cinema_name", cinema_name);
		map.put("cinema_movie", cinema_movie);
		map.put("cinema_time", cinema_time);
		return sqlSession.selectOne(NAMESPACE + "getSeatsLeft", map);
	}

}
