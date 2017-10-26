package com.free.board.all.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.free.board.all.model.AlbumDto;
import com.free.board.all.service.AlbumService;
import com.free.board.all.service.BoardCommonService;
import com.free.member.model.MemberDto;
import com.free.util.Upload;

@Controller
@RequestMapping("/album")
public class AlbumController {

	@Autowired
	private AlbumService albumService;
	
	@Autowired
	private BoardCommonService boardCommonService;

	// 파일 삭제 리스트에서 삭제 => deleted >> 1로 업데이트
	@RequestMapping(value = "/deleteupdatetoone", method = RequestMethod.GET, headers = {
			"Content-Type=application/json" })
	@ResponseBody
	public Map<String, String> deleteUpdatedToOne(@RequestParam("fileSeq") int fileSeq) {
		albumService.deleteUpdatedToOne(fileSeq);
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
	public List<AlbumDto> list(@RequestParam("bcode") int bcode, HttpServletRequest request) {
		List<AlbumDto> list = albumService.list(bcode);
		return list;
	}

	// upload
	@RequestMapping(value = "/upload.html", method = RequestMethod.POST)
	public ModelAndView store(HttpSession session, @RequestParam("file") MultipartFile data, HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		AlbumDto albumDto = Upload.returnAlbumDtoBeingStored(data, request);
		if (albumDto != null) {
			int seq = boardCommonService.getNextSeq();
			albumDto.setSeq(seq);

			int aseq = boardCommonService.getNextAseq();
			albumDto.setAseq(aseq);
			albumDto.setOriginalFileAseq(aseq);

			albumDto.setBcode(4);
			
			MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
			albumDto.setEmail(loginInfo.getEmail());
			albumDto.setName(loginInfo.getName());
			albumDto.setId(loginInfo.getId());
			
			// DB에 저장하기
			albumService.storeFile(albumDto);

			// 저장한 파일 정보를 저장해서 페이지 이동
			mav.addObject("storedFile", albumDto);
			mav.setViewName("/updownload/uploadok");

		}
		return mav;
	}

	// 파일 수정
	@RequestMapping(value = "/modify.html", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView modify(
				HttpSession session, @RequestParam("fileSeq") int originalFileAseq,
				@RequestParam("file") MultipartFile data, HttpServletRequest request
			) {
		ModelAndView mav = new ModelAndView();
		AlbumDto infoForAlbumDtoBeingModified = Upload.returnAlbumDtoBeingStored(data, request);
		
		if (infoForAlbumDtoBeingModified != null) {
			int seq = boardCommonService.getNextSeq();
			infoForAlbumDtoBeingModified.setSeq(seq);

			int aseq = boardCommonService.getNextAseq();
			infoForAlbumDtoBeingModified.setAseq(aseq);

			infoForAlbumDtoBeingModified.setOriginalFileAseq(originalFileAseq);
			
			infoForAlbumDtoBeingModified.setBcode(4);
			
			MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
			infoForAlbumDtoBeingModified.setEmail(loginInfo.getEmail());
			infoForAlbumDtoBeingModified.setName(loginInfo.getName());
			infoForAlbumDtoBeingModified.setId(loginInfo.getId());
			
			//	수정 후 데이터의 deleted 항복을 2로 바꾼다 
			//	이 뜻은 이 파일의 원본 파일은 삭제되고 새롭게 모디 파이 된 데이터가 들어갔다는 의미
			infoForAlbumDtoBeingModified.setDeleted(2);

			// 수정 전 파일 기록의 deleted항목을 1로 바꾼다.
			albumService.deleteUpdatedToOne(originalFileAseq);

			// DB에 저장하기
			albumService.modify(infoForAlbumDtoBeingModified);

			// 저장한 파일 정보를 저장해서 페이지 이동
			mav.addObject("storedFile", infoForAlbumDtoBeingModified);
			mav.setViewName("/updownload/uploadok");
		}
		return mav;
	}

	// 다운로드
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void downloadFile(@RequestParam("fileSeq") int fileSeq, HttpServletResponse response) {

		AlbumDto albumDto = albumService.getFileInfo(fileSeq);
		String file = albumDto.getStoredPath() + File.separator + albumDto.getStoredFileName();

		String downloadName = "";
		// System.out.println(">>>>>>>>>>>>>>>>>>>>>>>> " +
		// albumDto.getOriginalFileName());
		try {
			downloadName = Upload.encodeURI(URLEncoder.encode(albumDto.getOriginalFileName().replaceAll(" ", "|"), "utf-8"));
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
}
