package com.java.guestHouse.dao;

import java.util.Date;
import java.util.List;

import com.java.file.dto.FileDto;
import com.java.guestReserve.dto.GuestReserveDto;
import com.java.guestReserve.dto.RemainDto;
import com.java.guestdelluna.dto.PointAccumulate;
import com.java.guestdelluna.dto.PointUse;
import com.java.member.dto.MemberDto;
import com.java.host.dto.HostDto;

public interface GuestHouseDao {
	public HostDto guestHouseRead(int houseCode);
	public List<FileDto> guestHouseImg(int houseCode);
	public int getMemberCode(String email);
//	public int getPrice(int houseCode);
//	public int getHostMemberCode(int houseCode);
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
//	public int insertRemainArr(Date[] arrDate, int people, int houseCode);
	
	public List<RemainDto> getReamin(int houseCode);
	public MemberDto getMemberInfo(String email);
}
