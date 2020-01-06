package com.java.host.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAspect;
import com.java.experience.dto.ExperienceDto;
import com.java.file.dto.FileDto;
import com.java.guestReserve.dto.GuestReserveDto;
import com.java.guestdelluna.service.DellunaService;
import com.java.host.dao.HostDao;
import com.java.host.dto.ExReservationListDto;
import com.java.host.dto.HostDto;
import com.java.host.dto.ReservationListDto;
import com.java.host.dto.SearchDateList;
import com.java.host.dto.SearchDateListCount;
import com.java.member.dto.MemberDto;

@Component
public class HostServiceImp implements HostService {
	@Autowired
	private HostDao hostDao;

	@Override
	public void hostRegisterPage(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		HttpSession session = request.getSession();
		int memberCode = (Integer)session.getAttribute("memberCode");
		
		MemberDto memberDto = hostDao.selectMemberDto(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "memberDto :" + memberDto.toString());
		
		mav.addObject("memberDto", memberDto);
		mav.setViewName("host/hostRegister2.tiles");
	}
	
	@Override
	public void hostRegister(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
		
		//---------------------------------------memberDto
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);
		
		if (request.getFile("profileImg") != null) {
			MultipartFile upFile = request.getFile("profileImg");
			long profileFileSize = upFile.getSize();
			String fileName = Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();
			
			File path = new File("c:/profile");
			path.mkdir();
			
			if (path.exists() && path.isDirectory()) {
				File file = new File(path, fileName);
				
				try {
					upFile.transferTo(file);
				}catch(IOException e) {
					e.printStackTrace();
				}
				
				MemberDto memberDto = new MemberDto();
				memberDto.setMemberInfo(request.getParameter("memberInfo").replace("\r\n", "<br/>"));
				memberDto.setMemberImgSize(profileFileSize);
				memberDto.setMemberImgName(fileName);
				memberDto.setMemberImgPath(path.getAbsolutePath());
				memberDto.setEmail(email);
				HomeAspect.logger.info(HomeAspect.logMsg + memberDto.toString());
				
				int profileCheck = hostDao.memberProfileImg(memberDto);
			}
		}
		
		
		
