package com.java.guestdelluna.dto;

import java.util.Date;

public class NewExpReserveDto {

	private int exReserveCode ;
	private String exName ;
	private String state ;
	private Date exDate ;
	
	public NewExpReserveDto() {}

	public NewExpReserveDto(int exReserveCode, String exName, String state, Date exDate) {

		this.exReserveCode = exReserveCode;
		this.exName = exName;
		this.state = state;
		this.exDate = exDate;
	}

	@Override
	public String toString() {
		return "NewExpReserveDto [exReserveCode=" + exReserveCode + ", exName=" + exName + ", state=" + state
				+ ", exDate=" + exDate + "]";
	}

	public int getExReserveCode() {
		return exReserveCode;
	}

	public void setExReserveCode(int exReserveCode) {
		this.exReserveCode = exReserveCode;
	}

	public String getExName() {
		return exName;
	}

	public void setExName(String exName) {
		this.exName = exName;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Date getExDate() {
		return exDate;
	}

	public void setExDate(Date exDate) {
		this.exDate = exDate;
	}
	
}
