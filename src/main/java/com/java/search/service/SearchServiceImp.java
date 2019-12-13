package com.java.search.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAscpect;
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
		
		String form = request.getParameter("form");
		String local = request.getParameter("local");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		String price = request.getParameter("price");
		String people = request.getParameter("people");
		
		HomeAscpect.logger.info(HomeAscpect.logMsg+"local: "+local+", checkIn: "+checkIn+", checkOut: "+checkOut+", price: "+price + " ,people: "+people);
		
		
		Map<String, Object> dataMap = new HashMap<String,Object>();
		if(!local.equals("all,")) { 
			String[] localSplited = local.split(",");
		}
		if(!price.equals("")) {
			String[] priceSplited = price.split(",");
		}
		
		
		mav.setViewName("search/ys.tiles");
	}
	
	
	@Override
	public void searchGehi(String search) {
		System.out.println("검색 Service입니다");
		List<SearchDto> searchList = searchDao.searchGehi(search);
		System.out.println(searchList.toString()+","+searchList.size()); 
		//긁어오고
		
	}
	
}
