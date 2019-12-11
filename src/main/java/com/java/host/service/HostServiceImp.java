package com.java.host.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.java.host.dao.HostDao;
import com.java.host.dto.HostDto;

public class HostServiceImp implements HostService {
	@Autowired
	private HostDao hostDao;

	@Override
	public void hostRegister(ModelAndView mav) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		
		mav.setViewName("host/guestRoom.tiles");
	}
	
	
}
