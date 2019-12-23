package com.java.search.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAspect;
import com.java.host.dto.HostDto;
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
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		//session
		Integer memberCode = (Integer) request.getSession().getAttribute("memberCode");
		System.out.println(memberCode);
		
		//페이징
		String pageNumber= request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		// 게스트 하우스 검색 조건
		String sort = request.getParameter("sort");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		String local = request.getParameter("local");
		String people = request.getParameter("people");
		String searchHouseName = request.getParameter("searchHouseName");
		HomeAspect.logger.info(HomeAspect.logMsg+"local: "+local+", checkIn: "+checkIn+", checkOut: "+checkOut+ " ,people: "+people+", searchHouseName: "+searchHouseName +", sort: "+sort);

		mav = searchService.search(checkIn, checkOut, local, people, searchHouseName, pageNumber, memberCode, sort);
		
		mav.setViewName("search/searchHouse.tiles");
		return mav;
	}
	
	@RequestMapping(value="/dataInput", method= RequestMethod.GET)
	public ModelAndView dataInput(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("search/dataInput.tiles");
	}
	
	@RequestMapping(value="/test", method= RequestMethod.GET)
	public String test(HttpServletRequest request, HttpServletResponse response) {
		return "search/test.tiles";
	}
	
	
	@RequestMapping(value="/dataInputOk", method= RequestMethod.GET)
	public ModelAndView dataInputOk(HttpServletRequest request, HttpServletResponse response , HostDto hostDto) {
		ModelAndView mav = new ModelAndView();
		HomeAspect.logger.info(HomeAspect.logMsg+"데이터 등록: "+hostDto);
		
		//테스트용으로 데이터 넣기 위한 함수

   		 searchService.dataInputOk(hostDto);

		mav.setViewName("search/dataInput.tiles");
		return mav;
	}
}
