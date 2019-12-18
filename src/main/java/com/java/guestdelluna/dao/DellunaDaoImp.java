package com.java.guestdelluna.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.guestdelluna.dto.ExpReservationDto;
import com.java.guestdelluna.dto.HouseReservationDto;
import com.java.guestdelluna.dto.MemberDto;
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

	@Override
	public int reviewUpdate(ReviewDto reviewDto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("reviewUpdate",reviewDto);
	}

	@Override
	public int deleteReview(int boardNumber) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("reviewDelete",boardNumber);
	}

	@Override
	public ReviewDto clickMyReview(int boardNumber) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("clickMyReview",boardNumber);
	}

	@Override
	public int reviewCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("reviewCount");
	}

	@Override
	public List<ReviewDto> reviewList(int startRow, int endRow) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return sqlSessionTemplate.selectList("reviewList",map);
	}

	@Override
	public int findMyPoint(int memberCode) {
		// TODO Auto-generated method stub
		//membercode가 ?인 사람의 적립된 포인트를 찾아옴
		return sqlSessionTemplate.selectOne("findMyPoint",memberCode);
	}

	@Override
	public int countExp(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("countExp",memberCode);
	}

	@Override
	public ExpReservationDto findExpDto(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("findExpDto",memberCode);
	}

	@Override
	public List<ExpReservationDto> findExpList(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("findExpList", memberCode);
	}

	@Override
	public int countHouse(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("countHouse", memberCode);
	}

	@Override
	public HouseReservationDto findHouseDto(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("findHouseDto", memberCode);
	}

	@Override
	public List<ExpReservationDto> findHouseList(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("findHouseList",memberCode);
	}

	@Override
	public MemberDto selectForUpdate(String email) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("selectForUpdate",email);
	}

	@Override
	public int updateMember(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("updateMember",memberDto);
	}

	@Override
	public int memberDeleteOk(String email, String password) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("email" , email);
		map.put("password", password);
		
		return sqlSessionTemplate.delete("memberDeleteOk",map);
	}

	@Override
	public HouseReservationDto myResHouse(int reserveCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("myResHouse",reserveCode);
	}

	@Override
	public ExpReservationDto myResExp(int exCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("myResExp",exCode);
	}

	@Override
	public int doZzim(Map<String, Object> dataMap, String zzim) {
		if(zzim!=null)
			return sqlSessionTemplate.insert("dao.dellunaMapper.doZzim", dataMap);
		else
			return sqlSessionTemplate.delete("dao.dellunaMapper.cancelZzim", dataMap);
		
	}
	
	
	
	
	
	}




