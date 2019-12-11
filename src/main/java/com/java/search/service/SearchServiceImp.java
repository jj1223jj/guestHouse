package com.java.search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.search.dao.SearchDao;
import com.java.search.dto.SearchDto;


@Component
public class SearchServiceImp implements SearchService {

	@Autowired
	private SearchDao searchDao;

	@Override
	public void searchGehi(String search) {
		System.out.println("검색 Service입니다");
		List<SearchDto> searchList = searchDao.searchGehi(search);
		System.out.println(searchList.toString()+","+searchList.size()); 
		//긁어오고
	
		
		
	}
	
}