		//----------------------------------------hostDto
		int memberCode = hostDao.memberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);
		
		
		HostDto hostDto = (HostDto)map.get("hostDto");
		hostDto.setMemberCode(memberCode);
		
		String checkIn = request.getParameter("checkInHH") + ":" + request.getParameter("checkInMM");
		hostDto.setCheckInTime(checkIn);
		String checkOut = request.getParameter("checkOutHH") + ":" + request.getParameter("checkOutMM");
		hostDto.setCheckOutTime(checkOut);
		
		String roadAddr = request.getParameter("sample4_roadAddress");
		String jibunAddr = request.getParameter("sample4_jibunAddress");
		hostDto.setAddress(roadAddr);
		hostDto.setjibunAddress(jibunAddr);
		
		String[] roadStr = roadAddr.split(" ");
		String[] jibunStr = jibunAddr.split(" ");
		String localName = jibunStr[2].substring(0, 2);
		HomeAspect.logger.info(HomeAspect.logMsg + "지번이름!!: " + localName);

		String local = hostDao.getLocal(localName);
		
		hostDto.setLocal(local);
		hostDto.setSido(roadStr[0]);
		hostDto.setSigungu(roadStr[1]);
		hostDto.setRoadName(roadStr[roadStr.length-2]);
		hostDto.setbName(jibunStr[jibunStr.length-2]);
		hostDto.setApprovalStatus("심사대기");
		hostDto.setAccount(Long.parseLong(request.getParameter("account")));
		hostDto.setBed(Integer.parseInt(request.getParameter("bed")));
		hostDto.setPeople(Integer.parseInt(request.getParameter("people")));
		hostDto.setPrice(Integer.parseInt(request.getParameter("price")));
		hostDto.setExplain(request.getParameter("explain").replace("\r\n", "<br/>"));
		hostDto.setEtc(request.getParameter("etc").replace("\r\n", "<br/>"));
		hostDto.setHouseRegDate(new Date());
		HomeAspect.logger.info(HomeAspect.logMsg + hostDto.toString());
		
		int hostRegisterCheck = hostDao.hostRegister(hostDto);
		mav.addObject("hostRegisterCheck", hostRegisterCheck);
		
		//-----------------------숙소번호가져오기
		int houseCode = hostDao.houseCode();
		HomeAspect.logger.info(HomeAspect.logMsg + "하우스코드:" + houseCode);
		
		//------------------------------------------FileDto(mainImg)
		MultipartFile mainFile = request.getFile("mainImg");
		
		long mainFileSize = mainFile.getSize();
		String mainFileName = Long.toString(System.currentTimeMillis()) + "_" + mainFile.getOriginalFilename();
		
		File mainFilePath = new File("c:/pdn");
		mainFilePath.mkdir();
		
		if (mainFilePath.exists() && mainFilePath.isDirectory()) {
			File file = new File(mainFilePath, mainFileName);
			
			try {
				mainFile.transferTo(file);
			}catch(IOException e) {
				e.printStackTrace();
			}

			FileDto fileDto = new FileDto();
			fileDto.setHouseCode(houseCode);
			fileDto.setmainImgName(mainFileName);
			fileDto.setFilePath(mainFilePath.getAbsolutePath());
			fileDto.setFileSize(mainFileSize);
			HomeAspect.logger.info(HomeAspect.logMsg + fileDto.toString());
			
			int mainImgUploadCheck = hostDao.mainImgUpload(fileDto);
			mav.addObject("mainImgUploadCheck", mainImgUploadCheck);
		}
		
		
		
		
		
		
		//------------------------------------------FileDto(subImg)
		List<MultipartFile> files = request.getFiles("subImg");
		File filepath = new File("c:/pdn");
		filepath.mkdir();
		
		for (int i=0;i <files.size(); i++) {
			String subFileName = Long.toString(System.currentTimeMillis()) + "_" + files.get(i).getOriginalFilename();
			long fileSize = files.get(i).getSize();
			
			if(filepath .exists() && filepath.isDirectory()) {
				File file = new File(filepath, subFileName);
				
				try {
					files.get(i).transferTo(file);
				}catch(IOException e) {
					e.printStackTrace();
				}
				
				FileDto fileDto = new FileDto();
				fileDto.setHouseCode(houseCode);
				fileDto.setFileName(subFileName);
				fileDto.setFilePath(filepath.toString());
				fileDto.setFileSize(fileSize);
				
				int check = hostDao.subImgUpload(fileDto);
				mav.addObject("check", check);
				
				HomeAspect.logger.info(HomeAspect.logMsg + fileDto);
				HomeAspect.logger.info(HomeAspect.logMsg + check);
			}
		}
		
		
		mav.setViewName("host/registerOk.tiles");
	}

	@Override
	public void hostPage(ModelAndView mav) {
		
		mav.setViewName("host/hostPage.tiles");
	}

	@Override
	public void reservationView(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		int memberCode = hostDao.memberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		
		List<String> houseNameList = hostDao.houseNameList(memberCode);
		mav.addObject("houseNameList", houseNameList);
		HomeAspect.logger.info(HomeAspect.logMsg + houseNameList.size());
		mav.setViewName("host/reservationView.tiles");
	}
	
	@Override
	public void reservationOkView(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		String pageNumber = request.getParameter("pageNumber");
		HomeAspect.logger.info(HomeAspect.logMsg + "pageNumber: " + pageNumber);
		
		String houseName = request.getParameter("houseName");
		HomeAspect.logger.info(HomeAspect.logMsg + "houseName: " + houseName);
		
		int houseCode = hostDao.getHouseCode(houseName);
		HomeAspect.logger.info(HomeAspect.logMsg + houseCode);

		if (pageNumber.equals("")) {
			pageNumber = "1";
		}
		int currentPage = Integer.parseInt(pageNumber);
		
		int count = hostDao.getReserveCount(houseCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "getReserveCount: " + count);
		
		int boardSize = 5;
		int startRow = (currentPage-1)*boardSize+1;
		int endRow = currentPage*boardSize;		
		
		
		List<ReservationListDto> reserveViewList = null; 
		if (count > 0) {
			reserveViewList = hostDao.reserveViewList(houseCode, startRow, endRow);
			for (int i=0; i<reserveViewList.size();i++) {
				HomeAspect.logger.info(HomeAspect.logMsg + reserveViewList.get(i).toString());
				
			}
		}
		
		mav.addObject("houseName", houseName);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.addObject("reserveViewList", reserveViewList);
		mav.setViewName("host/reservationOkView.empty");
	}
	
	public void exReservationView(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		int memberCode = hostDao.memberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg + memberCode);

		
		List<String> exNameList = hostDao.exNameList(memberCode);
		mav.addObject("exNameList", exNameList);
		HomeAspect.logger.info(HomeAspect.logMsg + exNameList.size());
		mav.setViewName("host/exReservationView.tiles");
	}
	
	@Override
	public void exReservationOkView(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		String pageNumber = request.getParameter("pageNumber");
		HomeAspect.logger.info(HomeAspect.logMsg + "pageNumber: " + pageNumber);
		
		String exName = request.getParameter("exName");
		HomeAspect.logger.info(HomeAspect.logMsg + "exName: " + exName);
		
		int exCode = hostDao.getExCode(exName);
		HomeAspect.logger.info(HomeAspect.logMsg + exCode);

		if (pageNumber.equals("")) {
			pageNumber = "1";
		}
		int currentPage = Integer.parseInt(pageNumber);
		
		int count = hostDao.getExReserveCount(exCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "getExReserveCount: " + count);
		
		int boardSize = 5;
		int startRow = (currentPage-1)*boardSize+1;
		int endRow = currentPage*boardSize;		
		
		
		List<ExReservationListDto> exReserveViewList = null; 
		if (count > 0) {
			exReserveViewList = hostDao.exReserveViewList(exCode, startRow, endRow);
			for (int i=0; i<exReserveViewList.size();i++) {
				HomeAspect.logger.info(HomeAspect.logMsg + exReserveViewList.get(i).toString());
				
			}
		}
		
		mav.addObject("exName", exName);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.addObject("exReserveViewList", exReserveViewList);
		mav.setViewName("host/exReservationOkView.empty");
	}
	

	@Override
	public void salesView(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		int memberCode = hostDao.memberCode(email);
		
		List<GuestReserveDto> salesList = hostDao.getSales(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "salesList개수: " + salesList.size());

		GuestReserveDto guestReserveDto =null;
		
		String[] date = new String[salesList.size()];
		
		String year = request.getParameter("year");
		java.util.Calendar cal = java.util.Calendar.getInstance();
		int currentYear = cal.get( cal.YEAR );
		if (year == null) {
			year = Integer.toString(currentYear);
		}
		HomeAspect.logger.info(HomeAspect.logMsg + year);
		for (int i=0; i<salesList.size();i++) {
			SimpleDateFormat simpleYear = new SimpleDateFormat("yyyyMM");
			SimpleDateFormat simpleMonth = new SimpleDateFormat("MM");
			date[i] = simpleYear.format(salesList.get(i).getReserveDate());
			HomeAspect.logger.info(HomeAspect.logMsg + date[i] + "," + salesList.get(i).getPayment());
			if (date[i].substring(0, 4).equals(year)) {
				date[i] = simpleMonth.format(salesList.get(i).getReserveDate());
				HomeAspect.logger.info(HomeAspect.logMsg + date[i] + "," + salesList.get(i).getPayment());
			}
		}
		
		int[] monthTotal = new int[12];
		for (int j = 1; j <= 12; j++) {
			for (int i = 0; i < date.length; i++) {
				if (Integer.parseInt(date[i])==j) {
					monthTotal[j-1] += salesList.get(i).getPayment();
				}
			}
			HomeAspect.logger.info(HomeAspect.logMsg + monthTotal[j-1]);
		}
		
		
		mav.addObject("year", year);
		mav.addObject("currentYear", currentYear);
		mav.addObject("monthTotal",monthTotal);
		mav.setViewName("host/salesView.tiles");
	}

	@Override
	public void houseManagement(ModelAndView mav) {
		mav.setViewName("host/houseManagement.tiles");
	}
	
	@Override
	public void houseManagementView(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		int memberCode = hostDao.memberCode(email);
		
		String pageNumber = request.getParameter("pageNumber");
		if (pageNumber.equals("")) {
			pageNumber = "1";
		}
		int currentPage = Integer.parseInt(pageNumber);
		
		int count = hostDao.getHouseCount(email);
		HomeAspect.logger.info(HomeAspect.logMsg + "HouseCount: " + count);
		
		int boardSize = 5;
		int startRow = (currentPage-1)*boardSize+1;
		int endRow = currentPage*boardSize;		
		
		List<HostDto> houseList = null;
		if (count > 0) {
			houseList = hostDao.houseList(memberCode,startRow,endRow);
			HomeAspect.logger.info(HomeAspect.logMsg + "HouseListSize: " + houseList.size());
		}

		
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.addObject("houseList", houseList);
		mav.setViewName("host/houseManagementView.empty");
	}

	@Override
	public void exManagement(ModelAndView mav) {
		mav.setViewName("host/exManagement.tiles");
	}
	
	@Override
	public void exManagementView(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		int memberCode = hostDao.memberCode(email);
		
		
		String pageNumber = request.getParameter("pageNumber");
		if (pageNumber.equals("")) {
			pageNumber = "1";
		}
		int currentPage = Integer.parseInt(pageNumber);
		
		int count = hostDao.getExCount(memberCode);
		HomeAspect.logger.info(HomeAspect.logMsg + "getExCount: " + count);
		
		int boardSize = 5;
		int startRow = (currentPage-1)*boardSize+1;
		int endRow = currentPage*boardSize;		
		
		List<ExperienceDto> experienceList = null;
		if (count > 0) {
			experienceList = hostDao.experienceList(memberCode,startRow,endRow);
			HomeAspect.logger.info(HomeAspect.logMsg + "experienceListSize: " + experienceList.size());
			
			for (int i=0; i<experienceList.size();i++) {
				HomeAspect.logger.info(HomeAspect.logMsg +experienceList.get(i).toString());
			}
			
			
		}
		
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.addObject("experienceList", experienceList);
		mav.setViewName("host/exManagementView.empty");
	}
	
	
	@Override
	public void hostCancel(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int houseCode = Integer.parseInt(request.getParameter("houseCode"));
		int cancelCheck = hostDao.hostCancel(houseCode);
		houseManagement(mav);
	}
	

	@Override
	public void exCancel(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int exCode = Integer.parseInt(request.getParameter("exCode"));
		int cancelCheck = hostDao.exCancel(exCode);
		exManagement(mav);
	}


	@Override
	public void searchDate(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		int memberCode = hostDao.memberCode(email);
		HomeAspect.logger.info(HomeAspect.logMsg +"memberCode: " + memberCode);
		
		String startDate = request.getParameter("from");
		String endDate = request.getParameter("to");
		
		HomeAspect.logger.info(HomeAspect.logMsg + "기간조회: " + startDate + "," + endDate);
		
		String pageNumber = request.getParameter("pageNumber");
		if (pageNumber.equals("")) {
			pageNumber = "1";
		}
		int currentPage = Integer.parseInt(pageNumber);
		
		SearchDateListCount searchDateListCount = hostDao.getSearchDateCount(memberCode, startDate, endDate);
		HomeAspect.logger.info(HomeAspect.logMsg + "getSearchDateCount: " + searchDateListCount.toString());
		int count = searchDateListCount.getCount();
		
		int boardSize = 5;
		int startRow = (currentPage-1)*boardSize+1;
		int endRow = currentPage*boardSize;		
		
		List<SearchDateList> searchDateList = null;
		if (count > 0) {
			searchDateList = hostDao.searchDateList(memberCode, startDate, endDate, startRow, endRow);
			HomeAspect.logger.info(HomeAspect.logMsg + "searchDateList: " + searchDateList.size());
			for (int i=0; i<searchDateList.size();i++) {
				HomeAspect.logger.info(HomeAspect.logMsg +searchDateList.get(i).toString());
				
			}
			
		}
		
		mav.addObject("searchDateListCount", searchDateListCount);
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.addObject("searchDateList", searchDateList);
		mav.setViewName("host/searchDate.empty");
	}

	@Override
	public void houseNameCheck(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		String houseName = request.getParameter("houseName");
		HomeAspect.logger.info(HomeAspect.logMsg +"입력한 houseName: " + houseName);
		
		int check = hostDao.houseNameCheck(houseName);
		HomeAspect.logger.info(HomeAspect.logMsg +"기존에 있는 숙소이름이면 1/ 아니면 0: " + check);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(check);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	





	

	

	
	
	
	
}
