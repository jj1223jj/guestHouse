package com.java.host.dto;

import java.util.List;

import com.java.file.dto.FileDto;

public class HostImgDto extends HostDto {
    private List<FileDto> fileList;

	public HostImgDto() {}
	public HostImgDto(List<FileDto> fileList) {
		this.fileList = fileList;
	}

	public List<FileDto> getFileList() {
		return fileList;
	}
	public void setFileList(List<FileDto> fileList) {
		this.fileList = fileList;
	}
	@Override
	public String toString() {
		return "HostImgDto [fileList=" + fileList + ", toString()=" + super.toString() + "]";
	}
	
}