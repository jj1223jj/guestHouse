package com.java.guestdelluna.dto;

import java.util.Date;

public class MyHouseReviewList {
	private String houseName;
	private String mainImgName;
	private String revContent;
	private Date revDate;
	
	public MyHouseReviewList() {
		
	}

	public MyHouseReviewList(String houseName, String mainImgName, String revContent, Date revDate) {
		this.houseName = houseName;
		this.mainImgName = mainImgName;
		this.revContent = revContent;
		this.revDate = revDate;
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

	public String getRevContent() {
		return revContent;
	}

	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}

	public Date getRevDate() {
		return revDate;
	}

	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}

	@Override
	public String toString() {
		return "MyHouseReviewList [houseName=" + houseName + ", mainImgName=" + mainImgName + ", revContent="
				+ revContent + ", revDate=" + revDate + "]";
	}

	
	
}
