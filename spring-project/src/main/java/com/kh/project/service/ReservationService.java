package com.kh.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.project.dao.CinemaDao;
import com.kh.project.dao.ReservationDao;
import com.kh.project.vo.ReservationVo;
import com.kh.project.vo.SeatDto;
import com.kh.project.exception.ReservationUpdateException;

@Service
public class ReservationService {
	
	@Autowired
	private CinemaDao dao;
	
	@Autowired
	private ReservationDao dao2;
	
	@Transactional
	public boolean reservation(ReservationVo vo){
		try {
			boolean result = dao2.reservation(vo); // 예매 insert
			String seats = vo.getRe_seats(); // form에서 보낸 좌석정보 받기
			String[] arrSeats = seats.split(", "); // 좌석정보 분리
			
			List<SeatDto> list = new ArrayList<>(); // dto를 담을 List 생성
			for(String str : arrSeats) {
				
				int rowIndex = str.indexOf("열"); // "열" 글자의 index
				String strRow = str.substring(0, rowIndex); // 열 정보(row) 
				
				int colIndex = str.indexOf("번"); // "번" 글자의 index
				String strCol = str.substring(rowIndex+2, colIndex); // 행 정보(col) 
				
				int col = Integer.parseInt(strCol);
				int row = Integer.parseInt(strRow);
				
				SeatDto dto = new SeatDto(row, col); // dto 생성
				list.add(dto);
				
			}
			boolean result2 = dao.updateCinema(vo, list); // 극장 테이블 변경 update
			System.out.println("result1 : "+ result);
			System.out.println("result2 : "+ result2);
			if (result && result2) {
				return true;
			} else {
				throw new com.kh.project.exception.ReservationUpdateException();
			}
		} catch (ReservationUpdateException e) {
			return false;
		}
		
		
		
	}
}
