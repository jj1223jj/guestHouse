package com.java.search.service;

import org.springframework.web.servlet.ModelAndView;

import com.java.host.dto.HostDto;

public interface SearchService {
	public ModelAndView search(String checkIn, String checkOut, String local, String people, String searchHouseName, String pageNumber, Integer memberCode);
	
	//테스트 용으로 데이터 넣기 위한 함수
	public void dataInputOk(HostDto hostDto);

}
