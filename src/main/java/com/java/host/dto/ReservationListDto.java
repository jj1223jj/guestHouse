package com.java.host.dto;

import java.util.Date;

public class ReservationListDto {
	private String memberName;
	private String email;
	private String phone;
	private Date CheckIn;
	private Date CheckOut;
	private int payment;
	private String state;
	private int people;
	
	public ReservationListDto() {
		
	}

	public ReservationListDto(String memberName, String email, String phone, Date checkIn, Date checkOut, int payment, String state,int people) {
		this.memberName = memberName;
		this.email = email;
		this.phone = phone;
		CheckIn = checkIn;
		CheckOut = checkOut;
		this.payment = payment;
		this.people = people;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getCheckIn() {
		return CheckIn;
	}

	public void setCheckIn(Date checkIn) {
		CheckIn = checkIn;
	}

	public Date getCheckOut() {
		return CheckOut;
	}

	public void setCheckOut(Date checkOut) {
		CheckOut = checkOut;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	@Override
	public String toString() {
		return "ReservationListDto [memberName=" + memberName + ", email=" + email + ", phone=" + phone + ", CheckIn="
				+ CheckIn + ", CheckOut=" + CheckOut + ", payment=" + payment + ", state=" + state + ", people="
				+ people + "]";
	}
	
	
}
