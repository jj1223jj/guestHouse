package com.java.guestdelluna.dto;

import java.util.Date;

public class NewExpResDto {
	
	private int exReserveCode;
	private int memberCode ;
	private String exName ;
	private Date reserveDate ;
	private String state;
	private int exPayment ;
	private int exCode ;
	
	public NewExpResDto() {}

	public NewExpResDto(int exReserveCode, int memberCode, String exName, Date reserveDate, String state, int exPayment,
			int exCode) {
		
		this.exReserveCode = exReserveCode;
		this.memberCode = memberCode;
		this.exName = exName;
		this.reserveDate = reserveDate;
		this.state = state;
		this.exPayment = exPayment;
		this.exCode = exCode;
	}

	@Override
	public String toString() {
		return "NewExpResDto [exReserveCode=" + exReserveCode + ", memberCode=" + memberCode + ", exName=" + exName
				+ ", reserveDate=" + reserveDate + ", state=" + state + ", exPayment=" + exPayment + ", exCode="
				+ exCode + "]";
	}

	public int getExCode() {
		return exCode;
	}

	public void setExCode(int exCode) {
		this.exCode = exCode;
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

	public String getExName() {
		return exName;
	}

	public void setExName(String exName) {
		this.exName = exName;
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

	public int getExPayment() {
		return exPayment;
	}

	public void setExPayment(int exPayment) {
		this.exPayment = exPayment;
	}

	
}
