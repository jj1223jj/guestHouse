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
	public List<SearchDto> search(String checkIn, String checkOut, String local, String people, String searchHouseName) {
		
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
		
		return searchHouseList;
		
	}
	
	
	
	
	
	
	
	
	
	//테스트 용으로 데이터 넣기 위한 함수
	@Override
	public void dataInputOk(SearchDto searchDto) {
		
		int check= searchDao.dataInputOk(searchDto);
		HomeAspect.logger.info(HomeAspect.logMsg+"dataInput check: "+check);
		
	}

	
}
