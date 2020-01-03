package com.java.guestdelluna.dto;

import java.util.Date;

public class NewHouseResDto {
	
	private int reserveCode ;
	private int memberCode ;
	private Date reserveDate ;
	private String houseName ;
	private String state ;
	private int payment;
	private int houseCode; 
	
	public NewHouseResDto() {}

	public NewHouseResDto(int reserveCode, int memberCode, Date reserveDate, String houseName, String state,
			int payment, int houseCode) {
	
		this.reserveCode = reserveCode;
		this.memberCode = memberCode;
		this.reserveDate = reserveDate;
		this.houseName = houseName;
		this.state = state;
		this.payment = payment;
		this.houseCode = houseCode;
	}

	@Override
	public String toString() {
		return "NewHouseResDto [reserveCode=" + reserveCode + ", memberCode=" + memberCode + ", reserveDate="
				+ reserveDate + ", houseName=" + houseName + ", state=" + state + ", payment=" + payment
				+ ", houseCode=" + houseCode + "]";
	}

	
	public int getHouseCode() {
		return houseCode;
	}

	public void setHouseCode(int houseCode) {
		this.houseCode = houseCode;
	}

	public int getReserveCode() {
		return reserveCode;
	}

	public void setReserveCode(int reserveCode) {
		this.reserveCode = reserveCode;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public Date getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
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

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

}
