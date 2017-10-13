package com.free.stat;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.free.stat.service.StatService;

@Controller
@RequestMapping("/stat")
public class StatController {
	
	@Autowired
	private StatService statService;
	
	@RequestMapping(value="/stat.html", method=RequestMethod.GET)
	public ModelAndView list(@RequestParam Map<String, String> queryString,
			HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("stat");
		return mav;
	}
	
}
