package com.java.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.member.dto.MemberDto;

@Component
public class MemberDaoImp implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int register(MemberDto memberDto) {
		
		return sqlSessionTemplate.insert("dao.MemberMapper.insert",memberDto);
	}
	
	@Override
	public int emailCheck(String email) {
		
		int check = 0;
		String CheckEmail = sqlSessionTemplate.selectOne("dao.MemberMapper.emailCheck",email);
		if(CheckEmail != null) check =1;
		
		return check;
	}
	
	@Override
	public String login(String email, String password) {
		
		Map<String,Object> hMap = new HashMap<String, Object>();
		
		hMap.put("email", email);
		hMap.put("password", password);
		
		return sqlSessionTemplate.selectOne("dao.MemberMapper.login",hMap);
	}
	
}
