package com.kh.project.vo;

import java.sql.Timestamp;

import lombok.Data;
 
@Data
public class QnaVo {
	private int qna_no;
	private String userid;
	private String qna_title;
	private String qna_content;
	private int qna_state;
	private Timestamp qna_regdate;
	private int answer_no;
}
