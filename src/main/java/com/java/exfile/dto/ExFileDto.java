package com.java.exfile.dto;

public class ExFileDto {
   private int fileCode;
   private int exCode;
   private String fileName;
   private String filePath;
   private long fileSize;
   private String mainImgName;
   
   public ExFileDto() {
      
   }

public ExFileDto(int fileCode, int exCode, String fileName, String filePath, long fileSize, String mainImgName) {
	
	this.fileCode = fileCode;
	this.exCode = exCode;
	this.fileName = fileName;
	this.filePath = filePath;
	this.fileSize = fileSize;
	this.mainImgName = mainImgName;
}

public int getFileCode() {
	return fileCode;
}

public void setFileCode(int fileCode) {
	this.fileCode = fileCode;
}

public int getExCode() {
	return exCode;
}

public void setExCode(int exCode) {
	this.exCode = exCode;
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

public String getMainImgName() {
	return mainImgName;
}

public void setMainImgName(String mainImgName) {
	this.mainImgName = mainImgName;
}

@Override
public String toString() {
	return "ExFileDto [fileCode=" + fileCode + ", exCode=" + exCode + ", fileName=" + fileName + ", filePath="
			+ filePath + ", fileSize=" + fileSize + ", mainImgName=" + mainImgName + "]";
}


   
}