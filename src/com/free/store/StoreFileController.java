package com.free.store;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.free.member.model.MemberDto;
import com.free.store.model.StoreFileDto;
import com.free.store.service.StoreService;
import com.free.util.Upload;

@Controller
@RequestMapping("/storeFile")
public class StoreFileController {
	
	@Autowired
	private StoreService storeService;
	
	// 파일 삭제 리스트에서 삭제 => deleted >> 1로 업데이트
	@RequestMapping(value = "/deleteupdatetoone", method = RequestMethod.GET, headers = {
			"Content-Type=application/json" })
	@ResponseBody
	public Map<String, String> deleteUpdatedToOne(@RequestParam("fileSeq") int storeFileSeq) {
		storeService.deleteUpdatedToOne(storeFileSeq);
		Map<String, String> map = new HashMap<>();
		map.put("bcode", "4");

		return map;
	}

	// 파일 이름 실시간으로 보여주기
	@RequestMapping(value = "/returnfilename", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> returnFileName(@RequestParam Map<String, String> map) {

		return map;
	}

	// 파일 list 뿌리기
	@RequestMapping(value = "/list", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public List<StoreFileDto> list(HttpServletRequest request, HttpSession session) {
		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		Map<String, String> map = new HashMap<>();
		map.put("email", loginInfo.getEmail());
		List<StoreFileDto> list = storeService.list(map);
		return list;
	}

	// upload
	@RequestMapping(value = "/upload.html", method = RequestMethod.POST)
	public ModelAndView store(HttpSession session, @RequestParam("file") MultipartFile data, HttpServletRequest request, @RequestParam("isTitle") int isTitle) {

		ModelAndView mav = new ModelAndView();
		
		Map<String, String> infoMap = Upload.returnFileInfoBeingStored(data, request);
		StoreFileDto fileInfo = new StoreFileDto();
		if (infoMap != null) {
			fileInfo.setOriginalFileName(infoMap.get("originalFileName"));
			fileInfo.setStoredFileName(infoMap.get("storedFileName"));;
			fileInfo.setStoredPath(infoMap.get("storedPath"));
			fileInfo.setThumbStoredFileName(infoMap.get("thumbStoredFileName"));
			fileInfo.setThumbStoredPath(infoMap.get("thumbStoredPath"));
			fileInfo.setIsPic(Integer.parseInt(infoMap.get("isPic")));
			fileInfo.setIsTitle(isTitle);
			
			
			int storeFileSeq = storeService.getNextStoreFileSeq();
			fileInfo.setStoreFileSeq(storeFileSeq);
			fileInfo.setOriginalStoreFileSeq(storeFileSeq);
			
			
			MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
			fileInfo.setEmail(loginInfo.getEmail());
			fileInfo.setName(loginInfo.getName());
			fileInfo.setId(loginInfo.getId());
						
			int storeSeq = storeService.getStoreSeq(loginInfo.getEmail());
			fileInfo.setStoreSeq(storeSeq);

			if(isTitle == 1) {
				storeService.isTitleAllTo0(storeSeq);
			}
			
			// DB에 저장하기
			storeService.storeFile(fileInfo);

			// 저장한 파일 정보를 저장해서 페이지 이동
			mav.addObject("storedFile", fileInfo);
			mav.setViewName("/updownload/uploadok");

		}
		return mav;
	}

	// 파일 수정
	@RequestMapping(value = "/modify.html", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView modify(
				HttpSession session, @RequestParam("fileSeq") int originalStoreFileSeq,
				@RequestParam("file") MultipartFile data, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		 
		Map<String, String> infoMap = Upload.returnFileInfoBeingStored(data, request);
		StoreFileDto fileInfo = new StoreFileDto();
		if (infoMap != null) {
			fileInfo.setOriginalFileName(infoMap.get("originalFileName"));
			fileInfo.setStoredFileName(infoMap.get("storedFileName"));;
			fileInfo.setStoredPath(infoMap.get("storedPath"));
			fileInfo.setThumbStoredFileName(infoMap.get("thumbStoredFileName"));
			fileInfo.setThumbStoredPath(infoMap.get("thumbStoredPath"));
			fileInfo.setIsPic(Integer.parseInt(infoMap.get("isPic")));
			
			int storeFileSeq = storeService.getNextStoreFileSeq();
			fileInfo.setStoreFileSeq(storeFileSeq);
			fileInfo.setOriginalStoreFileSeq(originalStoreFileSeq);
			
			MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
			fileInfo.setEmail(loginInfo.getEmail());
			fileInfo.setName(loginInfo.getName());
			fileInfo.setId(loginInfo.getId());
			
			int storeSeq = storeService.getStoreSeq(loginInfo.getEmail());
			fileInfo.setStoreSeq(storeSeq);
			
			//	수정 후 데이터의 deleted 항복을 2로 바꾼다 
			//	이 뜻은 이 파일의 원본 파일은 삭제되고 새롭게 모디 파이 된 데이터가 들어갔다는 의미
			fileInfo.setDeleted(2);

			// 수정 전 파일 기록의 deleted항목을 1로 바꾼다.
			storeService.deleteUpdatedToOne(originalStoreFileSeq);

			// DB에 저장하기
			storeService.modify(fileInfo);

			// 저장한 파일 정보를 저장해서 페이지 이동
			mav.addObject("storedFile", fileInfo);
			mav.setViewName("/updownload/uploadok");
		}
		return mav;
	}

	// 다운로드
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void downloadFile(@RequestParam("fileSeq") int fileSeq, HttpServletResponse response) {

		StoreFileDto storeFileDto = storeService.getFileInfo(fileSeq);
		String file = storeFileDto.getStoredPath() + File.separator + storeFileDto.getStoredFileName();

		String downloadName = "";
		// System.out.println(">>>>>>>>>>>>>>>>>>>>>>>> " +
		// albumDto.getOriginalFileName());
		try {
			downloadName = Upload.encodeURI(URLEncoder.encode(storeFileDto.getOriginalFileName().replaceAll(" ", "|"), "utf-8"));
			byte fileByte[] = FileUtils.readFileToByteArray(new File(file));
			response.setContentType("application/octet-stream; charset=utf-8");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition", "attachment; fileName=\"" + downloadName + "\";");
			response.setHeader("Content-Transfer-Encoding", "binary");

			response.getOutputStream().write(fileByte);
			response.getOutputStream().flush();
			response.getOutputStream().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 파일 수정
	@RequestMapping(value = "/updateTitlePic/{storeSeq}/{storeFileSeq}", method = RequestMethod.GET)
	@ResponseBody
	public String updateTitlePic(@PathVariable("storeSeq") int storeSeq, @PathVariable("storeFileSeq") int storeFileSeq) {
		storeService.updateTitlePic(storeSeq, storeFileSeq);
		return "ok";
	}
}
