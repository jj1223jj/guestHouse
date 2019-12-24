package com.java.guestdelluna.dto;

import java.util.Date;

public class MyExReviewList {
	private String exName;
	private String mainImgName;
	private String revContent;
	private Date revDate;
	
	public MyExReviewList() {
		
	}

	public MyExReviewList(String exName, String mainImgName, String revContent, Date revDate) {
		this.exName = exName;
		this.mainImgName = mainImgName;
		this.revContent = revContent;
		this.revDate = revDate;
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
		return "MyExReviewList [exName=" + exName + ", mainImgName=" + mainImgName + ", revContent=" + revContent
				+ ", revDate=" + revDate + "]";
	}
	
	
}
