package com.java.search.service;

import org.springframework.web.servlet.ModelAndView;

import com.java.host.dto.HostDto;

public interface SearchService {
	public ModelAndView search(String checkIn, String checkOut, String local, String people, String searchHouseName, String pageNumber, Integer memberCode, String sort);
	
	//테스트 용으로 데이터 넣기 위한 함수
	public void dataInputOk(HostDto hostDto);

	public String overlay(int houseCode, Integer memberCode);

	public ModelAndView searchEx(String checkIn, String checkOut, String local, String people, String searchExName,
			String pageNumber, Integer memberCode, String sort);

	public String exOverlay(int exCode, Integer memberCode);

}
