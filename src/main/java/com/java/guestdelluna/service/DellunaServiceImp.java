package com.java.guestdelluna.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAscpect;
import com.java.guestdelluna.dao.DellunaDao;
import com.java.guestdelluna.dto.DellunaExpDto;
import com.java.guestdelluna.dto.DellunaZzimDto;
import com.java.guestdelluna.dto.ExpReservationDto;
import com.java.guestdelluna.dto.HouseReservationDto;
import com.java.guestdelluna.dto.MemberDto;
import com.java.guestdelluna.dto.ReviewDto;

@Component
public class DellunaServiceImp implements DellunaService {

	@Autowired
	private DellunaDao dellunaDao;

	@Override
	public void zzimlist(ModelAndView mav) {
		// TODO Auto-generated method stub
	
		//숙소 및 체험 찜한 게 리스트로 나와야함
		
		mav.setViewName("guestdelluna/zzimlist.tiles");
		
	}

	@Override
	public void zzimCancle(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		//해당페이지 잔류 및 delete
		
	}

	@Override
	public void doZzim(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = mav.getModelMap();
		
		//HttpServletRequest request = (HttpServletRequest) map.get("request");
		DellunaExpDto dellunaExpDto = (DellunaExpDto) map.get("dellunaExpDto");
		DellunaZzimDto dellunaZzimDto = (DellunaZzimDto) map.get("dellunaZzimDto");
		
		
		  HomeAscpect.logger.info(HomeAscpect.logMsg + dellunaZzimDto.toString());
		  HomeAscpect.logger.info(HomeAscpect.logMsg + dellunaExpDto.toString());
		 
		if(dellunaZzimDto.getWishCode() == 0) {
			System.out.println("체험 찜을 눌렀으니 방에 대한 정보는 없을 수 밖에 없다");
		}
		
		if(dellunaExpDto.getReserveCode() == 0) {
			System.out.println("게하 찜을 눌렀으니 체험에 대한 정보는 없을 수 밖에 없다");
		}
		
	}
	
	@Override
	public void review(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		int boardNumber = 0;
		
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		if(request.getParameter("boardNumber") != null) {
			
			boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
					
		}
		
		mav.addObject("boardNumber", boardNumber);
		
		mav.setViewName("guestdelluna/review.tiles");
		
	}

	@Override
	public void reviewOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		ReviewDto reviewDto = (ReviewDto) map.get("reviewDto");
		HomeAscpect.logger.info(HomeAscpect.logMsg + reviewDto.toString());
		
		reviewDto.setRevDate(new Date());
		reviewDto.setRevContent(reviewDto.getRevContent().replace("\r\n", "<br/>"));
		
		int check = dellunaDao.insertReview(reviewDto);
		HomeAscpect.logger.info(HomeAscpect.logMsg + check);
		
