package com.java.guestdelluna.dto;

import java.util.Date;

public class PointAccumulate {

	private int accuCode;
	private int memberCode;
	private String accuPlace;
	private Date accuDate ;
	private int accuPoint;
	
	public PointAccumulate() {}

	public PointAccumulate(int accuCode, int memberCode, String accuPlace, Date accuDate, int accuPoint) {
		
		this.accuCode = accuCode;
		this.memberCode = memberCode;
		this.accuPlace = accuPlace;
		this.accuDate = accuDate;
		this.accuPoint = accuPoint;
	}

	@Override
	public String toString() {
		return "PointAccumulate [accuCode=" + accuCode + ", memberCode=" + memberCode + ", accuPlace=" + accuPlace
				+ ", accuDate=" + accuDate + ", accuPoint=" + accuPoint + "]";
	}

	public int getAccuCode() {
		return accuCode;
	}

	public void setAccuCode(int accuCode) {
		this.accuCode = accuCode;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public String getAccuPlace() {
		return accuPlace;
	}

	public void setAccuPlace(String accuPlace) {
		this.accuPlace = accuPlace;
	}

	public Date getAccuDate() {
		return accuDate;
	}

	public void setAccuDate(Date accuDate) {
		this.accuDate = accuDate;
	}

	public int getAccuPoint() {
		return accuPoint;
	}

	public void setAccuPoint(int accuPoint) {
		this.accuPoint = accuPoint;
	}
	
	
	
}
