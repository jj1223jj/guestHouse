package com.java.search.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.aop.HomeAspect;
import com.java.search.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	private SearchService searchService;
	
	@RequestMapping(value="/ys", method=RequestMethod.GET)
	public String ys() {
		return "search/ys.tiles";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(HttpServletRequest request, HttpServletResponse response) {
		String address =request.getParameter("address");
		HomeAspect.logger.info(HomeAspect.logMsg+"등록할 주소: "+address);
		
		searchService.searchGehi(address);
		
		return "search/ys.tiles";
	}
}
