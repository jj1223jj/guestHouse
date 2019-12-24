package com.java.guestHouse.service;


import java.net.Inet4Address;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.java.guestReserve.dto.RemainDto;
import com.java.guestdelluna.dto.HouseDto;
import com.java.guestdelluna.dto.MsgDto;
import com.java.guestdelluna.dto.PointAccumulate;
import com.java.guestdelluna.dto.PointUse;
import com.java.host.dto.HostDto;
import com.java.host.dto.ReservationListDto;
import com.java.member.dto.MemberDto;

@Component
public class GuestHouseServiceImp implements GuestHouseService {
	
	@Autowired
	GuestHouseDao guestHouseDao;
	String email;
	HostDto hostDto;
	List<FileDto> fileList;
	int memberPoint;
	
	@Override
	public void guestHouseRead(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
//		int houseCode = Integer.Parse(request.getParameter("houseCode"));
		
//		int houseCode=63;
//		int houseCode = 101;
		int houseCode = 8;
		
		hostDto = guestHouseDao.getHostInfo(houseCode);
		HomeAspect.logger.info(HomeAspect.logMsg + hostDto.toString());
		
		fileList = guestHouseDao.guestHouseImg(houseCode);
		HomeAspect.logger.info(HomeAspect.logMsg + fileList.toString());
		
		
		HttpSession session = request.getSession();
		email = (String)session.getAttribute("email");
		System.out.println("email: "+ email);
		if(email!=null) {
			
			int memberCode = guestHouseDao.getMemberCode(email);
			HomeAspect.logger.info(HomeAspect.logMsg + memberCode);
			
			mav.addObject("memberCode",memberCode);
		}
		
		
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
		
		
		// 예약 가능 여부
		List<RemainDto> remainDtoList = guestHouseDao.getRemain(houseCode);
		HomeAspect.logger.info(HomeAspect.logMsg +remainDtoList.toString());
		
		if(!remainDtoList.isEmpty()) {
			System.out.println("예약여부확인");
			
			String[] disableDays = new String[remainDtoList.size()];
			ArrayList<String> dList = new ArrayList<String>();
			int count=0;
			SimpleDateFormat transFormat2 = new SimpleDateFormat("yyyy-MM-dd");	
			
			for(int i=0; i<remainDtoList.size(); i++) {
				if(remainDtoList.get(i).getPeople() == hostDto.getPeople()) {	// sum people 값과 예약 가능인원이 같으면
					disableDays[count] = transFormat2.format(remainDtoList.get(i).getResDate());
					HomeAspect.logger.info(HomeAspect.logMsg +disableDays[count]);
					count++;
				}
			}
			
			for(int i=0; i<disableDays.length; i++) {
				String result=null;
				HomeAspect.logger.info(HomeAspect.logMsg +disableDays[i]);
				if(disableDays[i]!=null) {
					String[] arrIn = disableDays[i].split("-");
					
					int[] intArrIn = new int[arrIn.length];
					int j=0;
					for(j=0; j<arrIn.length; j++) {
						intArrIn[j] = Integer.parseInt(arrIn[j]);
						System.out.println("intArrIn["+j+"]: "+intArrIn[j]);
					}
					result = intArrIn[0]+"-"+intArrIn[1]+"-"+intArrIn[2];
					System.out.println(result);
					dList.add(result);
				}
			}
			for(int i=0; i<dList.size();i++) {
				System.out.println(dList.get(i));
			}
			mav.addObject("dList",dList);
		}
		
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
		mav.addObject("host",host);
		mav.addObject("regDate",regDate);
		mav.addObject("lat",lat);
		mav.addObject("lng",lng);
		mav.addObject("remainDtoList",remainDtoList);
		mav.addObject("email",email);
		 		
		mav.setViewName("guestHousePage/guestPage.tiles");
		
	}
	
