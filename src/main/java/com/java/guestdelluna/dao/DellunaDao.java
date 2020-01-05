package com.java.guestdelluna.dao;

import java.util.List;
import java.util.Map;

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


public interface DellunaDao {

	HouseReviewDto selectReview(int memberCode);

	int reviewCount();

	List<HouseReviewDto> reviewList(int startRow, int endRow);

	int countExp(int memberCode);	//o

	List<ExpReservationDto> findExpList(int memberCode);	//o

	int countHouse(int memberCode);	//o

	List<HouseReservationDto> findHouseList(int memberCode);	//o

	MemberDto selectForUpdate(String email);	//o

	int updateMember(MemberDto memberDto);	//o

	int memberDeleteOk(String email, String password);	//o

	HouseReservationDto myResHouse(int reserveCode);

	ExpReservationDto myResExp(int exCode);

	int doZzim(Map<String, Object> dataMap, String zzim);	//o

	int selectExCode(int memberCode);

	int selectReserveCode(int memberCode);

	int deleteExpReserve(int exCode);

	int deleteHouseReserve(int reserveCode);

	int selectMemberCode(String email);	//o

	List<HouseDto> houseInfo(int memberCode);	//o

	List<Integer> allHouse(int memberCode);		//o

	List<Integer> houseCodeThis(int houseCodeFromRes);	//o

	List<HouseDto> houseInfo(int memberCode, int houseCode);	//o

	List<String> findHouseName(int memberCode);	//o

	List<Integer> ExpResNum(int memberCode);	//o

	List<Integer> expRealNum(int expResNum);	//o

	List<String> myExName(int memberCode);	//o

	List<Integer> findMyResCode(int memberCode);	//o

	int updateState(int houseReserveCode);		//o

	List<Integer> findMyExpCode(int memberCode);	//o

	int updateExpState(int expReserveCode);		//o

	List<ExpZzimDto> dtoExpZzim(int memberCode);	//o

	List<String> zzimExName(int memberCode);	//o

	int deleteExpZzim(int exCode, int memberCode);	//o

	List<HouseZzimDto> dtoHouseZzim(int memberCode);	//o

	List<String> zzimHouseName(int memberCode);	//o

	int deleteHouseZzim(int houseCode, int memberCode);	//o

	int deletePayListExp(int exReserveCode);	//o

	int deletePayListHouse(int houseReserveCode);	//o

	List<HouseReservationDto> findHouseListWithString(int memberCode, String state);	//o

	List<String> findHouseNameWithString(int memberCode, String state);	//o

	List<ExpReservationDto> findExpListWithString(int memberCode, String state);	//o

	List<String> myExNameWithString(int memberCode, String state);	//o

	int getCountAccu(int memberCode);	//o

	int getCountUse(int memberCode);	//o

	List<PointAccumulate> myAccuPoint(int memberCode, int startRow, int endRow);	//o

	List<PointUse> myUsePoint(int memberCode, int startRow , int endRow);	//o

	int expReviewCount(int memberCode);	//o

	int houseReviewCount(int memberCode);	//o

	List<ExpReviewDto> myExpReview(int memberCode, int startRow, int endRow);	//o

	List<HouseReviewDto> myHouseReview(int memberCode, int houseStartRow, int houseEndRow);	//o

	ExpReviewDto findMyReview(int memberCode, int exReserveCode);	//o

	int deleteReview(int exReserveCode, int memberCode);	//o

	int deleteHouseReview(int reserveCode, int memberCode);	//o

	int updateExpReview(int memberCode, int exReserveCode, String revContent);	//o

	int selectMSG(int memberCode,String msgCheck);	//o

	List<MsgDto> listMsg(int memberCode, String msgCheck);	//o

	int deleteAllMsg(int memberCode);	//o

	int deleteMsg(int memberCode, int msgCode);	//o

	List<HostHouseListDto> getHouseList(int memberCode);

	List<HouseReviewListDto> getHouseReviewList(int memberCode);

	List<ExReviewListDto> getExReviewList(int memberCode);

	List<HostExListDto> getExList(int memberCode);

	List<HouseReviewListDto> getHouseReviewListScroll(int memberCode, int startRow, int endRow);


	int allMsg(int memberCode);	//o

	int updateMsg(int memberCode, int msgCode, String msgCheck);	//o

	List<MsgDto> allMsgDto(int memberCode);	//o

	int updateHouseReview(int memberCode, int reserveCode, String revContent);	//�뀗

	List<NewExpReviewDto> myExpreviewList(int memberCode,int startRow, int endRow);	//�뀗

	List<ExReviewListDto> getExReviewListScroll(int memberCode, int startRow, int endRow);

	List<MyHouseReviewList> getMyHouseReviewListScroll(int memberCode, int startRow, int endRow);

	List<MyExReviewList> getMyExReviewListScroll(int memberCode, int startRow, int endRow);

	List<NewExpReserveDto> newExpReserve(int memberCode, String state);	//o

	List<NewHouseReserveDto> newHouseReserve(int memberCode, String state);	//o

	List<NewExpReserveDto> newNewExpReserve(int memberCode);	//o pppp
	
	List<NewHouseReserveDto> newNewHouseReserve(int memberCode);	//o

	List<PointAccumulate> allAccuPoint(int memberCode);	//o

	List<NewExpZzimDto> newExpZzimDto(int memberCode, int startRow, int endRow);	//o

	List<NewHouseZzimDto> newHouseZzimDto(int memberCode, int startRow, int endRow);	//o

	int countExpZzim(int memberCode);	//�뀗

	int countHouseZzim(int memberCode);	//�뀗

	int countPayExp(int memberCode,String state);	//o

	int countPayHouse(int memberCode,String state);	//o

	List<NewExpResDto> newExpResDto(int memberCode, String state, int startRow, int endRow);	//o

	List<NewHouseResDto> newHouseResDto(int memberCode, String state, int startRow, int endRow);	//o

	int getHouseReviewCount(int memberCode);

	int getExReviewCount(int memberCode);

	MemberDto selectMemberDto(int memberCode);

	int doExZzim(Map<String, Object> dataMap, String zzim);
  
	List<NewHouseReviewDto> myHousereviewList(int memberCode, int startRow, int endRow);	//o



}
