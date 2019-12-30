package com.java.guestHouse.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.file.dto.FileDto;
import com.java.guestReserve.dto.GHouseReviewListDto;
import com.java.guestReserve.dto.GuestReserveDto;
import com.java.guestReserve.dto.RemainDto;
import com.java.guestdelluna.dto.HouseReviewDto;
import com.java.guestdelluna.dto.MsgDto;
import com.java.guestdelluna.dto.PointAccumulate;
import com.java.guestdelluna.dto.PointUse;
import com.java.member.dto.MemberDto;
import com.java.host.dto.HostDto;

@Component
public class GuestHouseDaoImp implements GuestHouseDao{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public HostDto guestHouseRead(int houseCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.GuestHouseMapper.guestHouseRead",houseCode);
	}
	
	@Override
	public List<FileDto> guestHouseImg(int houseCode) {
		// TODO Auto-generated method stub
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("houseCode",houseCode);
		return sqlSessionTemplate.selectList("dao.GuestHouseMapper.guestHouseImgList",hMap);
	}
	
	@Override
	public int getMemberCode(String email) {
		return sqlSessionTemplate.selectOne("dao.GuestHouseMapper.getMemberCode",email);
	}
	
//	@Override
//	public int getPrice(int houseCode) {
//		return sqlSessionTemplate.selectOne("dao.GuestHouseMapper.getPrice",houseCode);
//	}
//	
//	@Override
//	public int getHostMemberCode(int houseCode) {
//		// TODO Auto-generated method stub
//		return sqlSessionTemplate.selectOne("dao.GuestHouseMapper.getHostMemberCode",houseCode);
//	}
	
	@Override
	public HostDto getHostInfo(int houseCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.GuestHouseMapper.getHostInfo",houseCode);
	}
	
	@Override
	public int getPoint(String email) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.GuestHouseMapper.getMemberPoint",email);
	}
	
	@Override
	public MemberDto getHostList(int hostCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.GuestHouseMapper.getHost",hostCode);
	}
	
	@Override
	public String getHouseName(int houseCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.GuestHouseMapper.getHouseName",houseCode);
	}
	
	@Override
	public int insertReserveInfo(GuestReserveDto guestReserveDto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("dao.GuestHouseMapper.insertReserveInfo",guestReserveDto);
	}
	
	@Override
	public int getReserveCode(int houseCode, int memberCode, Date checkIn) {
		// TODO Auto-generated method stub
		
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("houseCode", houseCode);
		hMap.put("memberCode", memberCode);
		hMap.put("checkIn", checkIn);
		
		return sqlSessionTemplate.selectOne("dao.GuestHouseMapper.getReserveCode",hMap);
	}
	
	@Override
	public int updatePoint(int memberPoint, int memberCode) {
		// TODO Auto-generated method stub
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("memberPoint", memberPoint);
		hMap.put("memberCode", memberCode);
		
		return sqlSessionTemplate.update("dao.GuestHouseMapper.updatePoint",hMap);
	}
	
	@Override
	public int insertResPoint(PointAccumulate pointAccumulate) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("dao.GuestHouseMapper.insertResPoint",pointAccumulate);
	}
	
	@Override
	public int insertUsePoint(PointUse pointUse) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("dao.GuestHouseMapper.insertUsePoint",pointUse);
	}
	
	@Override
	public int insertRemain(Date checkIn, int people, int houseCode) {
		// TODO Auto-generated method stub
		Map<String, Object> hMap =new HashMap<String, Object>();
		hMap.put("resDate", checkIn);
		hMap.put("people", people);
		hMap.put("houseCode", houseCode);
		
		return sqlSessionTemplate.insert("dao.GuestHouseMapper.insertRemain",hMap);
	}
	
	@Override
	public List<RemainDto> getRemain(int houseCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.GuestHouseMapper.getRemain",houseCode);
	}
	
	@Override
	public MemberDto getMemberInfo(String email) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.GuestHouseMapper.getMemberInfo",email);
	}
	
	@Override
	public int insertMsg(MsgDto msgDto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("dao.GuestHouseMapper.insertMsg",msgDto);
	}
	
	@Override
	public int getReviewCnt(int houseCode) {
		return sqlSessionTemplate.selectOne("dao.GuestHouseMapper.reviewCnt",houseCode);
	}
	
	@Override
	public List<GHouseReviewListDto> getReviewList(int startRow, int endRow, int houseCode) {
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		hMap.put("houseCode", houseCode);
		
		return sqlSessionTemplate.selectList("dao.GuestHouseMapper.reviewList",hMap);
	}
	
	@Override
	public int reserveCodeCnt(int memberCode, int houseCode) {
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("memberCode", memberCode);
		hMap.put("houseCode", houseCode);
		
		return sqlSessionTemplate.selectOne("dao.GuestHouseMapper.reserveCodeCnt",hMap);
	}
	
	@Override
	public List<GuestReserveDto> reserveCode(int houseCode, int memberCode) {
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("memberCode", memberCode);
		hMap.put("houseCode", houseCode);

		return  sqlSessionTemplate.selectList("dao.GuestHouseMapper.reserveCode",hMap);
	}
	
	@Override
	public int reviewChk(int reserveCode) {
		
		return sqlSessionTemplate.selectOne("dao.GuestHouseMapper.reviewChk",reserveCode);
	}
	
	@Override
	public int writeReview(HouseReviewDto reviewDto) {
	
		return sqlSessionTemplate.insert("dao.GuestHouseMapper.writeReview",reviewDto);
	}
	
	@Override
	public HouseReviewDto reviewUpdate(int memberCode, int reserveCode) {
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("memberCode", memberCode);
		hMap.put("reserveCode", reserveCode);
		
		return sqlSessionTemplate.selectOne("dao.GuestHouseMapper.reviewUpdate",hMap);
	}
	
	@Override
	public int reviewUpdateOk(HouseReviewDto reviewDto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("dao.GuestHouseMapper.reviewUpdateOk",reviewDto);
	}
	
	@Override
	public int reviewDelete(int reserveCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("dao.GuestHouseMapper.reviewDelete",reserveCode);
	}
}
