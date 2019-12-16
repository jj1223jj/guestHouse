package com.java.search.service;

import org.springframework.web.servlet.ModelAndView;

public interface SearchService {
	public void search(ModelAndView mav);

	//테스트 용으로 데이터 넣기 위한 함수
	public void dataInputOk(ModelAndView mav);
}
