package com.kh.project.vo;

import java.sql.Timestamp;

import lombok.Data;
 
@Data
public class QnaCommentVo {
	private int qna_no;
	private String qna_comment;
	private Timestamp qna_comment_regdate;
}
