package com.java.host.dao;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.experience.dto.ExperienceDto;
import com.java.file.dto.FileDto;
import com.java.guestReserve.dto.GuestReserveDto;
import com.java.host.dto.HostDto;
import com.java.host.dto.ReservationListDto;
import com.java.host.dto.SearchDateList;
import com.java.host.dto.SearchDateListCount;
import com.java.member.dto.MemberDto;

@Component
public class HostDaoImp implements HostDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int subImgUpload(FileDto fileDto) {
		return sqlSession.insert("host.dao.mapper.subImgUpload", fileDto);
	}

	@Override
	public int hostRegister(HostDto hostDto) {
		return sqlSession.insert("host.dao.mapper.hostRegister", hostDto);
	}

	@Override
	public int memberProfileImg(MemberDto memberDto) {
		return sqlSession.update("host.dao.mapper.memberProfileUpdate", memberDto);
	}

	@Override
	public int memberCode(String email) {
		return sqlSession.selectOne("host.dao.mapper.memberCode", email);
	}

	@Override
	public int mainImgUpload(FileDto fileDto) {
		return sqlSession.insert("host.dao.mapper.mainImgUpload",fileDto);
	}

	@Override
	public int houseCode() {
		return sqlSession.selectOne("host.dao.mapper.houseCode");
	}

	@Override
	public List<HostDto> houseList(int memberCode, int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberCode", memberCode);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("host.dao.mapper.houseList", map);
	}

	@Override
	public int hostCancel(int houseCode) {
		return sqlSession.update("host.dao.mapper.hostCancel", houseCode);
	}

	@Override
	public List<String> houseNameList(int memberCode) {
		return sqlSession.selectList("host.dao.mapper.houseNameList", memberCode);
	}

	@Override
	public int getHouseCode(String houseName) {
		return sqlSession.selectOne("host.dao.mapper.getHouseCode", houseName);
	}

	@Override
	public List<ReservationListDto> reserveViewList(int houseCode, int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("houseCode", houseCode);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("host.dao.mapper.reserveViewList", map);
	}

	@Override
	public int getHouseCount(String email) {
		return sqlSession.selectOne("host.dao.mapper.getHouseCount", email);
	}

	@Override
	public int getReserveCount(int houseCode) {
		return sqlSession.selectOne("host.dao.mapper.getReserveCount", houseCode);
	}

	@Override
	public int getExCount(int memberCode) {
		return sqlSession.selectOne("host.dao.mapper.getExCount", memberCode);
	}

	@Override
	public List<ExperienceDto> experienceList(int memberCode, int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberCode", memberCode);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("host.dao.mapper.experienceList", map);
	}

	@Override
	public List<GuestReserveDto> getSales(int memberCode) {
		return sqlSession.selectList("host.dao.mapper.getSales", memberCode);
	}

	@Override
	public SearchDateListCount getSearchDateCount(int memberCode, String startDate, String endDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberCode", memberCode);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return sqlSession.selectOne("host.dao.mapper.getSearchDateCount", map);
	}

	@Override
	public List<SearchDateList> searchDateList(int memberCode, String startDate, String endDate, int startRow,
			int endRow) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberCode", memberCode);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("host.dao.mapper.searchDateList", map);
	}

	@Override
	public MemberDto selectMemberDto(String email) {
		return sqlSession.selectOne("host.dao.mapper.selectMemberDto", email);
	}
}
