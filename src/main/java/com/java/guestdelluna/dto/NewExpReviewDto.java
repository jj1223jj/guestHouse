package com.java.guestdelluna.dto;

import java.util.Date;

public class NewExpReviewDto {
	
	private int exReserveCode ;
	private Date revDate ;
	private String revContent ;
	private String exName ;
	private String mainImgName;
	private int exCode ;
	
	public NewExpReviewDto() {}

	public NewExpReviewDto(int exReserveCode, Date revDate, String revContent, String exName, String mainImgName,
			int exCode) {
	
		this.exReserveCode = exReserveCode;
		this.revDate = revDate;
		this.revContent = revContent;
		this.exName = exName;
		this.mainImgName = mainImgName;
		this.exCode = exCode;
	}

	@Override
	public String toString() {
		return "NewExpReviewDto [exReserveCode=" + exReserveCode + ", revDate=" + revDate + ", revContent=" + revContent
				+ ", exName=" + exName + ", mainImgName=" + mainImgName + ", exCode=" + exCode + "]";
	}

	public int getExReserveCode() {
		return exReserveCode;
	}

	public void setExReserveCode(int exReserveCode) {
		this.exReserveCode = exReserveCode;
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

	public String getExName() {
		return exName;
	}

	public void setExName(String exName) {
		this.exName = exName;
	}

	public String getMainImgName() {
		return mainImgName;
	}

	public void setMainImgName(String mainImgName) {
		this.mainImgName = mainImgName;
	}

	public int getExCode() {
		return exCode;
	}

	public void setExCode(int exCode) {
		this.exCode = exCode;
	}
	
	
}
