package com.java.guestdelluna.dto;

import java.util.Date;

public class HouseReservationDto {

	private int reserveCode ;
	private int people ; //사람수
	private Date reserveDate ;
	private Date checkIn ;
	private Date checkOut ;
	private int payment ;
	private int memberCode ;
	private int houseCode ;
	private String state ;

	public HouseReservationDto() {}

	public HouseReservationDto(int reserveCode, int people, Date reserveDate, Date checkIn, Date checkOut, int payment,
			int memberCode, int houseCode, String state) {
		
		this.reserveCode = reserveCode;
		this.people = people;
		this.reserveDate = reserveDate;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.payment = payment;
		this.memberCode = memberCode;
		this.houseCode = houseCode;
		this.state = state;
	}

	@Override
	public String toString() {
		return "HouseReservationDto [reserveCode=" + reserveCode + ", people=" + people + ", reserveDate=" + reserveDate
				+ ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", payment=" + payment + ", memberCode="
				+ memberCode + ", houseCode=" + houseCode + ", state=" + state + "]";
	}

	public int getReserveCode() {
		return reserveCode;
	}

	public void setReserveCode(int reserveCode) {
		this.reserveCode = reserveCode;
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

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}


		
}
