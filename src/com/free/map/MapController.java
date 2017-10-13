package com.free.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.free.guesthouse.model.GuesthouseDto;
import com.free.map.service.MapService;

@Controller
@RequestMapping("/map")
public class MapController {
	
	@Autowired
	private MapService mapService;
	
	@RequestMapping("/map.html")
	public String map() {
		return "map";
	}
	
	@RequestMapping(value="/search.html", method=RequestMethod.GET)
	public ModelAndView search(@RequestParam("keyword") String keyword) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("keyword", keyword);
		mav.setViewName("/map/map");
		return mav;
	}
	
	@RequestMapping(value="/listguesthouse",
			produces="application/json;charset=UTF-8",
			method=RequestMethod.GET)
	@ResponseBody
	public List<GuesthouseDto> listGuesthouse() {
		List<GuesthouseDto> list = mapService.showGuesthouseList();
		return list;
	}
	

}
