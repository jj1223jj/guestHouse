package com.java.host.dto;

import java.util.List;

import com.java.file.dto.FileDto;

public class HostImgDto extends HostDto {
    private List<FileDto> fileList;
    private int revCount;
    private String revRate="0";

	public HostImgDto() {}
	public HostImgDto(List<FileDto> fileList) {
		this.fileList = fileList;
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
	public List<FileDto> getFileList() {
		return fileList;
	}
	public void setFileList(List<FileDto> fileList) {
		this.fileList = fileList;
	}
	@Override
	public String toString() {
		return "HostImgDto [revRate=" + revRate + ", revCount"+ revCount +", fileList=" + fileList + ", toString()=" + super.toString() + "]";
	}
	
}