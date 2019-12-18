package com.java.search.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.host.dto.HostDto;

@Component
public class SearchDaoImp implements SearchDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<HostDto> searchHouse(Map<String, Object> dataMap) {
		return session.selectList("dao.searchMapper.searchHouse", dataMap);
	}

	@Override
	public int getCount(Map<String, Object> dataMap) {
		return session.selectOne("dao.searchMapper.getCount", dataMap);
	}
	
	//테스트 용으로 데이터 넣기 위한 함수
	@Override
	public int dataInputOk(HostDto hostDto) {
		return session.insert("dao.searchMapper.dataInput", hostDto);
	}


}
