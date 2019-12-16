package com.java.search.service;

import java.util.List;

import com.java.search.dto.SearchDto;

public interface SearchService {
	public List<SearchDto> search(String checkIn, String checkOut, String local, String people, String searchHouseName);
	
	//테스트 용으로 데이터 넣기 위한 함수
	public void dataInputOk(SearchDto searchDto);

}
