package com.free.board.all.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.free.board.admin.model.BoardDto;
import com.free.board.all.model.ReboardDto;
import com.free.board.all.service.BoardCommonService;
import com.free.board.all.service.FreeBoardService;
import com.free.member.model.MemberDto;
import com.free.util.PageNavigation;

@Controller
@RequestMapping("/freeboard")
public class FreeBoardController {

	@Autowired
	private FreeBoardService freeBoardService;
	
	@Autowired
	private BoardCommonService boardCommonService;
	
	@RequestMapping(value="/list.html", method=RequestMethod.GET)
	public ModelAndView list(@RequestParam Map<String, String> queryString,
			HttpServletRequest request, HttpSession session) {
		List<ReboardDto> list = freeBoardService.listArticle(queryString);
		
		ModelAndView mav = new ModelAndView();
		PageNavigation navigation = boardCommonService.makePageNavigation(queryString);
		navigation.setRoot(request.getContextPath());
		navigation.setNavigator();
		
		mav.addObject("qs", queryString);
		mav.addObject("articleList", list);
		mav.addObject("pageNation", navigation);
		mav.setViewName("freeboard");
		return mav;
	}
	
	@RequestMapping(value="/view.html", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam Map<String, String> queryString,
								@RequestParam("seq") int seq, HttpSession session, 
									HttpServletRequest request, HttpServletResponse response) {
		
		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		String root = request.getContextPath();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("qs", queryString);
		mav.setViewName("freeboardview");

////////////////////////////////////////////////////////////////////////////
		ReboardDto dto = null;

		
		Cookie[] cookies = request.getCookies();
		String key = "";
		String value = "";
		int token = 0;
		int tokenSize = 0;

		Cookie hitCheck = null;
		
		List<Integer> hitList = null;
////////////////////////////////////////////////////////
//		초기화용
//		for (int i=0; i<cookies.length; i++) {
//			cookies[i].setMaxAge(0);
//			response.addCookie(cookies[i]);
//			System.out.println("!111111");
//		}
//		session.removeAttribute("hit");
////////////////////////////////////////////////////////		
		
		Calendar calendar = Calendar.getInstance();
		int date = calendar.get(Calendar.DAY_OF_YEAR);
		
		
		
/*		
		int hourOfDay = calendar.get(Calendar.HOUR_OF_DAY);
		int hour = calendar.get(Calendar.HOUR);
		int time = calendar.get(Calendar.LONG);
		System.out.println(hourOfDay + "-------------------------hourofday");
		System.out.println(hour + "==============================hour");
		System.out.println(time + "-----------------------time");
		
		String inTime = new java.text.SimpleDateFormat("HHmmss").format(new java.util.Date());
		System.out.println(inTime);
*/
		
		//하루가 지나면 세션 초기화 하는 로직
		List<Integer> invalidDateCheck = (List<Integer>) session.getAttribute("hit");
		if (invalidDateCheck != null && !invalidDateCheck.isEmpty()) {
			if (invalidDateCheck.get(0) != date) {
				session.removeAttribute("hit");
			} 
		}
		
		//로그인 한 사람들을 하루가 지나면 쿠키 초기화 하는 로직
		//여기서 이렇게 해도 되고 아래에서 hitCheck.getMaxAge()를 이요해서 만료시켜도 된다.
		//cookie 지울 때 path지정 안해주면 안 지워진다.
		if (loginInfo != null) {
			if (cookies != null && cookies.length >=1) {
				for(Cookie c: cookies) {
					key = c.getName();
					if(key.equals(loginInfo.getId())) {
						value = c.getValue();
						
						StringTokenizer tokens = new StringTokenizer(value, "|");
						token = Integer.parseInt(tokens.nextToken());
						System.out.println("쿠키 위에서 초기화 할 때 첫 토큰 = " + token);
						System.out.println("쿠키 위에서 초기화 할 때 date = " + date);
						//첫번째 토큰은 쿠키가 만들어진 날의 date가 들어가 있고 그 데이트를 현재 date와 비교를 해서 
						//다르면 모든 쿠키를 초기화 시켜준다.
						if (token != date) {
							for (int i=0; i<cookies.length; i++) {
								if (key.equals(loginInfo.getId())) {
									cookies[i].setMaxAge(0);
									cookies[i].setPath(root);
									//
									System.out.println(cookies[i].getMaxAge() + " maxage 초기화 되나/.?");
									response.addCookie(cookies[i]);
								}
							}
						}
					}
				}
			}
		}
/*
//		이렇게 하면 이 때 사람들이 뷰를 클릭 안하면 초기화 되지 않는다.
//		if ("170000".equals(inTime)) {
		if (date == 17) {
			for (Cookie empty: cookies) {
				empty.setMaxAge(0);
				response.addCookie(empty);
			}
//			여기서 세션을 끝낼 수 있고 아니면 아래처럼 if문과 date를 이용해서 세션을 죽일 수 있다.
			session.invalidate();
		}
*/
		//ip check!
		System.out.println(getClientIP(request) + "11111111111111");
		
		if (seq != 0) {
			if (loginInfo != null) {
				if (cookies != null && cookies.length >= 1) {
					
					for (Cookie c : cookies) {
						key = c.getName();
						if (key.equals(loginInfo.getId())) {
							value = c.getValue();
							
							System.out.println(c.getValue());

							StringTokenizer seqToken = new StringTokenizer(value, "|");					
							tokenSize = seqToken.countTokens();
							
							for (int i = 0; i < tokenSize; i++) {
								token = Integer.parseInt(seqToken.nextToken());
								System.out.println(token + " <<|||>> " + i);
								
								if (token == seq) {
									dto = freeBoardService.getArticle(seq);
									mav.addObject("article", dto);
									return mav;
								}
								
							}
							
							hitCheck = new Cookie(loginInfo.getId(), value + seq + "|");
							hitCheck.setPath(root);
							
							int maxAge = hitCheck.getMaxAge();
							//// 여기서 hitCheck의 원래 쿠키의 MaxAge를 구해서 새롭게 만들어진 쿠키에 부여한다.
							//그러면 쿠키가 자동으로 소멸 함!!!
							hitCheck.setMaxAge(maxAge);
							response.addCookie(hitCheck);
							///////
							System.out.println(maxAge + " else max age");

							boardCommonService.updateHit(seq);

							dto = freeBoardService.getArticle(seq);
							mav.addObject("article", dto);
							return mav;
						}
					}
				}
				hitCheck = new Cookie(loginInfo.getId(), date + "|" + seq + "|");
				//
				System.out.println(hitCheck.getValue() + " 쿠키 새로만들어졌어요!");
				
				hitCheck.setPath(root);
				hitCheck.setMaxAge(60*60*10);
				response.addCookie(hitCheck);

				boardCommonService.updateHit(seq);

				dto = freeBoardService.getArticle(seq);
				mav.addObject("article", dto);
				return mav;
			} else {
				//로그인 안 했을 때는 아이피를 이요해서 조회수를 관리하자
				hitList = (List<Integer>) session.getAttribute("hit");
				
				if (hitList != null && !hitList.isEmpty()) {
					if (hitList.get(0) == date) {
						for (Integer check: hitList) {
							if ( seq == check) {
								dto = freeBoardService.getArticle(seq);
								mav.addObject("article", dto);
								return mav;
							}
						}
						
						hitList.add(seq);
						session.setAttribute("hit",	hitList);
						boardCommonService.updateHit(seq);

						dto = freeBoardService.getArticle(seq);
						mav.addObject("article", dto);
						return mav;
					} else {
						session.removeAttribute("hit");
						hitList = new ArrayList<Integer>();
						hitList.add(date);
						hitList.add(seq);
						session.setAttribute("hit",	hitList);
						boardCommonService.updateHit(seq);

						dto = freeBoardService.getArticle(seq);
						mav.addObject("article", dto);
						return mav;
					}
				} else {
					hitList = new ArrayList<Integer>();
					hitList.add(date);
					//
					System.out.println("date session = " + hitList.get(0));
					
					hitList.add(seq);
					session.setAttribute("hit",	hitList);
					boardCommonService.updateHit(seq);

					dto = freeBoardService.getArticle(seq);
					mav.addObject("article", dto);
					return mav;
				}
			}
		}
////////////////////////////////////////////////////////////////////////////

		dto = freeBoardService.getArticle(seq);
		mav.addObject("article", dto);
		return mav;
	}
	
