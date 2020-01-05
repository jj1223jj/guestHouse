package com.java.experience.dto;

import java.util.List;

import com.java.file.dto.FileDto;

public class GuestHouseMainDto extends ExperienceDto {
	
	 private List<FileDto> fileList;
	 private String houseName;
	 private int houseCode;
	 private int price;
	 private int revRate;
	 private int revCount;
	 
	 
	 public GuestHouseMainDto() {}


	public GuestHouseMainDto(List<FileDto> fileList, String houseName, int houseCode, int price, int revRate,
			int revCount) {
		
		this.fileList = fileList;
		this.houseName = houseName;
		this.houseCode = houseCode;
		this.price = price;
		this.revRate = revRate;
		this.revCount = revCount;
	}


	public List<FileDto> getFileList() {
		return fileList;
	}


	public void setFileList(List<FileDto> fileList) {
		this.fileList = fileList;
	}


	public String getHouseName() {
		return houseName;
	}


	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}


	public int getHouseCode() {
		return houseCode;
	}


	public void setHouseCode(int houseCode) {
		this.houseCode = houseCode;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
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
		return "GuestHouseMainDto [fileList=" + fileList + ", houseName=" + houseName + ", houseCode=" + houseCode
				+ ", price=" + price + ", revRate=" + revRate + ", revCount=" + revCount + "]";
	}
	 
	
	 
}
