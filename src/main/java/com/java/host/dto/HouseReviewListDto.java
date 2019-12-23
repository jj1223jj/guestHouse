package com.java.host.dto;

import java.util.Date;

public class HouseReviewListDto {
	private String houseName;
	private String mainImgName;
	private String revContent;
	private int revRate;
	private Date revDate;
	private String memberImgName;
	private String memberName;
	
	public HouseReviewListDto() {
		
	}

	public HouseReviewListDto(String houseName, String mainImgName, String revContent, int revRate, Date revDate,
			String memberImgName, String memberName) {
		this.houseName = houseName;
		this.mainImgName = mainImgName;
		this.revContent = revContent;
		this.revRate = revRate;
		this.revDate = revDate;
		this.memberImgName = memberImgName;
		this.memberName = memberName;
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
		return "HouseReviewListDto [houseName=" + houseName + ", mainImgName=" + mainImgName + ", revContent="
				+ revContent + ", revRate=" + revRate + ", revDate=" + revDate + ", memberImgName=" + memberImgName
				+ ", memberName=" + memberName + "]";
	}
	
	
}
