package com.java.guestdelluna.dto;

import java.util.Date;

public class MemberDto {

	private int memberCode ;
	private String memberName ;
	private String email ;
	private String password ;
	private int phone ;
	private Date regDate ;
	private int point ;
	private String memberLevel ;
	private String memberImgName;
	private String memberImgPath ;
	private Long memberImgSize ;
	private String memberInfo;
	
	public MemberDto() {}

	public MemberDto(int memberCode, String memberName, String email, String password, int phone, Date regDate,
			int point, String memberLevel, String memberImgName, String memberImgPath, Long memberImgSize,
			String memberInfo) {
		
		this.memberCode = memberCode;
		this.memberName = memberName;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.regDate = regDate;
		this.point = point;
		this.memberLevel = memberLevel;
		this.memberImgName = memberImgName;
		this.memberImgPath = memberImgPath;
		this.memberImgSize = memberImgSize;
		this.memberInfo = memberInfo;
	}

	@Override
	public String toString() {
		return "MemberDto [memberCode=" + memberCode + ", memberName=" + memberName + ", email=" + email + ", password="
				+ password + ", phone=" + phone + ", regDate=" + regDate + ", point=" + point + ", memberLevel="
				+ memberLevel + ", memberImgName=" + memberImgName + ", memberImgPath=" + memberImgPath
				+ ", memberImgSize=" + memberImgSize + ", memberInfo=" + memberInfo + "]";
	}

	public String getMemberInfo() {
		return memberInfo;
	}

	public void setMemberInfo(String memberInfo) {
		this.memberInfo = memberInfo;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getMemberLevel() {
		return memberLevel;
	}

	public void setMemberLevel(String memberLevel) {
		this.memberLevel = memberLevel;
	}

	public String getMemberImgName() {
		return memberImgName;
	}

	public void setMemberImgName(String memberImgName) {
		this.memberImgName = memberImgName;
	}

	public String getMemberImgPath() {
		return memberImgPath;
	}

	public void setMemberImgPath(String memberImgPath) {
		this.memberImgPath = memberImgPath;
	}

	public Long getMemberImgSize() {
		return memberImgSize;
	}

	public void setMemberImgSize(Long memberImgSize) {
		this.memberImgSize = memberImgSize;
	}

	
	
}
