package com.java.experience.service;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAspect;
import com.java.exfile.dto.ExFileDto;
import com.java.experience.dao.ExperienceDao;
import com.java.experience.dto.ExperienceDto;
import com.java.exreview.dto.ExReviewDto;
import com.java.host.dto.HostDto;
import com.java.member.dto.MemberDto;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class ExperienceServiceImp implements ExperienceService {
	
	@Autowired
	private ExperienceDao experienceDao;
	
	@Override
	public void hostAddress(ModelAndView mav) {
		Map <String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg +"email: "+ email);
		
		MemberDto memberDto = new MemberDto();
		memberDto.setEmail(email);

		//member에서 해당 이메일에 맞는 멤버 코드를 가져옴
		int memberCode = experienceDao.memberCode(email);
		
		
		HostDto hostDto = (HostDto)map.get("hostDto");
		List<HostDto> hostChkList = null;
		
		if(memberCode != 0) {
		
			hostChkList = experienceDao.hostChkList(memberCode);
			HomeAspect.logger.info(HomeAspect.logMsg +"해당 회원의 주소 갯수:" + hostChkList.size());
		
		}
		
		request.setAttribute("hostChkList", hostChkList);
		
	}
	
	@Override
	public void exHostOk(ModelAndView mav){
		
		Map<String, Object> map = mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
		
		// -- memberDto
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg +"email: "+ email);
		MemberDto memberDto = new MemberDto();
		memberDto.setEmail(email);

		// -- experienceDto
		int memberCode = experienceDao.memberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg +"memberCode: "+ memberCode);
		
		ExperienceDto experienceDto = (ExperienceDto)map.get("experienceDto");
		HomeAspect.logger.info(HomeAspect.logMsg +"experienceDto: "+ experienceDto);
		
		// 회원코드
		experienceDto.setMemberCode(memberCode);
		
		//체험 이름
		experienceDto.setExName(request.getParameter("exName"));
		
		//체험 주소
		experienceDto.setExAddress(request.getParameter("exAddress"));
		
		
		// 인원수
		experienceDto.setExPeople(Integer.parseInt(request.getParameter("exPeople")));
		
		//진행시간
		experienceDto.setExTime(request.getParameter("exTime"));
		
		//체험 소개
		experienceDto.setExExplain(request.getParameter("exExplain"));
		
		// 시작 끝 날짜
		System.out.println(request.getParameter("exStartDateS"));
		System.out.println(request.getParameter("exEndDateS"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
		Date exStartDate = sdf.parse(request.getParameter("exStartDateS"));
		experienceDto.setExStartDate(exStartDate);
		
		Date exEndDate = sdf.parse(request.getParameter("exEndDateS"));
		experienceDto.setExEndDate(exEndDate);
		System.out.println(exEndDate);
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		//은행
		experienceDto.setExBank(request.getParameter("exBank"));
		
		//계좌
		experienceDto.setExAccount(Integer.parseInt(request.getParameter("exAccount")));
		
		//가격
		experienceDto.setExPrice(Integer.parseInt(request.getParameter("exPrice")));
		
		//승인
		experienceDto.setExApproval("심사 대기중");
		
		// 등록 날짜
		experienceDto.setExRegDate(new Date());
		
		// 주소
		experienceDto.setExAddress(request.getParameter("exAddress"));
		
		int exRegisterChk = experienceDao.exHostRegister(experienceDto);
		
		//-- 체험 코드 가져오기
		int exCode = experienceDao.exCode();
		HomeAspect.logger.info(HomeAspect.logMsg + "체험코드:" + exCode);
		
		
		// -- hostDto
		
				HostDto hostDto = new HostDto();
				//selectList로 memberCode에 맞는 address를 hostDto에서 가져옴
				
				
				
		
		//------------------------------------------exFileDto(mainImg)
				MultipartFile exMainFile = request.getFile("mainImg");
				
				long exMainFileSize = exMainFile.getSize();
				String exMainFileName = Long.toString(System.currentTimeMillis()) + "_" + exMainFile.getOriginalFilename();
				
				File exPath = new File("c:\\ex");
				exPath.mkdir();
				
				if (exPath.exists() && exPath.isDirectory()) {
					File exFile = new File(exPath, exMainFileName);
					
					try {
						exMainFile.transferTo(exFile);
					}catch(IOException e) {
						e.printStackTrace();
					}

					ExFileDto exFileDto = new ExFileDto();
					exFileDto.setExCode(exCode);
					exFileDto.setMainImgName(exMainFileName);
					exFileDto.setFilePath(exPath.getAbsolutePath());
					exFileDto.setFileSize(exMainFileSize);
					HomeAspect.logger.info(HomeAspect.logMsg + exFileDto.toString());
					
					int profileCheck = experienceDao.mainImgUpload(exFileDto);
				}
				
		
		//------------------------------------------FileDto(subImg)
		//기타 사진
		List<MultipartFile> exFiles = request.getFiles("subImg");
		
		File filepath = new File("c:\\ex");
		filepath.mkdir();
		
		for (int i=0;i <exFiles.size(); i++) {
			String exSubFileName = Long.toString(System.currentTimeMillis()) + "_" + exFiles.get(i).getOriginalFilename();
			long fileSize = exFiles.get(i).getSize();
			
			if(filepath.exists() && filepath.isDirectory()) {
				File exFile = new File(filepath, exSubFileName);
				
				try {
					exFiles.get(i).transferTo(exFile);
				}catch(IOException e) {
					e.printStackTrace();
				}
				
				ExFileDto exFileDto = new ExFileDto();

				exFileDto.setExCode(exCode);
				exFileDto.setFileName(exSubFileName);
				exFileDto.setFilePath(filepath.toString());
				exFileDto.setFileSize(fileSize);
				
				int check = experienceDao.subImgUpload(exFileDto);
				
				HomeAspect.logger.info(HomeAspect.logMsg + exFileDto);
				HomeAspect.logger.info(HomeAspect.logMsg + check);
				}
			}
		
			HomeAspect.logger.info(HomeAspect.logMsg + experienceDto.toString());
		
			
			mav.setViewName("experience/exHostOk.tiles");
		
		}
	
	@Override
	public void exReview(ModelAndView mav) {
		// write, list
		Map <String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int currentPage = Integer.parseInt(pageNumber);		//  1) 요청 페이지 1
		
		int boardSize = 3; 		// 2) 페이지당 출력할 게시물 수
		// 시작 번호
		int startRow = (currentPage-1)*boardSize+1;
		
		// 끝 번호
		int endRow = boardSize * currentPage;
			
		int count = experienceDao.getReviewCnt();
		
		HomeAspect.logger.info(HomeAspect.logMsg + "전체 댓글 갯수: " +count);
	//	logger.info(logMsg + "전체 방명록 갯수: " + count);
		
		//MemberDto memberDto = (MemberDto)map.get("memberDto");
		//HomeAspect.logger.info(HomeAspect.logMsg +"memberDto: "+ memberDto);
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg +"email: "+ email);
		MemberDto memberDto = new MemberDto();
		memberDto.setEmail(email);
		
		List<ExReviewDto> reviewList =null;
		
		if(count > 0) {	// 저장된 방명록이 존재 할 경우
			
			reviewList = experienceDao.getExReviewList(startRow, endRow);
			HomeAspect.logger.info(HomeAspect.logMsg + "이 페이지에 저장된 댓글  갯수: " +reviewList.size());
			
		}
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("boardSize", boardSize);
		request.setAttribute("count", count);
		request.setAttribute("memberDto", memberDto);
		
		mav.setViewName("experience/exReview.tiles");
		
	}
	@Override
	public void exReviewOk(ModelAndView mav) {
		
		Map <String, Object> map = mav.getModelMap();
		ExReviewDto exReviewDto = (ExReviewDto) map.get("exReviewDto");
		
		exReviewDto.setRevDate(new Date());
		exReviewDto.setRevContent(exReviewDto.getRevContent().replace("\r\n", "<br>"));
		
		int check = experienceDao.writeReview(exReviewDto);
		
		HomeAspect.logger.info(HomeAspect.logMsg + "check: " +check);
		
		mav.addObject("check",check);
		mav.setViewName("guest/writeOk.tiles");
		
	}
	
}