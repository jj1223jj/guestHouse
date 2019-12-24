package com.java.host.dto;

import java.util.Date;

public class ExReservationListDto {
	private String memberName;
	private String email;
	private String phone;
	private Date reserveDate;
	private int exPayment;
	private String state;
	private int exPeople;
	
	public ExReservationListDto() {
		
	}

	public ExReservationListDto(String memberName, String email, String phone, Date reserveDate, int exPayment,
			String state, int exPeople) {
		this.memberName = memberName;
		this.email = email;
		this.phone = phone;
		this.reserveDate = reserveDate;
		this.exPayment = exPayment;
		this.state = state;
		this.exPeople = exPeople;
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

	public Date getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}

	public int getExPayment() {
		return exPayment;
	}

	public void setExPayment(int exPayment) {
		this.exPayment = exPayment;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getExPeople() {
		return exPeople;
	}

	public void setExPeople(int exPeople) {
		this.exPeople = exPeople;
	}

	@Override
	public String toString() {
		return "ExReservationListDto [memberName=" + memberName + ", email=" + email + ", phone=" + phone
				+ ", reserveDate=" + reserveDate + ", exPayment=" + exPayment + ", state=" + state + ", exPeople="
				+ exPeople + "]";
	}
	
	
}
