package com.kh.project.exception;

@SuppressWarnings("serial")
public class ReservationUpdateException extends RuntimeException {
	@Override
	public String getMessage() {
		return "reservation update error";
	}
}
