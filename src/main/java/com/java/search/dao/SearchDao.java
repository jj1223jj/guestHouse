package com.java.search.dao;

import java.util.List;
import java.util.Map;

import com.java.experience.dto.ExperienceImgDto;
import com.java.host.dto.HostDto;
import com.java.host.dto.HostImgDto;
import com.java.search.dto.GetCountDto;

public interface SearchDao {

	public List<HostImgDto> searchHouse(Map<String, Object> dataMap);

	//테스트 용으로 데이터 넣기 위한 함수
	public int dataInputOk(HostDto hostDto);

	public GetCountDto getCount(Map<String, Object> dataMap);

	public HostImgDto overlay(int houseCode, Integer memberCode);

	public List<ExperienceImgDto> searchEx(Map<String, Object> dataMap);

	public int getExCount(Map<String, Object> dataMap);

	public ExperienceImgDto exOverlay(int exCode, Integer memberCode);
}
