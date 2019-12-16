package com.java.host.dao;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.file.dto.FileDto;
import com.java.host.dto.HostDto;

@Component
public class HostDaoImp implements HostDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

//	@Override
//	public int subImgUpload(String fileName, File filepath, long fileSize) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		map.put("fileName", fileName);
//		map.put("path", filepath);
//		map.put("fileSize", fileSize);
//		
//		//return sqlSession.insert("subImgUpload", map);
//		return 0;
//	}

	@Override
	public int subImgUpload(FileDto fileDto) {
		return sqlSession.insert("subImgUpload", fileDto);
	}

	@Override
	public int hostRegister(HostDto hostDto) {
		return sqlSession.insert("dd", hostDto);
	}
}
