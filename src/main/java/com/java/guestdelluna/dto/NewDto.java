package com.java.guestdelluna.dto;

public class NewDto extends HouseReservationDto  {
	
	private int houseCode ;

	public int getHouseCode() {
		return houseCode;
	}

	public void setHouseCode(int houseCode) {
		this.houseCode = houseCode;
	}

	@Override
	public String toString() {
		return "NewDto [houseCode=" + houseCode + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
	
}
