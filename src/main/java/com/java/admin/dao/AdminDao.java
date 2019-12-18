package com.java.admin.dao;

import java.util.List;

import com.java.experience.dto.ExperienceDto;
import com.java.member.dto.MemberDto;

public interface AdminDao {

	// 회원관리
	public int memberCount();

	public List<MemberDto> memberList(int startRow, int endRow);

	public MemberDto memberRead(int memberCode);

	public int memberUpdateOk(MemberDto memberDto);
	
	
	// 게스트하우스 관리 
	public int houseCount();

	public List<MemberDto> houseList(int startRow, int endRow);

	// 체험 관리
	public int experienceCount();

	public List<ExperienceDto> experienceList(int startRow, int endRow);

}
