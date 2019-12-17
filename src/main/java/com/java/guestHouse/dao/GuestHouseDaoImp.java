package com.java.guestHouse.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.file.dto.FileDto;
import com.java.host.dto.HostDto;

@Component
public class GuestHouseDaoImp implements GuestHouseDao{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public HostDto guestHouseRead(int houseCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.GuestHouseMapper.guestHouseRead",houseCode);
	}
	
	@Override
	public List<FileDto> guestHouseImg(int houseCode) {
		// TODO Auto-generated method stub
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("houseCode",houseCode);
		return sqlSessionTemplate.selectList("dao.GuestHouseMapper.guestHouseImgList",hMap);
	}
	
	@Override
	public int getMemberCode(String email) {
		return sqlSessionTemplate.selectOne("dao.GuestHouseMapper.getMemberCode",email);
	}
	
	@Override
	public int getPrice(int houseCode) {
		return sqlSessionTemplate.selectOne("dao.GuestHouseMapper.getPrice",houseCode);
	}
}
