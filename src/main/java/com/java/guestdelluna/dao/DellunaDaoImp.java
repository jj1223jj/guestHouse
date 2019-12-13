package com.java.guestdelluna.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.guestdelluna.dto.ReviewDto;

@Component
public class DellunaDaoImp implements DellunaDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int insertReview(ReviewDto reviewDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ReviewDto selectReview(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("selectOneReview",memberCode);
	}

	@Override
	public int countMemberCode(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("countMemberCode",memberCode);
	}

	@Override
	public List<ReviewDto> selectListReview(int memberCode) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		
		return sqlSessionTemplate.selectList("selectListReview",map);
	}

	
	
	}




