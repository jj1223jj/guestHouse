package com.java.experience.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.java.exfile.dto.ExFileDto;
import com.java.experience.dto.ExperienceDto;
import com.java.experience.dto.ExperienceMainDto;
import com.java.experience.dto.GuestHouseMainDto;
import com.java.exremain.dto.ExRemainDto;
import com.java.exreserve.dto.ExReserveDto;
import com.java.exreview.dto.ExReviewDto;
import com.java.exreview.dto.ExReviewListDto;
import com.java.guestdelluna.dto.PointAccumulate;
import com.java.guestdelluna.dto.PointUse;
import com.java.host.dto.HostDto;
import com.java.member.dto.MemberDto;

public interface ExperienceDao {

	public int subImgUpload(ExFileDto exFileDto);

	public int memberCode(String email);

	public int exHostRegister(ExperienceDto experienceDto);

	public int mainImgUpload(ExFileDto exFileDto);

	public int exCode();

	public List<HostDto> hostChkList(int memberCode);

	public int getReviewCnt(int exCode);

	public List<ExReviewListDto> getExReviewList(int startRow, int endRow, int exCode); 

	//예약번호가 있는지
	public int reserveCodeCnt(int memberCode,int exCode);

	public int writeReview(ExReviewDto exReviewDto);

	public ExReviewDto exReviewUpdate(int memberCode, int exReserveCode);

	public int exReviewUpdateOk(ExReviewDto exReviewDto);

	public int exReviewDelete(int exReserveCode);

	public ExperienceDto exPage(int exCode);

	public List<ExFileDto> exPageImgList(int exCode);

	public MemberDto exHostInfo(int memberCode);

	public int exPayment(int exPeople, int exCode);

	public int getPoint(String email);

	public int insertExReserve(ExReserveDto exReserveDto);

	public int getExReserveCode(int exCode, int memberCode, Date exDate);

	public int pointUpdate(int memberCode, int plusPoint);

	// 후기 작성시 해당 멤버의 예약번호 가져옴
	public List<ExReserveDto> exReserveCode(int exCode, int memberCode);
	
	// 댓글 작성을 했을 경우 또 작성할 수 없게 예약코드가 리뷰 테이블에 존재하는 지 확인
	public int reviewChk(int exReserveCode);

	//달력 체험하는 인원 세기
	public List<ExReserveDto> reserveList(int exCode, Date exDate);
	// 하루에 수용 가능한 인원
	public int getPeople(int exCode);

	// 체험코드로 남은!!!
	public List<ExRemainDto> getExRemain(int exCode);

	public int insertExRemain(Date exDate, int exPeople, int exCode);

	public int message(int memberCode, String msgContent, Date msgDate, String msgCheck);

	public int resPointUp(PointAccumulate pointAccumulate);

	public int usePointUp(PointUse pointUse);

	// 카카오페이
	public MemberDto getMemberInfo(String email);

	// 체험 메인
	public List<ExperienceMainDto> searchMainEx();

	// 게하 메인
	public List<GuestHouseMainDto> searchMain();

	public List<String> exDisableDates(Map<String, Object> map);










}
