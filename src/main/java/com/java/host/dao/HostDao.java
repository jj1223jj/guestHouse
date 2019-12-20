package com.java.host.dao;

import java.io.File;

import java.util.List;

import com.java.experience.dto.ExperienceDto;
import com.java.file.dto.FileDto;
import com.java.guestReserve.dto.GuestReserveDto;
import com.java.host.dto.HostDto;
import com.java.host.dto.ReservationListDto;
import com.java.host.dto.SearchDateList;
import com.java.member.dto.MemberDto;

public interface HostDao {

	public int subImgUpload(FileDto fileDto);

	public int hostRegister(HostDto hostDto);

	public int memberProfileImg(MemberDto memberDto);

	public int memberCode(String email);

	public int mainImgUpload(FileDto fileDto);

	public int houseCode();

	public List<HostDto> houseList(int memberCode, int startRow, int endRow);

	public int hostCancel(int houseCode);

	public List<String> houseNameList(int memberCode);

	public int getHouseCode(String houseName);

	public List<ReservationListDto> reserveViewList(int houseCode, int startRow, int endRow);

	public int getHouseCount(String email);

	public int getReserveCount(int houseCode);

	public int getExCount(int memberCode);

	public List<ExperienceDto> experienceList(int memberCode, int startRow, int endRow);

	public List<GuestReserveDto> getSales(int memberCode);

	public int getSearchDateCount(int memberCode, String startDate, String endDate);

	public List<SearchDateList> searchDateList(int memberCode, String startDate, String endDate, int startRow,
			int endRow);

}
