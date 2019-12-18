package com.java.search.service;

import org.springframework.web.servlet.ModelAndView;

import com.java.search.dto.SearchDto;

public interface SearchService {
	public ModelAndView search(String checkIn, String checkOut, String local, String people, String searchHouseName, String pageNumber);
	
	//테스트 용으로 데이터 넣기 위한 함수
	public void dataInputOk(SearchDto searchDto);

}
