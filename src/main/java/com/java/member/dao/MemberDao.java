package com.java.member.dao;

import java.util.List;

import com.java.member.dto.MemberDto;

public interface MemberDao {

	public int register(MemberDto memberDto);

	public int emailCheck(String email);

	public String login(String email, String password);

	public MemberDto memberSel(String email, String password);

	public int inserKakao(String email, String memberImgPath, String memberName);


	public int kakaoEmailChk(String email);

	public int getMemberCode(String email);

}
