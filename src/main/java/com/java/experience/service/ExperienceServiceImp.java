package com.java.experience.service;

import java.io.File;
import java.io.IOException;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.java.exremain.dto.ExRemainDto;
import com.java.exreserve.dto.ExReserveDto;
import com.java.exreview.dto.ExReviewDto;
import com.java.exreview.dto.ExReviewListDto;
import com.java.file.dto.FileDto;
import com.java.host.dto.HostDto;
import com.java.member.dto.MemberDto;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @author : 정승현
 * @Date : 2019. 12. 22.
 * @Content : 예약가능일 날짜 표시, 페이징, exReserve 시퀀스 디비에 create, messageDto
 */
@Component
public class ExperienceServiceImp implements ExperienceService {

	@Autowired
	private ExperienceDao experienceDao;
	// List<ExFileDto> exFileList;
	// ExperienceDto experienceDto;

	@Override
	public void hostAddress(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();

		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + "email: " + email);

		MemberDto memberDto = new MemberDto();
		memberDto.setEmail(email);

		// member에서 해당 이메일에 맞는 멤버 코드를 가져옴
		int memberCode = experienceDao.memberCode(email);

		HostDto hostDto = (HostDto) map.get("hostDto");
		List<HostDto> hostChkList = null;

		if (memberCode != 0) {

			hostChkList = experienceDao.hostChkList(memberCode);
			HomeAspect.logger.info(HomeAspect.logMsg + "해당 회원의 주소 갯수:" + hostChkList.size());

		}

