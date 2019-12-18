package com.java.search.dao;

import java.util.List;
import java.util.Map;

import com.java.search.dto.SearchDto;

public interface SearchDao {

	public List<SearchDto> searchHouse(Map<String, Object> dataMap);

	//테스트 용으로 데이터 넣기 위한 함수
	public int dataInputOk(SearchDto searchDto);

	public int getCount(Map<String, Object> dataMap);
}
