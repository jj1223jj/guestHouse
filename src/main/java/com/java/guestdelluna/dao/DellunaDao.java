package com.java.guestdelluna.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.java.guestdelluna.dto.ExpReservationDto;
import com.java.guestdelluna.dto.HouseReservationDto;
import com.java.guestdelluna.dto.MemberDto;
import com.java.guestdelluna.dto.ReviewDto;

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

	int countExp(int memberCode);

	ExpReservationDto findExpDto(int memberCode);

	List<ExpReservationDto> findExpList(int memberCode);

	int countHouse(int memberCode);

	HouseReservationDto findHouseDto(int memberCode);

	List<ExpReservationDto> findHouseList(int memberCode);

	MemberDto selectForUpdate(String email);

	int updateMember(MemberDto memberDto);

	int memberDeleteOk(String email, String password);

	HouseReservationDto myResHouse(int reserveCode);

	ExpReservationDto myResExp(int exCode);

	

}
