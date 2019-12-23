package com.java.host.dto;

import java.util.Date;

public class ExReviewListDto {
	private String exName;
	private String mainImgName;
	private String revContent;
	private int revRate;
	private Date revDate;
	private String memberImgName;
	private String memberName;
	
	public ExReviewListDto() {
		
	}

	public ExReviewListDto(String exName, String mainImgName, String revContent, int revRate, Date revDate,
			String memberImgName, String memberName) {
		this.exName = exName;
		this.mainImgName = mainImgName;
		this.revContent = revContent;
		this.revRate = revRate;
		this.revDate = revDate;
		this.memberImgName = memberImgName;
		this.memberName = memberName;
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

	public int getRevRate() {
		return revRate;
	}

	public void setRevRate(int revRate) {
		this.revRate = revRate;
	}

	public Date getRevDate() {
		return revDate;
	}

	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}

	public String getMemberImgName() {
		return memberImgName;
	}

	public void setMemberImgName(String memberImgName) {
		this.memberImgName = memberImgName;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		return "ExReviewListDto [exName=" + exName + ", mainImgName=" + mainImgName + ", revContent=" + revContent
				+ ", revRate=" + revRate + ", revDate=" + revDate + ", memberImgName=" + memberImgName + ", memberName="
				+ memberName + "]";
	}
	
	
}
