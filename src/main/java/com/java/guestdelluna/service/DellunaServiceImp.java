package com.java.guestdelluna.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAscpect;
import com.java.guestdelluna.dao.DellunaDao;
import com.java.guestdelluna.dto.DellunaExpDto;
import com.java.guestdelluna.dto.DellunaZzimDto;
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
	public void reviewOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String,Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		ReviewDto reviewDto = (ReviewDto) map.get("reviewDto");
		
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
	public void reserveOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		
	}

	

}
