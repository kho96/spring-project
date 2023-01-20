package com.kh.project.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.dao.CinemaDao;
import com.kh.project.dao.SampleDao;
import com.kh.project.vo.CinemaVo;
import com.kh.project.vo.SampleVo;

@Service
public class CinemaService {
	
	@Autowired
	private CinemaDao dao;
	
	public List<String> getMovieList() {
		return dao.getMovieList();
	}

	public List<String> getCinemaList() {
		return dao.getCinemaList();
	}

	public List<Date> getTimeList() {
		return dao.getTimeList();
	}

	public List<Date> getDateList() {
		return dao.getDateList();
	}
	
	public List<String> getCinemaList(String cinema_movie) {
		return dao.getCinemaList(cinema_movie);
	}

	public List<Date> getDateList(String cinema_name, String cinema_movie) {
		return dao.getDateList(cinema_name, cinema_movie);
	}

	public List<Date> getTimeList(String cinema_name, String cinema_movie, String day) {
		return dao.getTimeList(cinema_name, cinema_movie, day);
	}

	public int getSeatCol(String cinema_name, String cinema_movie, String cinema_time) {
		return dao.getSeatCol(cinema_name, cinema_movie, cinema_time);
	}

	public List<CinemaVo> getSeatAll(String cinema_name, String cinema_movie, String cinema_time) {
		return dao.getSeatAll(cinema_name, cinema_movie, cinema_time);
	}

	public int getSeatsLeft(String cinema_name, String cinema_movie, String cinema_time) {
		return dao.getSeatsLeft(cinema_name, cinema_movie, cinema_time);
	}
}
