package com.java.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.experience.dto.ExperienceDto;
import com.java.member.dto.MemberDto;

@Component
public class AdminDaoImp implements AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 관리자 회원관리
	@Override
	public int memberCount() {
		return sqlSessionTemplate.selectOne("dao.AdminMapper.memberCount");
	}
	
	@Override
	public List<MemberDto> memberList(int startRow, int endRow) {
		Map<String,Integer> hMap = new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSessionTemplate.selectList("dao.AdminMapper.memberList",hMap);
	}
	@Override
	public MemberDto memberRead(int memberCode) {
		MemberDto memberDto = null;
	
		memberDto = sqlSessionTemplate.selectOne("dao.AdminMapper.memberReadSelect",memberCode);
		
		return memberDto;
	}

	@Override
	public int memberUpdateOk(MemberDto memberDto) {
		
		return sqlSessionTemplate.update("dao.AdminMapper.memberUpdateOk",memberDto);
	}
	
	// 게스트 하우스 관리
	@Override
	public int houseCount() {
		return sqlSessionTemplate.selectOne("dao.AdminMapper.houseCount");
	}
	@Override
	public List<MemberDto> houseList(int startRow, int endRow) {
		Map<String,Integer> hMap = new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSessionTemplate.selectList("dao.AdminMapper.houseList",hMap);
	}
	// 체험 관리
	@Override
	public int experienceCount() {
		return sqlSessionTemplate.selectOne("dao.AdminMapper.experienceCount");
	}
	
	@Override
	public List<ExperienceDto> experienceList(int startRow, int endRow) {
		Map<String,Integer> hMap = new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSessionTemplate.selectList("dao.AdminMapper.experienceList",hMap);
	}
	@Override
	public int experienceStateOk(int exCode) {
		return sqlSessionTemplate.update("dao.AdminMapper.experienceStateOk",exCode);
	}
	@Override
	public int experienceStateNo(int exCode) {
		return sqlSessionTemplate.update("dao.AdminMapper.experienceStateNo",exCode);
	}

	@Override
	public int guestHouseStateOk(int houseCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("dao.AdminMapper.guestHouseStateOk",houseCode);
	}
	
	@Override
	public int guestHouseStateNo(int houseCode) {
		// TODO Auto-generated method stub
		return  sqlSessionTemplate.update("dao.AdminMapper.guestHouseStateNo",houseCode);

	}
	
	@Override
	public int memberLevelHost(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("dao.AdminMapper.memberLevelHost",memberCode);
	}
	
	/*
	 * // 메인 페이지
	 * 
	 * @Override public List<ExperienceDto> mainPage() { return
	 * sqlSessionTemplate.selectList("dao.AdminMapper.experienceMain");
	 * 
	 * }
	 */
	
	
}
