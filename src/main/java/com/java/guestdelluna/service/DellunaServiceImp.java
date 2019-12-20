package com.java.guestdelluna.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAspect;
import com.java.guestdelluna.dao.DellunaDao;
import com.java.guestdelluna.dto.DellunaExpDto;
import com.java.guestdelluna.dto.HouseZzimDto;
import com.java.guestdelluna.dto.ExpReservationDto;
import com.java.guestdelluna.dto.ExpZzimDto;
import com.java.guestdelluna.dto.HouseDto;
import com.java.guestdelluna.dto.HouseReservationDto;
import com.java.guestdelluna.dto.MemberDto;
import com.java.guestdelluna.dto.ReviewDto;

@Component
public class DellunaServiceImp implements DellunaService {

	@Autowired
	private DellunaDao dellunaDao;

	//찜목록불러오기
	@Override
	public void zzimlist(ModelAndView mav) {
		// TODO Auto-generated method stub
	
		Map<String,Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);
		
		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);
	
		//DTO를 모두 받아와서 DTO를 넘겨주면 개수만큼 FOREACH써서 돌리면되네
		List<ExpZzimDto> expZzimDto = dellunaDao.dtoExpZzim(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + expZzimDto.toString());
		
		//체험 이름을 string으로 받아와서 넘겨주고 FOREACH돌린다
		List<String> exName = dellunaDao.zzimExName(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + exName);
	
		//찜한 게스트하우스의 dto를 받아와서 넘겨주면 개수만큼 for each돌려줌
		List<HouseZzimDto> houseZzimDto = dellunaDao.dtoHouseZzim(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + houseZzimDto);
		
		//찜한 게스트하우스 이름을 string으로 받아와서 넘겨주고 foreach사용
		List<String> houseName = dellunaDao.zzimHouseName(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + houseName);
		
		mav.addObject("houseZzimDto", houseZzimDto);
		mav.addObject("houseName", houseName);
		mav.addObject("expZzimDto", expZzimDto);
		mav.addObject("exName", exName);
		
		mav.setViewName("guestdelluna/zzimlist.tiles");
		
	}
	
	//찜한 게스트하우스 삭제
	@Override
	public String zzimCancle(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object> map = mav.getModelMap();
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
	
	//찜한 체험 삭제
	@Override

	public void doZzim(String memberCode, String houseCode, String zzim) {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("memberCode", memberCode);
		dataMap.put("houseCode", houseCode);

		int check = dellunaDao.doZzim(dataMap,zzim);
		HomeAspect.logger.info(HomeAspect.logMsg+"check: "+check);
	}

	public String zzimExpCancle(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = mav.getModelMap();
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
	public void review(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);
		
		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode); //3 �꽆�뼱�샂
		
		String memberName = dellunaDao.selectMemberName(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberName); //�씠湲곗슜 �옒 �꽆�뼱�샂
		
		mav.addObject("memberCode", memberCode);
		mav.addObject("memberName", memberName);
		
		mav.setViewName("guestdelluna/review.tiles");
		
	}

	@Override
	public void reviewOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");		
		ReviewDto reviewDto = (ReviewDto) map.get("reviewDto");
		HomeAspect.logger.info(HomeAspect.logMsg + reviewDto.toString());
		
		reviewDto.setRevDate(new Date());
		reviewDto.setRevContent(reviewDto.getRevContent().replace("\r\n", "<br/>"));
		
		int check = dellunaDao.insertReview(reviewDto);
		HomeAspect.logger.info(HomeAspect.logMsg + check);
		
		mav.addObject("check", check);
		mav.setViewName("guestdelluna/reviewOk.tiles");
		
	}

	@Override
	public void reviewUpdate(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		List<ReviewDto> reviewlist = null;
		int memberCode = Integer.parseInt(request.getParameter("memberCode"));

		HomeAspect.logger.info(HomeAspect.logMsg + "메엥ㅁ버코드  : " + memberCode);
		
		ReviewDto reviewDto = null;
		
		int count = dellunaDao.countMemberCode(memberCode);
		
		if(count==1) {
		
		reviewDto = dellunaDao.selectReview(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + reviewDto.toString());
		}
		
		else {
			reviewlist = dellunaDao.selectListReview(memberCode);
			HomeAspect.logger.info(HomeAspect.logMsg + reviewlist.size());	
		}
		
		mav.addObject("count", count);
		mav.addObject("memberCode", memberCode);
		mav.addObject("reviewlist", reviewlist);
				
		mav.setViewName("guestdelluna/reviewUpdate.tiles");
		
	}

	@Override
	public void reviewUpdateOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		ReviewDto reviewDto = (ReviewDto) map.get("reviewDto");
		int pageNumber = Integer.parseInt(request.getParameter("request"));
		//log李띿뼱蹂닿린
		
		int check = dellunaDao.reviewUpdate(reviewDto);
		//log濡� check 李띿뼱蹂닿린
		
		mav.addObject("check", check);
		
		mav.setViewName("guestdelluna/reviewUpdateOk.tiles");
		
	}

	@Override
	public void reviewDelete(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		HomeAspect.logger.info(HomeAspect.logMsg + pageNumber + " / " + boardNumber);
		
		int check = dellunaDao.deleteReview(boardNumber);
		HomeAspect.logger.info(HomeAspect.logMsg + check);
		
		mav.addObject("check", check);
		mav.setViewName("guestdelluna/reviewDeleteOk.tiles");
		
	}

	@Override
	public void readMyReview(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		HomeAspect.logger.info(HomeAspect.logMsg + boardNumber + " / " + pageNumber);
		
		ReviewDto reviewDto = dellunaDao.clickMyReview(boardNumber);
		HomeAspect.logger.info(HomeAspect.logMsg + reviewDto);
		
		mav.addObject("reviewDto", reviewDto);
		mav.addObject("pageNumber", pageNumber);
		
		mav.setViewName("guestdelluna/onlyOneMyReview.tiles");
		
	}
	
	//�럹�씠吏뺢린踰�
	@Override
	public void myReviewList(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);
		
		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);
		
		//체험에 대한 후기 전체 목록
		
		
		mav.setViewName("guestdelluna/myReviewList.tiles");
		
	}

	@Override
	public void pointManage(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);
		
		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);
		
		int point = dellunaDao.findMyPoint(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode + "님의 포인트는 : " + point);

		//체험리스트를 다 빼와서 for문돌린 뒤 get i를 이용해 int temp에 저장
		mav.setViewName("guestdelluna/myReviewList.tiles");
		
	}
	
	//내가 예약한 게스트하우스 , 찜 목록 조회
	@Override
	public void reserveCheck(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);
		
		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);
		
		dellunaDao.houseInfo(memberCode, 3);
		
		List<ExpReservationDto> listExp = null;
		List<HouseReservationDto> listHouse = null;
		List<HouseDto> houseDtoList = null;
		List<Integer> forHouseCode = null;
		List<Integer> forHouseName = null;
		List<String> houseName = null;
		List<Integer> reserveCode = null;
		List<Integer> exreserveCode = null;
		
		//게하 예약수 조회
		int countHouse = dellunaDao.countHouse(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "캉누트하우스" + countHouse);
		
		listHouse = dellunaDao.findHouseList(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + listHouse.size());
		HomeAspect.logger.info(HomeAspect.logMsg + listHouse.toString());
				
		//내가 예약한 하우스코드 가져오기
		forHouseCode = dellunaDao.allHouse(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "forHouseCode사이즈 : " + forHouseCode.size());
		  
		for(int i=0; i<forHouseCode.size(); i++) {
			HomeAspect.logger.info(HomeAspect.logMsg + "forhousecode : " + forHouseCode.get(i));
			
			//예약테이블에서 얻은 내 예약코드
			reserveCode = dellunaDao.findMyResCode(memberCode);
			HomeAspect.logger.info(HomeAspect.logMsg + "reserveCode : " + reserveCode);
			
			int houseReserveCode = reserveCode.get(i);
			HomeAspect.logger.info(HomeAspect.logMsg + "houseReserveCode " + houseReserveCode);
			
			//예약테이블에서 얻은 하우스코드
			  int houseCodeFromRes = forHouseCode.get(i);
			  
			  forHouseName = dellunaDao.houseCodeThis(houseCodeFromRes);
			  HomeAspect.logger.info(HomeAspect.logMsg + "내가 예약한 정보로부터 얻은 하우스코드를 이용해 게하정보로 가서 받은 하우스코드 : " + forHouseName);

			  houseName = dellunaDao.findHouseName(memberCode);
			  HomeAspect.logger.info(HomeAspect.logMsg + houseName);
			  
			  mav.addObject("houseReserveCode", houseReserveCode);
			  mav.addObject("reserveCode", reserveCode);
			  mav.addObject("houseName", houseName);
			  mav.addObject("forHouseName", forHouseName);
		}		 
		
		//체험 예약수를 조회
		int countExp = dellunaDao.countExp(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + countExp);
		
		//내가 예약한 체험 조회
		listExp = dellunaDao.findExpList(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + listExp.size());
		HomeAspect.logger.info(HomeAspect.logMsg + listExp.toString());
		
		//내가 예약한 체험번호 가져오기
		List<Integer> myExpResNum = dellunaDao.ExpResNum(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "내가 예약한 체험번호 : " + myExpResNum); 	//1,4넘어옴
		
		for(int i=0; i<myExpResNum.size(); i++) {
			//체험예약테이블에서 얻은 내 체험예약코드
			exreserveCode = dellunaDao.findMyExpCode(memberCode);
			HomeAspect.logger.info(HomeAspect.logMsg + "exreserveCode : " + exreserveCode);	//예약코드 1,4넘어옴
					
			int expCodeFromExp = exreserveCode.get(i);
			HomeAspect.logger.info(HomeAspect.logMsg + expCodeFromExp);
			
			//체험예약테이블에서 얻은 체험코드
			HomeAspect.logger.info(HomeAspect.logMsg + myExpResNum.get(i));
			
			//체험예약테이블에서 얻은 체험코드를 저장
			int expResNum = myExpResNum.get(i);
			
			//체험예약테이블에서 얻은 체험코드를 이용해 체험테이블에서 체험코드를 가져옴
			List<Integer> realExpNum = dellunaDao.expRealNum(expResNum);
			HomeAspect.logger.info(HomeAspect.logMsg + "체험예약테이블에서 얻은 체험코드를 이용해 체험테이블에서 체험코드 : " + realExpNum);
			
			List<String> exName = dellunaDao.myExName(memberCode);
			HomeAspect.logger.info(HomeAspect.logMsg + exName);
			
			mav.addObject("exName", exName);
			mav.addObject("expCodeFromExp", expCodeFromExp);

		}
		
		mav.addObject("houseDtoList", houseDtoList);
		mav.addObject("countExp", countExp);
		mav.addObject("listExp", listExp);
		mav.addObject("countHouse", countHouse);
		mav.addObject("listHouse", listHouse);
		mav.addObject("memberCode", memberCode);
		
		
		mav.setViewName("guestdelluna/myReserveList.tiles");
		
	}

	@Override
	public void updateMember(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		
		MemberDto memberDto = dellunaDao.selectForUpdate(email);
		
		if(memberDto.getMemberImgName() != null) {
			
			int index = memberDto.getMemberImgName().indexOf("_")+1;
			memberDto.setMemberImgName(memberDto.getMemberImgName().substring(index));
			HomeAspect.logger.info(HomeAspect.logMsg + memberDto.toString());
		}
		
		mav.addObject("memberDto", memberDto);
		mav.setViewName("guestdelluna/memberUpdate.tiles");

	}

	@Override
	public void updateMemberOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object> map = mav.getModelMap();
		
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		HomeAspect.logger.info(HomeAspect.logMsg + memberDto.toString());
		
		MultipartFile upFile = request.getFile("file");
		HomeAspect.logger.info(HomeAspect.logMsg + "file : " + upFile);
		long fileSize = upFile.getSize();
		HomeAspect.logger.info(HomeAspect.logMsg + fileSize);
		int check=0;
		if(fileSize != 0) {
			
			String fileName = Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();
			HomeAspect.logger.info(HomeAspect.logMsg + fileName);
			File path = new File("C:\\profile");
			path.mkdir();
			
			if(path.exists() && path.isDirectory()) {
				
				File file = new File(path, fileName);
				
				try {
					upFile.transferTo(file);
				}
				catch(IOException e){
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
		
		check = dellunaDao.updateMember(memberDto);
		HomeAspect.logger.info(HomeAspect.logMsg + check);
		HomeAspect.logger.info(HomeAspect.logMsg + memberDto.toString());
		mav.addObject("check", check);
		mav.setViewName("guestdelluna/memberUpdateOk.tiles");
		
	}

	@Override
	public void deleteMember(ModelAndView mav) {
		// TODO Auto-generated method stub
		mav.setViewName("guestdelluna/memberDelete.tiles");
	}

	@Override
	public void deleteMemberOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HomeAspect.logger.info(HomeAspect.logMsg + email + " / " + password);
		
		int check = dellunaDao.memberDeleteOk(email,password);
		HomeAspect.logger.info(HomeAspect.logMsg + check);
		
		if(check !=0) {
			mav.addObject("check", check);
			mav.setViewName("guestdelluna/memberDeleteOk.tiles");
		}
		
	}


	@Override
	public void myReserveExp(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = mav.getModelMap();
		
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

	//하우시 예약취소
	@Override
	public String reserveCancle(ModelAndView mav) throws Throwable {
		// TODO Auto-generated method stub
	
		//게스트하우스 예약 취소
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);
		
		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);
	
     	//reserveCode를 받아와서 해당하는 거 변경
		int houseReserveCode = Integer.parseInt(request.getParameter("value"));
		HomeAspect.logger.info(HomeAspect.logMsg + "houseReserveCode 캔슬: " + houseReserveCode);
		  
		int check = dellunaDao.updateState(houseReserveCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "ㅊㅋ : " + check);
	
		return null;
		
	}

	//체험예약취소
	@Override
	public String expCancle(ModelAndView mav) throws Throwable{
		// TODO Auto-generated method stub
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");	

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);
		
		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);
	
     	//expReserveCode를 받아와서 해당하는 거 변경
		int expReserveCode = Integer.parseInt(request.getParameter("eXvalue"));
		HomeAspect.logger.info(HomeAspect.logMsg + "expReserveCode 캔슬: " + expReserveCode);
		  
		int check = dellunaDao.updateExpState(expReserveCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "ㅊㅋ : " + check);
	
		return null;
		
	}

	@Override
	public void listPay(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");	

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);
		
		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		
		//게하 예약리스트(state가 예약완료인것)을 조회
		//dto를 받아서 dto를 넘겨주면 foreach만큼 돌린다
		String state = "예약완료";
		
		List<HouseReservationDto> houseList = dellunaDao.findHouseListWithString(memberCode,state);
		HomeAspect.logger.info(HomeAspect.logMsg + "내가 예약한 하우스들의 리스트 : " + houseList.toString());
		HomeAspect.logger.info(HomeAspect.logMsg + "houseList의 사이즈 : " + houseList.size());
	
		//게하이름을 string으로 받아온다
		List<String> houseName = dellunaDao.findHouseNameWithString(memberCode,state);
		HomeAspect.logger.info(HomeAspect.logMsg + "내가 예약한 하우스들의 이름 : " + houseName);	
		
		//게스트하우스 예약리스트를 조회
		//dto를 받아서 dto를 넘겨주면 foreach만큼 돌린다
		List<ExpReservationDto> expList = dellunaDao.findExpListWithString(memberCode,state);
		HomeAspect.logger.info(HomeAspect.logMsg + "내가 예약한 체험들의 리스트 : " + expList.toString());
		HomeAspect.logger.info(HomeAspect.logMsg + "expList의 사이즈 : " + expList.size());
		
		//체험이름을 string으로 받아온다
		List<String> expName = dellunaDao.myExNameWithString(memberCode,state);
		HomeAspect.logger.info(HomeAspect.logMsg + "내가 예약한 체험이름 : " + expName);
		
		mav.addObject("expName", expName);
		mav.addObject("expList", expList);
		mav.addObject("houseName", houseName);
		mav.addObject("houseList", houseList);
		
		mav.setViewName("guestdelluna/myPayList.tiles");
		
	}

	@Override
	public String deleteExpPayList(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");	
		
		//찜 예약코드를 받아옴
		int exReserveCode = Integer.parseInt(request.getParameter("exValue"));
		HomeAspect.logger.info(HomeAspect.logMsg + "결제내역에서 예약취소를 누르면 가져오는 체함예약코드는 : " + exReserveCode);
		
		int check = dellunaDao.deletePayListExp(exReserveCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "삭제가 잘 됐다면 넘어온 체크값은 : " + check);
		
		return null;
	}

	@Override
	public void deleteExpPayHouse(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");	
		
		int houseReserveCode = Integer.parseInt(request.getParameter("houseValue"));
		HomeAspect.logger.info(HomeAspect.logMsg + "결제내역에서 예약취소를 누르면 가져오는 게스타하우스예약코드는 :" + houseReserveCode);
		
		int check = dellunaDao.deletePayListHouse(houseReserveCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "삭제가 됐다면 넘어온 체크값은 : " + check);
		
	}

	@Override
	public void myInfo(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");	

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);
		
		int memberCode = dellunaDao.selectMemberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);
		
		MemberDto memberDto = dellunaDao.selectForUpdate(email);
		HomeAspect.logger.info(HomeAspect.logMsg + "내정보를 위해 가져온 나의 dto :" + memberDto);
		
		
		
		mav.addObject("memberDto", memberDto);
		//mav.addObject(attributeName, attributeValue);		
		
		mav.setViewName("guestdelluna/myInfo.tiles");
		
	}



	

}
