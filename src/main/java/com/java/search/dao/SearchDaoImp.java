package com.java.search.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.search.dto.SearchDto;

@Component
public class SearchDaoImp implements SearchDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<SearchDto> searchHouse(Map<String, Object> dataMap) {
		return session.selectList("searchHouse", dataMap);
	}

	@Override
	public int getCount(Map<String, Object> dataMap) {
		return session.selectOne("getCount", dataMap);
	}
	
	//테스트 용으로 데이터 넣기 위한 함수
	@Override
	public int dataInputOk(SearchDto searchDto) {
		return session.insert("dataInput", searchDto);
	}


}
