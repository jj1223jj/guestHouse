package com.java.guestReserve.dto;

import java.util.Date;

public class GuestReserveDto {
	private int reserveCode;
	private int memberCode;
	private int houseCode;
	private Date reserveDate;
	private Date checkIn;
	private Date checkOut;
	private String state;
	private int payment;
	private int people;
	
	public GuestReserveDto() {}
	

	public GuestReserveDto(int reserveCode, int memberCode, int houseCode, Date reserveDate,
			Date checkIn, Date checkOut, String state, int payment, int people) {
		super();

		this.reserveCode = reserveCode;
		this.memberCode = memberCode;
		this.houseCode = houseCode;
		this.reserveDate = reserveDate;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.state = state;
		this.payment = payment;
		this.people = people;
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

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getPeople() {
		return people;
	}


	public void setPeople(int people) {
		this.people = people;
	}


	@Override
	public String toString() {
		return "GuestReserveDto [reserveCode=" + reserveCode + ", memberCode=" + memberCode + ", houseCode=" + houseCode
				+ ", reserveDate=" + reserveDate + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", state="
				+ state + ", payment=" + payment + ", people=" + people + "]";
	}


	
	
}
