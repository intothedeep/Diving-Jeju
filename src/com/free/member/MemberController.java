package com.free.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.free.member.model.MemberDetailDto;
import com.free.member.model.MemberDto;
import com.free.member.model.ZipDto;
import com.free.member.service.MemberService;
import com.free.util.Encoding;

@Controller
@RequestMapping("/member")
@SessionAttributes("loginInfo")//id라는 키로 저장된 attribute는 세션객체에 저장 됨
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/loginWithKakao", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, String> loginWithKakao(@ModelAttribute MemberDto memberDto, HttpSession session, HttpServletResponse response) {
		response.setContentType("application/x-www-form-urlencoded;charset=UTF-8");
		memberDto.setId(memberDto.getName());
		memberDto.setJoinType(5); //5: 카카오 통해 가입
		memberDto.setMemberType(1); //3: 일반사용자
		memberDto.setPass("123");
		//카카오회원 싸이트 DB 확인 후 있으면 업데이트 없으면 인서트
		session.setAttribute("loginInfo", memberDto);
		int count = memberService.checkIfKakaoisInDB(memberDto);
		
		Map<String, String> map = new HashMap<>();
		map.put("status", count + "");
		
		return map;
	}
	
	@RequestMapping(value="/register.html", method=RequestMethod.GET)
	public String register() {
		return "/WEB-INF/join/join";
	}
	
	@RequestMapping(value="/register.html", method=RequestMethod.POST)
	public ModelAndView register(MemberDetailDto memberDetailDto) {
		int cnt = memberService.register(memberDetailDto);
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", memberDetailDto);
		mav.setViewName("/WEB-INF/login/loginid");
		if (cnt !=0)
			System.out.println("가입성공!");
		else
			System.out.println("가입실패!");
		return mav;
	}
	
	@RequestMapping(value="/loginid.html", method=RequestMethod.GET)
	public String loginId() {
		return "/WEB-INF/login/loginid";
	}
	
	@RequestMapping(value="/loginpassword.html", method=RequestMethod.GET)
	public String loginPass() {
		return "/WEB-INF/login/loginpassword";
	}
	
	@RequestMapping(value="/loginid.html", method=RequestMethod.POST)
	public ModelAndView loginId(@RequestParam(value="id") String email) {
		MemberDto memberDto = memberService.loginId(email);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/WEB-INF/login/loginfail");			
		
		if (memberDto != null) {
			mav.addObject("loginInfo", memberDto);
			mav.setViewName("/WEB-INF/login/loginpassword");	
		} else {
			JOptionPane.showMessageDialog(null, "아이디를 확인해 주세요!");
			mav.setViewName("/WEB-INF/login/loginid");
		}
		return mav;
	}
	
	@RequestMapping(value="/loginpassword.html", method=RequestMethod.POST)
	public ModelAndView loginPass(@RequestParam Map<String, String> map, HttpSession session) {
//		System.out.println(map.get("email") + " " + map.get("pass"));
		MemberDto memberDto = memberService.loginPass(map);
		ModelAndView mav = new ModelAndView();
		
		
		if (memberDto != null) {
			mav.addObject("loginInfo", memberDto);
			mav.setViewName("redirect:/admin/main.html");	
		} else {
			mav.addObject("loginInfo", memberDto);
			JOptionPane.showMessageDialog(null, "비밀번호를 확인해 주세요!");
			mav.setViewName("/WEB-INF/login/loginpassword");
		}
		return mav;
	}
	
//	@RequestMapping(value="/logout.html", method=RequestMethod.GET)
//	public String logout(HttpSession session) {
//		session.invalidate();
////		session.removeAttribute("loginSession");
//		return "/index";
//	}
	
	@RequestMapping(value="/logout.html", method=RequestMethod.GET)
	public String logout(@ModelAttribute MemberDto loginInfo, WebRequest request, SessionStatus status) {
	    status.setComplete();
	    request.removeAttribute("loginInfo", WebRequest.SCOPE_SESSION);
		return "/index";
	}
	
	@RequestMapping(value="/memberinfo.html", method=RequestMethod.GET)
	public ModelAndView memberInfo(HttpSession session) { 
		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		String email = loginInfo.getEmail();
		
		MemberDetailDto memberInfo = memberService.getMember(email);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberInfo", memberInfo);
		mav.setViewName("/WEB-INF/management/memberinfo");

		return mav;
	}
	
	@RequestMapping(value="/modify.html", method=RequestMethod.POST)
	public ModelAndView modify(@ModelAttribute MemberDetailDto memberDetailDto) { 
		memberService.modify(memberDetailDto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/main");

		return mav;
	}	
	
	@RequestMapping(value="/bookinfo.html", method=RequestMethod.GET)
	public String memberinfo() {
		return "/WEB-INF/management/bookinfo";
	}
	
	
	
	
	
	
	
	
	
	
	////////////////////////////////////////////////////////////////
			
	@RequestMapping("/idcheck.kitri")
	public @ResponseBody String idCheck(@RequestParam("sid") String sid) {
		int cnt= memberService.idCheck(sid);
		JSONObject json = new JSONObject();
		json.put("count", cnt); //{'count' : '1'}
		json.put("sid", sid);//{'count' : '1', 'sid' : 'java2'}
		
//		System.out.println(json.toJSONString());
		return json.toJSONString();
	}
	
	@RequestMapping(value="/zipsearch.kitri", method=RequestMethod.GET)
	public String zipSearch() {
		return "/WEB-INF/join/zipsearch";
	}
	
	@RequestMapping(value="/zipsearch.kitri", method=RequestMethod.POST)
	public @ResponseBody String zipsearch(@RequestParam("sdong") String sdong) {
//		System.out.println("검색동 : >>> " + sdong);
		
		List<ZipDto> list = memberService.zipSearch(sdong);
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		for (ZipDto zipDto: list) {
			JSONObject jsonaddr = new JSONObject();
			jsonaddr.put("zip1", zipDto.getZip1());
			jsonaddr.put("zip2", zipDto.getZip2());
			jsonaddr.put("address", Encoding.urlUtf(zipDto.getSido().replaceAll(" ", "") + "&nbsp;" + zipDto.getGugun().replaceAll(" ", "") + "&nbsp;" + zipDto.getDong().replaceAll(" ", "&nbsp;") + "&nbsp;" + zipDto.getBunji().replaceAll(" ", "")));
			
			jarr.add(jsonaddr);
		
//			System.out.println(jsonaddr.get("address"));
		}
		json.put("ziplist", jarr);
		return json.toJSONString();
	}
	
	@RequestMapping(value="/mail.kitri", method=RequestMethod.GET)
	public String mail() {
		return "/WEB-INF/login/mail";
	}
}
