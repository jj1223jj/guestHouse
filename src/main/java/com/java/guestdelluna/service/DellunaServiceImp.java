package com.java.guestdelluna.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.logging.Log;
import org.json.simple.JSONArray;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.aop.HomeAspect;
import com.java.guestdelluna.dao.DellunaDao;
import com.java.guestdelluna.dto.ExpReservationDto;
import com.java.guestdelluna.dto.ExpReviewDto;
import com.java.guestdelluna.dto.ExpZzimDto;
import com.java.guestdelluna.dto.HouseDto;
import com.java.guestdelluna.dto.HouseReservationDto;
import com.java.guestdelluna.dto.HouseReviewDto;
import com.java.guestdelluna.dto.HouseZzimDto;
import com.java.guestdelluna.dto.MemberDto;
import com.java.guestdelluna.dto.MsgDto;

import com.java.guestdelluna.dto.MyExReviewList;
import com.java.guestdelluna.dto.MyHouseReviewList;
import com.java.guestdelluna.dto.NewExpResDto;
import com.java.guestdelluna.dto.NewExpReserveDto;
import com.java.guestdelluna.dto.NewExpReviewDto;
import com.java.guestdelluna.dto.NewExpZzimDto;
import com.java.guestdelluna.dto.NewHouseResDto;
import com.java.guestdelluna.dto.NewHouseReserveDto;
import com.java.guestdelluna.dto.NewHouseReviewDto;
import com.java.guestdelluna.dto.NewHouseZzimDto;
import com.java.guestdelluna.dto.PointAccumulate;
import com.java.guestdelluna.dto.PointUse;
import com.java.host.dto.ExReviewListDto;
import com.java.host.dto.HostExListDto;
import com.java.host.dto.HostHouseListDto;
import com.java.host.dto.HouseReviewListDto;

@Component
public class DellunaServiceImp implements DellunaService {

	@Autowired
	private DellunaDao dellunaDao;

	// 찜목록불러오기
	@Override
	public void zzimlist(ModelAndView mav) {
		// TODO Auto-generated method stub

		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);
		
		int countExpZzim = dellunaDao.countExpZzim(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode + "의 체험 찜 개수 : " + countExpZzim);

		int countHouseZzim = dellunaDao.countHouseZzim(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode + "의 게하 찜 개수 : " + countHouseZzim);
		
		String accuPageNumber = request.getParameter("accuPageNumber");
		if (accuPageNumber == null)
			accuPageNumber = "1";

		int accuCurrentPage = Integer.parseInt(accuPageNumber);
		HomeAspect.logger.info(HomeAspect.logMsg + "현재 체험찜페이지 : " + accuCurrentPage);
		
		String usePageNumber = request.getParameter("usePageNumber");
		if (usePageNumber == null)
			usePageNumber = "1";
		
		int useCurrentPage = Integer.parseInt(usePageNumber);
		HomeAspect.logger.info(HomeAspect.logMsg + "현재 게하찜페이지 : " + useCurrentPage);
		
		int boardSize = 5;

		int startRow = (accuCurrentPage - 1) * boardSize + 1;
		int endRow = startRow + boardSize -1;

		int useStartRow = (useCurrentPage - 1) * boardSize + 1;
		int useEndRow = useStartRow + boardSize-1;
		
		List<NewExpZzimDto> newExpZzimDto = dellunaDao.newExpZzimDto(memberCode,startRow,endRow);
		HomeAspect.logger.info(HomeAspect.logMsg + "newExpZzimDto : " + newExpZzimDto);
		
		List<NewHouseZzimDto> newHouseZzimDto = dellunaDao.newHouseZzimDto(memberCode,useStartRow,useEndRow);
		HomeAspect.logger.info(HomeAspect.logMsg + "newHouseZzimDto : " + newHouseZzimDto);
		
		MemberDto memberDto = dellunaDao.selectForUpdate(email);
		
		mav.addObject("countExpZzim", countExpZzim);
		mav.addObject("countHouseZzim", countHouseZzim);
		mav.addObject("memberDto", memberDto);
		mav.addObject("newHouseZzimDto", newHouseZzimDto);
		mav.addObject("newExpZzimDto", newExpZzimDto);
		mav.addObject("boardSize", boardSize);
		mav.addObject("useCurrentPage", useCurrentPage);
		mav.addObject("accuCurrentPage", accuCurrentPage);

