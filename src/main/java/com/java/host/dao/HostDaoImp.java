package com.java.host.dao;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.file.dto.FileDto;
import com.java.host.dto.HostDto;
import com.java.host.dto.ReservationListDto;
import com.java.member.dto.MemberDto;

@Component
public class HostDaoImp implements HostDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

//	@Override
//	public int subImgUpload(String fileName, File filepath, long fileSize) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		map.put("fileName", fileName);
//		map.put("path", filepath);
//		map.put("fileSize", fileSize);
//		
//		//return sqlSession.insert("subImgUpload", map);
//		return 0;
//	}

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
	public List<HostDto> houseList(int memberCode) {
		return sqlSession.selectList("host.dao.mapper.houseList", memberCode);
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
	public List<ReservationListDto> reserveViewList(int houseCode) {
		return sqlSession.selectList("host.dao.mapper.reserveViewList", houseCode);
	}

	@Override
	public int getCount(String email) {
		return sqlSession.selectOne("host.dao.mapper.getCount", email);
	}
}
