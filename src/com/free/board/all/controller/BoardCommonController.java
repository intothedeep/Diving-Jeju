package com.free.board.all.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.free.board.all.service.BoardCommonService;

@Controller
@RequestMapping("/boardcommon")
public class BoardCommonController {

	@Autowired
	private BoardCommonService boardCommonService;

}
