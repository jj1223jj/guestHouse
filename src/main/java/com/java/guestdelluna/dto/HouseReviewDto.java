package com.java.guestdelluna.dto;

import java.util.Date;

public class HouseReviewDto {

	private int reserveCode;
	
	private int memberCode;
	
	private Date revDate;
	
	private String revContent ;
	
	private int revRate	;
	
	public HouseReviewDto() {}

	public HouseReviewDto(int reserveCode, int memberCode, Date revDate, String revContent, int revRate) {
		
		this.reserveCode = reserveCode;
		this.memberCode = memberCode;
		this.revDate = revDate;
		this.revContent = revContent;
		this.revRate = revRate;
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

	public Date getRevDate() {
		return revDate;
	}

	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}

	public String getRevContent() {
		return revContent;
	}

	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}

	public int getRevRate() {
		return revRate;
	}

	public void setRevRate(int revRate) {
		this.revRate = revRate;
	}

	@Override
	public String toString() {
		return "ReviewDto [reserveCode=" + reserveCode + ", memberCode=" + memberCode + ", revDate=" + revDate
				+ ", revContent=" + revContent + ", revRate=" + revRate + "]";
	}
	
	
}
