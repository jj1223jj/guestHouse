package com.java.guestdelluna.dto;

import java.util.Date;

public class ExpReservationDto {

	private int exReserveCode ;
	private int exPeople;	
	private Date exDate ;
	private int exPayment ;
	private int memberCode;
	private int exCode ;
	private Date exRegDate ;
	private String state ;

	
	public ExpReservationDto() {}


	public ExpReservationDto(int exReserveCode, int exPeople, Date exDate, int exPayment, int memberCode, int exCode,
			Date exRegDate, String state) {
		
		this.exReserveCode = exReserveCode;
		this.exPeople = exPeople;
		this.exDate = exDate;
		this.exPayment = exPayment;
		this.memberCode = memberCode;
		this.exCode = exCode;
		this.exRegDate = exRegDate;
		this.state = state;
	}


	@Override
	public String toString() {
		return "ExpReservationDto [exReserveCode=" + exReserveCode + ", exPeople=" + exPeople + ", exDate=" + exDate
				+ ", exPayment=" + exPayment + ", memberCode=" + memberCode + ", exCode=" + exCode + ", exRegDate="
				+ exRegDate + ", state=" + state + "]";
	}


	public int getExReserveCode() {
		return exReserveCode;
	}


	public void setExReserveCode(int exReserveCode) {
		this.exReserveCode = exReserveCode;
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


	public int getExCode() {
		return exCode;
	}


	public void setExCode(int exCode) {
		this.exCode = exCode;
	}


	public Date getExRegDate() {
		return exRegDate;
	}


	public void setExRegDate(Date exRegDate) {
		this.exRegDate = exRegDate;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}
	
	
	
}
