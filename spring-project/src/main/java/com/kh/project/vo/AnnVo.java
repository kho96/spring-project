package com.kh.project.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AnnVo {
	private int ann_no;
	private int ann_category;
	private String ann_title;
	private String ann_content;
	private Timestamp ann_regdate;
	private int ann_viewcnt;
}
