package com.java.guestdelluna.dto;

public class ExpZzimDto {

	private int exCode ;
	private int memberCode;
	
	public ExpZzimDto() {}

	public ExpZzimDto(int exCode, int memberCode) {

		this.exCode = exCode;
		this.memberCode = memberCode;
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

	@Override
	public String toString() {
		return "ExpZzimDto [exCode=" + exCode + ", memberCode=" + memberCode + "]";
	}
	
	
	
}
