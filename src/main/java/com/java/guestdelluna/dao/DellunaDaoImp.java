package com.java.guestdelluna.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.guestdelluna.dto.ExpReservationDto;
import com.java.guestdelluna.dto.ExpZzimDto;
import com.java.guestdelluna.dto.HouseDto;
import com.java.guestdelluna.dto.HouseReservationDto;
import com.java.guestdelluna.dto.HouseZzimDto;
import com.java.guestdelluna.dto.MemberDto;
import com.java.guestdelluna.dto.ReviewDto;
import com.java.host.dto.ExReviewListDto;
import com.java.host.dto.HostExListDto;
import com.java.host.dto.HostHouseListDto;
import com.java.host.dto.HouseReviewListDto;

@Component
public class DellunaDaoImp implements DellunaDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int insertReview(ReviewDto reviewDto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("dao.dellunaMapper.insertReview", reviewDto);
	}

	@Override
	public ReviewDto selectReview(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.selectOneReview", memberCode);
	}

	@Override
	public int countMemberCode(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.countMemberCode", memberCode);
	}

	@Override
	public List<ReviewDto> selectListReview(int memberCode) {
		// TODO Auto-generated method stub

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberCode", memberCode);

		return sqlSessionTemplate.selectList("dao.dellunaMapper.selectListReview", map);
	}

	@Override
	public int reviewUpdate(ReviewDto reviewDto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("dao.dellunaMapper.reviewUpdate", reviewDto);
	}

	@Override
	public int deleteReview(int boardNumber) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("dao.dellunaMapper.reviewDelete", boardNumber);
	}

	@Override
	public ReviewDto clickMyReview(int boardNumber) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.clickMyReview", boardNumber);
	}

	@Override
	public int reviewCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.reviewCount");
	}

	@Override
	public List<ReviewDto> reviewList(int startRow, int endRow) {
		// TODO Auto-generated method stub

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		return sqlSessionTemplate.selectList("dao.dellunaMapper.reviewList", map);
	}

	@Override
	public int findMyPoint(int memberCode) {
		// TODO Auto-generated method stub
		// membercode가 ?인 사람의 적립된 포인트를 찾아옴
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.findMyPoint", memberCode);
	}

	@Override
	public int countExp(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.countExp", memberCode);
	}

	@Override
	public List<ExpReservationDto> findExpList(int memberCode) {
		// TODO Auto-generated method stub

		return sqlSessionTemplate.selectList("dao.dellunaMapper.findExpList", memberCode);
	}

	@Override
	public int countHouse(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.countHouse", memberCode);
	}

	@Override
	public List<HouseReservationDto> findHouseList(int memberCode) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberCode", memberCode);
		return sqlSessionTemplate.selectList("dao.dellunaMapper.findHouseList", map);
	}

	@Override
	public MemberDto selectForUpdate(String email) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.selectForUpdate", email);
	}

	@Override
	public int updateMember(MemberDto memberDto) {
		// TODO Auto-generated method stub

		int check = 0;

		if (memberDto.getMemberImgName() == null) {
			check = sqlSessionTemplate.update("dao.dellunaMapper.updateMember", memberDto);
		} else {
			check = sqlSessionTemplate.update("dao.dellunaMapper.updateMemberFile", memberDto);
		}
		return check;
	}

	@Override
	public int memberDeleteOk(String email, String password) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("password", password);

		return sqlSessionTemplate.delete("dao.dellunaMapper.memberDeleteOk", map);
	}

	@Override
	public HouseReservationDto myResHouse(int reserveCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.myResHouse", reserveCode);
	}

	@Override
	public ExpReservationDto myResExp(int exCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.myResExp", exCode);
	}

	@Override

	public int doZzim(Map<String, Object> dataMap, String zzim) {
		if(zzim!=null)
			return sqlSessionTemplate.insert("dao.dellunaMapper.doZzim", dataMap);
		else
			return sqlSessionTemplate.delete("dao.dellunaMapper.cancelZzim", dataMap);
		
	}
	
	public String selectMemberName(String email) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.selectMemberName", email);
	}

	@Override
	public int selectMemberCode(String email) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.selectMemberCode", email);
	}

	@Override
	public int selectExCode(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.selectExCode", memberCode);
	}

	@Override
	public int selectReserveCode(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.selectReserveCode", memberCode);
	}

	@Override
	public int deleteExpReserve(int exCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("dao.dellunaMapper.deleteExpReserve", exCode);
	}

	@Override
	public int deleteHouseReserve(int reserveCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("dao.dellunaMapper.deleteHouseReserve", reserveCode);
	}

	@Override
	public List<HouseDto> houseInfo(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.dellunaMapper.houseInfo", memberCode);
	}

	@Override
	public List<Integer> allHouse(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.dellunaMapper.allHouse", memberCode);
	}

	@Override
	public List<Integer> houseCodeThis(int houseCodeFromRes) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.dellunaMapper.houseCodeThis", houseCodeFromRes);
	}

	@Override
	public List<HouseDto> houseInfo(int memberCode, int houseCode) {
		// TODO Auto-generated method stub

		/*
		 * List<Object> list = sqlSessionTemplate.selectList("houseInfo2",memberCode);
		 * 
		 * System.out.println("list: "+list.toString());
		 * 
		 * 
		 * 
		 * Map<String,Object> map = (Map<String, Object>)
		 * sqlSessionTemplate.selectList("houseInfo",memberCode);
		 * 
		 * System.out.println(map.toString());
		 */
		  
		return /* sqlSessionTemplate.selectList("houseInfo", memberCode) */ null;
		 
	}

	@Override
	public List<String> findHouseName(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.dellunaMapper.findHouseName", memberCode);
	}

	@Override
	public List<Integer> ExpResNum(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.dellunaMapper.ExpResNum", memberCode);
	}

	@Override
	public List<Integer> expRealNum(int expResNum) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.dellunaMapper.expRealNum", expResNum);
	}

	@Override
	public List<String> myExName(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.dellunaMapper.myExName", memberCode);
	}

	@Override
	public List<Integer> findMyResCode(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.dellunaMapper.findMyResCode", memberCode);
	}

	@Override
	public int updateState(int houseReserveCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("dao.dellunaMapper.updateState", houseReserveCode);
	}

	@Override
	public List<Integer> findMyExpCode(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.dellunaMapper.findMyExpCode", memberCode);
	}

	@Override
	public int updateExpState(int expReserveCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("dao.dellunaMapper.updateExpState",expReserveCode);
	}

	@Override
	public List<ExpZzimDto> dtoExpZzim(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.dellunaMapper.dtoExpZzim",memberCode);

	}

	@Override
	public List<String> zzimExName(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.dellunaMapper.zzimExName", memberCode);
	}

	@Override
	public int deleteExpZzim(int exCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("dao.dellunaMapper.deleteExpZzim",exCode);
	}

	@Override
	public List<HouseZzimDto> dtoHouseZzim(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.dellunaMapper.dtoHouseZzim", memberCode);
	}

	@Override
	public List<String> zzimHouseName(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.dellunaMapper.zzimHouseName", memberCode);
	}

	@Override
	public int deleteHouseZzim(int houseCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("dao.dellunaMapper.deleteHouseZzim",houseCode);
	}

	@Override
	public int deletePayListExp(int exReserveCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("dao.dellunaMapper.deletePayListExp",exReserveCode);
	}

	@Override
	public int deletePayListHouse(int houseReserveCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("dao.dellunaMapper.deletePayListHouse",houseReserveCode);
	}

	@Override
	public List<HouseReservationDto> findHouseListWithString(int memberCode, String state) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("memberCode", memberCode);
		map.put("state", state);
	
		
		return sqlSessionTemplate.selectList("dao.dellunaMapper.findHouseListWithString", map);
	}

	@Override
	public List<String> findHouseNameWithString(int memberCode, String state) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("memberCode", memberCode);
		map.put("state", state);
	
		return sqlSessionTemplate.selectList("dao.dellunaMapper.findHouseNameWithString", map);
	}

	@Override
	public List<ExpReservationDto> findExpListWithString(int memberCode, String state) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("memberCode", memberCode);
		map.put("state", state);
		
		return sqlSessionTemplate.selectList("dao.dellunaMapper.findExpListWithString", map);
	}

	@Override
	public List<String> myExNameWithString(int memberCode, String state) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("memberCode", memberCode);
		map.put("state", state);
		
		return sqlSessionTemplate.selectList("dao.dellunaMapper.myExNameWithString", map);
	}

	@Override
	public List<HostHouseListDto> getHouseList(int memberCode) {
		return sqlSessionTemplate.selectList("host.dao.mapper.getHouseList" ,memberCode);
	}

	@Override
	public List<HouseReviewListDto> getHouseReviewList(int memberCode) {
		return sqlSessionTemplate.selectList("host.dao.mapper.getHouseReviewList" ,memberCode);
	}

	@Override
	public List<ExReviewListDto> getExReviewList(int memberCode) {
		return sqlSessionTemplate.selectList("host.dao.mapper.getExReviewList" ,memberCode);
	}

	@Override
	public List<HostExListDto> getExList(int memberCode) {
		return sqlSessionTemplate.selectList("host.dao.mapper.getExList" ,memberCode);
	}

	@Override
	public List<HouseReviewListDto> getHouseReviewListScroll(int memberCode, int startRow, int endRow) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSessionTemplate.selectList("host.dao.mapper.getHouseReviewListScroll" ,map);
	}


	

	
	

	
}
