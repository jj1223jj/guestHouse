package com.java.search.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.search.dto.SearchDto;

@Component
public class SearchDaoImp implements SearchDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<SearchDto> searchGehi(String search) {
		return session.selectList("searchGehi", search);
	}

}