	/* 예약 가능 인원 확인 */
	@Override
	public void limitCheck(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		int houseCode = Integer.parseInt(request.getParameter("houseCode"));
		int memberCode = Integer.parseInt(request.getParameter("memberCode"));
		String stCheckIn = request.getParameter("checkIn");
		String stCheckOut = request.getParameter("checkOut");
		int people = Integer.parseInt(request.getParameter("people"));
		
		Date checkIn = null;
		Date checkOut = null; 
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			checkIn =format.parse(stCheckIn);
			checkOut =format.parse(stCheckIn);
			HomeAspect.logger.info(HomeAspect.logMsg + "checkInt: "+checkIn);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<RemainDto> remainDtoList = guestHouseDao.getRemain(houseCode);
		HomeAspect.logger.info(HomeAspect.logMsg +remainDtoList.toString());
		
		int sum =0;
		for(int i=0; i<remainDtoList.size();i++) {
			if(remainDtoList.get(i).getResDate() == checkIn) {
				sum = remainDtoList.get(i).getPeople();
				System.out.println(sum);
			}
		}
		
		System.out.println(sum);
		int check =0;
		int limit = hostDto.getPeople();
		if(limit > (sum + people)) {
			check=1;
		}else {
			check=0;
		}
		System.out.println("check:"+check);
		mav.addObject("houseCode",houseCode);
		mav.addObject("memberCode",memberCode);
		mav.addObject("checkIn",stCheckIn);
		mav.addObject("checkOut",stCheckOut);
		mav.addObject("people",people);
		mav.addObject("check",check);
		
		mav.setViewName("guestHousePage/check.tiles");
	}
	
	/* 결제방식선택 페이지 */
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
		
		int hostMemberCode =hostDto.getMemberCode();
		HomeAspect.logger.info(HomeAspect.logMsg +hostMemberCode);
		
		HomeAspect.logger.info(HomeAspect.logMsg + email);		
		memberPoint = guestHouseDao.getPoint(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberPoint);
		
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
		mav.addObject("point",memberPoint);
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
	
	/* 무통장 입금 예약 완료 */
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
		
		// string타입 Date타입으로 변경
		Date checkIn=null;
		Date checkOut=null;
		try {
			checkIn = new SimpleDateFormat("yyyy-MM-dd").parse(stCheckIn);
			checkOut = new SimpleDateFormat("yyyy-MM-dd").parse(stCheckOut);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
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
		
		Calendar cal = Calendar.getInstance();
		Date[] arrDate = new Date[night];				// 계산한 날짜 저장할 배열
		cal.setTime(checkIn);		// checkIn 날짜
		
		if(night>1) {	// 숙박일이 2박 이상일 경우
			arrDate[0] = cal.getTime();		// checkIn날짜 배열에 저장
			System.out.println(arrDate[0]);
			
			for(int i=1; i<night; i++) {
				cal.add(Calendar.DATE, 1);	// 1일 더해줌
				arrDate[i] = cal.getTime();	// 더해준 날짜를 배열에 저장
				System.out.println(arrDate[i]);
			}
			
			for(int i=0; i<arrDate.length; i++) {
				int remainCheckArr = guestHouseDao.insertRemain(arrDate[i], people, houseCode);
				HomeAspect.logger.info(HomeAspect.logMsg +"remainCheck: "+remainCheckArr);
			}
		}else {	// 숙박일이 1박일 경우
			int remainCheck = guestHouseDao.insertRemain(checkIn, people, houseCode);
			HomeAspect.logger.info(HomeAspect.logMsg +"remainCheck: "+remainCheck);
		}
		
		// 게스트하우스 사진
		String mainImg = null;
		for(int i=0; i<fileList.size(); i++) {
			if(fileList.get(i).getMainImgName()!=null) {
				mainImg = fileList.get(i).getMainImgName();
			}
		}
		
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
		
		HomeAspect.logger.info(HomeAspect.logMsg +"checkIn: "+checkIn);
		
		// message 테이블
		MsgDto msgDto = new MsgDto();
		
		msgDto.setMemberCode(guestHouseDao.getMemberCode(email));
		msgDto.setMsgContent("게스트하우스 예약완료되었습니다. 예약목록을 확인해보세요");
		msgDto.setMsgDate(new Date());
		msgDto.setMsgCheck("읽지 않음");
		
		int msgInsertCheck = guestHouseDao.insertMsg(msgDto);
		HomeAspect.logger.info(HomeAspect.logMsg + "msgInsertCheck: "+msgInsertCheck); 
		
		// 예약 번호 
		int reserveCode = guestHouseDao.getReserveCode(houseCode,memberCode,checkIn);
		HomeAspect.logger.info(HomeAspect.logMsg +"reserveCode: "+reserveCode);
		
		int resPoint = (int)point;
//		System.out.println(resPoint);
		
		// 멤버 포인트 수정
		memberPoint = memberPoint+ resPoint - usePoint;
		HomeAspect.logger.info(HomeAspect.logMsg +"memberPoint: "+memberPoint);
		
		// 멤버 포인트 업데이트
		int pointUpCheck = guestHouseDao.updatePoint(memberPoint,memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg +"pointUpCheck: "+pointUpCheck);
		
		// 포인트 내역 db 저장
		if(resPoint>0) {
			PointAccumulate pointAccumulate = new PointAccumulate();
			pointAccumulate.setAccuDate(guestReserveDto.getReserveDate());
			pointAccumulate.setMemberCode(memberCode);
			pointAccumulate.setAccuPlace(hostDto.getHouseName());
			pointAccumulate.setAccuPoint(resPoint);
			HomeAspect.logger.info(HomeAspect.logMsg +pointAccumulate.toString());
			
			int resPointCheck = guestHouseDao.insertResPoint(pointAccumulate);
			HomeAspect.logger.info(HomeAspect.logMsg +"resPointCheck: "+resPointCheck);
		}else{// 포인트 사용 내역
			PointUse pointUse = new PointUse();
			pointUse.setMemberCode(memberCode);
			pointUse.setUseDate(guestReserveDto.getReserveDate());
			pointUse.setUsePlace(hostDto.getHouseName());
			pointUse.setUsePoint(usePoint);
			
			int usePointCheck = guestHouseDao.insertUsePoint(pointUse);
			HomeAspect.logger.info(HomeAspect.logMsg +"usePointCheck: "+usePointCheck);
		}
		
		MemberDto memberDto = guestHouseDao.getMemberInfo(email);
		
		mav.addObject("reserveCode",reserveCode);
		mav.addObject("payment",guestReserveDto.getPayment());
		mav.addObject("houseName",hostDto.getHouseName());
		mav.addObject("explain",hostDto.getExplain());
		mav.addObject("mainImg",mainImg);
		//mav.addObject("memberDto",memberDto);
		
		mav.setViewName("guestHousePage/guestHouseReservOk.tiles");
		//mav.setViewName("guestHousePage/kakaoPay.tiles");
	}
	
