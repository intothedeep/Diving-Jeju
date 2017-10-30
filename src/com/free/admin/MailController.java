package com.free.admin;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.free.admin.service.AdminService;
import com.free.member.model.EmailAuthDto;
import com.free.util.Upload;

@Controller
@RequestMapping("/mail")
public class MailController {
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/emailTokenBack", method=RequestMethod.GET)
	public String tokenBack(@RequestParam("token") String token) {
		adminService.verifyEmail(token);

		return "../index";
	}
	
	@RequestMapping(value="/emailTokenSend", method=RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, String> tokenSend(@RequestParam("email") String email) {
		Map<String, String> map = new HashMap<>();
		
		String token = Upload.getRandomString();
		
		DateFormat df = new SimpleDateFormat("yyMMddhhmmss");
		String today = df.format(new Date());
		
		token += today;
		EmailAuthDto eaDto = new EmailAuthDto();
		eaDto.setEmail(email);
		eaDto.setToken(token);
		//adminService.deleteTokenSentBefore(email);
		int cnt = adminService.insertEmailAuthInfo(eaDto);
		
		if (cnt == 0) {
			map.put("status", "0");
			return map;
		}
		
		// 단순 메일 보내기
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setFrom("intojeju@admin.com");
		msg.setTo(email);
		msg.setSubject("Diving & Jeju 이메일 인증 메일 입니다.");
		msg.setText("아래 링크를 눌러 이메일을 확인해 주세요!\n\n Link=http://localhost/guest/mail/emailTokenBack?token=" + token);
		try {
		    mailSender.send(msg);
		} catch (MailException ex) {
		    logger.debug(ex);
		}

		map.put("status", "1");
		return map;
	}
		
	@RequestMapping(value="/send", method=RequestMethod.POST)
	public String mail(@RequestParam(value="file", required=false) MultipartFile file,
				@RequestParam("subject") String subject,
					@RequestParam("content") String content,
						HttpServletRequest request) {
		// 단순 메일 보내기
//		SimpleMailMessage msg = new SimpleMailMessage();
//		msg.setFrom("aaa@bbb.co.kr");
//		msg.setTo("victor.taek.lim@gmail.com");
//		msg.setSubject("제목이 이러저러합니다");
//		msg.setText("본문이 어쩌구저쩌구합니다");
//		try {
//		    mailSender.send(msg);
//		} catch (MailException ex) {
//		    logger.debug(ex);
//		}		
		
		//첨부파일을 통한 메일보내기
		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper helper;
		

		
		try {
			helper = new MimeMessageHelper(msg, true);
			helper.setTo(new InternetAddress("victor.taek.lim@gmail.com", "임택"));
			helper.setSubject(subject);
			helper.setText(content, true); // true는 HTML 내용인 경우고 false는 평문 내용인 경우다
			
			if(!file.isEmpty()) {
				Map <String, String> fileInfo = getFileInfo(request, file);
				String encodedFileName = Upload.encodeURI(URLEncoder.encode(fileInfo.get("name").replaceAll(" ", "|"), "utf-8"));
				helper.addAttachment(encodedFileName, new File(fileInfo.get("filePath")));				
			}
			
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		try {
		    mailSender.send(msg);
		} catch (MailException ex) {
		    logger.debug(ex);
		}
        return "/index";
    }
	
	private Map<String, String> getFileInfo(HttpServletRequest request, MultipartFile file) {
		String fileName = file.getOriginalFilename();
		String storedPath = request.getServletContext().getRealPath("/upload");
		
		// 저장위치에 위치할 폴더를 만든다.
		File dir = new File(storedPath);
		
		// 저장위치에 위치할 폴더가 존재하지 않으면 그 위치에 폴더를 생성한다.
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		try {
			file.transferTo(new File(storedPath, fileName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		
		Map<String, String> map = new HashMap<>();
		map.put("name", fileName);
		map.put("path", storedPath);
		map.put("filePath", storedPath + File.separator + fileName);
		return map;
	}
}
