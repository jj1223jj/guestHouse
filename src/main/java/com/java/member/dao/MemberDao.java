package com.java.member.dao;

import com.java.member.dto.MemberDto;

public interface MemberDao {

	public int register(MemberDto memberDto);

	public int emailCheck(String email);

	public String login(String email, String password);

}
