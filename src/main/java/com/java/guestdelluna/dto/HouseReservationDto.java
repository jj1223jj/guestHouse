package com.java.guestdelluna.dto;

import java.util.Date;

public class HouseReservationDto {

	private int reserveCode ;
	private int houseCode ;
	private String roomName ;
	private int memberCode ;
	private int people ; //사람수
	private Date reserveDate ;
	
	public HouseReservationDto() {}

	public HouseReservationDto(int reserveCode, int houseCode, String roomName, int memberCode, int people,
			Date reserveDate) {
		
		this.reserveCode = reserveCode;
		this.houseCode = houseCode;
		this.roomName = roomName;
		this.memberCode = memberCode;
		this.people = people;
		this.reserveDate = reserveDate;
	}

	@Override
	public String toString() {
		return "HouseReservation [reserveCode=" + reserveCode + ", houseCode=" + houseCode + ", roomName=" + roomName
				+ ", memberCode=" + memberCode + ", people=" + people + ", reserveDate=" + reserveDate + "]";
	}

	public int getReserveCode() {
		return reserveCode;
	}

	public void setReserveCode(int reserveCode) {
		this.reserveCode = reserveCode;
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

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public Date getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}
		
}
