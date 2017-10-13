package com.free.board.all.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.print.attribute.standard.Media;
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

import com.free.board.all.model.MemoDto;
import com.free.board.all.service.MemoService;
import com.free.member.model.MemberDto;

@Controller
@RequestMapping("/memo")
public class MemoController {

	@Autowired
	private MemoService memoService;
	
	private JSONObject makeList(int seq) {
		List<MemoDto> list = memoService.listMemo(seq);
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		for (MemoDto memoDto : list) {
			JSONObject jobj = new JSONObject();
			jobj.put("mseq", memoDto.getMseq());
			jobj.put("seq", memoDto.getSeq());
			jobj.put("id", memoDto.getId());
			jobj.put("name", memoDto.getName());
			//jobj.put("mcontent", memoDto.getMcontent());
			
			//jaxson이랑 같이 쓰면 인코딩이 이상해져서 이렇게 인코딩해주고 클라이언트에서 디코딩 해줘야 함!!
			//그냥 jaxson써서 하는게 더 편한 거 같음!
			String mContent = memoDto.getMcontent().replaceAll("\n", "<br>").replaceAll(" ", "&nbsp;");
			try {
				jobj.put("mcontent", URLEncoder.encode(mContent, "utf-8"));
				jobj.put("mtime", URLEncoder.encode(memoDto.getMtime(), "utf-8"));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			jobj.put("ref", memoDto.getRef());
			jobj.put("lev", memoDto.getLev());
			jobj.put("step", memoDto.getStep());
			jobj.put("pseq", memoDto.getPseq());
			jobj.put("reply", memoDto.getReply());
			jobj.put("mup", memoDto.getMup());

			jarr.add(jobj);
		}
		json.put("memolist", jarr);
		return json;
	}
	
	
	@RequestMapping(value="/write.html", method=RequestMethod.POST)
	public @ResponseBody String write(MemoDto memoDto, HttpSession session) {
		
		MemberDto memberDto = (MemberDto) session.getAttribute("loginInfo");
		memoDto.setId(memberDto.getId());
		memoDto.setName(memberDto.getName());
		memoService.writeMemo(memoDto);
		
		JSONObject json = makeList(memoDto.getSeq());
		
		return json.toJSONString();
	}
	
	@RequestMapping(value="/modify.html", method=RequestMethod.POST)
	public @ResponseBody String modify(MemoDto memoDto, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		memoService.modifyMemo(memoDto);
		
		JSONObject json = makeList(memoDto.getSeq());
		return json.toJSONString();
	}

//	JSONObject를 이용한 제이슨 반환
//	@RequestMapping(value="/list.html", method=RequestMethod.GET)
//	public @ResponseBody String list(@RequestParam("seq") int seq, HttpServletResponse response) {
//		response.setCharacterEncoding("utf-8");
//		JSONObject json = makeList(seq);
//		
//		return json.toJSONString();
//	}

//	resful api를 이용한 json반환
	@RequestMapping(value="/list",
			produces=MediaType.APPLICATION_JSON_UTF8_VALUE,
			method=RequestMethod.GET)
	public @ResponseBody List<MemoDto> list(@RequestParam("seq") int seq) {
		List<MemoDto> list = memoService.listMemo(seq);
		
		//메모 내용 안에 \n은 html에서는 공백이다. 그래서 엔터로 인식 되도록 <br>로 교체
		int len = list.size();
		for (int i=0; i<len; i++) {			
			String mcontent = list.get(i).getMcontent().replaceAll("\n", "<br>");
			list.get(i).setMcontent(mcontent);
		}

		return list;
	}
	
	@RequestMapping(value="/delete.html", method=RequestMethod.GET)
	public @ResponseBody String delete(@RequestParam("seq") int seq, @RequestParam("mseq") int mseq) {
		memoService.deleteMemo(mseq);
		JSONObject json = makeList(seq);
		
		return json.toJSONString();
	}
	
	@RequestMapping(value="/plusup.html", method=RequestMethod.GET)
	public @ResponseBody String plusUp(@RequestParam("seq") int seq, @RequestParam("mseq") int mseq) {
		memoService.plusUp(mseq);
		JSONObject json = makeList(seq);
		
		return json.toJSONString();
	}
	
}
