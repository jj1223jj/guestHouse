package com.java.guestReserve.dto;

import java.util.Date;

public class RemainDto {
	private Date resDate;
	private int people;
	private int houseCode;
	
	public RemainDto() {};
	
	public RemainDto(Date resDate, int people, int houseCode) {
		super();
		this.resDate = resDate;
		this.people = people;
		this.houseCode = houseCode;
	}

	public Date getResDate() {
		return resDate;
	}

	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public int getHouseCode() {
		return houseCode;
	}

	public void setHouseCode(int houseCode) {
		this.houseCode = houseCode;
	}

	@Override
	public String toString() {
		return "RemainDto [resDate=" + resDate + ", people=" + people + ", houseCode=" + houseCode + "]";
	}
	
}
