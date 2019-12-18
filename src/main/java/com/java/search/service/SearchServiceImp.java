package com.java.search.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAspect;
import com.java.host.dto.HostDto;
import com.java.search.dao.SearchDao;


@Component
public class SearchServiceImp implements SearchService {

	@Autowired
	private SearchDao searchDao;

	@Override
	public ModelAndView search(String checkIn, String checkOut, String local, String people, String searchHouseName, String pageNumber) {
		HomeAspect.logger.info(HomeAspect.logMsg+"local: "+local+", checkIn: "+checkIn+", checkOut: "+checkOut+ " ,people: "+people+", searchHouseName: "+searchHouseName );
		
		//myBatis에 넘겨줄 data, Map에 넣기
		Map<String, Object> dataMap = new HashMap<String,Object>();
		
		dataMap.put("checkIn", checkIn);
		dataMap.put("checkOut", checkOut);
		dataMap.put("local", local);
		dataMap.put("people", people);
		
		//지역조건이 전체가 아니면 배열로 dataMap에 넣어주기
		if(local.split(",").length>=1 && !local.equals(""))
			dataMap.put("localSplit", local.split(","));
		//숙소이름 검색조건이 있으면 dataMap에 넣어주기
		if(!searchHouseName.equals(""))
			dataMap.put("searchHouseName",searchHouseName);

		//페이징
		int currentPage=Integer.parseInt(pageNumber);
		
		//검색조건 결과가 0인지 확인
		int count = searchDao.getCount(dataMap);
		HomeAspect.logger.info(HomeAspect.logMsg+"검색결과 count: " +count);

		//검색조건 결과 0아니면 데이터 10개씩 가져오기
		int boardSize=3;
		List<HostDto> searchHouseList=null;
		if(count>0) {
			int sRow = (currentPage-1)*boardSize+1;	//startRow
			int eRow = currentPage*boardSize;		//endRow
			
			dataMap.put("sRow", sRow);
			dataMap.put("eRow", eRow);
			searchHouseList = searchDao.searchHouse(dataMap); 
			HomeAspect.logger.info(HomeAspect.logMsg+"검색결과 개수: " +searchHouseList.size());
			HomeAspect.logger.info(HomeAspect.logMsg+"검색결과 : " +searchHouseList.toString());
		}
		
		//물어보기
		ModelAndView mav = new ModelAndView();
		mav.addObject("searchHouseList", searchHouseList);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.addObject("checkIn", checkIn);
		mav.addObject("checkOut", checkOut);
		mav.addObject("local", local);
		mav.addObject("people", people);
		mav.addObject("searchHouseName", searchHouseName);
		
		return mav;
		
	}
	
	
	//테스트 용으로 데이터 넣기 위한 함수
	@Override
	public void dataInputOk(HostDto hostDto) {
		
		int check= searchDao.dataInputOk(hostDto);
		HomeAspect.logger.info(HomeAspect.logMsg+"dataInput check: "+check);
		
	}









	
	
}
