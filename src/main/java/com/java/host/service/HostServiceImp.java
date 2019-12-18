package com.java.host.service;

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
import com.java.file.dto.FileDto;
import com.java.host.dao.HostDao;
import com.java.host.dto.HostDto;
import com.java.host.dto.ReservationListDto;
import com.java.member.dto.MemberDto;

@Component
public class HostServiceImp implements HostService {
	@Autowired
	private HostDao hostDao;

	@Override
	public void hostRegister(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
		
		//---------------------------------------memberDto
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		HomeAspect.logger.info(HomeAspect.logMsg + email);
		MultipartFile upFile = request.getFile("profileImg");
		
		long profileFileSize = upFile.getSize();
		String fileName = Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();
		
		File path = new File("c:\\profile");
		path.mkdir();
		
		if (path.exists() && path.isDirectory()) {
			File file = new File(path, fileName);
			
			try {
				upFile.transferTo(file);
			}catch(IOException e) {
				e.printStackTrace();
			}
			
			MemberDto memberDto = new MemberDto();
			memberDto.setMemberInfo(request.getParameter("memberInfo"));
			memberDto.setMemberImgSize(profileFileSize);
			memberDto.setMemberImgName(fileName);
			memberDto.setMemberImgPath(path.getAbsolutePath());
			memberDto.setEmail(email);
			HomeAspect.logger.info(HomeAspect.logMsg + memberDto.toString());
			
			int profileCheck = hostDao.memberProfileImg(memberDto);
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
		hostDto.setSido(roadStr[0]);
		hostDto.setSigungu(roadStr[1]);
		hostDto.setRoadName(roadStr[roadStr.length-2]);
		hostDto.setbName(jibunStr[jibunStr.length-2]);
		hostDto.setApprovalStatus("심사 대기중");
		hostDto.setAccount(Integer.parseInt(request.getParameter("account")));
		hostDto.setBed(Integer.parseInt(request.getParameter("bed")));
		hostDto.setPeople(Integer.parseInt(request.getParameter("people")));
		hostDto.setPrice(Integer.parseInt(request.getParameter("price")));
		hostDto.setLocal("아직");
		hostDto.setHouseRegDate(new Date());
		HomeAspect.logger.info(HomeAspect.logMsg + hostDto.toString());
		
		int hostRegisterCheck = hostDao.hostRegister(hostDto);
		
		//-----------------------숙소번호가져오기
		int houseCode = hostDao.houseCode();
		HomeAspect.logger.info(HomeAspect.logMsg + "하우스코드:" + houseCode);
		
		//------------------------------------------FileDto(mainImg)
		MultipartFile mainFile = request.getFile("mainImg");
		
		long mainFileSize = mainFile.getSize();
		String mainFileName = Long.toString(System.currentTimeMillis()) + "_" + mainFile.getOriginalFilename();
		
		File mainFilePath = new File("c:\\pds");
		path.mkdir();
		
		if (path.exists() && path.isDirectory()) {
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
			
			int profileCheck = hostDao.mainImgUpload(fileDto);
		}
		
		
		
		
		
		
		//------------------------------------------FileDto(subImg)
		List<MultipartFile> files = request.getFiles("subImg");
		File filepath = new File("c:\\pds");
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
				
				HomeAspect.logger.info(HomeAspect.logMsg + fileDto);
				HomeAspect.logger.info(HomeAspect.logMsg + check);
			}
		}

		mav.setViewName("host/hostPage.tiles");
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
		
		
		String pageNumber = request.getParameter("pageNumber");
		if (pageNumber == null) {
			pageNumber = "1";
		}
		int currentPage = Integer.parseInt(pageNumber);
		
		int count = hostDao.getCount(email);
		
		int boardSize = 3;
		int startRow = (currentPage-1)*boardSize+1;
		int endRow = currentPage*boardSize;
		
		List<String> houseNameList;
		//if ()
		houseNameList = hostDao.houseNameList(memberCode);
		mav.addObject("houseNameList", houseNameList);
		HomeAspect.logger.info(HomeAspect.logMsg + houseNameList.size());
		mav.setViewName("host/reservationView.tiles");
	}
	
	@Override
	public void reservationOkView(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String houseName = request.getParameter("houseName");
		int houseCode = hostDao.getHouseCode(houseName);
		HomeAspect.logger.info(HomeAspect.logMsg + houseCode);
		List<ReservationListDto> reserveViewList = hostDao.reserveViewList(houseCode);
		for (int i=0; i<reserveViewList.size();i++) {
			HomeAspect.logger.info(HomeAspect.logMsg + reserveViewList.get(i).toString());
			
		}
		mav.addObject("reserveViewList", reserveViewList);
		
		mav.setViewName("host/reservationOkView.empty");
	}

	@Override
	public void salesView(ModelAndView mav) {

		mav.setViewName("host/salesView.tiles");
	}

	@Override
	public void houseManagement(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		int memberCode = hostDao.memberCode(email);
		
		List<HostDto> houseList = hostDao.houseList(memberCode);
		mav.addObject("houseList", houseList);
		
		mav.setViewName("host/houseManagement.tiles");
	}

	@Override
	public void hostCancel(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int houseCode = Integer.parseInt(request.getParameter("houseCode"));
		int cancelCheck = hostDao.hostCancel(houseCode);
		
		
		 houseManagement(mav);
	}
	
	
}
