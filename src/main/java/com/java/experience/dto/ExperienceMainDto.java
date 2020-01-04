package com.java.experience.dto;

import java.util.List;

import com.java.exfile.dto.ExFileDto;

public class ExperienceMainDto extends ExperienceDto {
	
	 private List<ExFileDto> exFileList;
	 private String exName;
	 private int exCode;
	 private int exPrice;
	 private int revRate;
	 private int revCount;
	 
	 public ExperienceMainDto() {}

	public ExperienceMainDto(List<ExFileDto> exFileList, String exName, int exCode, int exPrice, int revRate,
			int revCount) {
	
		this.exFileList = exFileList;
		this.exName = exName;
		this.exCode = exCode;
		this.exPrice = exPrice;
		this.revRate = revRate;
		this.revCount = revCount;
	}

	public List<ExFileDto> getExFileList() {
		return exFileList;
	}

	public void setExFileList(List<ExFileDto> exFileList) {
		this.exFileList = exFileList;
	}

	public String getExName() {
		return exName;
	}

	public void setExName(String exName) {
		this.exName = exName;
	}

	public int getExCode() {
		return exCode;
	}

	public void setExCode(int exCode) {
		this.exCode = exCode;
	}

	public int getExPrice() {
		return exPrice;
	}

	public void setExPrice(int exPrice) {
		this.exPrice = exPrice;
	}

	public int getRevRate() {
		return revRate;
	}

	public void setRevRate(int revRate) {
		this.revRate = revRate;
	}

	public int getRevCount() {
		return revCount;
	}

	public void setRevCount(int revCount) {
		this.revCount = revCount;
	}

	@Override
	public String toString() {
		return "ExperienceMainDto [exFileList=" + exFileList + ", exName=" + exName + ", exCode=" + exCode
				+ ", exPrice=" + exPrice + ", revRate=" + revRate + ", revCount=" + revCount + "]";
	}

	
	 

}
