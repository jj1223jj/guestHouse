package com.java.guestdelluna.dto;

import java.util.Date;

public class NewHouseReviewDto {

	private int reserveCode ;
	private Date revDate ;
	private String revContent ;
	private String houseName ;
	private String mainImgName;
	private int houseCode ;
	
	public NewHouseReviewDto() {}

	public NewHouseReviewDto(int reserveCode, Date revDate, String revContent, String houseName, String mainImgName,
			int houseCode) {
	
		this.reserveCode = reserveCode;
		this.revDate = revDate;
		this.revContent = revContent;
		this.houseName = houseName;
		this.mainImgName = mainImgName;
		this.houseCode = houseCode;
	}

	@Override
	public String toString() {
		return "NewHouseReviewDto [reserveCode=" + reserveCode + ", revDate=" + revDate + ", revContent=" + revContent
				+ ", houseName=" + houseName + ", mainImgName=" + mainImgName + ", houseCode=" + houseCode + "]";
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

	public String getHouseName() {
		return houseName;
	}

	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}

	public String getMainImgName() {
		return mainImgName;
	}

	public void setMainImgName(String mainImgName) {
		this.mainImgName = mainImgName;
	}
	
}
