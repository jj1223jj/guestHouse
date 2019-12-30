package com.java.experience.dto;

import java.util.List;

import com.java.exfile.dto.ExFileDto;

public class ExperienceImgDto extends ExperienceDto {
    private List<ExFileDto> exFileList;
    private int revCount;
    private String revRate="0";
    private String zzimed;
	private String latLng;


	public ExperienceImgDto() {}
	public ExperienceImgDto(List<ExFileDto> exFileList) {
		this.exFileList = exFileList;
	}

	public String getRevRate() {
		return revRate;
	}
	public void setRevRate(String revRate) {
		this.revRate = revRate;
	}
	public int getRevCount() {
		return revCount;
	}
	public void setRevCount(int revCount) {
		this.revCount = revCount;
	}
	public String getZzimed() {
		return zzimed;
	}
	public void setZzimed(String zzimed) {
		this.zzimed = zzimed;
	}
	public String getLatLng() {
		return latLng;
	}
	public void setLatLng(String latLng) {
		this.latLng = latLng;
	}
	public List<ExFileDto> getExFileList() {
		return exFileList;
	}
	public void setExFileList(List<ExFileDto> exFileList) {
		this.exFileList = exFileList;
	}
	@Override
	public String toString() {
		return "HostImgDto [revRate=" + revRate + ", revCount" + revCount + ", zzimed=" + zzimed + ", exFileList=" + exFileList + ", latLng=" + latLng + ", toString()=" + super.toString() + "]";
	}
	
}