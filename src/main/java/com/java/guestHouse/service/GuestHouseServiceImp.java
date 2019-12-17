package com.java.guestHouse.service;


import java.sql.Date;
/*import java.util.Date;*/
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAscpect;
import com.java.file.dto.FileDto;
import com.java.guestHouse.dao.GuestHouseDao;
import com.java.host.dto.HostDto;

@Component
public class GuestHouseServiceImp implements GuestHouseService {
	
	@Autowired
	GuestHouseDao guestHouseDao;
	
	@Override
	public void guestHouseRead(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		int houseCode=22;
		
		HostDto hostDto = guestHouseDao.guestHouseRead(houseCode);
		HomeAscpect.logger.info(HomeAscpect.logMsg + hostDto.toString());
		
		List<FileDto> fileList = guestHouseDao.guestHouseImg(houseCode);
		HomeAscpect.logger.info(HomeAscpect.logMsg + fileList.toString());
		
		int memberCode = guestHouseDao.getMemberCode(email);
		HomeAscpect.logger.info(HomeAscpect.logMsg + memberCode);
		
		mav.addObject("hostDto",hostDto);
		mav.addObject("fileList",fileList);
		mav.addObject("memberCode",memberCode);
		
		mav.setViewName("guestHousePage/guestPage.tiles");
		
	}
	
	@Override
	public void guestHouseReserv(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int houseCode = Integer.parseInt(request.getParameter("houseCode"));
		int memberCode = Integer.parseInt(request.getParameter("memberCode"));
		String stCheckIn = request.getParameter("checkIn");
		String stCheckOut = request.getParameter("checkOut");
		int people = Integer.parseInt(request.getParameter("people"));
		
		Date checkIn = Date.valueOf(stCheckIn);
		Date checkOut = Date.valueOf(stCheckOut);
		
		HomeAscpect.logger.info(HomeAscpect.logMsg + houseCode +","+ memberCode +","+ checkIn +"," +checkOut +"," + people);
		
		int price = guestHouseDao.getPrice(houseCode);
		
		HomeAscpect.logger.info(HomeAscpect.logMsg +price);
		
		
		
	}
}
