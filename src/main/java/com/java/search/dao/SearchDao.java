package com.java.search.dao;

import java.util.List;
import java.util.Map;

import com.java.host.dto.HostDto;
import com.java.host.dto.HostImgDto;

public interface SearchDao {

	public List<HostImgDto> searchHouse(Map<String, Object> dataMap);

	//테스트 용으로 데이터 넣기 위한 함수
	public int dataInputOk(HostDto hostDto);

	public int getCount(Map<String, Object> dataMap);
}
