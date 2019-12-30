package com.java.guestdelluna.dto;

import java.util.Date;

public class NewExpResDto {
	
	private int exReserveCode;
	private int memberCode ;
	private String exName ;
	private Date reserveDate ;
	private String state;
	
	public NewExpResDto() {}

	public NewExpResDto(int exReserveCode, int memberCode, String exName, Date reserveDate, String state) {
	
		this.exReserveCode = exReserveCode;
		this.memberCode = memberCode;
		this.exName = exName;
		this.reserveDate = reserveDate;
		this.state = state;
	}

	@Override
	public String toString() {
		return "NewExpResDto [exReserveCode=" + exReserveCode + ", memberCode=" + memberCode + ", exName=" + exName + ", reserveDate="
				+ reserveDate + ", state=" + state + "]";
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


	
}
