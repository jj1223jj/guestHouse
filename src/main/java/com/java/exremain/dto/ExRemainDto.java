package com.java.exremain.dto;

import java.util.Date;

public class ExRemainDto {

	private Date resDate;
	private int exPeople;
	private int exCode;
	
	public ExRemainDto() {}
	
	public ExRemainDto(Date resDate, int exPeople, int exCode) {
		
		this.resDate = resDate;
		this.exPeople = exPeople;
		this.exCode = exCode;
	}

	public Date getResDate() {
		return resDate;
	}

	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}

	public int getExPeople() {
		return exPeople;
	}

	public void setExPeople(int exPeople) {
		this.exPeople = exPeople;
	}

	public int getExCode() {
		return exCode;
	}

	public void setExCode(int exCode) {
		this.exCode = exCode;
	}

	@Override
	public String toString() {
		return "ExRemainDto [resDate=" + resDate + ", exPeople=" + exPeople + ", exCode=" + exCode + "]";
	}
	
	
}
