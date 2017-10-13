package com.free.board.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.free.board.admin.service.BoardAdminService;

@Controller
public class BoardAdminController {
	
	@Autowired
	private BoardAdminService boardAdminService;
	
}
