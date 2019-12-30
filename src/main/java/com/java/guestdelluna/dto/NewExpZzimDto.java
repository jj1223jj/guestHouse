package com.java.guestdelluna.dto;

import java.util.Date;

public class NewExpZzimDto {

	private int exCode ;
	private String exName ;
	private int membercode ;
	private Date exStartDate ;
	
	public NewExpZzimDto() {}

	public NewExpZzimDto(int exCode, String exName, int membercode, Date exStartDate) {
		
		this.exCode = exCode;
		this.exName = exName;
		this.membercode = membercode;
		this.exStartDate = exStartDate;
	}

	@Override
	public String toString() {
		return "NewExpZzimDto [exCode=" + exCode + ", exName=" + exName + ", membercode=" + membercode
				+ ", exStartDate=" + exStartDate + "]";
	}

	public int getExCode() {
		return exCode;
	}

	public void setExCode(int exCode) {
		this.exCode = exCode;
	}

	public String getExName() {
		return exName;
	}

	public void setExName(String exName) {
		this.exName = exName;
	}

	public int getMembercode() {
		return membercode;
	}

	public void setMembercode(int membercode) {
		this.membercode = membercode;
	}

	public Date getExStartDate() {
		return exStartDate;
	}

	public void setExStartDate(Date exStartDate) {
		this.exStartDate = exStartDate;
	}

	
}
