package com.java.guestReserve.dto;

import java.util.Date;

public class GuestReserveDto {
	private int reserveCode;
	private int memberCode;
	private int houseCode;
	private String houseName;
	private Date reserveDate;
	private Date checkIn;
	private Date checkOut;
	private String state;
	
	public GuestReserveDto() {}
	
	public GuestReserveDto(int reserveCode, int memberCode, int houseCode, String houseName, Date reserveDate,
			Date checkIn, Date checkOut, String state) {
		this.reserveCode = reserveCode;
		this.memberCode = memberCode;
		this.houseCode = houseCode;
		this.houseName = houseName;
		this.reserveDate = reserveDate;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.state = state;
	}

	public int getReserveCode() {
		return reserveCode;
	}

	public void setReserveCode(int reserveCode) {
		this.reserveCode = reserveCode;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
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

	public Date getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}

	public Date getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}

	public Date getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "GuestReserveDto [reserveCode=" + reserveCode + ", memberCode=" + memberCode + ", houseCode=" + houseCode
				+ ", houseName=" + houseName + ", reserveDate=" + reserveDate + ", checkIn=" + checkIn + ", checkOut="
				+ checkOut + ", state=" + state + "]";
	}
	
}