		for (int i = 0; i < hostChkList.size(); i++) {
			hostChkList.get(i)
					.setAddress(hostChkList.get(i).getAddress() + " " + hostChkList.get(i).getDetailAddress());
			HomeAspect.logger.info(HomeAspect.logMsg + hostChkList.get(i).getAddress());

		}
		request.setAttribute("hostChkList", hostChkList);

	}

	@Override
	public void exHostOk(ModelAndView mav) {

		Map<String, Object> map = mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");

		// -- memberDto

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + "email: " + email);
		MemberDto memberDto = new MemberDto();
		memberDto.setEmail(email);

		// -- experienceDto
		int memberCode = experienceDao.memberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + "memberCode: " + memberCode);

		ExperienceDto experienceDto = (ExperienceDto) map.get("experienceDto");
		HomeAspect.logger.info(HomeAspect.logMsg + "experienceDto: " + experienceDto);

		// 회원코드
		experienceDto.setMemberCode(memberCode);

		// 체험 이름
		experienceDto.setExName(request.getParameter("exName"));

		// 체험 주소 (주소랑 상세주소 합친 값을 exAddress에, jsp에서 hidden으로 넘겨주는거 재확인)
		experienceDto.setExAddress(request.getParameter("exAddress") + request.getParameter("detailAddress"));

		// 인원수
		experienceDto.setExPeople(Integer.parseInt(request.getParameter("exPeople")));

		// 진행시간
		experienceDto.setExTime(request.getParameter("exTime"));

		// 체험 소개
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

		} catch (Exception e) {
			e.printStackTrace();
		}

		// 은행
		experienceDto.setExBank(request.getParameter("exBank"));

		// 계좌
		experienceDto.setExAccount(Integer.parseInt(request.getParameter("exAccount")));

		// 가격
		experienceDto.setExPrice(Integer.parseInt(request.getParameter("exPrice")));

		// 승인
		experienceDto.setExApproval("심사 대기중");

		// 등록 날짜
		experienceDto.setExRegDate(new Date());

		// 주소
		experienceDto.setExAddress(request.getParameter("exAddress"));

		int exRegisterChk = experienceDao.exHostRegister(experienceDto);

		// -- 체험 코드 가져오기
		int exCode = experienceDao.exCode();
		HomeAspect.logger.info(HomeAspect.logMsg + "체험코드:" + exCode);

		// -- hostDto

		// selectList로 memberCode에 맞는 address를 hostDto에서 가져옴

		// ------------------------------------------exFileDto(mainImg)
		MultipartFile exMainFile = request.getFile("mainImg");

		long exMainFileSize = exMainFile.getSize();
		String exMainFileName = Long.toString(System.currentTimeMillis()) + "_" + exMainFile.getOriginalFilename();

		File exPath = new File("c:/ex");
		exPath.mkdir();

		if (exPath.exists() && exPath.isDirectory()) {
			File exFile = new File(exPath, exMainFileName);

			try {
				exMainFile.transferTo(exFile);
			} catch (IOException e) {
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

		// ------------------------------------------FileDto(subImg)
		// 기타 사진
		List<MultipartFile> exFiles = request.getFiles("subImg");

		File filepath = new File("c:/ex");
		filepath.mkdir();

		for (int i = 0; i < exFiles.size(); i++) {
			String exSubFileName = Long.toString(System.currentTimeMillis()) + "_"
					+ exFiles.get(i).getOriginalFilename();
			long fileSize = exFiles.get(i).getSize();

			if (filepath.exists() && filepath.isDirectory()) {
				File exFile = new File(filepath, exSubFileName);

				try {
					exFiles.get(i).transferTo(exFile);
				} catch (IOException e) {
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

	// 리뷰 작성하기
	@Override
	public void exReview(ModelAndView mav) {
		// write, list
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int exCode = Integer.parseInt(request.getParameter("exCode"));
		int memberCode = Integer.parseInt(request.getParameter("memberCode"));

		/*
		 * int count = experienceDao.getReviewCnt(exCode);
		 * 
		 * HomeAspect.logger.info(HomeAspect.logMsg + "전체 댓글 갯수: " +count);
		 * 
		 * 
		 * HttpSession session = request.getSession(); String email =
		 * (String)session.getAttribute("email"); int memberCode =
		 * (Integer)session.getAttribute("memberCode");
		 * 
		 * HomeAspect.logger.info(HomeAspect.logMsg +"email: "+ email +
		 * "		memberCode: " + memberCode);
		 * 
		 * MemberDto memberDto = (MemberDto)map.get("memberDto");
		 * memberDto.setEmail(email); HomeAspect.logger.info(HomeAspect.logMsg
		 * +"memberDto: "+ memberDto);
		 * 
		 * ExReviewDto exReviewDto = (ExReviewDto) map.get("exReviewDto");
		 * 
		 * 
		 * // 멤버코드로 예약 테이블에서 예약번호를 가져옴 int exReserveCode =
		 * experienceDao.reserveCode(memberCode);
		 * HomeAspect.logger.info(HomeAspect.logMsg +"exReserveCode: "+ exReserveCode);
		 * 
		 * // 예약번호가 있는 사람일 경우 if(exReserveCode !=0) {
		 * 
		 * HomeAspect.logger.info(HomeAspect.logMsg +"exReserveCode: "+ exReserveCode);
		 * 
		 * // 체험 예약번호 ExReviewDto exReviewDto = (ExReviewDto)map.get("exReviewDto");
		 * exReviewDto.setExReserveCode(exReserveCode);
		 * exReviewDto.setMemberCode(memberCode);
		 * 
		 * // 예약 번호가 없는 사람일 경우 }else { int exResrveCode = 0; }
		 * 
		 * List<ExReviewListDto> reviewList =null;
		 * 
		 * if(count > 0) { // 저장된 방명록이 존재 할 경우
		 * 
		 * reviewList = experienceDao.getExReviewList(startRow, endRow, memberCode);
		 * HomeAspect.logger.info(HomeAspect.logMsg + "이 페이지에 저장된 댓글  갯수: "
		 * +reviewList.size()); HomeAspect.logger.info(HomeAspect.logMsg +
		 * reviewList.get(0).toString()); }
		 * 
		 * mav.addObject("reviewList", reviewList); mav.addObject("currentPage",
		 * currentPage); mav.addObject("boardSize", boardSize); mav.addObject("count",
		 * count);
		 */

		// mav.addObject("exReviewDto", exReviewDto);

		mav.setViewName("experience/exReview.tiles");

	}

	@Override
	public void exReviewOk(ModelAndView mav) {

		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int exCode = Integer.parseInt(request.getParameter("exCode"));

		// ExReviewDto exReviewDto = (ExReviewDto) map.get("exReviewDto");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		int memberCode = (Integer) session.getAttribute("memberCode");

		HomeAspect.logger.info(HomeAspect.logMsg + "email: " + email + "		memberCode: " + memberCode);

		// int exReserveCode = experienceDao.reserveCode(memberCode);
		// HomeAspect.logger.info(HomeAspect.logMsg + "exReserveCode: " +
		// exReserveCode);

		ExReviewDto exReviewDto = (ExReviewDto) map.get("exReviewDto");

		// %%%%%%%%%%0이면 체험예약번호가 없는 사람, 1 이상이면 체험예약 번호가 있는 사람

		int getExReserveCode = experienceDao.reserveCodeCnt(memberCode, exCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "exReserveCode: " + getExReserveCode);

		if (getExReserveCode != 0) {
			// 리스트로 받기
			List<ExReserveDto> exReserveList = null;
			exReserveList = experienceDao.exReserveCode(exCode, memberCode);

			for (int i = 0; i < exReserveList.size(); i++) {

				if (exReserveList.get(i) != null) {

					int exReserveCode = exReserveList.get(i).getExReserveCode();
					// 이 예약코드로 리뷰를 작성했는지 확인
					int reviewChk = experienceDao.reviewChk(exReserveCode);

					// 이미 작성하였을 경우
					if (reviewChk != 0) {
						mav.addObject("reviewChk", reviewChk);

						mav.setViewName("experience/exReviewOk.tiles");
					} else {
						// 회원번호
						exReviewDto.setMemberCode(memberCode);
						// 작성일
						exReviewDto.setRevDate(new Date());
						// 내용
						exReviewDto.setRevContent(request.getParameter("revContent"));
						// 별점
						exReviewDto.setRevRate(Integer.parseInt(request.getParameter("revRate")));
						// 예약번호
						exReviewDto.setExReserveCode(Integer.parseInt(request.getParameter("exReserveCode")));
						HomeAspect.logger.info(HomeAspect.logMsg + "exReviewDto: " + exReviewDto.toString());

						int check = experienceDao.writeReview(exReviewDto);

						HomeAspect.logger.info(HomeAspect.logMsg + "check: " + check);

						mav.addObject("check", check);
						mav.setViewName("experience/exReviewOk.tiles");

					}
				}
			}
		} else {
			mav.addObject("getExReserveCode", getExReserveCode);

			mav.setViewName("experience/exReviewOk.tiles");
		}
	}

	// 예약번호가 있는 사람일 경우
	/*
	 * if (exReserveCode != 0) { // 체험 예약번호
	 * exReviewDto.setExReserveCode(exReserveCode);
	 * 
	 * // 회원번호 exReviewDto.setMemberCode(memberCode);
	 * 
	 * // 작성일 exReviewDto.setRevDate(new Date());
	 * 
	 * // 내용
	 * 
	 * exReviewDto.setRevContent(request.getParameter("revContent"));
	 * 
	 * 
	 * //exReviewDto.setRevContent(exReviewDto.getRevContent().replace("\r\n",
	 * "<br>"));
	 * 
	 * // 별점
	 * //exReviewDto.setRevRate(Integer.parseInt(request.getParameter("revRate")));
	 * 
	 * HomeAspect.logger.info(HomeAspect.logMsg + "exReserveCode: " +
	 * exReserveCode); HomeAspect.logger.info(HomeAspect.logMsg + "exReviewDto: " +
	 * exReviewDto.toString());
	 * 
	 * 
	 * }
	 */

	@Override
	public void exReviewUpdate(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		ExReviewDto exReviewDto = (ExReviewDto) map.get("exReviewDto");

		int exReserveCode = Integer.parseInt(request.getParameter("exReserveCode"));
		int memberCode = Integer.parseInt(request.getParameter("memberCode"));

		HomeAspect.logger.info(HomeAspect.logMsg + "exReserveCode:" + exReserveCode + " memberCode: " + memberCode);

		exReviewDto = experienceDao.exReviewUpdate(memberCode);

		HomeAspect.logger.info(HomeAspect.logMsg + "exReviewDto:" + exReviewDto.toString());

		mav.addObject("exReviewDto", exReviewDto);
		mav.addObject("exReserveCode", exReserveCode);

		mav.setViewName("experience/exReviewUpdate.empty");

	}

	@Override
	public void exReviewUpdateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		ExReviewDto exReviewDto = (ExReviewDto) map.get("exReviewDto");
		exReviewDto.setRevDate(new Date());

		HomeAspect.logger.info(HomeAspect.logMsg + exReviewDto.toString());

		int check = experienceDao.exReviewUpdateOk(exReviewDto);

		mav.addObject("check", check);

		mav.setViewName("experience/exReviewUpdateOk.empty");
	}

	@Override
	public void exReviewDelete(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int exReserveCode = Integer.parseInt(request.getParameter("exReserveCode"));
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

		HomeAspect.logger.info(HomeAspect.logMsg + "exReserveCode : " + exReserveCode);

		int check = experienceDao.exReviewDelete(exReserveCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "check : " + check);

		mav.addObject("pageNumber", pageNumber);
		mav.addObject("check", check);

		mav.setViewName("experience/exReviewDelete.tiles");

	}

	// 체험 페이지
	@Override
	public void exPage(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		int memberCode = (Integer) session.getAttribute("memberCode");
		HomeAspect.logger.info(HomeAspect.logMsg + "email : " + email + "	memberCode:" + memberCode);

		// 선택된 체험 코드에 해당하는 페이지로 이동
		/* int exCode = 41; */
		/* int exCode = 6; */

		int exCode = Integer.parseInt(request.getParameter("exCode"));

		if (exCode == 0) {
			exCode = 41;
		}

		ExperienceDto experienceDto = experienceDao.exPage(exCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "체험 정보 : " + experienceDto.toString());

		// 사진
		List<ExFileDto> exFileList = experienceDao.exPageImgList(exCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "exPageImgList : " + exFileList.toString());

		// 해당 호스트의 memberDto 불러서 호스트 정보 제공
		MemberDto memberDto = experienceDao.exHostInfo(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "호스트 정보 : " + memberDto.toString());

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

		int count = experienceDao.getReviewCnt(exCode);

		HomeAspect.logger.info(HomeAspect.logMsg + "이 회원의 댓글 갯수: " + count);

		List<ExReviewListDto> reviewList = null;

		if (count > 0) { // 이 페이지에 저장된 방명록이 존재 할 경우

			reviewList = experienceDao.getExReviewList(startRow, endRow, exCode);
			HomeAspect.logger.info(HomeAspect.logMsg + "이 페이지에 저장된 댓글  갯수: " + reviewList.size());
			// HomeAspect.logger.info(HomeAspect.logMsg + reviewList.get(0).toString());
		}

		// 달력 ////////////////////////////////

		/*
		 * Date start = experienceDto.getExStartDate(); Date end =
		 * experienceDto.getExEndDate();
		 * 
		 * HomeAspect.logger.info(HomeAspect.logMsg + "start, end, exCode: " + start
		 * +"," + end +"," + exCode);
		 * 
		 * 
		 * SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 * 
		 * String exStart =null; String exEnd =null;
		 * 
		 * try { exStart = sdf.format(start); exEnd = sdf.format(end);
		 * 
		 * } catch (Exception e) { e.printStackTrace(); }
		 * 
		 * // 달력 ArrayList<String> dates = new ArrayList<String>(); Date currentDate =
		 * start;
		 * 
		 * // start날짜 부터 end까지 리스트 date에 담음 while(currentDate.compareTo(end) <=0 ) {
		 * dates.add(sdf.format(currentDate)); Calendar cal = Calendar.getInstance();
		 * cal.setTime(start); cal.add(Calendar.DATE,1);
		 * 
		 * currentDate=cal.getTime();
		 * 
		 * } // date에 담은 값을 exReserve테이블에 for(int i =0;i<dates.size();i++) { String
		 * selDate = dates(i); List<ExRemainDto> exDateList =
		 * experienceDao.exDateList(selDate);
		 * 
		 * }
		 */
		// 남은 체험
		// List<ExRemainDto> exDateList = experienceDao.exDateList();
		// for(int i=0;i<exDateList.size();i++) {

		// }
		/*
		 * //체험하는 인원 세기 List<ExReserveDto> reserveList =
		 * experienceDao.reserveList(exCode, exDate);
		 * 
		 * 
		 * int totalPeople = 0; if(reserveList != null) { for(int i=0;
		 * i<reserveList.size();i++) { int people = reserveList.get(i).getExPeople();
		 * totalPeople += people;
		 * 
		 * } }
		 * 
		 * // 하루당 수용 가능 인원 int exPeople = experienceDao.getPeople(exCode);
		 * 
		 * // 아직 체험 가능할 때 if(exPeople >= totalPeople) {
		 * 
		 * int ablePeople = exCode-totalPeople;
		 * 
		 * mav.addObject("ablePeople",ablePeople);
		 * 
		 * 
		 * }else {
		 * 
		 * }
		 */

		////////////////////////////// 달력

		mav.addObject("reviewList", reviewList);
		mav.addObject("currentPage", currentPage);
		mav.addObject("boardSize", boardSize);
		mav.addObject("count", count);

		// mav.addObject("exReviewDto", exReviewDto);

		// mav.setViewName("experience/exReview.tiles");

		////////////////////////////// 후기 리스트/////////////////////////

		mav.addObject("experienceDto", experienceDto);
		mav.addObject("exFileList", exFileList);
		mav.addObject("memberDto", memberDto);

		mav.setViewName("experience/exPage.tiles");

	}

	@Override
	public void exReserve(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		int memberCode = (Integer) session.getAttribute("memberCode");
		HomeAspect.logger.info(HomeAspect.logMsg + "체험 예약자 email : " + email + "	memberCode:" + memberCode);

		ExReserveDto exReserveDto = (ExReserveDto) map.get("exReserveDto");

		// 회원번호
		// experienceDto.setMemberCode(memberCode);

		// 체험번호
		int exCode = Integer.parseInt(request.getParameter("exCode"));
		// exReserveDto.setExCode(Integer.parseInt(request.getParameter("exCode")));

		ExperienceDto experienceDto = experienceDao.exPage(exCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "체험 정보 : " + experienceDto.toString());

		// 체험 인원
		int exPeople = Integer.parseInt(request.getParameter("exPeople"));

		// 결제 금액 ( 인원 * 가격)
		int exPayment = experienceDao.exPayment(exPeople, exCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "결제금액 : " + exPayment);

		// 체험날짜

		System.out.println(request.getParameter("exDateS"));

		String exDateS = request.getParameter("exDateS");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date exDate = null;
		try {
			exDate = sdf.parse(request.getParameter("exDateS"));
			exReserveDto.setExDate(exDate);

		} catch (Exception e) {
			e.printStackTrace();
		}

		HomeAspect.logger.info(HomeAspect.logMsg + "exReserveDto : " + exReserveDto.toString());

		// HomeAspect.logger.info(HomeAspect.logMsg + "experienceDto : " +
		// experienceDto.toString());

		// 포인트
		int point = experienceDao.getPoint(email);

		// 사진

		List<ExFileDto> exFileList = experienceDao.exPageImgList(exCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "exPageImgList : " + exFileList.toString());

		String mainImg = null;
		for (int i = 0; i < exFileList.size(); i++) {
			if (exFileList.get(i).getMainImgName() != null) {
				mainImg = exFileList.get(i).getMainImgName();
			}
		}
		String review = request.getParameter("reviewList");

		/*
		 * ExperienceDto experienceDto = (ExperienceDto) map.get("experienceDto");
		 * HomeAspect.logger.info(HomeAspect.logMsg + "experienceDto : " +
		 * experienceDto.toString());
		 */

		mav.addObject("exCode", exCode);
		mav.addObject("exPeople", exPeople);
		mav.addObject("exReserveDto", exReserveDto);
		mav.addObject("exPayment", exPayment);
		mav.addObject("point", point);
		mav.addObject("exDate", exDate);
		mav.addObject("exDateS", exDateS);
		mav.addObject("mainImg", mainImg);
		mav.addObject("experienceDto", experienceDto);
		mav.addObject("review", review);

		mav.setViewName("experience/exPageReserve.tiles");

	}

	@Override
	public void exReserveOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");

		int exCode = Integer.parseInt(request.getParameter("exCode"));
		int memberCode = Integer.parseInt(request.getParameter("memberCode"));
		String exDateS = request.getParameter("exDateS");
		int exPeople = Integer.parseInt(request.getParameter("exPeople"));
		int exPayment = Integer.parseInt(request.getParameter("exPayment"));
		float point = Float.parseFloat(request.getParameter("point"));
		int usePoint = Integer.parseInt(request.getParameter("usePoint"));

		HomeAspect.logger.info(HomeAspect.logMsg + exCode + ", " + memberCode + ", " + exDateS + ", " + exPeople + ", "
				+ exPayment + ", " + point + "," + usePoint);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date exDate = null;
		try {
			exDate = sdf.parse(request.getParameter("exDateS"));

		} catch (Exception e) {
			e.printStackTrace();
		}

		ExReserveDto exReserveDto = new ExReserveDto();

		exReserveDto.setMemberCode(memberCode);
		exReserveDto.setExCode(exCode);
		exReserveDto.setExPeople(exPeople);
		exReserveDto.setReserveDate(new Date());
		exReserveDto.setExPayment(exPayment);
		exReserveDto.setState("예약완료");
		exReserveDto.setExDate(exDate);

		HomeAspect.logger.info(HomeAspect.logMsg + "exReserveDto: " + exReserveDto.toString());

		// 체험정보
		ExperienceDto experienceDto = experienceDao.exPage(exCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "체험 정보 : " + experienceDto.toString());

		// db에 예약정보 저장
		int check = experienceDao.insertExReserve(exReserveDto);
		HomeAspect.logger.info(HomeAspect.logMsg + "db에 예약자 등록:" + check);

		// 예약번호
		int exReserveCode = experienceDao.getExReserveCode(exCode, memberCode, exDate);
		HomeAspect.logger.info(HomeAspect.logMsg + "예약번호:" + exReserveCode);

		int resPoint = (int) point;
		HomeAspect.logger.info(HomeAspect.logMsg + "resPoint:" + resPoint);

		// 멤버 포인트 업데이트하기, plusPoint는 적립금- 사용금
		int nowPoint = experienceDao.getPoint(email);

		int plusPoint = nowPoint + (resPoint - usePoint);
		int pointUpdate = experienceDao.pointUpdate(memberCode, plusPoint);

		// 체험 사진
		List<ExFileDto> exFileList = experienceDao.exPageImgList(exCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "exPageImgList : " + exFileList.toString());

		String mainImg = null;
		for (int i = 0; i < exFileList.size(); i++) {
			if (exFileList.get(i).getMainImgName() != null) {
				mainImg = exFileList.get(i).getMainImgName();
			}
		}

		// 메세지 보관함
		// String msgContent = "(체험) "+experienceDto.getExName()+"이 예약 완료 되었습니다. 예약 목록을
		// 확인해보세요";
		// int megChk = experienceDao.message(memberCode,msgContent);

		mav.addObject("exReserveCode", exReserveCode);
		mav.addObject("exReserveDto", exReserveDto);
		mav.addObject("experienceDto", experienceDto);
		mav.addObject("mainImg", mainImg);
		mav.addObject("plusPoint", plusPoint);

		mav.setViewName("experience/exPageReserveOk.tiles");

	}

// 예약 가능일 달력
	@Override
	public void exReserveCal(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String exDateS = request.getParameter("exDate");
		int exCode = Integer.parseInt(request.getParameter("exCode"));
		System.out.println(exDateS + ", " + exCode);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date exDate = null;
		try {
			exDate = sdf.parse(request.getParameter("exDateS"));

		} catch (Exception e) {
			e.printStackTrace();
		}

		// 체험하는 인원 세기
		List<ExReserveDto> reserveList = experienceDao.reserveList(exCode, exDate);

		int totalPeople = 0;
		if (reserveList != null) {
			for (int i = 0; i < reserveList.size(); i++) {
				int people = reserveList.get(i).getExPeople();
				totalPeople += people;

			}
		}

		// 하루당 수용 가능 인원
		int exPeople = experienceDao.getPeople(exCode);

		// 아직 체험 가능할 때
		if (exPeople >= totalPeople) {

			int ablePeople = exCode - totalPeople;

			mav.addObject("ablePeople", ablePeople);

		} else {

		}

	}

}