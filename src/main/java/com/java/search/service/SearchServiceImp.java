package com.java.search.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAspect;
import com.java.search.dao.SearchDao;
import com.java.search.dto.SearchDto;


@Component
public class SearchServiceImp implements SearchService {

	@Autowired
	private SearchDao searchDao;

	@Override
	public void search(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request"); 
		
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		String local = request.getParameter("local");
		System.out.println(local);
		//local = "("+local.substring(0,local.length()-1)+")";
		String people = request.getParameter("people");
		String searchHouseName = request.getParameter("searchHouseName");
		
		HomeAspect.logger.info(HomeAspect.logMsg+"local: "+local+", checkIn: "+checkIn+", checkOut: "+checkOut+ " ,people: "+people+", searchHouseName: "+searchHouseName );
		
		//myBatis에 넘겨줄 data, Map에 넣기
		Map<String, Object> dataMap = new HashMap<String,Object>();
		
		
		dataMap.put("checkIn", checkIn);
		dataMap.put("checkOut", checkOut);
		dataMap.put("local", local);
		dataMap.put("people", people);
		dataMap.put("searchHouseName",searchHouseName);
		
		List<SearchDto> searchHouseList = searchDao.searchHouse(dataMap); 
		HomeAspect.logger.info(HomeAspect.logMsg+"검색결과 개수: " +searchHouseList.size());
		
		mav.addObject("searchHouseList", searchHouseList);
		
		mav.setViewName("search/searchHouse.tiles");
	}
	
	
	
	
	
	
	
	
	
	//테스트 용으로 데이터 넣기 위한 함수
	@Override
	public void dataInputOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request"); 
		SearchDto searchDto = (SearchDto) map.get("searchDto");
		
		int check= searchDao.dataInputOk(searchDto);
		HomeAspect.logger.info(HomeAspect.logMsg+"dataInput check: "+check);
		
		mav.setViewName("search/dataInput.tiles");
	}

	
}
