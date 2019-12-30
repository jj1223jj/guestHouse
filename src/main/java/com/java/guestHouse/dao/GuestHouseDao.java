package com.java.guestHouse.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

public interface GuestHouseDao {
	public HostDto guestHouseRead(int houseCode);
	
	public List<FileDto> guestHouseImg(int houseCode);
	
	public int getMemberCode(String email);
	
	public HostDto getHostInfo(int houseCode);
	
	public int getPoint(String email);
	
	public MemberDto getHostList(int hostCode);
	
	public String getHouseName(int houseCode);
	
	public int insertReserveInfo(GuestReserveDto guestReserveDto);
	
	public int getReserveCode(int houseCode,int memberCode,Date checkIn);
	
	public int updatePoint(int memberPoint, int memberCode);
	
	public int insertResPoint(PointAccumulate pointAccumulate);
	
	public int insertUsePoint(PointUse pointUse);
	
	public int insertRemain(Date checkIn, int people, int houseCode);
	
	public List<RemainDto> getRemain(int houseCode);
	
	public MemberDto getMemberInfo(String email);
	
	public int insertMsg(MsgDto msgDto);
	
	public int getReviewCnt(int houseCode);
	
	public List<GHouseReviewListDto> getReviewList(int startRow, int endRow, int houseCode);
	
	public int reserveCodeCnt(int memberCode, int houseCode);
	
	public List<GuestReserveDto> reserveCode(int houseCode, int memberCode);
	
	public int reviewChk(int reserveCode);
	
	public int writeReview(HouseReviewDto reviewDto);
	
	public HouseReviewDto reviewUpdate(int memberCode, int reserveCode);
	
	public int reviewUpdateOk(HouseReviewDto reviewDto);
	
	public int reviewDelete(int reserveCode);
}
