package com.free.util;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.imgscalr.Scalr;
import org.imgscalr.Scalr.Method;
import org.springframework.web.multipart.MultipartFile;

import com.free.board.all.model.AlbumDto;
import com.free.member.model.MemberDto;

public class Upload {
    public static String getRandomString(){
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
    
	public static  Map<String, String> saveScaledImage(String storedPath, String storedFileName){
		Map<String, String> map = new HashMap<>();
		String thumbStoredFileName = "thumb-" + storedFileName;
		String thumbStoredPath = storedPath + File.separator + "thumb";
		map.put("thumbStoredFileName", thumbStoredFileName);
		map.put("thumbStoredPath", thumbStoredPath);

	    try {
	    	// 저장위치에 위치할 폴더를 만든다.
	    	File dir = new File(thumbStoredPath);
	    	
	    	// 저장위치에 위치할 폴더가 존재하지 않으면 그 위치에 폴더를 생성한다.
	    	if(!dir.exists()) {
	    		dir.mkdirs();
	    	}

	    	String imagePath = storedPath + File.separator + storedFileName;
	    	BufferedImage sourceImage = ImageIO.read(new File(imagePath));
	        int width = sourceImage.getWidth();
	        int height = sourceImage.getHeight();
	        
			double extraSize = 0;
			double percentHeight = 0;
			double percentWidth = 0;
			BufferedImage img = null;
			Image scaledImage = null;
			BufferedImage img2 = null;
	        
			if(width>height){
	        	extraSize=  height-100;
	            percentHeight = (extraSize/height)*100;
	            percentWidth = width - ((width/100)*percentHeight);
	            img = new BufferedImage((int)percentWidth, 100, BufferedImage.TYPE_INT_RGB);
	            scaledImage = sourceImage.getScaledInstance((int)percentWidth, 100, Image.SCALE_SMOOTH);
		        img.createGraphics().drawImage(scaledImage, 0, 0, null);
		        img2 = img.getSubimage((int)((percentWidth-100)/2), 0, 100, 100);
			} else if (width == height) {
				img2 = Scalr.resize(sourceImage, Method.QUALITY, 100, 100, Scalr.OP_ANTIALIAS);
			} else{
	            extraSize = width-100;
	            percentWidth = (extraSize/width)*100;
	            percentHeight = height - ((height/100)*percentWidth);
	            img = new BufferedImage(100, (int)percentHeight, BufferedImage.TYPE_INT_RGB);
	            scaledImage = sourceImage.getScaledInstance(100,(int)percentHeight, Image.SCALE_SMOOTH);
	            img.createGraphics().drawImage(scaledImage, 0, 0, null);
	            img2 = img.getSubimage(0, (int)((percentHeight-100)/2), 100, 100);
			}
	        
	        ImageIO.write(img2, "jpg", new File(thumbStoredPath, thumbStoredFileName));    
	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return map;
	}
	
	public static AlbumDto returnAlbumDtoBeingStored (MultipartFile data, HttpServletRequest request) {
		
		AlbumDto albumDto = new AlbumDto();
		
		if(!data.isEmpty()) {
			String originalFileName = data.getOriginalFilename();//a.b.c.jpg
			String originalFileNameExt = originalFileName.substring(originalFileName.lastIndexOf('.'));

			String storedPath = request.getServletContext().getRealPath("/upload");// + File.separator + today;

			// 저장위치에 위치할 폴더를 만든다.
			File dir = new File(storedPath);
			
			// 저장위치에 위치할 폴더가 존재하지 않으면 그 위치에 폴더를 생성한다.
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			//저장할 파일이름을 만든다.
			String storedFileName = Upload.getRandomString() + originalFileNameExt;//170803657654687984.jpg
			
			
			try {
			//dir에 생성된 폴더 안에 storedFileName으로 된 파일을 저장한다.
				data.transferTo(new File(storedPath, storedFileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			albumDto.setBcode(4);
			albumDto.setOriginalFileName(originalFileName);
			albumDto.setStoredFileName(storedFileName);
			albumDto.setStoredPath(storedPath);
			
			if (Upload.checkIsImage (new File(storedPath, storedFileName))) {
				//Thumbnail 이미지 만드는 함수를 호출 후 썸네일 파일 이름이랑 패스 저장
				Map <String, String> thumbMap = Upload.saveScaledImage(storedPath, storedFileName);
				albumDto.setThumbStoredFileName(thumbMap.get("thumbStoredFileName"));
				albumDto.setThumbStoredPath(thumbMap.get("thumbStoredPath"));
				albumDto.setIsPic(1);
			} else {
				albumDto.setThumbStoredFileName("");
				albumDto.setThumbStoredPath("");
				albumDto.setIsPic(0);
			}
		} else {
			albumDto = null;
		}
		return albumDto;
	}
	
	//URLEncoder.encode 했을 때 변환 된 특수 문자 코드를 원래 특수문자로 바꿔주기 // 인코더 안 해주면 다운로드 시 한글 깨짐 
	public static synchronized String encodeURI(String s) {
	    String[] findList = {"#", "+", "&", "%", " ", "@", "(", ")", " "};// %7C >> |
	    String[] replList = {"%23", "%2B", "%26", "%25", "%20", "%40", "%28", "%29", "%7C"};
	    return StringUtils.replaceEach(s, replList, findList);
	}
	
	//파일 확장자 체크하기
	public static boolean checkIsImage (File file){
		String fileName = file.getName();
		//System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> " + fileName);
		
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
		
		//final String[] BAD_EXTENSION = { "jsp", "php", "asp", "html","perl"};
		final String[] IMG_EXTENTION = { "jpg", "jpeg", "bmp", "png","gif"};
		
		int len = IMG_EXTENTION.length;
		for(int i = 0; i < len; i++) {
			if(ext.equalsIgnoreCase(IMG_EXTENTION[i])) {
				return true; // 이미지일 때!!!
			}
		}
		return false;
	}
	
}
