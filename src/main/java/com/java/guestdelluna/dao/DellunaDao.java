package com.java.guestdelluna.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.java.guestdelluna.dto.DellunaExpDto;
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

public interface DellunaDao {

	int insertReview(ReviewDto reviewDto);

	ReviewDto selectReview(int memberCode);

	int countMemberCode(int memberCode);

	List<ReviewDto> selectListReview(int memberCode);

	int reviewUpdate(ReviewDto reviewDto);

	int deleteReview(int boardNumber);

	ReviewDto clickMyReview(int boardNumber);

	int reviewCount();

	List<ReviewDto> reviewList(int startRow, int endRow);

	int findMyPoint(int memberCode);

	int countExp(int memberCode);	//o

	List<ExpReservationDto> findExpList(int memberCode);	//o

	int countHouse(int memberCode);	//o

	List<HouseReservationDto> findHouseList(int memberCode);	//o

	MemberDto selectForUpdate(String email);	//o

	int updateMember(MemberDto memberDto);	//o

	int memberDeleteOk(String email, String password);	//o

	HouseReservationDto myResHouse(int reserveCode);

	ExpReservationDto myResExp(int exCode);

	int doZzim(Map<String, Object> dataMap, String zzim);

	String selectMemberName(String email);

	int selectMemberCode(String email);	//o

	int selectExCode(int memberCode);

	int selectReserveCode(int memberCode);

	int deleteExpReserve(int exCode);

	int deleteHouseReserve(int reserveCode);

	

	List<HouseDto> houseInfo(int memberCode);

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

	int deleteExpZzim(int exCode);	//o

	List<HouseZzimDto> dtoHouseZzim(int memberCode);	//o

	List<String> zzimHouseName(int memberCode);	//o

	int deleteHouseZzim(int houseCode);	//o

	int deletePayListExp(int exReserveCode);	//o

	int deletePayListHouse(int houseReserveCode);	//o

	List<HouseReservationDto> findHouseListWithString(int memberCode, String state);	//o

	List<String> findHouseNameWithString(int memberCode, String state);	//o

	List<ExpReservationDto> findExpListWithString(int memberCode, String state);	//o

	List<String> myExNameWithString(int memberCode, String state);	//o

	List<HostHouseListDto> getHouseList(int memberCode);

	List<HouseReviewListDto> getHouseReviewList(int memberCode);

	List<ExReviewListDto> getExReviewList(int memberCode);

	List<HostExListDto> getExList(int memberCode);

	List<HouseReviewListDto> getHouseReviewListScroll(int memberCode, int startRow, int endRow);

	





}
