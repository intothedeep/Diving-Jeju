package com.free.board.all.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HotListController
 */
@WebServlet("/hotlist")
public class HotListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String act = request.getParameter("act");
//		
//		if("listhot".equals(act)) {
//			FreeBoardActionFactory.getFreeBoardHotListAction().execute(request, response);
//		} else if ("up".equals(act)) {
//			String path = FreeBoardActionFactory.getFreeBoardUpAction().execute(request, response);
//			PageMove.forward(path, request, response);
//			
//		} else if ("down".equals(act)) {
//			String path = FreeBoardActionFactory.getFreeboardDownAction().execute(request, response);
//			PageMove.redirect(path, request, response);
//		} 
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		doGet(request, response);
//	}
}
