package com.free.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.free.admin.service.PicService;

@Controller
public class PicController {
	
	@Autowired
	private PicService picService;

}