	@RequestMapping(value="/write.html", method=RequestMethod.POST)
	public ModelAndView write(@RequestParam Map<String, String> queryString, 
			ReboardDto reboardDto, HttpSession session, HttpServletRequest request) {
		
//		System.out.println(queryString.get("bcode"));
//		System.out.println(queryString.get("pg"));
//		System.out.println(queryString.get("word"));
//		System.out.println(queryString.get("key"));
//		System.out.println(queryString.get("content"));
//		System.out.println(queryString.get("subject"));

		MemberDto memberDto = (MemberDto) session.getAttribute("loginInfo");
		ModelAndView mav = new ModelAndView();

		if(memberDto != null) {
			int seq = boardCommonService.getNextSeq();
			
			System.out.println(seq + "<<<<<<<<<<<<<<<<seq");
			
			reboardDto.setSeq(seq);
			reboardDto.setId(memberDto.getId());
			reboardDto.setName(memberDto.getName());
			reboardDto.setEmail(memberDto.getEmail());
			reboardDto.setRef(seq);
			
			int cnt = freeBoardService.freeBoardWrite(reboardDto);
//			if (cnt != 0)
//				JOptionPane.showMessageDialog(null, "글 작성 성공");
//			else
//				JOptionPane.showMessageDialog(null, "글 작성 실패");
			
			List<ReboardDto> list = freeBoardService.listArticle(queryString);
			PageNavigation navigation = boardCommonService.makePageNavigation(queryString);
			navigation.setRoot(request.getContextPath());
			navigation.setNavigator();
			
			mav.addObject("articleList", list);
			mav.addObject("pageNation", navigation);
			mav.addObject("seq", seq);
			mav.addObject("qs", queryString);
			mav.setViewName("freeboard");
		} else {
			mav.setViewName("/index");//나중에 login page로 이동
		}
		return mav;
	}
	
