package com.java.search.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.HomeAspect;
import com.java.exfile.dto.ExFileDto;
import com.java.experience.dto.ExperienceImgDto;
import com.java.file.dto.FileDto;
import com.java.host.dto.HostDto;
import com.java.host.dto.HostImgDto;
import com.java.search.dao.SearchDao;
import com.java.search.dto.GetCountDto;


@Component
public class SearchServiceImp implements SearchService {

	@Autowired
	private SearchDao searchDao;

	@SuppressWarnings("unchecked")
	@Override
	public ModelAndView search(String checkIn, String checkOut, String local, String people, String searchHouseName, String pageNumber, Integer memberCode, String sort) {
		HomeAspect.logger.info(HomeAspect.logMsg+"local: "+local+", checkIn: "+checkIn+", checkOut: "+checkOut+ " ,people: "+people+", searchHouseName: "+searchHouseName+", pageNumber: "+pageNumber+", memberCode: "+memberCode+", sort: "+sort);
		ModelAndView mav = new ModelAndView();
		
		//myBatis에 넘겨줄 data, Map에 넣기
		Map<String, Object> dataMap = new HashMap<String,Object>();
		
		if(memberCode!=null)
			dataMap.put("memberCode", memberCode);
		dataMap.put("checkIn", checkIn);
		dataMap.put("checkOut", checkOut);
		dataMap.put("local", local);
		dataMap.put("people", people);
		if(sort!=null) {
			dataMap.put("sort", sort);
			mav.addObject("sort",sort);
		}
		//지역조건이 전체가 아니면 배열로 dataMap에 넣어주기
		if(local.split(",").length>=1 && !local.equals(""))
			dataMap.put("localSplit", local.split(","));
		//숙소이름 검색조건이 있으면 dataMap에 넣어주기
		if(!searchHouseName.equals(""))
			dataMap.put("searchHouseName",searchHouseName);

		//페이징
		int currentPage=pageNumber==null? 1:Integer.parseInt(pageNumber);
		
		//검색조건 결과가 0인지 확인
		GetCountDto getCountDto = searchDao.getCount(dataMap);
		int min = getCountDto.getMin();
		int max = getCountDto.getMax();
		max = max>=100000? 100000 : max;
		int count =getCountDto.getCount();
		HomeAspect.logger.info(HomeAspect.logMsg+"검색결과 count: " +count);

		//검색조건 결과 0아니면 데이터 10개씩 가져오기
		int boardSize=10;
		List<HostImgDto> searchHouseList=null;
		if(count>0) {
			int sRow = (currentPage-1)*boardSize+1;	//startRow
			int eRow = currentPage*boardSize;		//endRow
			
			dataMap.put("sRow", sRow);
			dataMap.put("eRow", eRow);
			searchHouseList = searchDao.searchHouse(dataMap); 
			HomeAspect.logger.info(HomeAspect.logMsg+"검색결과 개수: " +searchHouseList.size());
			HomeAspect.logger.info(HomeAspect.logMsg+"검색결과 : " +searchHouseList.toString());
			
			//검색 결과 list -> JSON으로
			JSONArray arr = new JSONArray();
			for(HostImgDto hostDto : searchHouseList) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("houseName",hostDto.getHouseName());
				map.put("houseCode",hostDto.getHouseCode());
				map.put("lat",hostDto.getLatLng().split(",")[0]);
				map.put("lng",hostDto.getLatLng().split(",")[1]);
				map.put("people",hostDto.getPeople());
				map.put("price",hostDto.getPrice());
				map.put("revRate",hostDto.getRevRate());
				map.put("revCount",hostDto.getRevCount());
				map.put("zzimed",hostDto.getZzimed());
				map.put("bed",hostDto.getBed());
				map.put("bath",hostDto.getBath());
				map.put("parking",hostDto.getParking());
				map.put("kitchen",hostDto.getKitchen());
				map.put("aircon",hostDto.getAircon());
				map.put("hotWater",hostDto.getHotWater());
				map.put("necessary", hostDto.getNecessary());
				map.put("wifi", hostDto.getWifi());
				map.put("washer", hostDto.getWasher());
				map.put("tv", hostDto.getTv());
				map.put("mart", hostDto.getMart());
				map.put("safety", hostDto.getSafety());
				
				JSONArray fileArr = new JSONArray();
				for(FileDto fileDto : hostDto.getFileList()) {
					HashMap<String, Object> fileMap = new HashMap<String, Object>();
					//fileMap.put("filePath",fileDto.getFilePath());
					fileMap.put("fileName",fileDto.getFileName());
					fileArr.add(fileMap);
				}
				map.put("fileList", fileArr);
				arr.add(map);
				HomeAspect.logger.info(HomeAspect.logMsg+"hostDto Json: " +map.toString());
			}
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("houseJson", arr);
			String jsonText = JSONValue.toJSONString(map);
			HomeAspect.logger.info(HomeAspect.logMsg+"JsonText: " +jsonText);
			
			mav.addObject("houseJson", jsonText);
			mav.addObject("jsonHouseList", jsonText);
		}
		
