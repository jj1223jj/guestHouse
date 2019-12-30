package com.java.guestReserve.dto;

import java.util.Date;

public class GHouseReviewListDto {
	private int reserveCode;
	private int memberCode;
	private Date revDate;
	private String revContent ;
	private int revRate	;
	private String email;
	
	public GHouseReviewListDto() {}

	public GHouseReviewListDto(int reserveCode, int memberCode, Date revDate, String revContent, int revRate,
			String email) {
		super();
		this.reserveCode = reserveCode;
		this.memberCode = memberCode;
		this.revDate = revDate;
		this.revContent = revContent;
		this.revRate = revRate;
		this.email = email;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "HouseReviewListDto [reserveCode=" + reserveCode + ", memberCode=" + memberCode + ", revDate=" + revDate
				+ ", revContent=" + revContent + ", revRate=" + revRate + ", email=" + email + "]";
	}
	
	
}
