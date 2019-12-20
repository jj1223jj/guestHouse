package com.java.guestHouse.service;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
//import java.sql.Date;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAspect;
import com.java.file.dto.FileDto;
import com.java.guestHouse.dao.GuestHouseDao;
import com.java.guestReserve.dto.GuestReserveDto;

import com.java.host.dto.HostDto;
import com.java.member.dto.MemberDto;

@Component
public class GuestHouseServiceImp implements GuestHouseService {
	
	@Autowired
	GuestHouseDao guestHouseDao;
	String email;
	HostDto hostDto;
	List<FileDto> fileList;
	
	@Override
	public void guestHouseRead(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		email = (String)session.getAttribute("email");
		
		int houseCode=63;
		
//		 int houseCode = 8;
		
		hostDto = guestHouseDao.getHostInfo(houseCode);
		HomeAspect.logger.info(HomeAspect.logMsg + hostDto.toString());
		
		fileList = guestHouseDao.guestHouseImg(houseCode);
		HomeAspect.logger.info(HomeAspect.logMsg + fileList.toString());
		
		int memberCode = guestHouseDao.getMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);
		
		int hostCode = hostDto.getMemberCode();
		HomeAspect.logger.info(HomeAspect.logMsg  + hostCode);
		
		MemberDto host = guestHouseDao.getHostList(hostCode);
		HomeAspect.logger.info(HomeAspect.logMsg  + host.toString());
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM");	
		String regDate = transFormat.format(host.getRegDate());
		HomeAspect.logger.info(HomeAspect.logMsg  + regDate);
		
		String[] arrLatLng = hostDto.getLatLng().split(",");
		
		float lat = Float.parseFloat(arrLatLng[0]);
		float lng = Float.parseFloat(arrLatLng[1]);
		HomeAspect.logger.info(HomeAspect.logMsg + lat +", "+lng);
		
//		String bfPath = fileList.get(0).getFilePath();
//		String[] arr = bfPath.split(":");
//		String afPath = arr[0] +":" +"\\"+arr[1];
//		String mainImg=null;
//		//String mainImgSrc = null;
//		String[] img = new String[fileList.size()];
//		for(int i=0; i<fileList.size(); i++) {
//			if(fileList.get(i).getMainImgName()!=null) {
//				//mainImgSrc = afPath + "\\" + "\\"+fileList.get(i).getMainImgName();
//				//HomeAspect.logger.info(HomeAspect.logMsg +mainImgSrc);
//				mainImg = fileList.get(i).getMainImgName();
//			}else {
//				img[i] = fileList.get(i).getFileName();
//				HomeAspect.logger.info(HomeAspect.logMsg  +img[i]);
//			}
//		}
		
		mav.addObject("hostDto",hostDto);
		mav.addObject("fileList",fileList);
		mav.addObject("memberCode",memberCode);
		mav.addObject("host",host);
		mav.addObject("regDate",regDate);
		mav.addObject("lat",lat);
		mav.addObject("lng",lng);
		
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
				
		//Date checkIn = Date.valueOf(stCheckIn) ;
		//Date checkOut =  Date.valueOf(stCheckOut) ;
		
		String[] arrIn = stCheckIn.split("-");
		String[] arrOut = stCheckOut.split("-");
		
		int[] intArrIn = new int[arrIn.length];
		for(int i=0; i<arrIn.length; i++) {
			intArrIn[i] = Integer.parseInt(arrIn[i]);
		}
		
		int[] intArrOut = new int[arrOut.length];
		for(int i=0; i<arrOut.length; i++) {
			intArrOut[i] = Integer.parseInt(arrOut[i]);
		}
	
		int night = GetDifferenceOfDate(intArrIn[0] ,intArrIn[1] , intArrIn[2] , intArrOut[0], intArrOut[1], intArrOut[2]);
		HomeAspect.logger.info(HomeAspect.logMsg +"night : " + night);
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");		
		
		Date checkIn = null;
		Date checkOut = null;
		
		try {
			checkIn = transFormat.parse(stCheckIn);
			checkOut = transFormat.parse(stCheckOut);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HomeAspect.logger.info(HomeAspect.logMsg + houseCode +","+ memberCode +","+ stCheckIn +"," +stCheckOut +"," + people);

//		HostDto hostDto = guestHouseDao.getHostInfo(houseCode);
		HomeAspect.logger.info(HomeAspect.logMsg +hostDto.toString());
		
//		int price = guestHouseDao.getPrice(houseCode);
//		HomeAspect.logger.info(HomeAspect.logMsg +price);
		
//		int hostMemberCode = guestHouseDao.getHostMemberCode(houseCode);
		
		int hostMemberCode =hostDto.getMemberCode();
		HomeAspect.logger.info(HomeAspect.logMsg +hostMemberCode);
		
		HomeAspect.logger.info(HomeAspect.logMsg + email);		
		int point = guestHouseDao.getPoint(email);
		HomeAspect.logger.info(HomeAspect.logMsg + point);
		
		int total = hostDto.getPrice()*night*people;
		
		//List<FileDto> fileList = guestHouseDao.guestHouseImg(houseCode);
		//HomeAspect.logger.info(HomeAspect.logMsg + fileList.toString());
		
		String mainImg = null;
		for(int i=0; i<fileList.size(); i++) {
			if(fileList.get(i).getMainImgName()!=null) {
				mainImg = fileList.get(i).getMainImgName();
			}
		}
		
//		int hostRev = guestHouseDao.getHostRevCount(hostDto);
		
		mav.addObject("houseCode",houseCode);
		mav.addObject("memberCode",memberCode);
		mav.addObject("checkIn",stCheckIn);
		mav.addObject("checkOut",stCheckOut);
		mav.addObject("people",people);
		mav.addObject("hostDto",hostDto);
		mav.addObject("point",point);
		mav.addObject("night",night);
		mav.addObject("total",total);
		mav.addObject("mainImg",mainImg);
		
		mav.setViewName("guestHousePage/guestHouseReserv.tiles");
		
		/*
		 * GuestReserveDto reserveDto = null;
		 * 
		 * reserveDto.setReserveDate(new Date());
		 */

	}
	
