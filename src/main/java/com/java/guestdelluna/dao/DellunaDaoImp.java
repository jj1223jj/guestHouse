package com.java.guestdelluna.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.guestdelluna.dto.ExpReservationDto;
import com.java.guestdelluna.dto.ExpReviewDto;
import com.java.guestdelluna.dto.ExpZzimDto;
import com.java.guestdelluna.dto.HouseDto;
import com.java.guestdelluna.dto.HouseReservationDto;
import com.java.guestdelluna.dto.HouseZzimDto;
import com.java.guestdelluna.dto.MemberDto;
import com.java.guestdelluna.dto.MsgDto;

import com.java.guestdelluna.dto.MyExReviewList;
import com.java.guestdelluna.dto.MyHouseReviewList;
import com.java.guestdelluna.dto.NewExpResDto;
import com.java.guestdelluna.dto.NewExpReviewDto;
import com.java.guestdelluna.dto.NewExpZzimDto;
import com.java.guestdelluna.dto.NewHouseResDto;
import com.java.guestdelluna.dto.NewHouseReserveDto;
import com.java.guestdelluna.dto.NewExpReserveDto;
import com.java.guestdelluna.dto.NewHouseReviewDto;
import com.java.guestdelluna.dto.NewHouseZzimDto;
import com.java.guestdelluna.dto.PointAccumulate;
import com.java.guestdelluna.dto.PointUse;
import com.java.guestdelluna.dto.HouseReviewDto;
import com.java.host.dto.ExReviewListDto;
import com.java.host.dto.HostExListDto;
import com.java.host.dto.HostHouseListDto;
import com.java.host.dto.HouseReviewListDto;