		//물어보기
		
		mav.addObject("pageNumber", 1);
		mav.addObject("min", min);
		mav.addObject("max", max);
		mav.addObject("searchHouseList", searchHouseList);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.addObject("checkIn", checkIn);
		mav.addObject("checkOut", checkOut);
		mav.addObject("local", local);
		mav.addObject("people", people);
		mav.addObject("searchHouseName", searchHouseName);
		
		return mav;
		
	}
	
	
	//테스트 용으로 데이터 넣기 위한 함수
	@Override
	public void dataInputOk(HostDto hostDto) {
		
		int check= searchDao.dataInputOk(hostDto);
		HomeAspect.logger.info(HomeAspect.logMsg+"dataInput check: "+check);
		
	}


	@SuppressWarnings("unchecked")
	@Override
	public String overlay(int houseCode, Integer memberCode) {
		HostImgDto hostImgDto = searchDao.overlay(houseCode, memberCode);

//		ObjectMapper mapper = new ObjectMapper();
//		try {
//			System.out.println("objectMapper: "+mapper.writeValueAsString(mapper));
//		} catch (JsonProcessingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("houseCode", hostImgDto.getHouseCode());
		map.put("houseName", hostImgDto.getHouseName());
		map.put("people", hostImgDto.getPeople());
		map.put("revRate", hostImgDto.getRevRate());
		map.put("revCount", hostImgDto.getRevCount());
		map.put("zzimed", hostImgDto.getZzimed());
		JSONArray fileArr= new JSONArray();
		for(FileDto fileDto: hostImgDto.getFileList()) {
			HashMap<String,String> fileMap = new HashMap<String,String>();
			fileMap.put("fileName", fileDto.getFileName());
			fileArr.add(fileMap);
		}
		map.put("fileList", fileArr);
		HomeAspect.logger.info(HomeAspect.logMsg+"jsonValue: "+JSONValue.toJSONString(map));
		HomeAspect.logger.info(HomeAspect.logMsg+"jsonObject: "+JSONObject.toJSONString(map));
		
		return JSONObject.toJSONString(map);
	}


	@SuppressWarnings("unchecked")
	@Override
	public ModelAndView searchEx(String checkIn, String checkOut, String local, String people, String searchExName,
			String pageNumber, Integer memberCode, String sort) {
		HomeAspect.logger.info(HomeAspect.logMsg+"local: "+local+", checkIn: "+checkIn+", checkOut: "+checkOut+ " ,people: "+people+", searchExName: "+searchExName+", pageNumber: "+pageNumber+", memberCode: "+memberCode+", sort: "+sort);
		
		ModelAndView mav = new ModelAndView();
		
		//myBatis에 넘겨줄 data, Map에 넣기
		Map<String, Object> dataMap = new HashMap<String,Object>();
		
		if(memberCode!=null)
			dataMap.put("memberCode", memberCode);
		dataMap.put("checkIn", checkIn);
		dataMap.put("checkOut", checkOut);
		dataMap.put("local", local);
		dataMap.put("people", people);
		if(sort!=null) {
			dataMap.put("sort", sort);
			mav.addObject("sort",sort);
		}
		//지역조건이 전체가 아니면 배열로 dataMap에 넣어주기
		if(local.split(",").length>=1 && !local.equals(""))
			dataMap.put("localSplit", local.split(","));
		//숙소이름 검색조건이 있으면 dataMap에 넣어주기
		if(!searchExName.equals(""))
			dataMap.put("searchExName",searchExName);

		//페이징
		int currentPage=pageNumber==null? 1:Integer.parseInt(pageNumber);
		
		//검색조건 결과가 0인지 확인
//		GetCountDto getCountDto = searchDao.getCount(dataMap);
//		int min = getCountDto.getMin();
//		int max = getCountDto.getMax();
//		max = max>=100000? 100000 : max;
//		int count =getCountDto.getCount();
		int count =searchDao.getExCount(dataMap);
		HomeAspect.logger.info(HomeAspect.logMsg+"검색결과 count: " +count);

		//검색조건 결과 0아니면 데이터 10개씩 가져오기
		int boardSize=10;
		List<ExperienceImgDto> searchExList=null;
		if(count>0) {
			int sRow = (currentPage-1)*boardSize+1;	//startRow
			int eRow = currentPage*boardSize;		//endRow
			
			dataMap.put("sRow", sRow);
			dataMap.put("eRow", eRow);
			searchExList = searchDao.searchEx(dataMap); 
			HomeAspect.logger.info(HomeAspect.logMsg+"검색결과 개수: " +searchExList.size());
			HomeAspect.logger.info(HomeAspect.logMsg+"검색결과 : " +searchExList.toString());
			
			//////////////////////////////////////////////////////////////////////////////////
			//검색 결과 list -> JSON으로
			JSONArray arr = new JSONArray();
			for(ExperienceImgDto exDto : searchExList) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("exName",exDto.getExName());
				map.put("exCode",exDto.getExCode());
				map.put("lat",exDto.getLatLng().split(",")[0]);
				map.put("lng",exDto.getLatLng().split(",")[1]);
				map.put("people",exDto.getExPeople());
				map.put("price",exDto.getExPrice());
				map.put("revRate",exDto.getRevRate());
				map.put("revCount",exDto.getRevCount());
				map.put("zzimed",exDto.getZzimed());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				map.put("exStartDate",sdf.format(exDto.getExStartDate()));
				map.put("exEndDate",sdf.format(exDto.getExEndDate()));
				map.put("exTime",exDto.getExTime());
				
				
				JSONArray exFileArr = new JSONArray();
				for(ExFileDto exFileDto : exDto.getExFileList()) {
					HashMap<String, Object> exFileMap = new HashMap<String, Object>();
					//exFileMap.put("exFilePath",exFileDto.getFilePath());
					exFileMap.put("exFileName",exFileDto.getFileName());
					exFileArr.add(exFileMap);
				}
				map.put("exFileList", exFileArr);
				arr.add(map);
				HomeAspect.logger.info(HomeAspect.logMsg+"exDto Json: " +map.toString());
			}
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("exJson", arr);
			String jsonText = JSONValue.toJSONString(map);
			HomeAspect.logger.info(HomeAspect.logMsg+"ExJsonText: " +jsonText);
			
			mav.addObject("exJson", jsonText);
			mav.addObject("jsonExList", jsonText);
		}

		//물어보기
		
		mav.addObject("pageNumber", 1);
		mav.addObject("searchExList", searchExList);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.addObject("checkIn", checkIn);
		mav.addObject("checkOut", checkOut);
		mav.addObject("local", local);
		mav.addObject("people", people);
		mav.addObject("searchExName", searchExName);
		
		return mav;
		
	}


	@SuppressWarnings("unchecked")
	@Override
	public String exOverlay(int exCode, Integer memberCode) {
		ExperienceImgDto exImgDto = searchDao.exOverlay(exCode, memberCode);

//		ObjectMapper mapper = new ObjectMapper();
//		try {
//			System.out.println("objectMapper: "+mapper.writeValueAsString(mapper));
//		} catch (JsonProcessingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("exCode", exImgDto.getExCode());
		map.put("exName", exImgDto.getExName());
		map.put("people", exImgDto.getExPeople());
		map.put("revRate", exImgDto.getRevRate());
		map.put("revCount", exImgDto.getRevCount());
		map.put("zzimed", exImgDto.getZzimed());
		JSONArray fileArr= new JSONArray();
		for(ExFileDto exFileDto: exImgDto.getExFileList()) {
			HashMap<String,String> fileMap = new HashMap<String,String>();
			fileMap.put("exFileName", exFileDto.getFileName());
			fileArr.add(fileMap);
		}
		map.put("exFileList", fileArr);
		HomeAspect.logger.info(HomeAspect.logMsg+"jsonValue: "+JSONValue.toJSONString(map));
		HomeAspect.logger.info(HomeAspect.logMsg+"jsonObject: "+JSONObject.toJSONString(map));
		
		return JSONObject.toJSONString(map);
	}




	
	
}
