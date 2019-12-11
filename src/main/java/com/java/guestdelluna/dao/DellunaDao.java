package com.java.guestdelluna.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.java.guestdelluna.dto.ReviewDto;

public interface DellunaDao {

	int insertReview(ReviewDto reviewDto);

	ReviewDto selectReview(int memberCode);

	int countMemberCode(int memberCode);

	List<ReviewDto> selectListReview(int memberCode);

	

}
