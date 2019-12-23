package com.java.host.dto;

public class HostExListDto {
	private String exName;
	private String mainImgName;
	private int revRate;
	private int reviewCount;
	
	public HostExListDto() {
		
	}

	public HostExListDto(String exName, String mainImgName, int revRate, int reviewCount) {
		this.exName = exName;
		this.mainImgName = mainImgName;
		this.revRate = revRate;
		this.reviewCount = reviewCount;
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

	public int getRevRate() {
		return revRate;
	}

	public void setRevRate(int revRate) {
		this.revRate = revRate;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	@Override
	public String toString() {
		return "HostExListDto [exName=" + exName + ", mainImgName=" + mainImgName + ", revRate=" + revRate
				+ ", reviewCount=" + reviewCount + "]";
	}
	
	
}
