package com.java.guestHouse.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
//import java.sql.Date;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAspect;
import com.java.file.dto.FileDto;
import com.java.guestHouse.dao.GuestHouseDao;
import com.java.guestReserve.dto.GuestReserveDto;
import com.java.guestReserve.dto.GHouseReviewListDto;
import com.java.guestReserve.dto.RemainDto;
import com.java.guestdelluna.dto.HouseReviewDto;
import com.java.guestdelluna.dto.MsgDto;
import com.java.guestdelluna.dto.PointAccumulate;
import com.java.guestdelluna.dto.PointUse;
import com.java.host.dto.HostDto;
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
		
		int houseCode = Integer.parseInt(request.getParameter("houseCode"));
		HomeAspect.logger.info(HomeAspect.logMsg+"houseCode: "+houseCode);
		
//		int houseCode=13;
//		int houseCode = 20;
//		int houseCode = 8;

		
		hostDto = guestHouseDao.getHostInfo(houseCode);
		HomeAspect.logger.info(HomeAspect.logMsg + hostDto.toString());
		
		fileList = guestHouseDao.guestHouseImg(houseCode);
		HomeAspect.logger.info(HomeAspect.logMsg + fileList.toString());
		
		
		HttpSession session = request.getSession();
		
		email = (String)session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg+"email: "+ email);

		MemberDto member = guestHouseDao.getMemberInfo(email);
		mav.addObject("MemberDto",member);
		
		
		int emailCheck = 0;
		if(email!=null) {
			HomeAspect.logger.info(HomeAspect.logMsg + member.getMemberCode() + member.getMemberLevel());
			emailCheck =1;
			
			mav.addObject("memberCode",member.getMemberCode());
			mav.addObject("emailCheck",emailCheck);
		}else {
			emailCheck =0;
			mav.addObject("emailCheck",emailCheck);
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
			HomeAspect.logger.info(HomeAspect.logMsg+"예약여부확인");
			
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
						HomeAspect.logger.info(HomeAspect.logMsg+"intArrIn["+j+"]: "+intArrIn[j]);
					}
					result = intArrIn[0]+"-"+intArrIn[1]+"-"+intArrIn[2];
					HomeAspect.logger.info(HomeAspect.logMsg+result);
					dList.add(result);
				}
			}
			for(int i=0; i<dList.size();i++) {
				HomeAspect.logger.info(HomeAspect.logMsg+dList.get(i));
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
		
		/* 후기 리스트 */
		String pageNumber = request.getParameter("pageNumber");
		if (pageNumber == null) pageNumber = "1";
		
		int currentPage = Integer.parseInt(pageNumber); // 1) 요청 페이지 1

		int boardSize = 3; // 2) 페이지당 출력할 게시물 수
		// 시작 번호
		int startRow = (currentPage - 1) * boardSize + 1;

		// 끝 번호
		int endRow = boardSize * currentPage;
		
		int count = guestHouseDao.getReviewCnt(houseCode);
		HomeAspect.logger.info(HomeAspect.logMsg +"댓글 수: "+count);
		
		List<GHouseReviewListDto> reviewList = null;
		if(count>0) {
			reviewList = guestHouseDao.getReviewList(startRow,endRow,houseCode);
			HomeAspect.logger.info(HomeAspect.logMsg + "이 페이지에 저장된 댓글  갯수: "+ reviewList.size());
		}
		
		
		mav.addObject("hostDto",hostDto);
//		mav.addObject("explain",(hostDto.getExplain()).replaceAll("\r\n", "<br>"));
//		mav.addObject("etc",(hostDto.getEtc()).replaceAll("\r\n", "<br>"));
		mav.addObject("fileList",fileList);
		mav.addObject("host",host);
		mav.addObject("regDate",regDate);
		mav.addObject("lat",lat);
		mav.addObject("lng",lng);
		mav.addObject("remainDtoList",remainDtoList);
		mav.addObject("email",email);
		
		
		mav.addObject("reviewList", reviewList);
		mav.addObject("currentPage", currentPage);
		mav.addObject("boardSize", boardSize);
		mav.addObject("count", count);
		 
		 		
		//mav.setViewName("guestHousePage/guestPage.tiles");
		
		// 게하를 관리자가 보는 경우 exApp에 1을 임의로 넘겨줌
		
		  String exApp = request.getParameter("exApp");
		  
		  if(exApp!=null) { // 관리자가 보는 페이지는 헤더 x
			  mav.setViewName("guestHousePage/guestPage.empty");
		  }else {
			  mav.setViewName("guestHousePage/guestPage.tiles");
			  }
		 
		
		
	}
	
	@Override
	public String review(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int houseCode = Integer.parseInt(request.getParameter("houseCode"));
		int memberCode = (Integer)(request.getSession().getAttribute("memberCode"));
		HomeAspect.logger.info(HomeAspect.logMsg + "memberCode: "+memberCode);
		
		//////////////////////////후기 리스트 exReview///////////////////////////////

		String pageNumber = request.getParameter("pageNumber");
		if (pageNumber == null)
			pageNumber = "1";

		int currentPage = Integer.parseInt(pageNumber); // 1) 요청 페이지 1

		int boardSize = 3; // 2) 페이지당 출력할 게시물 수
		// 시작 번호
		int startRow = (currentPage - 1) * boardSize + 1;

		// 끝 번호
		int endRow = boardSize * currentPage;

		int count = guestHouseDao.getReviewCnt(houseCode);

		HomeAspect.logger.info(HomeAspect.logMsg + "이 회원의 댓글 갯수: " + count);

		List<GHouseReviewListDto> reviewList = null;

		if (count > 0) { // 이 페이지에 저장된 방명록이 존재 할 경우

			reviewList = guestHouseDao.getReviewList(startRow, endRow, houseCode);
			HomeAspect.logger.info(HomeAspect.logMsg + "이 페이지에 저장된 댓글  갯수: " + reviewList.size());
			// HomeAspect.logger.info(HomeAspect.logMsg + reviewList.get(0).toString());
		}

		//json
		JSONArray arr = new JSONArray();
		for (GHouseReviewListDto reviewListDto : reviewList) {
			HashMap<String, String> CommonMap = new HashMap<String, String>();
			CommonMap.put("reserveCode", Integer.toString(reviewListDto.getReserveCode()));
			CommonMap.put("memberCode", Integer.toString(reviewListDto.getMemberCode()));
			CommonMap.put("revDate", reviewListDto.getRevDate().toString());
			CommonMap.put("revContent", reviewListDto.getRevContent());
			CommonMap.put("revRate", Integer.toString(reviewListDto.getRevRate()));
			CommonMap.put("email", reviewListDto.getEmail());

			arr.add(CommonMap);

			HomeAspect.logger.info(HomeAspect.logMsg + "리뷰 정보 : " + reviewListDto.toString());
		}
		String jsonText = JSONValue.toJSONString(arr);
		HomeAspect.logger.info(HomeAspect.logMsg + "jsonText 정보 : " + jsonText);

		return jsonText;
		
		//mav.setViewName("guestHousePage/review.tiles");
	}
	
	@Override
	public Map<String, Object> review(HttpServletRequest request) {
		// jackson

		Map<String, Object> map = new HashMap<String, Object>();

		// 세션
		HttpSession session = request.getSession();
		String sessionEmail = (String) session.getAttribute("email");

		/* int exCode = 6; */
		int houseCode = Integer.parseInt(request.getParameter("houseCode"));
		// int memberCode = Integer.parseInt(request.getParameter("memberCode"));

		////////////////////////// 후기 리스트 exReview///////////////////////////////

		String pageNumber = request.getParameter("pageNumber");
		if (pageNumber == null)
			pageNumber = "1";

		int currentPage = Integer.parseInt(pageNumber); // 1) 요청 페이지 1

		int boardSize = 3; // 2) 페이지당 출력할 게시물 수
		// 시작 번호
		int startRow = (currentPage - 1) * boardSize + 1;

		// 끝 번호
		int endRow = boardSize * currentPage;

		int count = guestHouseDao.getReviewCnt(houseCode);

		HomeAspect.logger.info(HomeAspect.logMsg + "이 회원의 댓글 갯수: " + count);

		List<GHouseReviewListDto> reviewList = null;

		if (count > 0) { // 이 페이지에 저장된 방명록이 존재 할 경우

			reviewList = guestHouseDao.getReviewList(startRow, endRow, houseCode);
			HomeAspect.logger.info(HomeAspect.logMsg + "이 페이지에 저장된 댓글  갯수: " + reviewList.size());
			// HomeAspect.logger.info(HomeAspect.logMsg + reviewList.get(0).toString());
		}

		map.put("reviewList", reviewList);
		map.put("count", count);
		return map;
	}
	
	@Override
	public void reviewOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int houseCode = Integer.parseInt(request.getParameter("houseCode"));
		HomeAspect.logger.info(HomeAspect.logMsg + "houseCode: "+houseCode);

		HttpSession session = request.getSession();
		int memberCode = (Integer) session.getAttribute("memberCode");

		
		HouseReviewDto reviewDto = (HouseReviewDto)map.get("reviewDto");
		
		int getReserveCode = guestHouseDao.reserveCodeCnt(memberCode,houseCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "getReserveCode: "+getReserveCode);
		
		if(getReserveCode!=0) {
			List<GuestReserveDto> reserveList = guestHouseDao.reserveCode(houseCode,memberCode);
			HomeAspect.logger.info(HomeAspect.logMsg + "exReserveList: " + reserveList);
			
			for(int i=0; i<reserveList.size(); i++) {
				if(reserveList.get(i)!=null) {
					int reserveCode = reserveList.get(i).getReserveCode();
					
					// 예약코드로 리뷰를 작성했는지 확인
					int reviewChk = guestHouseDao.reviewChk(reserveCode);
					
					// 이미 작성했을 경우
					if(reviewChk!=0) {
						mav.addObject("reviewChk",reviewChk);
						mav.addObject("houseCode",houseCode);
						
						mav.setViewName("guestHousePage/reviewOk.tiles");
					}else {
						reviewDto.setMemberCode(memberCode);
						reviewDto.setRevDate(new Date());
						reviewDto.setRevContent(request.getParameter("revContent"));
						reviewDto.setRevRate(Integer.parseInt(request.getParameter("revRate")));
						reviewDto.setReserveCode(reserveCode);
						HomeAspect.logger.info(HomeAspect.logMsg + "reviewDto: "+reviewDto.toString());
						
						int check = guestHouseDao.writeReview(reviewDto);
						HomeAspect.logger.info(HomeAspect.logMsg + "write-Check: "+check);
						
						mav.addObject("check",check);
						mav.addObject("houseCode",houseCode);
						mav.setViewName("guestHousePage/reviewOk.tiles");
					}
				}
			}
		}else { // 게스트하우스 예약 번호가 없으면
			mav.addObject("getReserveCode",getReserveCode);
			mav.addObject("houseCode",houseCode);
			mav.setViewName("guestHousePage/reviewOk.tiles");
		}
		
	}
	
	@Override
	public void reviewUpdate(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int reserveCode = Integer.parseInt(request.getParameter("reserveCode"));
		int memberCode = Integer.parseInt(request.getParameter("memberCode"));
		
		String revContent = request.getParameter("revContent");
		HomeAspect.logger.info(HomeAspect.logMsg + "reserveCode: " +reserveCode+", memberCode: "+memberCode);
		
		HouseReviewDto reviewDto = guestHouseDao.reviewUpdate(memberCode, reserveCode);
		
		mav.addObject("reviewDto",reviewDto);
		mav.addObject("reserveCode",reserveCode);
		mav.addObject("memberCode",memberCode);
		mav.addObject("revContent",revContent);
		
		mav.setViewName("guestHousePage/reviewUpdate.empty");
		
	}@Override
	public void reviewUpdateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		HouseReviewDto reviewDto = (HouseReviewDto)map.get("reviewDto");
		reviewDto.setRevDate(new Date());
		
		HomeAspect.logger.info(HomeAspect.logMsg + reviewDto.toString());
		
		int check = guestHouseDao.reviewUpdateOk(reviewDto);
		
		mav.addObject("check");
		response.setContentType("application/x-json;charset=utf-8");
		
		try {
			PrintWriter out = response.getWriter();
			out.print(check);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void reviewDelete(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int reserveCode = Integer.parseInt(request.getParameter("reserveCode"));
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		int houseCode = Integer.parseInt(request.getParameter("houseCode"));
		
		HomeAspect.logger.info(HomeAspect.logMsg + "reserveCode : " + reserveCode + ", "+houseCode);

		int check = guestHouseDao.reviewDelete(reserveCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "check : " + check);

		mav.addObject("pageNumber", pageNumber);
		mav.addObject("check", check);
		mav.addObject("houseCode",houseCode);
		
		mav.setViewName("guestHousePage/reviewDelete.tiles");
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
				HomeAspect.logger.info(HomeAspect.logMsg+sum);
			}
		}
		
		HomeAspect.logger.info(HomeAspect.logMsg+sum);
		int check =0;

		int limit = hostDto.getPeople();		// 1
		if(limit >= (sum + people)) {			// 1 > 0 +
			check=1;
		}else {
			check=0;
		}
		HomeAspect.logger.info(HomeAspect.logMsg+"check:"+check);
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
			HomeAspect.logger.info(HomeAspect.logMsg+arrDate[0]);
			
			for(int i=1; i<night; i++) {
				cal.add(Calendar.DATE, 1);	// 1일 더해줌
				arrDate[i] = cal.getTime();	// 더해준 날짜를 배열에 저장
				HomeAspect.logger.info(HomeAspect.logMsg+arrDate[i]);
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
//		HomeAspect.logger.info(HomeAspect.logMsg+resPoint);
		
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
		mav.addObject("account",hostDto.getAccount());
		mav.addObject("mainImg",mainImg);
		mav.addObject("resPoint",resPoint);
		//mav.addObject("memberDto",memberDto);
		
		mav.setViewName("guestHousePage/guestHouseReservOk.tiles");
		//mav.setViewName("guestHousePage/kakaoPay.tiles");
	}
	
	/* 결제 방식이 카카오페이 */
	@Override
	public void kakaoPaySuccess(ModelAndView mav) {
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
		
		int payment = total-usePoint;
		HomeAspect.logger.info(HomeAspect.logMsg+"총금액:" +payment);
		
		MemberDto memberDto = guestHouseDao.getMemberInfo(email);
		
		mav.addObject("checkIn",stCheckIn);		// 예약체크인날짜
		mav.addObject("checkOut",stCheckOut);	// 예약체크아웃날짜
		mav.addObject("people",people);			// 예약인원수
		mav.addObject("usePoint",usePoint);		// 사용포인트
		mav.addObject("point",point);			// 적립포인트
		mav.addObject("memberCode",memberCode); // 예약자 멤버코드
		
		mav.addObject("payment",payment);
		mav.addObject("houseCode",houseCode);
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
		int total = Integer.parseInt(request.getParameter("paid_amount"));
		int houseCode = hostDto.getHouseCode();
		
		int memberCode =  Integer.parseInt(request.getParameter("memberCode"));
		String stCheckIn = request.getParameter("checkIn");
		String stCheckOut = request.getParameter("checkOut");
		int people = Integer.parseInt(request.getParameter("people"));
		float point = Float.parseFloat(request.getParameter("point"));
		int usePoint = Integer.parseInt(request.getParameter("usePoint"));
		
		HomeAspect.logger.info(HomeAspect.logMsg 
				+ "imp_uid: "+imp_uid+", merchant_uid:"+merchant_uid +", paid_amount:"+total);
		
		// 게스트하우스 사진
		String mainImg = null;
		for(int i=0; i<fileList.size(); i++) {
			if(fileList.get(i).getMainImgName()!=null) {
				mainImg = fileList.get(i).getMainImgName();
			}
		}
		HomeAspect.logger.info(HomeAspect.logMsg + "mainImg: "+mainImg); 
		
		
		/* 예약된 날짜 추가 */
		
		// string타입 Date타입으로 변경
		Date checkIn = null;
		Date checkOut = null;
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
			HomeAspect.logger.info(HomeAspect.logMsg+arrDate[0]);
			
			for(int i=1; i<night; i++) {
				cal.add(Calendar.DATE, 1);	// 1일 더해줌
				arrDate[i] = cal.getTime();	// 더해준 날짜를 배열에 저장
				HomeAspect.logger.info(HomeAspect.logMsg+arrDate[i]);
			}
			
			for(int i=0; i<arrDate.length; i++) {
				int remainCheckArr = guestHouseDao.insertRemain(arrDate[i], people, houseCode);
				HomeAspect.logger.info(HomeAspect.logMsg +"remainCheck: "+remainCheckArr);
			}
		}else {	// 숙박일이 1박일 경우
			int remainCheck = guestHouseDao.insertRemain(checkIn, people, houseCode);
			HomeAspect.logger.info(HomeAspect.logMsg +"remainCheck: "+remainCheck);
		}
		
		// 예약 정보 insert
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
		
		int reCheck = guestHouseDao.insertReserveInfo(guestReserveDto);
		HomeAspect.logger.info(HomeAspect.logMsg +reCheck);
		
		HomeAspect.logger.info(HomeAspect.logMsg +"checkIn: "+checkIn);
		// 예약 번호 
		int reserveCode = guestHouseDao.getReserveCode(houseCode,memberCode,checkIn);
		HomeAspect.logger.info(HomeAspect.logMsg +"reserveCode: "+reserveCode);
		
		int resPoint = (int)point;		// 적립포인트
		HomeAspect.logger.info(HomeAspect.logMsg+resPoint);
		
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
		
		// message테이블
		MsgDto msgDto = new MsgDto();
		
		msgDto.setMemberCode(guestHouseDao.getMemberCode(email));
		msgDto.setMsgContent("게스트하우스 예약완료되었습니다. 예약목록을 확인해보세요");
		msgDto.setMsgDate(new Date());
		msgDto.setMsgCheck("읽지 않음");
		
		int msgInsertCheck = guestHouseDao.insertMsg(msgDto);
		HomeAspect.logger.info(HomeAspect.logMsg + "msgInsertCheck: "+msgInsertCheck); 
		
		mav.addObject("reserveCode",reserveCode);
		mav.addObject("payment",total);
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
