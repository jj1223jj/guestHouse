package com.java.exreserve.dto;

import java.util.Date;

public class ExReserveDto {

	private int exReserveCode;
	private int memberCode;
	private int exCode;
	private int exPeople;
	private Date reserveDate;
	private int exPayment;
	private String state;
	private Date exDate;
	
	public ExReserveDto() {}
	
	public ExReserveDto(int exReserveCode, int memberCode, int exCode, int exPeople, Date reserveDate, int exPayment,
			String state, Date exDate) {
		
		this.exReserveCode = exReserveCode;
		this.memberCode = memberCode;
		this.exCode = exCode;
		this.exPeople = exPeople;
		this.reserveDate = reserveDate;
		this.exPayment = exPayment;
		this.state = state;
		this.exDate = exDate;
	}

	public int getExReserveCode() {
		return exReserveCode;
	}

	public void setExReserveCode(int exReserveCode) {
		this.exReserveCode = exReserveCode;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public int getExCode() {
		return exCode;
	}

	public void setExCode(int exCode) {
		this.exCode = exCode;
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

	public int getExPayment() {
		return exPayment;
	}

	public void setExPayment(int exPayment) {
		this.exPayment = exPayment;
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

	@Override
	public String toString() {
		return "ExReserveDto [exReserveCode=" + exReserveCode + ", memberCode=" + memberCode + ", exCode=" + exCode
				+ ", exPeople=" + exPeople + ", reserveDate=" + reserveDate + ", exPayment=" + exPayment + ", state="
				+ state + ", exDate=" + exDate + "]";
	}
	
	
	
}
