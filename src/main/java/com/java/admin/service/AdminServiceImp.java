package com.java.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.admin.dao.AdminDao;
import com.java.aop.HomeAscpect;
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
		HomeAscpect.logger.info(HomeAscpect.logMsg +"요청페이지: " + currentPage);

		
		int count = adminDao.memberCount();
		HomeAscpect.logger.info(HomeAscpect.logMsg +"총 회원 수: "+ count);
	
		
		
		  int boardSize = 10; 
		  int startRow = (currentPage-1)*boardSize+1;
		  int endRow = currentPage * boardSize;
		  
		  List<MemberDto> memberList = null;
		  
		  if(count > 0) {
			  memberList=adminDao.memberList(startRow,endRow);
		  HomeAscpect.logger.info(HomeAscpect.logMsg +"이 페이지 회원 갯수: "+ memberList.size());
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
		
		HomeAscpect.logger.info(HomeAscpect.logMsg +"memberCode: "+ memberCode + ", pageNumber: " + pageNumber);
		
		MemberDto memberDto = adminDao.memberRead(memberCode);
		HomeAscpect.logger.info(HomeAscpect.logMsg +"memberDto: "+ memberDto.toString());
		
		mav.addObject("memberDto",memberDto);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("admin/memberRead.empty");
		
	}
	
	@Override
	public void memberUpdateOk(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		
		int memberCode = Integer.parseInt(request.getParameter("memberCode"));
		 
		HomeAscpect.logger.info(HomeAscpect.logMsg +" memberDto: "+ memberDto.toString());
		HomeAscpect.logger.info(HomeAscpect.logMsg +" memberCode: "+ memberCode);
		
		int check = adminDao.memberUpdateOk(memberDto);
		
		HomeAscpect.logger.info(HomeAscpect.logMsg +" check: "+ check);
		
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
		HomeAscpect.logger.info(HomeAscpect.logMsg +"요청페이지: " + currentPage);

		
		int count = adminDao.houseCount();
		HomeAscpect.logger.info(HomeAscpect.logMsg +"총 게스츠하우스 수: "+ count);
	
		
		
		  int boardSize = 10; 
		  int startRow = (currentPage-1)*boardSize+1;
		  int endRow = currentPage * boardSize;
		  
		  List<MemberDto> houseList = null;
		  
		  if(count > 0) {
			  houseList = adminDao.houseList(startRow,endRow);
		  HomeAscpect.logger.info(HomeAscpect.logMsg +"이 페이지 게하 갯수: "+ houseList.size());
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
		HomeAscpect.logger.info(HomeAscpect.logMsg +"요청페이지: " + currentPage);

		
		int count = adminDao.experienceCount();
		HomeAscpect.logger.info(HomeAscpect.logMsg +"총 체험 수: "+ count);
	
		
		
		  int boardSize = 10; 
		  int startRow = (currentPage-1)*boardSize+1;
		  int endRow = currentPage * boardSize;
		  
		  List<ExperienceDto> experienceList = null;
		  
		  if(count > 0) {
			  experienceList = adminDao.experienceList(startRow,endRow);
		  HomeAscpect.logger.info(HomeAscpect.logMsg +"이 페이지 체험 갯수: "+ experienceList.size());
		  }
		  
		  mav.addObject("boardSize", boardSize);
		  mav.addObject("currentPage", currentPage);
		  mav.addObject("count", count);
		  mav.addObject("experienceList",experienceList);
		 
		  mav.setViewName("admin/experienceList.tiles");
		  
		
	}
}
