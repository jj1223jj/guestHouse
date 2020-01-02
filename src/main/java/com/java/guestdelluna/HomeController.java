package com.java.guestdelluna;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.admin.dao.AdminDao;
import com.java.admin.service.AdminService;
import com.java.aop.HomeAspect;
import com.java.experience.dto.ExperienceDto;
import com.java.member.dto.MemberDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private AdminDao adminDao;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is oh-yeah!");
		
		return "search/index3.tiles";
		
	}
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public ModelAndView
	 * mainPage(HttpServletRequest request, HttpServletResponse response) {
	 * 
	 * ModelAndView mav = new ModelAndView(); mav.addObject("request", request);
	 * 
	 * List<ExperienceDto> experienceDto = adminDao.mainPage();
	 * 
	 * HomeAspect.logger.info(HomeAspect.logMsg +"memberDto: "+
	 * experienceDto.toString());
	 * 
	 * mav.addObject("experienceDto",experienceDto);
	 * 
	 * mav.setViewName("search/index3.tiles");
	 * 
	 * 
	 * 
	 * return mav; }
	 */
	
}
