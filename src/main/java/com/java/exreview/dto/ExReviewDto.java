package com.java.exreview.dto;

import java.util.Date;

public class ExReviewDto {
	private int exReservationCode;
	private int memberCode;
	private Date revDate;
	private String revContent;
	private int revRate;
	
	public ExReviewDto(int exReservationCode, int memberCode, Date revDate, String revContent, int revRate) {
		
		this.exReservationCode = exReservationCode;
		this.memberCode = memberCode;
		this.revDate = revDate;
		this.revContent = revContent;
		this.revRate = revRate;
	}

	public int getExReservationCode() {
		return exReservationCode;
	}

	public void setExReservationCode(int exReservationCode) {
		this.exReservationCode = exReservationCode;
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
		return "ExReviewDto [exReservationCode=" + exReservationCode + ", memberCode=" + memberCode + ", revDate="
				+ revDate + ", revContent=" + revContent + ", revRate=" + revRate + "]";
	}
	
	
	
	
}
