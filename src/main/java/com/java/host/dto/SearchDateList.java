package com.java.host.dto;

import java.util.Date;

public class SearchDateList {
	private Date reserveDate;
	private String memberName;
	private int people;
	private int payment;
	
	public SearchDateList() {
		
	}

	public SearchDateList(Date reserveDate, String memberName, int people, int payment) {
		this.reserveDate = reserveDate;
		this.memberName = memberName;
		this.people = people;
		this.payment = payment;
	}

	public Date getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	@Override
	public String toString() {
		return "SearchDateList [reserveDate=" + reserveDate + ", memberName=" + memberName + ", people=" + people
				+ ", payment=" + payment + "]";
	}
	
	
	
}
