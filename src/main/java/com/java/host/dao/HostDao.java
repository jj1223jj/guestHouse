package com.java.host.dao;

import java.io.File;

import java.util.List;

import com.java.file.dto.FileDto;
import com.java.host.dto.HostDto;
import com.java.host.dto.ReservationListDto;
import com.java.member.dto.MemberDto;

public interface HostDao {

	public int subImgUpload(FileDto fileDto);

	public int hostRegister(HostDto hostDto);

	public int memberProfileImg(MemberDto memberDto);

	public int memberCode(String email);

	public int mainImgUpload(FileDto fileDto);

	public int houseCode();

	public List<HostDto> houseList(int memberCode);

	public int hostCancel(int houseCode);

	public List<String> houseNameList(int memberCode);

	public int getHouseCode(String houseName);

	public List<ReservationListDto> reserveViewList(int houseCode);

	public int getCount(String email);

}
