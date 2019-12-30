package com.java.exreview.dto;

import java.util.Date;


public class ExReviewListDto {
	private int exReserveCode;
	private int memberCode;
	private Date revDate;
	
	private String revContent;
	private int revRate;
	private String email;
	
	public ExReviewListDto() {}
	
	public ExReviewListDto(int exReserveCode, int memberCode, Date revDate, String revContent, int revRate,
			String email) {
		
		this.exReserveCode = exReserveCode;
		this.memberCode = memberCode;
		this.revDate = revDate;
		this.revContent = revContent;
		this.revRate = revRate;
		this.email = email;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "ExReviewListDto [exReserveCode=" + exReserveCode + ", memberCode=" + memberCode + ", revDate=" + revDate
				+ ", revContent=" + revContent + ", revRate=" + revRate + ", email=" + email + "]";
	}
	
}
