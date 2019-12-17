package com.java.guestHouse.dao;

import java.util.List;

import com.java.file.dto.FileDto;
import com.java.host.dto.HostDto;

public interface GuestHouseDao {
	public HostDto guestHouseRead(int houseCode);
	public List<FileDto> guestHouseImg(int houseCode);
	public int getMemberCode(String email);
	public int getPrice(int houseCode);
}
