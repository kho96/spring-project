package com.kh.project.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CinemaVo {
	private String cinema_name;
	private String cinema_movie;
	private Timestamp cinema_time;
	private int cinema_row;
	private int cinema_col;
	private String cinema_able;
}   
