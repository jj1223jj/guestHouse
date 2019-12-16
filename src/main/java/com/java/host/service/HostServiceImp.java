package com.java.host.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAscpect;
import com.java.file.dto.FileDto;
import com.java.host.dao.HostDao;
import com.java.host.dto.HostDto;

@Component
public class HostServiceImp implements HostService {
	@Autowired
	private HostDao hostDao;

	@Override
	public void hostRegister(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
		
		//---------------------------------------memberDto
		MultipartFile upFile = request.getFile("profileImg");
		long profileFileSize = upFile.getSize();
		if(profileFileSize != 0) {
			String fileName = Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();
			
			File path = new File("");
			path.mkdir();
			
			if (path.exists() && path.isDirectory()) {
				File file = new File(path, fileName);
				
				try {
					upFile.transferTo(file);
				}catch(IOException e) {
					e.printStackTrace();
				}
				
				//MemberDto memberDto = new MemberDto();
				//memberDto.setHouseImgSize(profileFileSize);
				//memberDto.setHouseImgName(fileName);
				//memberDto.setHouseImgPath(file.getAbsolutePath());
			}
		}
		
		
		
		//----------------------------------------hostDto
		HostDto hostDto = (HostDto)map.get("hostDto");
		
		String checkIn = request.getParameter("checkInHH") + ":" + request.getParameter("checkInMM");
		hostDto.setCheckIn(checkIn);
		String checkOut = request.getParameter("checkOutHH") + ":" + request.getParameter("checkOutMM");
		hostDto.setCheckOut(checkOut);
		
		String roadAddr = request.getParameter("sample4_roadAddress");
		String jibunAddr = request.getParameter("sample4_jibunAddress");
		hostDto.setAddress(roadAddr);
		hostDto.setAutoJibunAddress(jibunAddr);
		
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
		List<MultipartFile> files = request.getFiles("subImg");
		
		int profileCheck = hostDao.hostRegister(hostDto);
		
		
		
		
		//------------------------------------------fileDto
		File filepath = new File("c:\\pds");
		filepath.mkdir();
		
		for (int i=0;i <files.size(); i++) {
			String fileName = Long.toString(System.currentTimeMillis()) + "_" + files.get(i).getOriginalFilename();
			long fileSize = files.get(i).getSize();
			
			if(filepath .exists() && filepath.isDirectory()) {
				File file = new File(filepath, fileName);
				
				try {
					files.get(i).transferTo(file);
				}catch(IOException e) {
					e.printStackTrace();
				}
				
				FileDto fileDto = new FileDto();
				fileDto.setFileName(fileName);
				fileDto.setFilePath(filepath.toString());
				fileDto.setFileSize(fileSize);
				
				int check = hostDao.subImgUpload(fileDto);
				
				HomeAscpect.logger.info(HomeAscpect.logMsg + fileDto);
				HomeAscpect.logger.info(HomeAscpect.logMsg + check);
			}
		}
		
//		MultipartFile upFile = request.getFile("subImg");
//		long fileSize = upFile.getSize();
//		if(fileSize != 0) {
//			String fileName = Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();
//			
//			File path = new File("c:\\pds");
//			path.mkdir();
//			
//			if (path.exists() && path.isDirectory()) {
//				File file = new File(path, fileName);
//				
//				try {
//					upFile.transferTo(file);
//				}catch(IOException e) {
//					e.printStackTrace();
//				}
//				
//				hostDto.setHouseImgSize(fileSize);
//				hostDto.setHouseImgName(fileName);
//				hostDto.setHouseImgPath(file.getAbsolutePath());
//			}
//		}

		HomeAscpect.logger.info(HomeAscpect.logMsg + hostDto.toString());
		
		
		
		mav.setViewName("host/guestRoom.tiles");
	}

	@Override
	public void hostPage(ModelAndView mav) {
		
		mav.setViewName("host/hostPage.tiles");
	}

	@Override
	public void reservationView(ModelAndView mav) {

		mav.setViewName("host/reservationView.tiles");
	}

	@Override
	public void salesView(ModelAndView mav) {

		mav.setViewName("host/salesView.tiles");
	}

	@Override
	public void houseManagement(ModelAndView mav) {

		mav.setViewName("host/houseManagement.tiles");
	}
	
	
}
