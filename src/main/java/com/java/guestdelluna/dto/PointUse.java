package com.java.guestdelluna.dto;

import java.util.Date;

public class PointUse {

	private int useCode ;
	private int memberCode;
	private String usePlace ;
	private Date useDate;
	private int usePoint;
	
	public PointUse() {}

	public PointUse(int useCode, int memberCode, String usePlace, Date useDate, int usePoint) {
		
		this.useCode = useCode;
		this.memberCode = memberCode;
		this.usePlace = usePlace;
		this.useDate = useDate;
		this.usePoint = usePoint;
	}

	@Override
	public String toString() {
		return "PointUse [useCode=" + useCode + ", memberCode=" + memberCode + ", usePlace=" + usePlace + ", useDate="
				+ useDate + ", usePoint=" + usePoint + "]";
	}

	public int getUseCode() {
		return useCode;
	}

	public void setUseCode(int useCode) {
		this.useCode = useCode;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public String getUsePlace() {
		return usePlace;
	}

	public void setUsePlace(String usePlace) {
		this.usePlace = usePlace;
	}

	public Date getUseDate() {
		return useDate;
	}

	public void setUseDate(Date useDate) {
		this.useDate = useDate;
	}

	public int getUsePoint() {
		return usePoint;
	}

	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}
	
	
	
}
