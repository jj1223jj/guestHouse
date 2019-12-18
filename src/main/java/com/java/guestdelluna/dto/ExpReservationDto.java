package com.java.guestdelluna.dto;

import java.util.Date;

public class ExpReservationDto {

	private int exReserveCode ;
	private int exCode ;
	private int exPayment ;
	private int memberCode;
	private int exPeople;
	private Date reserveDate ;
	private String state;
	
	public ExpReservationDto() {}

	public ExpReservationDto(int exReserveCode, int exCode, int exPayment, int memberCode, int exPeople,
			Date reserveDate, String state) {
	
		this.exReserveCode = exReserveCode;
		this.exCode = exCode;
		this.exPayment = exPayment;
		this.memberCode = memberCode;
		this.exPeople = exPeople;
		this.reserveDate = reserveDate;
		this.state = state;
	}

	@Override
	public String toString() {
		return "ExpReservationDto [exReserveCode=" + exReserveCode + ", exCode=" + exCode + ", exPayment=" + exPayment
				+ ", memberCode=" + memberCode + ", exPeople=" + exPeople + ", reserveDate=" + reserveDate + ", state="
				+ state + "]";
	}

	public int getExReserveCode() {
		return exReserveCode;
	}

	public void setExReserveCode(int exReserveCode) {
		this.exReserveCode = exReserveCode;
	}

	public int getExCode() {
		return exCode;
	}

	public void setExCode(int exCode) {
		this.exCode = exCode;
	}

	public int getExPayment() {
		return exPayment;
	}

	public void setExPayment(int exPayment) {
		this.exPayment = exPayment;
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

	public Date getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}


	
}
