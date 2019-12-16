package com.java.file.dto;

public class FileDto {
	private int fileCode;
	private String fileName;
	private String filePath;
	private long fileSize;
	private String exCode;
	private int houseCode;
	
	public FileDto() {
		
	}

	public FileDto(int fileCode, String fileName, String filePath, long fileSize, String exCode, int houseCode) {
		this.fileCode = fileCode;
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.exCode = exCode;
		this.houseCode = houseCode;
	}

	public int getFileCode() {
		return fileCode;
	}

	public void setFileCode(int fileCode) {
		this.fileCode = fileCode;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getExCode() {
		return exCode;
	}

	public void setExCode(String exCode) {
		this.exCode = exCode;
	}

	public int getHouseCode() {
		return houseCode;
	}

	public void setHouseCode(int houseCode) {
		this.houseCode = houseCode;
	}

	@Override
	public String toString() {
		return "FileDto [fileCode=" + fileCode + ", fileName=" + fileName + ", filePath=" + filePath + ", fileSize="
				+ fileSize + ", exCode=" + exCode + ", houseCode=" + houseCode + "]";
	}
	
	
}