	@RequestMapping(value="/hotlist",
			produces=MediaType.APPLICATION_JSON_UTF8_VALUE,
			method=RequestMethod.GET)
	@ResponseBody
	public List<ReboardDto> hotList(){
		List<ReboardDto> list = freeBoardService.getHotList();
		return list;
	}
	
	@RequestMapping(value="/plusUp.html", method=RequestMethod.GET)
	public @ResponseBody String plusUp(@RequestParam("seq") int seq){
		int up = boardCommonService.plusUp(seq);
		return up + "";
	}
	
	@RequestMapping(value="/plusDown.html", method=RequestMethod.GET)
	public @ResponseBody String plusDown(@RequestParam("seq") int seq){
		int down = boardCommonService.plusDown(seq);
		return down + "";
	}
	
	@RequestMapping(value="/modify.html", method=RequestMethod.POST)
	public ModelAndView modify(@RequestParam Map<String,String> queryString
							, BoardDto dto){
		ModelAndView mav = new ModelAndView();
		int cnt = freeBoardService.modifyArticle(dto);
		ReboardDto reboardDto = freeBoardService.getArticle(Integer.parseInt(queryString.get("seq")));
		mav.addObject("qs", queryString);
		mav.addObject("article", reboardDto);
		mav.setViewName("freeboardview");
		return mav;
	}
	
	@RequestMapping(value="/reply.html", method=RequestMethod.POST)
	public ModelAndView reply(@RequestParam Map<String, String> queryString,
								ReboardDto dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDto memberDto = (MemberDto) session.getAttribute("loginInfo");
		if(memberDto != null) {
			int seq = boardCommonService.getNextSeq();
			dto.setSeq(seq);
			dto.setId(memberDto.getId());
			dto.setName(memberDto.getName());
			dto.setEmail(memberDto.getEmail());
			freeBoardService.replyArticle(dto);
			mav.addObject("qs", queryString);
			mav.addObject("article", freeBoardService.getArticle(seq));
			mav.setViewName("freeboardview");
		} else {
			mav.setViewName("/index");//나중에 login page로 이동
		}
		return mav;
	}
	
	@RequestMapping(value="/delete.html", method=RequestMethod.GET)
	public ModelAndView delete(@RequestParam Map<String, String> queryString,
								@RequestParam("seq") int seq, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		MemberDto memberDto = (MemberDto) session.getAttribute("loginInfo");
		if(Integer.parseInt(queryString.get("reply")) != 0)
			System.out.println("삭제불가능");
		else {
			System.out.println("삭제가능");
			freeBoardService.deleteArticle(seq);
		}
		List<ReboardDto> list = freeBoardService.listArticle(queryString);
		PageNavigation navigation = boardCommonService.makePageNavigation(queryString);
		navigation.setRoot(request.getContextPath());
		navigation.setNavigator();
		
		mav.addObject("articleList", list);
		mav.addObject("pageNation", navigation);
		mav.addObject("seq", seq);
		mav.addObject("qs", queryString);
		mav.setViewName("freeboard");		
		return mav;
	}
	
	
	///ip 얻기
	public String getClientIP(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
}
