package com.java.file.dto;

public class FileDto {
	private int fileCode;
	private String fileName;
	private String filePath;
	private long fileSize;
	private int houseCode;
	private String mainImgName;
	
	public FileDto() {
		
	}

	public FileDto(int fileCode, String fileName, String filePath, long fileSize, int houseCode, String mainImgName) {

		this.fileCode = fileCode;
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.houseCode = houseCode;
		this.mainImgName = mainImgName;
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

	public int getHouseCode() {
		return houseCode;
	}

	public void setHouseCode(int houseCode) {
		this.houseCode = houseCode;
	}
	
	public String getMainImgName() {
		return mainImgName;
	}

	public void setmainImgName(String mainImgName) {
		this.mainImgName = mainImgName;
	}

	@Override
	public String toString() {
		return "FileDto [fileCode=" + fileCode + ", fileName=" + fileName + ", filePath=" + filePath + ", fileSize="
				+ fileSize + ", houseCode=" + houseCode + ", mainImgName=" + mainImgName + "]";
	}
	
	
}