		mav.setViewName("guestdelluna/zzimlist.tiles");

	}
	
	@Override
	public void zzimExpAjax(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		String accuPageNumber = request.getParameter("accuPageNumber");
		if (accuPageNumber == null)
			accuPageNumber = "1";

		int accuCurrentPage = Integer.parseInt(accuPageNumber);
		HomeAspect.logger.info(HomeAspect.logMsg + "현재 체험 찜 페이지 : " + accuCurrentPage);

		int countExpZzim = dellunaDao.countExpZzim(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode + "의 체험 찜 개수 : " + countExpZzim);

		int boardSize = 5;

		int startRow = (accuCurrentPage - 1) * boardSize + 1;
		int endRow = startRow + boardSize-1;

		System.out.println(startRow + "," + endRow);

		List<NewExpZzimDto> newHouseZzimDto = null;
		if (countExpZzim > 0) {
			newHouseZzimDto = dellunaDao.newExpZzimDto(memberCode,startRow,endRow);
			HomeAspect.logger.info(HomeAspect.logMsg + "체험찜 로우넘 리스트 : " + newHouseZzimDto);
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonList = "";

		try {
			jsonList = mapper.writeValueAsString(newHouseZzimDto);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		response.setContentType("application/text;charset=utf-8");
		PrintWriter out;
		
		//얻은데이터를 json형식으로 바꾸기
		
		try {
			out = response.getWriter();
			out.print(jsonList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HomeAspect.logger.info(HomeAspect.logMsg + "jsonList : " + jsonList) ;
		
		mav.addObject("jsonList", jsonList);
		mav.addObject("newHouseZzimDto", newHouseZzimDto);
		
	}

	@Override
	public void zzimHouseAjax(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		String usePageNumber = request.getParameter("usePageNumber");
		if (usePageNumber == null)
			usePageNumber = "1";
		
		int useCurrentPage = Integer.parseInt(usePageNumber);
		HomeAspect.logger.info(HomeAspect.logMsg + "현재 게하찜페이지 : " + useCurrentPage);
		
		int countHouseZzim = dellunaDao.countHouseZzim(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode + "의 게하 찜 개수 : " + countHouseZzim);

		int boardSize = 5;

		int useStartRow = (useCurrentPage - 1) * boardSize + 1;
		int useEndRow = useStartRow + boardSize - 1;

		System.out.println(useStartRow + "," + useEndRow);

		List<NewHouseZzimDto> newHouseZzimDto = null;
		if (countHouseZzim > 0) {
			newHouseZzimDto = dellunaDao.newHouseZzimDto(memberCode,useStartRow,useEndRow);
			HomeAspect.logger.info(HomeAspect.logMsg + "하우스찜 로우넘 리스트 : " + newHouseZzimDto);
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonList = "";

		try {
			jsonList = mapper.writeValueAsString(newHouseZzimDto);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		response.setContentType("application/text;charset=utf-8");
		PrintWriter out;
		
		//얻은데이터를 json형식으로 바꾸기
		
		try {
			out = response.getWriter();
			out.print(jsonList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HomeAspect.logger.info(HomeAspect.logMsg + "jsonList : " + jsonList) ;
		
		mav.addObject("jsonList", jsonList);
		mav.addObject("newHouseZzimDto", newHouseZzimDto);
	}

	// 찜한 게스트하우스 삭제
	@Override
	public String zzimCancle(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		int houseCode = Integer.parseInt(request.getParameter("hsValue"));
		HomeAspect.logger.info(HomeAspect.logMsg + houseCode);

		int check = dellunaDao.deleteHouseZzim(houseCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "게스트하우스 찜삭제 : " + check);

		return null;
	}

	@Override

	public void doZzim(String memberCode, String houseCode, String zzim) {

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("memberCode", memberCode);
		dataMap.put("houseCode", houseCode);

		int check = dellunaDao.doZzim(dataMap, zzim);
		HomeAspect.logger.info(HomeAspect.logMsg + "check: " + check);
	}

	public String zzimExpCancle(ModelAndView mav) {
		// TODO Auto-generated method stub

		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		int exCode = Integer.parseInt(request.getParameter("value"));
		HomeAspect.logger.info(HomeAspect.logMsg + "eeeeeeeeeeeeeeeeexcode" + exCode);

		int check = dellunaDao.deleteExpZzim(exCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "체험찜삭제 ㅊㅋ : " + check);

		return null;
	}

	@Override
	public String reviewUpdate(ModelAndView mav) {
		// TODO Auto-generated method stub

		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		int exReserveCode = Integer.parseInt(request.getParameter("exValue"));
		HomeAspect.logger.info(HomeAspect.logMsg + "넘어온 체험 예약 번호 : " + exReserveCode);

		// dto받아서 셀렉트
		ExpReviewDto expReviewDto = dellunaDao.findMyReview(memberCode, exReserveCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "받아온 리뷰 DTO : " + expReviewDto);

		return null;

	}

	// 체험후기수정
	@Override
	public void reviewUpdateOk(ModelAndView mav) {
		// TODO Auto-generated method stub

		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		int exReserveCode = Integer.parseInt(request.getParameter("expUpResCode"));
		HomeAspect.logger.info(HomeAspect.logMsg + "리케스트로 받은 체험예약번호는 : " + exReserveCode);

		String revContent = request.getParameter("expRevContent");
		HomeAspect.logger.info(HomeAspect.logMsg + "리케스트로 받은 수정내뇽 : " + revContent);

		int check = dellunaDao.updateExpReview(memberCode, exReserveCode, revContent);

	}

	@Override
	public void reviewDelete(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		int exReserveCode = Integer.parseInt(request.getParameter("value"));
		HomeAspect.logger.info(HomeAspect.logMsg + "exResCode : " + exReserveCode);

		int check = dellunaDao.deleteReview(exReserveCode, memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + check);

		mav.addObject("check", check);
		mav.setViewName("guestdelluna/reviewDeleteOk.tiles");

	}

	@Override
	public void revExpAjax(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);
		
		String accuPageNumber = request.getParameter("accuPageNumber");
		if (accuPageNumber == null)
			accuPageNumber = "1";

		int accuCurrentPage = Integer.parseInt(accuPageNumber);
		HomeAspect.logger.info(HomeAspect.logMsg + "현재 페이지 : " + accuCurrentPage);
		
		int countExpReview = dellunaDao.expReviewCount(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "체험 후기 개수 : " + countExpReview);
		
		int boardSize = 5;

		int startRow = (accuCurrentPage - 1) * boardSize + 1;
		int endRow = startRow + boardSize - 1;

		System.out.println(startRow + "," + endRow);
		
		List<NewExpReviewDto> myExpreviewList = null;

		if(countExpReview>0) {
			myExpreviewList = dellunaDao.myExpreviewList(memberCode,startRow,endRow);
			HomeAspect.logger.info(HomeAspect.logMsg + "내가 쓴 체험후기 : " + myExpreviewList.toString());
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonList = "";

		try {
			jsonList = mapper.writeValueAsString(myExpreviewList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		response.setContentType("application/text;charset=utf-8");
		PrintWriter out;
		
		//얻은데이터를 json형식으로 바꾸기
		
		try {
			out = response.getWriter();
			out.print(jsonList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HomeAspect.logger.info(HomeAspect.logMsg + "jsonList : " + jsonList) ;
		
		mav.addObject("jsonList", jsonList);
		mav.addObject("myExpreviewList", myExpreviewList);
	}

	@Override
	public void revHouseAjax(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);
		
		String usePageNumber = request.getParameter("usePageNumber");
		if (usePageNumber == null)
			usePageNumber = "1";

		int useCurrentPage = Integer.parseInt(usePageNumber);
		HomeAspect.logger.info(HomeAspect.logMsg + "사용 적립페이지 : " + useCurrentPage);
		
		int countHouseReview = dellunaDao.houseReviewCount(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "게하 후기 개수  : " + countHouseReview);
		
		int boardSize = 5;

		int useStartRow = (useCurrentPage - 1) * boardSize + 1;
		int useEndRow = useStartRow + boardSize -1;

		System.out.println(useStartRow + "," + useEndRow);
		
		List<NewHouseReviewDto> myHousereviewList = null;

		if(countHouseReview>0) {
			myHousereviewList = dellunaDao.myHousereviewList(memberCode,useStartRow,useEndRow);
			HomeAspect.logger.info(HomeAspect.logMsg + "내가 쓴 게하후기 : " + myHousereviewList.toString());
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonList = "";

		try {
			jsonList = mapper.writeValueAsString(myHousereviewList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		response.setContentType("application/text;charset=utf-8");
		PrintWriter out;
		
		//얻은데이터를 json형식으로 바꾸기
		
		try {
			out = response.getWriter();
			out.print(jsonList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HomeAspect.logger.info(HomeAspect.logMsg + "jsonList : " + jsonList) ;
		
		mav.addObject("jsonList", jsonList);
		mav.addObject("myHousereviewList", myHousereviewList);
	}
	
	// 내가 쓴 리뷰 리스트
	@Override
	public void myReviewList(ModelAndView mav) {
		// TODO Auto-generated method stub

		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		String accuPageNumber = request.getParameter("accuPageNumber");
		if (accuPageNumber == null)
			accuPageNumber = "1";

		int accuCurrentPage = Integer.parseInt(accuPageNumber);
		HomeAspect.logger.info(HomeAspect.logMsg + "현재 적립페이지 : " + accuCurrentPage);
		
		String usePageNumber = request.getParameter("usePageNumber");
		if (usePageNumber == null)
			usePageNumber = "1";

		int useCurrentPage = Integer.parseInt(usePageNumber);
		HomeAspect.logger.info(HomeAspect.logMsg + "사용 적립페이지 : " + useCurrentPage);

		// 체험 후기 개수
		int countExpReview = dellunaDao.expReviewCount(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "체험 후기 개수 : " + countExpReview);

		// 게하 후기 개수
		int countHouseReview = dellunaDao.houseReviewCount(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "게하 후기 개수  : " + countHouseReview);

		// 후기 페이징 기법
		int boardSize = 3;
		int startRow = (accuCurrentPage - 1) * boardSize + 1;
		int endRow = startRow + boardSize -1;

		int useStartRow = (useCurrentPage - 1) * boardSize + 1;
		int useEndRow = useStartRow + boardSize -1;

		MemberDto memberDto = dellunaDao.selectForUpdate(email);
		
		// 내가 쓴 체험 리뷰리스트 (using newDto)
		List<NewExpReviewDto> myExpreviewList = dellunaDao.myExpreviewList(memberCode,startRow,endRow);
		HomeAspect.logger.info(HomeAspect.logMsg + "내가 쓴 체험 후기 myExpreviewList  : " + myExpreviewList);

		// 내가 쓴 게스트하우스 리뷰 리스트 (using newDto)
		List<NewHouseReviewDto> myHousereviewList = dellunaDao.myHousereviewList(memberCode,useStartRow,useEndRow);
		HomeAspect.logger.info(HomeAspect.logMsg + "내가 쓴 게하 후기 myHousereviewList " + myHousereviewList);
		
		mav.addObject("memberDto", memberDto);
		mav.addObject("myExpreviewList", myExpreviewList);
		mav.addObject("myHousereviewList", myHousereviewList);
		mav.addObject("countExpReview", countExpReview);
		mav.addObject("countHouseReview", countHouseReview);
		mav.addObject("boardSize", boardSize);
		mav.addObject("accuCurrentPage", accuCurrentPage);
		mav.addObject("useCurrentPage", useCurrentPage);

		/* mav.setViewName("guestdelluna/myReviewList.tiles"); */
		mav.setViewName("guestdelluna/dddddddddddddddd.tiles");

	}

	@Override
	public void pointManageUseAjax(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		String usePageNumber = request.getParameter("usePageNumber");
		if (usePageNumber == null)
			usePageNumber = "1";

		int useCurrentPage = Integer.parseInt(usePageNumber);
		HomeAspect.logger.info(HomeAspect.logMsg + "사용 적립페이지 : " + useCurrentPage);

		int countUse = dellunaDao.getCountUse(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode + "의 사용 된 개수 : " + countUse);

		int boardSize = 5;

		int useStartRow = (useCurrentPage - 1) * boardSize + 1;
		int useEndRow = useStartRow + boardSize - 1;

		System.out.println(useStartRow + "," + useEndRow);

		List<PointUse> usePoint = null;
		if (countUse > 0) {
			usePoint = dellunaDao.myUsePoint(memberCode, useStartRow, useEndRow);
			HomeAspect.logger.info(HomeAspect.logMsg + "포인트사용내역 리스트 : " + usePoint);
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonList = "";

		try {
			jsonList = mapper.writeValueAsString(usePoint);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		response.setContentType("application/text;charset=utf-8");
		PrintWriter out;
		
		//얻은데이터를 json형식으로 바꾸기
		
		try {
			out = response.getWriter();
			out.print(jsonList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HomeAspect.logger.info(HomeAspect.logMsg + "jsonList : " + jsonList) ;
		
		mav.addObject("jsonList", jsonList);
		mav.addObject("usePoint", usePoint);
	}
	
	// 포인트 관리페이지 ajax
	@Override
	public void pointManageAjax(ModelAndView mav) {
		// TODO Auto-generated method stub

		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		String accuPageNumber = request.getParameter("accuPageNumber");
		if (accuPageNumber == null)
			accuPageNumber = "1";
		System.out.println(accuPageNumber);

		int accuCurrentPage = Integer.parseInt(accuPageNumber);
		HomeAspect.logger.info(HomeAspect.logMsg + "현재 적립페이지 : " + accuCurrentPage);

		int countAccu = dellunaDao.getCountAccu(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode + "의 적립 된 개수 : " + countAccu);

		int countUse = dellunaDao.getCountUse(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode + "의 사용 된 개수 : " + countUse);

		int boardSize = 5;

		int startRow = (accuCurrentPage - 1) * boardSize + 1;
		int endRow = startRow + boardSize - 1;

		System.out.println(startRow + "," + endRow);

		List<PointAccumulate> accuPoint = dellunaDao.myAccuPoint(memberCode, startRow, endRow);
		HomeAspect.logger.info(HomeAspect.logMsg + "포인트적립내역 리스트 : " + accuPoint);

		if (countAccu > 0) {
			accuPoint = dellunaDao.myAccuPoint(memberCode, startRow, endRow);
			HomeAspect.logger.info(HomeAspect.logMsg + "포인트적립내역 리스트 : " + accuPoint);
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonList = "";

		//얻은 데이터를 json형식으로 바꾸기

		try {
			jsonList = mapper.writeValueAsString(accuPoint);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		HomeAspect.logger.info(HomeAspect.logMsg + "pointJsonList : " + jsonList);

		//[{"":""},{"":""},{"":""}]
		
		// json형식을 jsp페이지로 보내기
		response.setContentType("application/text;charset=utf-8");
		PrintWriter out;
		
		//얻은데이터를 json형식으로 바꾸기
		
		try {
			out = response.getWriter();
			out.print(jsonList);
		} catch (IOException e) {
			e.printStackTrace();
		}
		HomeAspect.logger.info(HomeAspect.logMsg + "jsonList : " + jsonList) ;
		
		mav.addObject("jsonList", jsonList);
		mav.addObject("accuPoint", accuPoint);
	}

	// 포인트 적립 및 사용 다 가져와서 보내줌
	@Override
	public void pointManage(ModelAndView mav) {
		// TODO Auto-generated method stub

		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		String accuPageNumber = request.getParameter("accuPageNumber");
		if (accuPageNumber == null)
			accuPageNumber = "1";

		int accuCurrentPage = Integer.parseInt(accuPageNumber);
		HomeAspect.logger.info(HomeAspect.logMsg + "현재 적립페이지 : " + accuCurrentPage);
		
		String usePageNumber = request.getParameter("usePageNumber");
		if (usePageNumber == null)
			usePageNumber = "1";

		int useCurrentPage = Integer.parseInt(usePageNumber);
		HomeAspect.logger.info(HomeAspect.logMsg + "사용 적립페이지 : " + useCurrentPage);

		int countAccu = dellunaDao.getCountAccu(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode + "의 적립 된 개수 : " + countAccu);

		int countUse = dellunaDao.getCountUse(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode + "의 사용 된 개수 : " + countUse);

		int boardSize = 5;

		int startRow = (accuCurrentPage - 1) * boardSize + 1;
		int endRow = startRow + boardSize -1;

		int useStartRow = (useCurrentPage - 1) * boardSize + 1;
		int useEndRow = startRow + boardSize -1;

		MemberDto memberDto = dellunaDao.selectForUpdate(email);

		List<PointAccumulate> accuPoint = null;
		if (countAccu > 0) {
			accuPoint = dellunaDao.myAccuPoint(memberCode, startRow, endRow);
			HomeAspect.logger.info(HomeAspect.logMsg + "포인트적립내역 리스트 : " + accuPoint);
		}

		List<PointUse> usePoint = null;
		if (countUse > 0) {
			usePoint = dellunaDao.myUsePoint(memberCode, useStartRow, useEndRow);
			HomeAspect.logger.info(HomeAspect.logMsg + "포인트사용내역 리스트 : " + usePoint);
		}
		
		mav.addObject("memberDto", memberDto);
		mav.addObject("accuPoint", accuPoint);
		mav.addObject("usePoint", usePoint);
		mav.addObject("countAccu", countAccu);
		mav.addObject("countUse", countUse);
		mav.addObject("boardSize", boardSize);
		mav.addObject("accuCurrentPage", accuCurrentPage);
		mav.addObject("useCurrentPage", useCurrentPage);

		mav.setViewName("guestdelluna/myPoint.tiles");

	}

	// 내가 예약한 게스트하우스 , 찜 목록 조회
	@Override
	public void reserveCheck(ModelAndView mav) {
		// TODO Auto-generated method stub

		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		dellunaDao.houseInfo(memberCode, 3);


		// 게하 예약수 조회
		int countHouse = dellunaDao.countHouse(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "캉누트하우스" + countHouse);

		// 체험 예약수를 조회
		int countExp = dellunaDao.countExp(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + countExp);

		List<NewExpReserveDto> newExpReserveDto = dellunaDao.newNewExpReserve(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "newExpReserveDto : " + newExpReserveDto);

		List<NewHouseReserveDto> newHouseReserveDto = dellunaDao.newNewHouseReserve(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "newHouseReserveDto : " + newHouseReserveDto);

		mav.addObject("newExpReserveDto", newExpReserveDto);
		mav.addObject("newHouseReserveDto", newHouseReserveDto);
		mav.addObject("countExp", countExp);
		mav.addObject("countHouse", countHouse);
		mav.addObject("memberCode", memberCode);
		mav.setViewName("guestdelluna/myReserveList.tiles");

	}

	@Override
	public void updateMember(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");

		MemberDto memberDto = dellunaDao.selectForUpdate(email);

		if (memberDto.getMemberImgName() != null) {

			int index = memberDto.getMemberImgName().indexOf("_") + 1;
			memberDto.setMemberImgName(memberDto.getMemberImgName().substring(index));
			HomeAspect.logger.info(HomeAspect.logMsg + memberDto.toString());
		}

		mav.addObject("memberDto", memberDto);
		mav.setViewName("guestdelluna/memberUpdate.tiles");

	}

	@Override
	public void updateMemberOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();

		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		HomeAspect.logger.info(HomeAspect.logMsg + memberDto.toString());

		MultipartFile upFile = request.getFile("file");
		HomeAspect.logger.info(HomeAspect.logMsg + "file : " + upFile);
		long fileSize = upFile.getSize();
		HomeAspect.logger.info(HomeAspect.logMsg + fileSize);
		int check = 0;
		if (fileSize != 0) {

			String fileName = Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();
			HomeAspect.logger.info(HomeAspect.logMsg + fileName);
			File path = new File("C:\\profile");
			path.mkdir();

			if (path.exists() && path.isDirectory()) {

				File file = new File(path, fileName);

				try {
					upFile.transferTo(file);
				} catch (IOException e) {
					e.printStackTrace();
				}

				HttpSession session = request.getSession();
				String email = (String) session.getAttribute("email");

				MemberDto searchFile = dellunaDao.selectForUpdate(email);
				HomeAspect.logger.info(HomeAspect.logMsg + searchFile.toString());

				memberDto.setMemberImgName(fileName);
				memberDto.setMemberImgSize(fileSize);
				memberDto.setMemberImgPath(file.getAbsolutePath());

			}

		}

		String memberInfo = request.getParameter("memberInfo");
		HomeAspect.logger.info(HomeAspect.logMsg + "멤버정보 : " + memberInfo);
		memberDto.setMemberInfo(memberInfo);
		check = dellunaDao.updateMember(memberDto);

		HomeAspect.logger.info(HomeAspect.logMsg + check);
		HomeAspect.logger.info(HomeAspect.logMsg + memberDto.toString());
		mav.addObject("check", check);
		mav.setViewName("guestdelluna/memberUpdateOk.tiles");

	}

	@Override
	public void deleteMember(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		
		mav.addObject("email", email);
		mav.setViewName("guestdelluna/memberDelete.tiles");
	}

	@Override
	public void deleteMemberOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HomeAspect.logger.info(HomeAspect.logMsg + email + " / " + password);

		int check = dellunaDao.memberDeleteOk(email, password);
		HomeAspect.logger.info(HomeAspect.logMsg + check);

		mav.addObject("check", check);
		mav.setViewName("guestdelluna/memberDeleteOk.tiles");
	}

	@Override
	public void myReserveExp(ModelAndView mav) {
		// TODO Auto-generated method stub

		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		int memberCode = dellunaDao.selectMemberCode(email);

		int exCode = Integer.parseInt(request.getParameter("exCode"));
		HomeAspect.logger.info(HomeAspect.logMsg + exCode);

		ExpReservationDto expReservationDto = dellunaDao.myResExp(exCode);
		HomeAspect.logger.info(HomeAspect.logMsg + expReservationDto.toString());

		mav.addObject("expReservationDto", expReservationDto);
		mav.addObject("exCode", exCode);

	}

	// 하우시 예약취소
	@Override
	public String reserveCancle(ModelAndView mav) throws Throwable {
		// TODO Auto-generated method stub

		// 게스트하우스 예약 취소
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		// reserveCode를 받아와서 해당하는 거 변경
		int houseReserveCode = Integer.parseInt(request.getParameter("value"));
		HomeAspect.logger.info(HomeAspect.logMsg + "houseReserveCode 캔슬: " + houseReserveCode);

		int check = dellunaDao.updateState(houseReserveCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "ㅊㅋ : " + check);

		return null;

	}

	// 체험예약취소
	@Override
	public String expCancle(ModelAndView mav) throws Throwable {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		// expReserveCode를 받아와서 해당하는 거 변경
		int expReserveCode = Integer.parseInt(request.getParameter("eXvalue"));
		HomeAspect.logger.info(HomeAspect.logMsg + "expReserveCode 캔슬: " + expReserveCode);

		int check = dellunaDao.updateExpState(expReserveCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "ㅊㅋ : " + check);

		return null;

	}

	@Override
	public void listPay(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		// 게하 예약리스트(state가 예약완료인것)을 조회
		// dto를 받아서 dto를 넘겨주면 foreach만큼 돌린다
		String state = "예약완료";

		String accuPageNumber = request.getParameter("accuPageNumber");
		if (accuPageNumber == null)
			accuPageNumber = "1";

		int accuCurrentPage = Integer.parseInt(accuPageNumber);
		HomeAspect.logger.info(HomeAspect.logMsg + "현재 적립페이지 : " + accuCurrentPage);
		
		String usePageNumber = request.getParameter("usePageNumber");
		if (usePageNumber == null)
			usePageNumber = "1";

		int useCurrentPage = Integer.parseInt(usePageNumber);
		HomeAspect.logger.info(HomeAspect.logMsg + "사용 적립페이지 : " + useCurrentPage);
		
		int countPayExp = dellunaDao.countPayExp(memberCode,state);
		HomeAspect.logger.info(HomeAspect.logMsg + "countPayExp : " + countPayExp);

		int countPayHouse = dellunaDao.countPayHouse(memberCode,state);
		HomeAspect.logger.info(HomeAspect.logMsg + "countUsePayHouse : " + countPayHouse);

		int boardSize = 5;

		int startRow = (accuCurrentPage - 1) * boardSize + 1;
		int endRow = startRow + boardSize-1;

		int useStartRow = (useCurrentPage - 1) * boardSize + 1;
		int useEndRow = useStartRow + boardSize -1;

		List<NewExpResDto> newExpResDto = null;
		if(countPayExp>0) {
			newExpResDto = dellunaDao.newExpResDto(memberCode, state, startRow, endRow);
			HomeAspect.logger.info(HomeAspect.logMsg + "내가 예약한 체험들의 리스트 : " + newExpResDto.toString());
		}
		
		List<NewHouseResDto> newHouseResDto = null;
		if(countPayHouse>0) {
			newHouseResDto = dellunaDao.newHouseResDto(memberCode, state, useStartRow, useEndRow);
			HomeAspect.logger.info(HomeAspect.logMsg + "내가 예약한 하우스들의 리스트 : " + newHouseResDto.toString());
		}
		
		MemberDto memberDto = dellunaDao.selectForUpdate(email);
		
		mav.addObject("boardSize", boardSize);
		mav.addObject("accuCurrentPage", accuCurrentPage);
		mav.addObject("useCurrentPage", useCurrentPage);
		mav.addObject("memberDto", memberDto);
		mav.addObject("countPayExp", countPayExp);
		mav.addObject("countPayHouse", countPayHouse);
		mav.addObject("newHouseResDto", newHouseResDto);
		mav.addObject("newExpResDto", newExpResDto);

		mav.setViewName("guestdelluna/myPayList.tiles");

	}
	
	@Override
	public void payExpAjax(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		String state = "예약완료";

		String accuPageNumber = request.getParameter("accuPageNumber");
		if (accuPageNumber == null)
			accuPageNumber = "1";

		int accuCurrentPage = Integer.parseInt(accuPageNumber);
		HomeAspect.logger.info(HomeAspect.logMsg + "현재 페이지 : " + accuCurrentPage);

		int countPayExp = dellunaDao.countPayExp(memberCode,state);
		HomeAspect.logger.info(HomeAspect.logMsg + "countPayExp : " + countPayExp);

		int boardSize = 5;

		int startRow = (accuCurrentPage - 1) * boardSize + 1;
		int endRow = startRow + boardSize - 1;

		System.out.println(startRow + "," + endRow);

		List<NewExpResDto> newExpResDto = null;

		if(countPayExp>0) {
			newExpResDto = dellunaDao.newExpResDto(memberCode, state, startRow, endRow);
			HomeAspect.logger.info(HomeAspect.logMsg + "내가 예약한 체험들의 리스트 : " + newExpResDto.toString());
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonList = "";

		try {
			jsonList = mapper.writeValueAsString(newExpResDto);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		response.setContentType("application/text;charset=utf-8");
		PrintWriter out;
		
		//얻은데이터를 json형식으로 바꾸기
		
		try {
			out = response.getWriter();
			out.print(jsonList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HomeAspect.logger.info(HomeAspect.logMsg + "jsonList : " + jsonList) ;
		
		mav.addObject("jsonList", jsonList);
		mav.addObject("newExpResDto", newExpResDto);
	}

	@Override
	public void payHouseAjax(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		String state = "예약완료";

		String accuPageNumber = request.getParameter("accuPageNumber");
		if (accuPageNumber == null)
			accuPageNumber = "1";

		String usePageNumber = request.getParameter("usePageNumber");
		if (usePageNumber == null)
			usePageNumber = "1";

		int useCurrentPage = Integer.parseInt(usePageNumber);
		HomeAspect.logger.info(HomeAspect.logMsg + "현재 페이지 : " + useCurrentPage);
		
		int countPayHouse = dellunaDao.countPayHouse(memberCode,state);
		HomeAspect.logger.info(HomeAspect.logMsg + "countUsePayHouse : " + countPayHouse);
		
		int boardSize = 5;

		int useStartRow = (useCurrentPage - 1) * boardSize + 1;
		int useEndRow = useStartRow + boardSize -1;

		System.out.println(useStartRow + "," + useStartRow);

		List<NewHouseResDto> newHouseResDto = null;
		if(countPayHouse>0) {
			newHouseResDto = dellunaDao.newHouseResDto(memberCode, state, useStartRow, useEndRow);
			HomeAspect.logger.info(HomeAspect.logMsg + "내가 예약한 하우스들의 리스트 : " + newHouseResDto.toString());
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonList = "";

		try {
			jsonList = mapper.writeValueAsString(newHouseResDto);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		response.setContentType("application/text;charset=utf-8");
		PrintWriter out;
		
		//얻은데이터를 json형식으로 바꾸기
		
		try {
			out = response.getWriter();
			out.print(jsonList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HomeAspect.logger.info(HomeAspect.logMsg + "jsonList : " + jsonList) ;
		
		mav.addObject("jsonList", jsonList);
		mav.addObject("newHouseResDto", newHouseResDto);
	}

	@Override
	public String deleteExpPayList(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		// 찜 예약코드를 받아옴
		int exReserveCode = Integer.parseInt(request.getParameter("exValue"));
		HomeAspect.logger.info(HomeAspect.logMsg + "결제내역에서 예약취소를 누르면 가져오는 체함예약코드는 : " + exReserveCode);

		int check = dellunaDao.deletePayListExp(exReserveCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "삭제가 잘 됐다면 넘어온 체크값은 : " + check);

		return null;
	}

	@Override
	public String deleteExpPayHouse(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int houseReserveCode = Integer.parseInt(request.getParameter("houseValue"));
		HomeAspect.logger.info(HomeAspect.logMsg + "결제내역에서 예약취소를 누르면 가져오는 게스타하우스예약코드는 :" + houseReserveCode);

		int check = dellunaDao.deletePayListHouse(houseReserveCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "삭제가 됐다면 넘어온 체크값은 : " + check);

		return null;

	}

	@Override
	public void myInfo(ModelAndView mav) {
		// TODO Auto-generated method stub

		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		String memberLevel = (String) session.getAttribute("memberLevel");
		HomeAspect.logger.info(HomeAspect.logMsg + memberLevel);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		MemberDto memberDto = dellunaDao.selectForUpdate(email);
//
//		if (memberDto.getMemberImgName() != null) {
//
//			int index = memberDto.getMemberImgName().indexOf("_") + 1;
//			memberDto.setMemberImgName(memberDto.getMemberImgName().substring(index));
//			HomeAspect.logger.info(HomeAspect.logMsg + memberDto.toString());
//		}
		

		mav.addObject("memberDto", memberDto);

		String housePageNumber = request.getParameter("housePageNumber");
		if (housePageNumber == null)
			housePageNumber = "1";

		// host가 가지고있는 숙소 리스트 별점 등 가져오기
		List<HostHouseListDto> hostHouseList = dellunaDao.getHouseList(memberCode);
		for (int i = 0; i < hostHouseList.size(); i++) {
			HomeAspect.logger.info(HomeAspect.logMsg + "hostHouseList: " + hostHouseList.get(i).toString());
		}

		// host가 가지고 있는 체험 리스트 별점 등 가져오기
		List<HostExListDto> hostExList = dellunaDao.getExList(memberCode);
		for (int i = 0; i < hostExList.size(); i++) {
			HomeAspect.logger.info(HomeAspect.logMsg + "hostExList: " + hostExList.get(i).toString());
		}

		// host의 숙소 후기 리스트
		List<HouseReviewListDto> houseReviewList = dellunaDao.getHouseReviewList(memberCode);
		for (int i = 0; i < houseReviewList.size(); i++) {
			HomeAspect.logger.info(HomeAspect.logMsg + "houseReviewList: " + houseReviewList.get(i).toString());
		}

		// host의 체험 후기 리스트
		List<ExReviewListDto> exReviewList = dellunaDao.getExReviewList(memberCode);
		for (int i = 0; i < exReviewList.size(); i++) {
			HomeAspect.logger.info(HomeAspect.logMsg + "exReviewList: " + exReviewList.get(i).toString());
		}

		String pageNumber = request.getParameter("pageNumber");
		if (pageNumber == null)
			pageNumber = "1";

		int currentPage = Integer.parseInt(pageNumber);

		int housecurrentPage = Integer.parseInt(housePageNumber);

		mav.addObject("hostHouseList", hostHouseList);
		mav.addObject("hostExList", hostExList);
		mav.addObject("houseReviewList", houseReviewList);
		mav.addObject("exReviewList", exReviewList);
		mav.addObject("memberLevel", memberLevel);
		mav.addObject("memberDto", memberDto);
		// mav.addObject(attributeName, attributeValue);

		int countAccu = dellunaDao.getCountAccu(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode + "의 적립 된 개수 : " + countAccu);

		int countUse = dellunaDao.getCountUse(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode + "의 사용 된 개수 : " + countUse);

		int boardSize = 3;
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = startRow * boardSize;

		List<PointAccumulate> accuPoint = dellunaDao.myAccuPoint(memberCode, startRow, endRow);
		HomeAspect.logger.info(HomeAspect.logMsg + "포인트적립내역 리스트 : " + accuPoint);

		List<PointUse> usePoint = dellunaDao.myUsePoint(memberCode, startRow, endRow);
		HomeAspect.logger.info(HomeAspect.logMsg + "포인트사용내역 리스트 : " + usePoint);

		// 체험 후기 개수
		int countExpReview = dellunaDao.expReviewCount(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "체험 후기 개수 : " + countExpReview);

		// 게하 후기 개수
		int countHouseReview = dellunaDao.houseReviewCount(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "게하 후기 개수  : " + countHouseReview);

		int houseStartRow = (housecurrentPage - 1) * boardSize + 1;
		int houseEndRow = housecurrentPage * boardSize;

		List<ExpReviewDto> expReview = dellunaDao.myExpReview(memberCode, startRow, endRow);
		HomeAspect.logger.info(HomeAspect.logMsg + "체험후기리스트 : " + expReview);

		List<HouseReviewDto> houseReview = dellunaDao.myHouseReview(memberCode, houseStartRow, houseEndRow);
		HomeAspect.logger.info(HomeAspect.logMsg + "하우스후기리스트 : " + houseReview);

		String state = "예약완료";

		List<HouseReservationDto> houseList = dellunaDao.findHouseListWithString(memberCode, state);
		HomeAspect.logger.info(HomeAspect.logMsg + "내가 예약한 하우스들의 리스트 : " + houseList.toString());
		HomeAspect.logger.info(HomeAspect.logMsg + "houseList의 사이즈 : " + houseList.size());

		// 게하이름을 string으로 받아온다
		List<String> houseName = dellunaDao.findHouseNameWithString(memberCode, state);
		HomeAspect.logger.info(HomeAspect.logMsg + "내가 예약한 하우스들의 이름 : " + houseName);

		// 게스트하우스 예약리스트를 조회
		// dto를 받아서 dto를 넘겨주면 foreach만큼 돌린다
		List<ExpReservationDto> expList = dellunaDao.findExpListWithString(memberCode, state);
		HomeAspect.logger.info(HomeAspect.logMsg + "내가 예약한 체험들의 리스트 : " + expList.toString());
		HomeAspect.logger.info(HomeAspect.logMsg + "expList의 사이즈 : " + expList.size());

		// 체험이름을 string으로 받아온다
		List<String> expName = dellunaDao.myExNameWithString(memberCode, state);
		HomeAspect.logger.info(HomeAspect.logMsg + "내가 예약한 체험이름 : " + expName);

		// 전체메시지개수 출력
		String msgCheck = "읽지않음";
		int cntAllMsg = dellunaDao.allMsg(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "총 메시지 개수 : " + cntAllMsg);

		// 전체 메시지 리스트 받아옴
		List<MsgDto> allMsgDto = dellunaDao.allMsgDto(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "모든 메시지 리스트 : " + allMsgDto);

		// 읽지 않은 메시지 개수 출력
		int cntMsg = dellunaDao.selectMSG(memberCode, msgCheck);
		HomeAspect.logger.info(HomeAspect.logMsg + "읽지 않은 메시지 개수는 : " + cntMsg);

		// 읽지않은 메시지 리스트 받아옴
		List<MsgDto> msgDto = dellunaDao.listMsg(memberCode, msgCheck);
		HomeAspect.logger.info(HomeAspect.logMsg + "읽지 않은 메시지 리스트들 : " + msgDto);

		mav.addObject("allMsgDto", allMsgDto);
		mav.addObject("cntAllMsg", cntAllMsg);
		mav.addObject("cntMsg", cntMsg);
		mav.addObject("msgDto", msgDto);
		mav.addObject("expName", expName);
		mav.addObject("expList", expList);
		mav.addObject("houseName", houseName);
		mav.addObject("houseList", houseList);
		mav.addObject("countExpReview", countExpReview);
		mav.addObject("countHouseReview", countHouseReview);
		mav.addObject("expReview", expReview);
		mav.addObject("houseReview", houseReview);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("housecurrentPage", housecurrentPage);
		mav.addObject("accuPoint", accuPoint);
		mav.addObject("usePoint", usePoint);
		mav.addObject("countAccu", countAccu);
		mav.addObject("countUse", countUse);
		mav.addObject("memberDto", memberDto);
		// mav.addObject(attributeName, attributeValue);

		mav.setViewName("guestdelluna/myInfo.tiles");

	}

	@Override
	public void houseReviewDelete(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		int reserveCode = Integer.parseInt(request.getParameter("hsValue"));
		HomeAspect.logger.info(HomeAspect.logMsg + "reserveCode : " + reserveCode);

		int check = dellunaDao.deleteHouseReview(reserveCode, memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + check);
		mav.addObject("check", check);
		mav.setViewName("guestdelluna/reviewDeleteOk.tiles");

	}

	@Override
	public void deleteAllMsg(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		int check = dellunaDao.deleteAllMsg(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "메시지삭제됐나요 : " + check);

	}

	@Override
	public String scroll(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		String pageNumber = request.getParameter("page");
		if (pageNumber == null) {
			pageNumber = "1";
		}
		int currentPage = Integer.parseInt(pageNumber);
		HomeAspect.logger.info(HomeAspect.logMsg + "currentPage: " + currentPage);

		int boardSize = 2;
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;

		String status = request.getParameter("status");
		HomeAspect.logger.info(HomeAspect.logMsg + status);

		List<HouseReviewListDto> houseReviewList = null;
		if (status.equals("house")) {
			houseReviewList = dellunaDao.getHouseReviewListScroll(memberCode, startRow, endRow);
			for (int i = 0; i < houseReviewList.size(); i++) {
				HomeAspect.logger.info(HomeAspect.logMsg + "houseReviewList: " + houseReviewList.get(i).toString());
			}
		}

		List<ExReviewListDto> exReviewList = null;
		if (status.equals("ex")) {
			exReviewList = dellunaDao.getExReviewListScroll(memberCode, startRow, endRow);
			for (int i = 0; i < exReviewList.size(); i++) {
				HomeAspect.logger.info(HomeAspect.logMsg + "exReviewList: " + exReviewList.get(i).toString());
			}
		}

		JSONArray arr = new JSONArray();
		for (HouseReviewListDto houseReviewListDto : houseReviewList) {
			HashMap<String, Object> commonMap = new HashMap<String, Object>();
			commonMap.put("houseName", houseReviewListDto.getHouseName());
			commonMap.put("mainImgName", houseReviewListDto.getMainImgName());
			commonMap.put("revContent", houseReviewListDto.getRevContent());
			commonMap.put("revRate", houseReviewListDto.getRevRate());
			commonMap.put("revDate", houseReviewListDto.getRevDate());
			commonMap.put("memberImgName", houseReviewListDto.getMemberImgName());
			commonMap.put("memberName", houseReviewListDto.getMemberName());

			arr.add(commonMap);
			HomeAspect.logger.info(HomeAspect.logMsg + "houseReviewList: " + commonMap.toString());
		}

		String jsonText = JSONValue.toJSONString(arr);

		return jsonText;

//		mav.addObject("exReviewList", exReviewList);
//		mav.addObject("houseReviewList", houseReviewList);
		// mav.setViewName("guestdelluna/scroll.empty");

	}

	@Override
	public void msgDelete(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		int msgCode = Integer.parseInt(request.getParameter("msgCode"));
		HomeAspect.logger.info(HomeAspect.logMsg + "넘어온 메시지 코드 : " + msgCode);

		int check = dellunaDao.deleteMsg(memberCode, msgCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "체크 값 : " + check);

	}

	@Override
	public void msgUpdate(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		int msgCode = Integer.parseInt(request.getParameter("msgCode"));
		HomeAspect.logger.info(HomeAspect.logMsg + "넘어온 메시지 코드 : " + msgCode);

		String msgCheck = "읽음";

		int check = dellunaDao.updateMsg(memberCode, msgCode, msgCheck);
		HomeAspect.logger.info(HomeAspect.logMsg + "수신 확인이 잘 됐다면 : " + check);

	}

	@Override
	public void houseReviewUpdateOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);

		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		int reserveCode = Integer.parseInt(request.getParameter("houseUpResCode"));
		HomeAspect.logger.info(HomeAspect.logMsg + "리케스트로 받은 하우스예약번호는 : " + reserveCode);

		String revContent = request.getParameter("houseRevContent");
		HomeAspect.logger.info(HomeAspect.logMsg + "리케스트로 받은 수정내뇽 : " + revContent);

		int check = dellunaDao.updateHouseReview(memberCode, reserveCode, revContent);
	}

}