	@Override
	public void reservComplete(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int houseCode =  Integer.parseInt(request.getParameter("houseCode"));
		int memberCode =  Integer.parseInt(request.getParameter("memberCode"));
		String stCheckIn = request.getParameter("checkIn");
		String stCheckOut = request.getParameter("checkOut");
		int people = Integer.parseInt(request.getParameter("people"));
		int total = Integer.parseInt(request.getParameter("total"));
		float point = Float.parseFloat(request.getParameter("point"));
		int usePoint = Integer.parseInt(request.getParameter("usePoint"));
		
		HomeAspect.logger.info(HomeAspect.logMsg + houseCode +", "+memberCode+", "
		+people+", "+stCheckIn+", "+stCheckOut+", "+total+", "+point+", "+usePoint);
		
		Date checkIn=null;
		Date checkOut=null;
		try {
			checkIn = new SimpleDateFormat("yyyy-MM-dd").parse(stCheckIn);
			checkOut = new SimpleDateFormat("yyyy-MM-dd").parse(stCheckOut);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		String houseName = guestHouseDao.getHouseName(houseCode);
		
		GuestReserveDto guestReserveDto = new GuestReserveDto();
		
		guestReserveDto.setHouseCode(houseCode);
		guestReserveDto.setMemberCode(memberCode);
		guestReserveDto.setCheckIn(checkIn);
		guestReserveDto.setCheckOut(checkOut);
		guestReserveDto.setReserveDate(new Date());
		guestReserveDto.setPayment(total);
		guestReserveDto.setState("예약완료");
		guestReserveDto.setPeople(people);		//guestReserveDto에 people 추가
		
		HomeAspect.logger.info(HomeAspect.logMsg +guestReserveDto.toString());
		
		// 예약 정보 insert
		int reCheck = guestHouseDao.insertReserveInfo(guestReserveDto);
		HomeAspect.logger.info(HomeAspect.logMsg +reCheck);
		
		// 예약 번호 
		int reserveCode = guestHouseDao.getReserveCode(houseCode,memberCode,checkIn);
		HomeAspect.logger.info(HomeAspect.logMsg +"reserveCode: "+reserveCode);
		
		int resPoint = (int)point;
		
		System.out.println(resPoint);
		
		// 멤버 포인트 업데이트
//		int pointUpChect = guestHouseDao.updatePoint(resPoint,usePoint);
		
		// 게스트하우스 사진
		String mainImg = null;
		for(int i=0; i<fileList.size(); i++) {
			if(fileList.get(i).getMainImgName()!=null) {
				mainImg = fileList.get(i).getMainImgName();
			}
		}
				
		mav.addObject("reserveCode",reserveCode);
		mav.addObject("guestReserveDto",guestReserveDto);
		mav.addObject("hostDto",hostDto);
		mav.addObject("mainImg",mainImg);
		
		mav.setViewName("guestHousePage/guestHouseReservOk.tiles");
	}
	
	public static int GetDifferenceOfDate(int nYear1,int nMonth1, int nDate1, int nYear2, int nMonth2, int nDate2) {
		
		Calendar cal = Calendar.getInstance();
		int nTotalDate1  = 0;
		int nTotalDate2  = 0;
		int nDiffOfYear  = 0;
		int nDiffOfDay  = 0;
		
		if(nYear2>nYear1) {
			for ( int i = nYear1; i < nYear2; i++ ) {
				cal.set ( i, 12, 0 );
				nDiffOfYear += cal.get ( Calendar.DAY_OF_YEAR );
				}
				nTotalDate2 += nDiffOfYear;
		}
		cal.set ( nYear1, nMonth1-1, nDate1 );
		nDiffOfDay = cal.get ( Calendar.DAY_OF_YEAR );
		nTotalDate1 += nDiffOfDay;
		
		cal.set ( nYear2, nMonth2-1, nDate2 );
		nDiffOfDay = cal.get ( Calendar.DAY_OF_YEAR );
		nTotalDate2 += nDiffOfDay;
		
		return nTotalDate2-nTotalDate1;
	}
}
