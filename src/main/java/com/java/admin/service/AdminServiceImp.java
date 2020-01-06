package com.java.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.admin.dao.AdminDao;
import com.java.aop.HomeAspect;
import com.java.experience.dto.ExperienceDto;
import com.java.member.dao.MemberDao;
import com.java.member.dto.MemberDto;

@Component
public class AdminServiceImp implements AdminService {
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public void memberList(ModelAndView mav) {
		
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) {
			pageNumber="1";
		}
		int currentPage = Integer.parseInt(pageNumber);	//요청페이지 - 시작, 끝
		HomeAspect.logger.info(HomeAspect.logMsg +"요청페이지: " + currentPage);

		
		int count = adminDao.memberCount();
		HomeAspect.logger.info(HomeAspect.logMsg +"총 회원 수: "+ count);
	
		
		
		  int boardSize = 10; 
		  int startRow = (currentPage-1)*boardSize+1;
		  int endRow = currentPage * boardSize;
		  
		  List<MemberDto> memberList = null;
		  
		  if(count > 0) {
			  memberList=adminDao.memberList(startRow,endRow);
		  HomeAspect.logger.info(HomeAspect.logMsg +"이 페이지 회원 갯수: "+ memberList.size());
		  }
		  
		  mav.addObject("boardSize", boardSize);
		  mav.addObject("currentPage", currentPage);
		  mav.addObject("count", count);
		  mav.addObject("memberList",memberList);
		 
		  mav.setViewName("admin/memberList.tiles");
		  
	}
	@Override
	public void memberRead(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int memberCode = Integer.parseInt(request.getParameter("memberCode"));
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		
		HomeAspect.logger.info(HomeAspect.logMsg +"memberCode: "+ memberCode + ", pageNumber: " + pageNumber);
		
		MemberDto memberDto = adminDao.memberRead(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg +"memberDto: "+ memberDto.toString());
		
		mav.addObject("memberDto",memberDto);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("admin/memberRead.empty");
		
	}
	
	@Override
	public void memberUpdateOk(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		
		//int memberCode = Integer.parseInt(request.getParameter("memberCode"));
		 
		HomeAspect.logger.info(HomeAspect.logMsg +" memberDto: "+ memberDto.toString());
		//HomeAspect.logger.info(HomeAspect.logMsg +" memberCode: "+ memberCode);
		
		int check = adminDao.memberUpdateOk(memberDto);
		
		HomeAspect.logger.info(HomeAspect.logMsg +" check: "+ check);
		
		mav.addObject("check",check);
		
		mav.setViewName("admin/memberUpdateOk.empty");
	}
	
	// 게스트하우스 관리
	@Override
	public void houseList(ModelAndView mav) {
		
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) {
			pageNumber="1";
		}
		int currentPage = Integer.parseInt(pageNumber);	//요청페이지 - 시작, 끝
		HomeAspect.logger.info(HomeAspect.logMsg +"요청페이지: " + currentPage);

		
		int count = adminDao.houseCount();
		HomeAspect.logger.info(HomeAspect.logMsg +"총 게스츠하우스 수: "+ count);
	
		
		
		  int boardSize = 10; 
		  int startRow = (currentPage-1)*boardSize+1;
		  int endRow = currentPage * boardSize;
		  
		  List<MemberDto> houseList = null;
		  
		  if(count > 0) {
			  houseList = adminDao.houseList(startRow,endRow);
		  HomeAspect.logger.info(HomeAspect.logMsg +"이 페이지 게하 갯수: "+ houseList.size());
		  }
		  
		  mav.addObject("boardSize", boardSize);
		  mav.addObject("currentPage", currentPage);
		  mav.addObject("count", count);
		  mav.addObject("houseList",houseList);
		 
		  mav.setViewName("admin/houseList.tiles");
		  
	}
	
	// 체험 관리
	@Override
	public void experienceList(ModelAndView mav) {
		
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) {
			pageNumber="1";
		}
		int currentPage = Integer.parseInt(pageNumber);	
		HomeAspect.logger.info(HomeAspect.logMsg +"요청페이지: " + currentPage);

		
		int count = adminDao.experienceCount();
		HomeAspect.logger.info(HomeAspect.logMsg +"총 체험 수: "+ count);
	
		
		
		  int boardSize = 10; 
		  int startRow = (currentPage-1)*boardSize+1;
		  int endRow = currentPage * boardSize;
		  
		  List<ExperienceDto> experienceList = null;
		  
		  if(count > 0) {
			  experienceList = adminDao.experienceList(startRow,endRow);
		  HomeAspect.logger.info(HomeAspect.logMsg +"이 페이지 체험 갯수: "+ experienceList.size());
		  }
		  
		  mav.addObject("boardSize", boardSize);
		  mav.addObject("currentPage", currentPage);
		  mav.addObject("count", count);
		  mav.addObject("experienceList",experienceList);
		 
		  mav.setViewName("admin/experienceList.tiles");
		  
		
	}
	
	@Override
	public void experienceStateOK(ModelAndView mav) {
		
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
	    int exCode = Integer.parseInt(request.getParameter("exCode"));
	    
	   int exStateOk = adminDao.experienceStateOk(exCode);
	   HomeAspect.logger.info(HomeAspect.logMsg +" exStateOk : "+ exStateOk);
	   
	   mav.addObject("exCode",exCode);
	   mav.addObject("exStateOk",exStateOk);
	   
	   mav.setViewName("admin/exState.tiles");
		
	}
	
	@Override
	public void experienceStateNo(ModelAndView mav) {

		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
	    int exCode = Integer.parseInt(request.getParameter("exCode"));
	    
	   int exStateNo = adminDao.experienceStateNo(exCode);

	   HomeAspect.logger.info(HomeAspect.logMsg +" exStateNo : "+ exStateNo);
	   
	   mav.addObject("exCode",exCode);
	   mav.addObject("exStateNo",exStateNo);
	   
	   mav.setViewName("admin/exState.tiles");
		
	}
	

	@Override
	public void guestHouseStateOK(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int houseCode = Integer.parseInt(request.getParameter("houseCode"));
		int memberCode = Integer.parseInt(request.getParameter("memberCode"));
		
		int ghStateOk = adminDao.guestHouseStateOk(houseCode);
		HomeAspect.logger.info(HomeAspect.logMsg + " ghStateOk : " + ghStateOk);
		
		if(ghStateOk==1) {
			int levelOk = adminDao.memberLevelHost(memberCode);
			HomeAspect.logger.info(HomeAspect.logMsg + " levelOk : " + levelOk);
		}
		

		mav.addObject("houseCode", houseCode);
		mav.addObject("ghStateOk", ghStateOk);

		mav.setViewName("admin/guestHouseState.tiles");
		
	}
	
	@Override
	public void guestHouseStateNo(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int houseCode = Integer.parseInt(request.getParameter("houseCode"));

		int ghStateNo = adminDao.guestHouseStateNo(houseCode);

		HomeAspect.logger.info(HomeAspect.logMsg + " ghStateNo : " + ghStateNo);

		mav.addObject("houseCode", houseCode);
		mav.addObject("ghStateNo", ghStateNo);

		mav.setViewName("admin/guestHouseState.tiles");
		
	}
	

}
