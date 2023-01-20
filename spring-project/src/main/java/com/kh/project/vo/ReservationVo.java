package com.kh.project.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReservationVo {
	private int re_num;
	private String userid;
	private Timestamp re_date;
	private String re_movie;
	private String re_cinema;
	private String re_day;
	private String re_time;
	private String re_personnel;
	private String re_seats;
	private String re_cost;
}   