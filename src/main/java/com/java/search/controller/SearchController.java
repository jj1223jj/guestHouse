package com.java.search.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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

	@RequestMapping(value="/searchAutocomplete", method=RequestMethod.GET)
	public void searchAutocomplete(HttpServletRequest request, HttpServletResponse response) {
		String searchName = request.getParameter("searchName");
		HomeAspect.logger.info(HomeAspect.logMsg+"autoComplete");
		response.setContentType("application/x-json;charset=utf-8");
		try {
			PrintWriter out =response.getWriter();
			out.print(searchName);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/overlay", method=RequestMethod.GET)
	public void overlay(HttpServletRequest request, HttpServletResponse response) {
		
		//customOverlay에 띄울 houseCode
		String houseCodeStr= request.getParameter("houseCode");
		int houseCode= houseCodeStr==null? 0 : Integer.parseInt(houseCodeStr);
		
		//login되어 있으면 zzimed가져와야함
		Integer memberCode= (Integer)request.getSession().getAttribute("memberCode");
		HomeAspect.logger.info(HomeAspect.logMsg+"ajax houseCode: "+houseCode+", memberCode: "+memberCode);
		
		String overlay= searchService.overlay(houseCode, memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg+"ajax dto결과물: "+overlay);
		
		response.setContentType("application/x-json;charset=utf-8");
		try {
			PrintWriter out =response.getWriter();
			out.print(overlay);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	@RequestMapping(value="/exOverlay", method=RequestMethod.GET)
	public void exOverlay(HttpServletRequest request, HttpServletResponse response) {
		
		//customOverlay에 띄울 houseCode
		String exCodeStr= request.getParameter("exCode");
		int exCode= exCodeStr==null? 0 : Integer.parseInt(exCodeStr);
		
		//login되어 있으면 zzimed가져와야함
		Integer memberCode= (Integer)request.getSession().getAttribute("memberCode");
		HomeAspect.logger.info(HomeAspect.logMsg+"ajax exCode: "+exCode+", memberCode: "+memberCode);
		
		String overlay= searchService.exOverlay(exCode, memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg+"ajax dto결과물: "+overlay);
		
		response.setContentType("application/x-json;charset=utf-8");
		try {
			PrintWriter out =response.getWriter();
			out.print(overlay);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		//session
		Integer memberCode = (Integer) request.getSession().getAttribute("memberCode");
		HomeAspect.logger.info(HomeAspect.logMsg+"sessionMemberCode: "+memberCode);
		
		//페이징
		String pageNumber= request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		// 게스트 하우스 검색 조건
		String sort = request.getParameter("sort");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		if(checkIn.equals("")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			checkIn= sdf.format(cal.getTime());
			cal.add(Calendar.DATE, 1);
			checkOut= sdf.format(cal.getTime());
		}
		
		String local = request.getParameter("local");
		String people = request.getParameter("people");
		String searchHouseName = request.getParameter("searchHouseName");
		HomeAspect.logger.info(HomeAspect.logMsg+"local: "+local+", checkIn: "+checkIn+", checkOut: "+checkOut+ " ,people: "+people+", searchHouseName: "+searchHouseName +", sort: "+sort);

		mav = searchService.search(checkIn, checkOut, local, people, searchHouseName, pageNumber, memberCode, sort);
		
		mav.setViewName("search/searchHouse.empty2");
		return mav;
	}
	
	
	@RequestMapping(value="/experience", method=RequestMethod.GET)
	public ModelAndView experience(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		//session
		Integer memberCode = (Integer) request.getSession().getAttribute("memberCode");
		HomeAspect.logger.info(HomeAspect.logMsg+"sessionMemberCode: "+memberCode);
		
		//페이징
		String pageNumber= request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		// 게스트 하우스 검색 조건
		String sort = request.getParameter("sort");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		if(checkIn.equals("")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			checkIn= sdf.format(cal.getTime());
			cal.add(Calendar.DATE, 1);
			checkOut= sdf.format(cal.getTime());
		}
		String local = request.getParameter("local");
		String people = request.getParameter("people");
		String searchExName = request.getParameter("searchExName");
		HomeAspect.logger.info(HomeAspect.logMsg+"local: "+local+", checkIn: "+checkIn+", checkOut: "+checkOut+ " ,people: "+people+", searchExName: "+searchExName +", sort: "+sort);
		
		mav = searchService.searchEx(checkIn, checkOut, local, people, searchExName, pageNumber, memberCode, sort);
		
		mav.setViewName("search/searchExperience.empty2");
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
