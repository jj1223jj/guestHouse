package com.java.guestdelluna.dto;

public class NewHouseZzimDto {
	private int houseCode ;
	private String houseName ;
	private int memberCode ;
	
	public NewHouseZzimDto() {}

	public NewHouseZzimDto(int houseCode, String houseName, int memberCode) {
	
		this.houseCode = houseCode;
		this.houseName = houseName;
		this.memberCode = memberCode;
	}

	@Override
	public String toString() {
		return "NewHouseZzimDto [houseCode=" + houseCode + ", houseName=" + houseName + ", memberCode=" + memberCode
				+ "]";
	}

	public int getHouseCode() {
		return houseCode;
	}

	public void setHouseCode(int houseCode) {
		this.houseCode = houseCode;
	}

	public String getHouseName() {
		return houseName;
	}

	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	
	
}
