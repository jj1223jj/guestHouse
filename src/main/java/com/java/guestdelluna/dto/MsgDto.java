package com.java.guestdelluna.dto;

import java.util.Date;

public class MsgDto {

	private int msgCode;
	private int memberCode;
	private String msgContent ;
	private Date msgDate ;
	private String msgCheck;
	
	public MsgDto() {}

	public MsgDto(int msgCode, int memberCode, String msgContent, Date msgDate, String msgCheck) {
		
		this.msgCode = msgCode;
		this.memberCode = memberCode;
		this.msgContent = msgContent;
		this.msgDate = msgDate;
		this.msgCheck = msgCheck;
	}

	@Override
	public String toString() {
		return "MsgDto [msgCode=" + msgCode + ", memberCode=" + memberCode + ", msgContent=" + msgContent + ", msgDate="
				+ msgDate + ", msgCheck=" + msgCheck + "]";
	}

	public int getMsgCode() {
		return msgCode;
	}

	public void setMsgCode(int msgCode) {
		this.msgCode = msgCode;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public Date getMsgDate() {
		return msgDate;
	}

	public void setMsgDate(Date msgDate) {
		this.msgDate = msgDate;
	}

	public String getMsgCheck() {
		return msgCheck;
	}

	public void setMsgCheck(String msgCheck) {
		this.msgCheck = msgCheck;
	}
	
	
	
}
