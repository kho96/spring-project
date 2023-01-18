package com.kh.project.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PagingDto {
	private int page = 1;
	private int startRow = 1;
	private int endRow = 10;
	private int startPage = 1;
	private int endPage = 5;
	private int totalPage;
	private int count;
	private final int ROW_COUNT = 10;
	
	public void setPagingInfo(int page, int count) {
		if(page > 0) {
			this.page = page;
		}
		this.count = count;
		this.endRow = page * ROW_COUNT;
		this.startRow = this.endRow - 9;
		this.startPage = ((page -1) / ROW_COUNT) * ROW_COUNT + 1;
		this.endPage = startPage + 4;
		
		this.totalPage = (int)Math.ceil((float)count / ROW_COUNT); // ceil:올림 vs floor:내림
		if(this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
 		}
	}
	
	
	public void setPage(int page) {
		this.page = page;
	}
	
}