		mav.addObject("check", check);
		mav.addObject("guestdelluna/reviewOk");
		
	}

	@Override
	public void reviewUpdate(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		List<ReviewDto> reviewlist = null;
		int memberCode = Integer.parseInt(request.getParameter("memberCode"));
		HomeAscpect.logger.info(HomeAscpect.logMsg + "메엥ㅁ버코드  : " + memberCode);
		
		ReviewDto reviewDto = null;
		
		int count = dellunaDao.countMemberCode(memberCode);
		
		if(count==1) {
		
		reviewDto = dellunaDao.selectReview(memberCode);
		HomeAscpect.logger.info(HomeAscpect.logMsg + reviewDto.toString());
		}
		
		else {
			reviewlist = dellunaDao.selectListReview(memberCode);
			HomeAscpect.logger.info(HomeAscpect.logMsg + reviewlist.size());	
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
		//log찍어보기
		
		int check = dellunaDao.reviewUpdate(reviewDto);
		//log로 check 찍어보기
		
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
		HomeAscpect.logger.info(HomeAscpect.logMsg + pageNumber + " / " + boardNumber);
		
		int check = dellunaDao.deleteReview(boardNumber);
		HomeAscpect.logger.info(HomeAscpect.logMsg + check);
		
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
		HomeAscpect.logger.info(HomeAscpect.logMsg + boardNumber + " / " + pageNumber);
		
		ReviewDto reviewDto = dellunaDao.clickMyReview(boardNumber);
		HomeAscpect.logger.info(HomeAscpect.logMsg + reviewDto);
		
		mav.addObject("reviewDto", reviewDto);
		mav.addObject("pageNumber", pageNumber);
		
		mav.setViewName("guestdelluna/onlyOneMyReview.tiles");
		
	}
	
	//페이징기법
	@Override
	public void myReviewList(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber="1";
		
		int currentPage = Integer.parseInt(pageNumber);
		HomeAscpect.logger.info(HomeAscpect.logMsg + currentPage);
		
		int count = dellunaDao.reviewCount();
		HomeAscpect.logger.info(HomeAscpect.logMsg + count);
		
		int boardSize = 5 ;
		int startRow = (currentPage-1)*boardSize + 1;
		int endRow = startRow * boardSize ;
		
		List<ReviewDto> reviewList = null;
		
		if(count>0) {
			reviewList = dellunaDao.reviewList(startRow,endRow);
			HomeAscpect.logger.info(HomeAscpect.logMsg + reviewList.size());
			HomeAscpect.logger.info(HomeAscpect.logMsg + reviewList);
		}
		
		mav.addObject("count", count);
		mav.addObject("currentPage", currentPage);
		mav.addObject("reviewList", reviewList);
		mav.addObject("boardSize", boardSize);
		
		mav.setViewName("guestdelluna/myReviewList.tiles");
		
	}

	@Override
	public void pointManage(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int memberCode = Integer.parseInt(request.getParameter("memberCode"));
		
		//사용가능포인트
		int point = dellunaDao.findMyPoint(memberCode);
		HomeAscpect.logger.info(HomeAscpect.logMsg + point);

		//적립내역 - 일단 결제내역을 끌어온다(방 및 체험)
		
		
		
		
		//사용내역(db table하나더?)
		
	}

	@Override
	public void reserveCheck(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int memberCode = Integer.parseInt(request.getParameter("memberCode"));
		
		ExpReservationDto expReservationDto = null;
		List<ExpReservationDto> listExp = null;
		
		HouseReservationDto houseReservationDto = null;
		List<HouseReservationDto> listHouse = null;
		
		//체험 예약 수 가져옴
		int countExp = dellunaDao.countExp(memberCode);
		HomeAscpect.logger.info(HomeAscpect.logMsg + countExp);
		
		//체험수가 0,1이면 dto로 아니면 list로
		if(countExp<2) {
			expReservationDto = dellunaDao.findExpDto(memberCode);
			HomeAscpect.logger.info(HomeAscpect.logMsg + expReservationDto.toString());
			mav.addObject("countExp", countExp);
			mav.addObject("expReservationDto", expReservationDto);
		}
		else {
			listExp = dellunaDao.findExpList(memberCode);
			HomeAscpect.logger.info(HomeAscpect.logMsg + listExp.size());
			HomeAscpect.logger.info(HomeAscpect.logMsg + listExp.toString());
			mav.addObject("countExp", countExp);
			mav.addObject("listExp", listExp);
		}
		
		//하우스 예약수 가져옴
		int countHouse = dellunaDao.countHouse(memberCode);
		HomeAscpect.logger.info(HomeAscpect.logMsg + countHouse);
		
		if(countHouse<2) {
			houseReservationDto = dellunaDao.findHouseDto(memberCode);
			HomeAscpect.logger.info(HomeAscpect.logMsg + houseReservationDto.toString());
			mav.addObject("countHouse", countHouse);
			mav.addObject("expReservationDto", houseReservationDto);
		}
		else {
			listExp = dellunaDao.findHouseList(memberCode);
			HomeAscpect.logger.info(HomeAscpect.logMsg + listHouse.size());
			HomeAscpect.logger.info(HomeAscpect.logMsg + listHouse.toString());
			mav.addObject("countExp", countHouse);
			mav.addObject("listHouse", listHouse);
		}
		
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
		
		if(memberDto != null) {
			mav.addObject("memberDto", memberDto);
			mav.setViewName("guestdelluna/memberUpdate.tiles");
		}
		
	}

	@Override
	public void updateMemberOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		
		int check = dellunaDao.updateMember(memberDto);
		
		if(check !=0) {
			mav.addObject("check", check);
			mav.setViewName("guestdelluna/memberUpdateOk.tiles");
		}
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
		
		int check = dellunaDao.memberDeleteOk(email,password);
		
		if(check !=0) {
			mav.addObject("check", check);
			mav.setViewName("guestdelluna/memberDeleteOk.tiles");
		}
		
	}

	@Override
	public void myReserveHouse(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int reserveCode = Integer.parseInt(request.getParameter("reserveCode"));
		HomeAscpect.logger.info(HomeAscpect.logMsg + reserveCode);
		
		HouseReservationDto houseReservationDto = dellunaDao.myResHouse(reserveCode);
		HomeAscpect.logger.info(HomeAscpect.logMsg + houseReservationDto.toString());
				
		mav.addObject("houseReservationDto", houseReservationDto);
		mav.addObject("reserveCode", reserveCode);
		
		mav.setViewName("guestdelluna/onlyOneMyReserve.tiles");
		
		
		
	}

	@Override
	public void myReserveExp(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int exCode = Integer.parseInt(request.getParameter("exCode"));
		HomeAscpect.logger.info(HomeAscpect.logMsg + exCode);
		
		ExpReservationDto expReservationDto = dellunaDao.myResExp(exCode);
		HomeAscpect.logger.info(HomeAscpect.logMsg + expReservationDto.toString());
		
		mav.addObject("expReservationDto", expReservationDto);
		mav.addObject("exCode", exCode);
		
	}


	

}
