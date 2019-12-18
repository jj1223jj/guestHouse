package com.java.guestdelluna.dto;

import java.util.Date;

public class DellunaExpDto {

	private int exCode ;
	private int memberCode;
	private String exName ;
	private int exPeople ;
	private Date exStartDate ;
	private Date exEndDate ;
	private String exTime ;
	private int exPrice ;
	private String exAddress ;
	private String exExplain ;
	
	public DellunaExpDto() {}

	public DellunaExpDto(int exCode, int memberCode, String exName, int exPeople, Date exStartDate, Date exEndDate,
			String exTime, int exPrice, String exAddress, String exExplain) {
		
		this.exCode = exCode;
		this.memberCode = memberCode;
		this.exName = exName;
		this.exPeople = exPeople;
		this.exStartDate = exStartDate;
		this.exEndDate = exEndDate;
		this.exTime = exTime;
		this.exPrice = exPrice;
		this.exAddress = exAddress;
		this.exExplain = exExplain;
	}

	@Override
	public String toString() {
		return "DellunaExpDto [exCode=" + exCode + ", memberCode=" + memberCode + ", exName=" + exName + ", exPeople="
				+ exPeople + ", exStartDate=" + exStartDate + ", exEndDate=" + exEndDate + ", exTime=" + exTime
				+ ", exPrice=" + exPrice + ", exAddress=" + exAddress + ", exExplain=" + exExplain + "]";
	}

	public int getExCode() {
		return exCode;
	}

	public void setExCode(int exCode) {
		this.exCode = exCode;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public String getExName() {
		return exName;
	}

	public void setExName(String exName) {
		this.exName = exName;
	}

	public int getExPeople() {
		return exPeople;
	}

	public void setExPeople(int exPeople) {
		this.exPeople = exPeople;
	}

	public Date getExStartDate() {
		return exStartDate;
	}

	public void setExStartDate(Date exStartDate) {
		this.exStartDate = exStartDate;
	}

	public Date getExEndDate() {
		return exEndDate;
	}

	public void setExEndDate(Date exEndDate) {
		this.exEndDate = exEndDate;
	}

	public String getExTime() {
		return exTime;
	}

	public void setExTime(String exTime) {
		this.exTime = exTime;
	}

	public int getExPrice() {
		return exPrice;
	}

	public void setExPrice(int exPrice) {
		this.exPrice = exPrice;
	}

	public String getExAddress() {
		return exAddress;
	}

	public void setExAddress(String exAddress) {
		this.exAddress = exAddress;
	}

	public String getExExplain() {
		return exExplain;
	}

	public void setExExplain(String exExplain) {
		this.exExplain = exExplain;
	}

	

}