@Component
public class DellunaDaoImp implements DellunaDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public HouseReviewDto selectReview(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.selectOneReview", memberCode);
	}

	@Override
	public int reviewCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.reviewCount");
	}

	@Override
	public List<HouseReviewDto> reviewList(int startRow, int endRow) {
		// TODO Auto-generated method stub

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		return sqlSessionTemplate.selectList("dao.dellunaMapper.reviewList", map);
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
		// TODO Auto-generated method stub oooo

		int check = 0;

		if (memberDto.getMemberImgName() == null) {
			System.out.println(11111);
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
	public int getCountAccu(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.getCountAccu", memberCode);
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



	@Override
	public int getCountUse(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.getCountUse", memberCode);
	}

	@Override
	public List<PointAccumulate> myAccuPoint(int memberCode, int startRow, int endRow) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return sqlSessionTemplate.selectList("dao.dellunaMapper.myAccuPoint", map);
	}

	@Override
	public List<PointUse> myUsePoint(int memberCode, int  useStartRow, int useEndRow) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("useStartRow", useStartRow);
		map.put("useEndRow", useEndRow);
		
		return sqlSessionTemplate.selectList("dao.dellunaMapper.myUsePoint", map);
	}

	@Override
	public int expReviewCount(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.expReviewCount", memberCode);
	}

	@Override
	public int houseReviewCount(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.houseReviewCount", memberCode);
	}

	@Override
	public List<ExpReviewDto> myExpReview(int memberCode, int startRow, int endRow) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return sqlSessionTemplate.selectList("dao.dellunaMapper.myExpReview", map);
	}

	@Override
	public List<HouseReviewDto> myHouseReview(int memberCode, int houseStartRow, int houseEndRow) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("houseStartRow", houseStartRow);
		map.put("houseEndRow", houseEndRow);
		
		return sqlSessionTemplate.selectList("dao.dellunaMapper.myHouseReview", map);
	}

	@Override
	public ExpReviewDto findMyReview(int memberCode, int exReserveCode) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("exReserveCode", exReserveCode);
		
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.findMyReview", map);
	}

	@Override
	public int deleteReview(int exReserveCode, int memberCode) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("exReserveCode", exReserveCode);
		
		return sqlSessionTemplate.delete("dao.dellunaMapper.deleteReview", map);
	}

	@Override
	public int deleteHouseReview(int reserveCode, int memberCode) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("reserveCode", reserveCode);
		return sqlSessionTemplate.delete("dao.dellunaMapper.deleteHouseReview", map);
	}

	@Override
	public int updateExpReview(int memberCode, int exReserveCode, String revContent) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("exReserveCode", exReserveCode);
		map.put("revContent", revContent);
		
		return sqlSessionTemplate.update("dao.dellunaMapper.updateExpReview",map);
	}

	@Override
	public int selectMSG(int memberCode,String msgCheck) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("msgCheck", msgCheck);
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.selectMSG", map);
	}

	@Override
	public List<MsgDto> listMsg(int memberCode, String msgCheck) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("msgCheck", msgCheck);
		return sqlSessionTemplate.selectList("dao.dellunaMapper.listMsg", map);
	}

	@Override
	public int deleteAllMsg(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("dao.dellunaMapper.deleteAllMsg",memberCode);
	}

	@Override
	public int deleteMsg(int memberCode, int msgCode) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("msgCode", msgCode);
		return sqlSessionTemplate.delete("dao.dellunaMapper.deleteMsg", map);
	}

	@Override
	public int allMsg(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.allMsg", memberCode);
	}

	@Override
	public int updateMsg(int memberCode, int msgCode, String msgCheck) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("msgCode", msgCode);
		map.put("msgCheck", msgCheck);
		return sqlSessionTemplate.update("dao.dellunaMapper.updateMsg", map);
	}

	@Override
	public List<MsgDto> allMsgDto(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.dellunaMapper.allMsgDto", memberCode);
	}

	@Override
	public int updateHouseReview(int memberCode, int reserveCode, String revContent) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("reserveCode", reserveCode);
		map.put("revContent", revContent);
		return sqlSessionTemplate.update("dao.dellunaMapper.updateHouseReview", map);
	}

	@Override

	public List<ExReviewListDto> getExReviewListScroll(int memberCode, int startRow, int endRow) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSessionTemplate.selectList("host.dao.mapper.getExReviewListScroll" ,map);
	}

	@Override
	public List<MyHouseReviewList> getMyHouseReviewListScroll(int memberCode, int startRow, int endRow) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSessionTemplate.selectList("host.dao.mapper.getMyHouseReviewListScroll" ,map);
	}

	@Override
	public List<MyExReviewList> getMyExReviewListScroll(int memberCode, int startRow, int endRow) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSessionTemplate.selectList("host.dao.mapper.getMyExReviewListScroll" ,map);
	}

	public List<NewExpReviewDto> myExpreviewList(int memberCode,int startRow, int endRow) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSessionTemplate.selectList("dao.dellunaMapper.myExpreviewList", map);
	}

	@Override
	public List<NewHouseReviewDto> myHousereviewList(int memberCode, int useStartRow,int useEndRow) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("useStartRow", useStartRow);
		map.put("useEndRow", useEndRow);
		return sqlSessionTemplate.selectList("dao.dellunaMapper.myHousereviewList",map);

	}

	@Override
	public List<NewExpReserveDto> newExpReserve(int memberCode, String state) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("memberCode", memberCode);
		map.put("state", state);
		return sqlSessionTemplate.selectList("dao.dellunaMapper.newExpReserve", map);
	}

	@Override
	public List<NewHouseReserveDto> newHouseReserve(int memberCode, String state) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("memberCode", memberCode);
		map.put("state", state);
		return sqlSessionTemplate.selectList("dao.dellunaMapper.newHouseReserve", map);
	}

	@Override
	public List<NewExpReserveDto> newNewExpReserve(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.dellunaMapper.newNewExpReserve", memberCode);
	}

	@Override
	public List<NewHouseReserveDto> newNewHouseReserve(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.dellunaMapper.newNewHouseReserve", memberCode);
	}

	@Override

	public List<PointAccumulate> allAccuPoint(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.dellunaMapper.newPointAccu", memberCode);
	}

	@Override
	public List<NewExpZzimDto> newExpZzimDto(int memberCode, int startRow, int endRow) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return sqlSessionTemplate.selectList("dao.dellunaMapper.newExpZzimDto", map);
	}

	@Override
	public List<NewHouseZzimDto> newHouseZzimDto(int memberCode, int useStartRow, int useEndRow) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("useStartRow", useStartRow);
		map.put("useEndRow", useEndRow);
		
		return sqlSessionTemplate.selectList("dao.dellunaMapper.newHouseZzimDto", map);
	}

	@Override
	public int countExpZzim(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.countExpZzim", memberCode);
	}

	@Override
	public int countHouseZzim(int memberCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.countHouseZzim", memberCode);
	}

	@Override
	public int countPayExp(int memberCode,String state) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("state", state);
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.countPayExp", map);
	}

	@Override
	public int countPayHouse(int memberCode,String state) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("state", state);
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.countPayHouse", map);
	}

	@Override
	public List<NewExpResDto> newExpResDto(int memberCode, String state, int startRow, int endRow) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("state", state);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSessionTemplate.selectList("dao.dellunaMapper.newExpResDto", map);
	}

	@Override
	public List<NewHouseResDto> newHouseResDto(int memberCode, String state, int useStartRow, int useEndRow) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberCode", memberCode);
		map.put("state", state);
		map.put("useStartRow", useStartRow);
		map.put("useEndRow", useEndRow);
		return sqlSessionTemplate.selectList("dao.dellunaMapper.newHouseResDto", map);
	}
	public int getHouseReviewCount(int memberCode) {
		return sqlSessionTemplate.selectOne("host.dao.mapper.getHouseReviewCount" ,memberCode);
	}

	@Override
	public int getExReviewCount(int memberCode) {
		return sqlSessionTemplate.selectOne("host.dao.mapper.getExReviewCount" ,memberCode);
	}

	@Override
	public MemberDto selectMemberDto(int memberCode) {
		return sqlSessionTemplate.selectOne("dao.dellunaMapper.selectMemberDto" ,memberCode);

	}
	
}
