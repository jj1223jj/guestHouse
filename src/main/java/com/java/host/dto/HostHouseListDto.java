package com.java.host.dto;

public class HostHouseListDto {
	private String houseName;
	private String mainImgName;
	private int revRate;
	private int reviewCount;
	
	public HostHouseListDto() {
		
	}

	public HostHouseListDto(String houseName, String mainImgName, int revRate, int reviewCount) {
		this.houseName = houseName;
		this.mainImgName = mainImgName;
		this.revRate = revRate;
		this.reviewCount = reviewCount;
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
		return "HostHouseList [houseName=" + houseName + ", mainImgName=" + mainImgName + ", revRate=" + revRate
				+ ", reviewCount=" + reviewCount + "]";
	}
	
	
	
}
