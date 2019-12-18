package com.java.guestdelluna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAspect;
import com.java.guestdelluna.dto.DellunaExpDto;
import com.java.guestdelluna.dto.DellunaZzimDto;
import com.java.guestdelluna.service.DellunaService;

@Controller
public class DellunaController {
	
	/*
	   
	   후기작성(상품,체험)
	   후기목록(상품,체험)
	   후기수정(상품,체험)
	   후기삭제(상품,체험)
	   
	   포인트관리
	    
	 */

	@Autowired
	private DellunaService dellunaService ;
	
	@RequestMapping(value="guestdelluna/zzim.do" , method=RequestMethod.GET)
	public void zzim(HttpServletRequest request , HttpServletResponse response) {
		String memberCode = request.getParameter("memberCode");
		String zzim = request.getParameter("zzim");
		String houseCode = request.getParameter("houseCode");
		HomeAspect.logger.info(HomeAspect.logMsg+"memberCode: "+memberCode+" zzim: "+zzim+" houseCode: "+houseCode);
			
		dellunaService.doZzim(memberCode,houseCode,zzim);
		
	}
		
	//찜목록
	@RequestMapping(value="guestdelluna/zzimlist.do" , method=RequestMethod.GET)
	public ModelAndView zzimlist(HttpServletRequest request , HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		//페이지넘버
	
		dellunaService.zzimlist(mav);
		
		return mav;
		
	}
	
	//찜쉬초
	@RequestMapping(value="guestdelluna/zzimhouseCancel.do" , method=RequestMethod.GET)
	public void zzimCancle(HttpServletRequest request , HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		dellunaService.zzimCancle(mav);
		
	}
		
}
