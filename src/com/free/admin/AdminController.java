package com.free.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.free.admin.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/main.html", method=RequestMethod.GET)
	public String main() {
//		System.out.println("메인 들리나??");
		return "/main/main";
	}
	
	@RequestMapping(value="/management.html", method=RequestMethod.GET)
	public ModelAndView managementTab(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("loginInfo", session.getAttribute("loginInfo"));
		mav.setViewName("/WEB-INF/management/management");
		return mav;
	}
}
