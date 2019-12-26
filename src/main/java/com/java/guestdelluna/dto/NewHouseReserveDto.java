package com.java.guestdelluna.dto;

import java.util.Date;

public class NewHouseReserveDto {
	private int reserveCode ;
	private String houseName ;
	private String state ;
	private Date checkIn;
	private Date checkOut;
	
	public NewHouseReserveDto() {}

	public NewHouseReserveDto(int reserveCode, String houseName, String state, Date checkIn, Date checkOut) {
		
		this.reserveCode = reserveCode;
		this.houseName = houseName;
		this.state = state;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
	}

	@Override
	public String toString() {
		return "NewHouseReserveDto [reserveCode=" + reserveCode + ", houseName=" + houseName + ", state=" + state
				+ ", checkIn=" + checkIn + ", checkOut=" + checkOut + "]";
	}

	public int getReserveCode() {
		return reserveCode;
	}

	public void setReserveCode(int reserveCode) {
		this.reserveCode = reserveCode;
	}

	public String getHouseName() {
		return houseName;
	}

	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Date getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}

	public Date getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}


}
