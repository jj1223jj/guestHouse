package com.java.search.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.aop.HomeAspect;
import com.java.file.dto.FileDto;
import com.java.host.dto.HostDto;
import com.java.host.dto.HostImgDto;
import com.java.search.dto.GetCountDto;

@Component
public class SearchDaoImp implements SearchDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<HostImgDto> searchHouse(Map<String, Object> dataMap) {
		System.out.println(dataMap.get("sort"));
		List<HostImgDto> hostImgList = session.selectList("dao.searchMapper.searchHouse", dataMap);
		for(HostImgDto hostImgDto : hostImgList) {
			List<FileDto> fileList = session.selectList("dao.searchMapper.getHouseImg",hostImgDto.getHouseCode());
			hostImgDto.setFileList(fileList);
		}
		return hostImgList;
	}

	@Override
	public GetCountDto getCount(Map<String, Object> dataMap) {
		GetCountDto getCountDto= session.selectOne("dao.searchMapper.getCount", dataMap);
		System.out.println(getCountDto.getMax()+","+getCountDto.getMin());
		
		return getCountDto; 
	}
	
	//테스트 용으로 데이터 넣기 위한 함수
	@Override
	public int dataInputOk(HostDto hostDto) {
		return session.insert("dao.searchMapper.dataInput", hostDto);
	}

	@Override
	public HostImgDto overlay(int houseCode, Integer memberCode) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("houseCode", houseCode);
		map.put("memberCode", memberCode);
		
		HostImgDto hostImgDto = session.selectOne("dao.searchMapper.overlay", map);
		List<FileDto> fileList = session.selectList("dao.searchMapper.getHouseImg",houseCode);
		hostImgDto.setFileList(fileList);
		HomeAspect.logger.info(HomeAspect.logMsg+"ajax Dto: "+hostImgDto);
		
		return hostImgDto;
	}


}
