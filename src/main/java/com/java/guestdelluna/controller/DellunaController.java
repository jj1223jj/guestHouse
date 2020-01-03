package com.java.guestdelluna.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAspect;
import com.java.guestdelluna.dto.DellunaExpDto;
import com.java.guestdelluna.dto.HouseZzimDto;
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
	@RequestMapping(value="guestdelluna/exZzim.do" , method=RequestMethod.GET)
	public void exZzim(HttpServletRequest request , HttpServletResponse response) {
		String memberCode = request.getParameter("memberCode");
		String zzim = request.getParameter("zzim");
		String exCode = request.getParameter("houseCode");
		HomeAspect.logger.info(HomeAspect.logMsg+"memberCode: "+memberCode+" zzim: "+zzim+" exCode: "+exCode);
		
		dellunaService.doExZzim(memberCode,exCode,zzim);
		
	}

	//찜목록
	@RequestMapping(value="guestdelluna/zzimlist.do" , method=RequestMethod.GET)
	public ModelAndView zzimlist(HttpServletRequest request , HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
	
		dellunaService.zzimlist(mav);
		
		return mav;
		
	}
	
	@RequestMapping(value="guestdelluna/zzimExpAjax.do" , method=RequestMethod.GET)
	public ModelAndView zzimExpAjax(HttpServletRequest request , HttpServletResponse response) {
		
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("request", request);
			mav.addObject("response", response);
			
			dellunaService.zzimExpAjax(mav);
			
			return mav;
			
	}
	
	@RequestMapping(value="guestdelluna/zzimHouseAjax.do" , method=RequestMethod.GET)
	public ModelAndView zzimHouseAjax(HttpServletRequest request , HttpServletResponse response) {
		
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("request", request);
			mav.addObject("response", response);
			
			dellunaService.zzimHouseAjax(mav);
			
			return mav;
			
	}
	
	//찜쉬초
	@RequestMapping(value="guestdelluna/zzimhouseCancel.do" , method=RequestMethod.GET)
	public void zzimCancle(HttpServletRequest request , HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		dellunaService.zzimCancle(mav);
		
	}
	
	//체험찜치소
	@RequestMapping(value="guestdelluna/zzimExpCancel.do" , method=RequestMethod.GET)
	public void zzimExpCancle(HttpServletRequest request , HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);

		dellunaService.zzimExpCancle(mav);

	}
	
	//내정보
	@RequestMapping(value="guestdelluna/myInfo.do", method=RequestMethod.GET)
	public ModelAndView viewMyInfo(HttpServletRequest request , HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);

		dellunaService.myInfo(mav);
		
		return mav;

	}
	
	@RequestMapping(value="guestdelluna/scroll.do", method=RequestMethod.GET)
		public void scroll(HttpServletRequest request , HttpServletResponse response) {
			
			ModelAndView mav = new ModelAndView();

			mav.addObject("request", request);
			mav.addObject("response", response);

			String jsonText = dellunaService.scroll(mav);
			
			if (jsonText != null) {
				response.setContentType("application/x-json;charset=utf-8");
		         try {
		            PrintWriter out;
		            out = response.getWriter();
		            out.print(jsonText);
		            out.close();
		         } catch (IOException e) {
		            e.printStackTrace();
		         }
			}
			
			
			//return mav;

		}
	@RequestMapping(value="guestdelluna/msgAllDelete.do" , method=RequestMethod.GET)
	public void deleteAllMsg(HttpServletRequest request , HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);

		dellunaService.deleteAllMsg(mav);
	}
	
	@RequestMapping(value="guestdelluna/msgDelete.do" , method=RequestMethod.GET)
	public void msgDelete(HttpServletRequest request , HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);

		dellunaService.msgDelete(mav);
	}
	
	@RequestMapping(value="guestdelluna/msgUpdate.do" , method=RequestMethod.POST)
	public void msgUpdate(HttpServletRequest request , HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);

		dellunaService.msgUpdate(mav);
	}

}
