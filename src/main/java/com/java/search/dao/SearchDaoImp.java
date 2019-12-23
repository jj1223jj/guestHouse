package com.java.search.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.file.dto.FileDto;
import com.java.host.dto.HostDto;
import com.java.host.dto.HostImgDto;

@Component
public class SearchDaoImp implements SearchDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<HostImgDto> searchHouse(Map<String, Object> dataMap) {
		List<HostImgDto> hostImgList = session.selectList("dao.searchMapper.searchHouse", dataMap);
		for(HostImgDto hostImgDto : hostImgList) {
			List<FileDto> fileList = session.selectList("dao.searchMapper.getHouseImg",hostImgDto.getHouseCode());
			hostImgDto.setFileList(fileList);
		}
		return hostImgList;
	}

	@Override
	public int getCount(Map<String, Object> dataMap) {
		return session.selectOne("dao.searchMapper.getCount", dataMap);
	}
	
	//테스트 용으로 데이터 넣기 위한 함수
	@Override
	public int dataInputOk(HostDto hostDto) {
		return session.insert("dao.searchMapper.dataInput", hostDto);
	}


}
