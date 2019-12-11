package com.java.guestdelluna.dto;

public class DellunaZzimDto {

	private int wishCode ;	//찜번호가 sequence형태로 된다
	private int userCode ;
	private int houseCode ; 
	private String roomName;
	
	public DellunaZzimDto() {}

	public int getWishCode() {
		return wishCode;
	}

	public void setWishCode(int wishCode) {
		this.wishCode = wishCode;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public int getHouseCode() {
		return houseCode;
	}

	public void setHouseCode(int houseCode) {
		this.houseCode = houseCode;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public DellunaZzimDto(int wishCode, int userCode, int houseCode, String roomName) {
	
		this.wishCode = wishCode;
		this.userCode = userCode;
		this.houseCode = houseCode;
		this.roomName = roomName;
	}

	@Override
	public String toString() {
		return "DellunaZzimDto [wishCode=" + wishCode + ", userCode=" + userCode + ", houseCode=" + houseCode
				+ ", roomName=" + roomName + "]";
	}
	
	
	
}