	/* 결제 방식이 카카오페이 */
	@Override
	public void kakaoPaySuccess(ModelAndView mav) {
		// TODO Auto-generated method stub
		
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
		
		// string타입 Date타입으로 변경
		Date checkIn=null;
		Date checkOut=null;
		try {
			checkIn = new SimpleDateFormat("yyyy-MM-dd").parse(stCheckIn);
			checkOut = new SimpleDateFormat("yyyy-MM-dd").parse(stCheckOut);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
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
		
		Calendar cal = Calendar.getInstance();
		Date[] arrDate = new Date[night];				// 계산한 날짜 저장할 배열
		cal.setTime(checkIn);		// checkIn 날짜
		
		if(night>1) {	// 숙박일이 2박 이상일 경우
			arrDate[0] = cal.getTime();		// checkIn날짜 배열에 저장
			System.out.println(arrDate[0]);
			
			for(int i=1; i<night; i++) {
				cal.add(Calendar.DATE, 1);	// 1일 더해줌
				arrDate[i] = cal.getTime();	// 더해준 날짜를 배열에 저장
				System.out.println(arrDate[i]);
			}
			
			for(int i=0; i<arrDate.length; i++) {
				int remainCheckArr = guestHouseDao.insertRemain(arrDate[i], people, houseCode);
				HomeAspect.logger.info(HomeAspect.logMsg +"remainCheck: "+remainCheckArr);
			}
		}else {	// 숙박일이 1박일 경우
			int remainCheck = guestHouseDao.insertRemain(checkIn, people, houseCode);
			HomeAspect.logger.info(HomeAspect.logMsg +"remainCheck: "+remainCheck);
		}
		
//		// 게스트하우스 사진
//		String mainImg = null;
//		for(int i=0; i<fileList.size(); i++) {
//			if(fileList.get(i).getMainImgName()!=null) {
//				mainImg = fileList.get(i).getMainImgName();
//			}
//		}
		
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
		
		HomeAspect.logger.info(HomeAspect.logMsg +"checkIn: "+checkIn);
		// 예약 번호 
		int reserveCode = guestHouseDao.getReserveCode(houseCode,memberCode,checkIn);
		HomeAspect.logger.info(HomeAspect.logMsg +"reserveCode: "+reserveCode);
		
		int resPoint = (int)point;
//		System.out.println(resPoint);
		
		// 멤버 포인트 수정
		memberPoint = memberPoint+ resPoint - usePoint;
		HomeAspect.logger.info(HomeAspect.logMsg +"memberPoint: "+memberPoint);
		
		// 멤버 포인트 업데이트
		int pointUpCheck = guestHouseDao.updatePoint(memberPoint,memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg +"pointUpCheck: "+pointUpCheck);
		
		// 포인트 내역 db 저장
		if(resPoint>0) {
			PointAccumulate pointAccumulate = new PointAccumulate();
			pointAccumulate.setAccuDate(guestReserveDto.getReserveDate());
			pointAccumulate.setMemberCode(memberCode);
			pointAccumulate.setAccuPlace(hostDto.getHouseName());
			pointAccumulate.setAccuPoint(resPoint);
			HomeAspect.logger.info(HomeAspect.logMsg +pointAccumulate.toString());
			
			int resPointCheck = guestHouseDao.insertResPoint(pointAccumulate);
			HomeAspect.logger.info(HomeAspect.logMsg +"resPointCheck: "+resPointCheck);
		}else{// 포인트 사용 내역
			PointUse pointUse = new PointUse();
			pointUse.setMemberCode(memberCode);
			pointUse.setUseDate(guestReserveDto.getReserveDate());
			pointUse.setUsePlace(hostDto.getHouseName());
			pointUse.setUsePoint(usePoint);
			
			int usePointCheck = guestHouseDao.insertUsePoint(pointUse);
			HomeAspect.logger.info(HomeAspect.logMsg +"usePointCheck: "+usePointCheck);
		}
		
		MemberDto memberDto = guestHouseDao.getMemberInfo(email);
		
		mav.addObject("reserveCode",reserveCode);
		mav.addObject("guestReserveDto",guestReserveDto);
//		mav.addObject("hostDto",hostDto);
//		mav.addObject("mainImg",mainImg);
		mav.addObject("memberDto",memberDto);
		mav.setViewName("guestHousePage/kakaoPay.tiles");
		 
	}
	
	/* 카카오 페이 예약 완료 */
	@Override
	public void kakaoPayCompleteOk(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");		
		
		String imp_uid = request.getParameter("imp_uid");
		String merchant_uid = request.getParameter("merchant_uid");
		int paid_amount = Integer.parseInt(request.getParameter("paid_amount"));
		int reserveCode = Integer.parseInt(request.getParameter("reserveCode"));
		int houseCode = hostDto.getHouseCode();
		
		HomeAspect.logger.info(HomeAspect.logMsg 
				+ "imp_uid: "+imp_uid+", merchant_uid:"+merchant_uid +", reserveCode:"+reserveCode+", paid_amount:"+paid_amount);
		
		// 게스트하우스 사진
		String mainImg = null;
		for(int i=0; i<fileList.size(); i++) {
			if(fileList.get(i).getMainImgName()!=null) {
				mainImg = fileList.get(i).getMainImgName();
			}
		}
		HomeAspect.logger.info(HomeAspect.logMsg + "mainImg: "+mainImg); 
		
		// message테이블
		MsgDto msgDto = new MsgDto();
		
		msgDto.setMemberCode(guestHouseDao.getMemberCode(email));
		msgDto.setMsgContent("게스트하우스 예약완료되었습니다. 예약목록을 확인해보세요");
		msgDto.setMsgDate(new Date());
		msgDto.setMsgCheck("읽지 않음");
		
		int msgInsertCheck = guestHouseDao.insertMsg(msgDto);
		HomeAspect.logger.info(HomeAspect.logMsg + "msgInsertCheck: "+msgInsertCheck); 
		
		mav.addObject("reserveCode",reserveCode);
		mav.addObject("payment",paid_amount);
		mav.addObject("houseName",hostDto.getHouseName());
		mav.addObject("explain",hostDto.getExplain());
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
