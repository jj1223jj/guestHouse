package com.java.guestdelluna.dto;

import java.util.Date;

public class ExpReservationDto {

	private int reserveCode ;
	private int exCode ;
	private int memberCode ;
	private int exPeople ;
	private Date exDate ;
	
	public ExpReservationDto() {}

	public ExpReservationDto(int reserveCode, int exCode, int memberCode, int exPeople, Date exDate) {
	
		this.reserveCode = reserveCode;
		this.exCode = exCode;
		this.memberCode = memberCode;
		this.exPeople = exPeople;
		this.exDate = exDate;
	}

	public int getReserveCode() {
		return reserveCode;
	}

	public void setReserveCode(int reserveCode) {
		this.reserveCode = reserveCode;
	}

	public int getExCode() {
		return exCode;
	}

	public void setExCode(int exCode) {
		this.exCode = exCode;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public int getExPeople() {
		return exPeople;
	}

	public void setExPeople(int exPeople) {
		this.exPeople = exPeople;
	}

	public Date getExDate() {
		return exDate;
	}

	public void setExDate(Date exDate) {
		this.exDate = exDate;
	}

	@Override
	public String toString() {
		return "ExpReservation [reserveCode=" + reserveCode + ", exCode=" + exCode + ", memberCode=" + memberCode
				+ ", exPeople=" + exPeople + ", exDate=" + exDate + "]";
	}
	
}
