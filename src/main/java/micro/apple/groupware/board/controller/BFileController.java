package micro.apple.groupware.board.controller;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BFileController {
	
	private static final Logger logger = LoggerFactory.getLogger(BFileController.class);
	
	/*
	@GetMapping("/downloadFile")
	public void download(HttpServletResponse response) throws Exception {
        try {
//한주연 폴더       	
//        	String path = "D:\\A_teaching\\workspace\\microApple\\src\\main\\webapp\\resources\\announceFile"; // 경로에 접근할 때 역슬래시('\') 사용
//유재면 폴더        	
        	String path = "D:\\workspaces\\workspace4web\\MicroApple\\src\\main\\webapp\\resources\\announceFile";
        	
        	File file = new File(path);
        	response.setHeader("Content-Disposition", "attachment;filename=" + file.getName()); // 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지를 알려주는 헤더
        	
        	FileInputStream fileInputStream = new FileInputStream(path); // 파일 읽어오기 
        	OutputStream out = response.getOutputStream();
        	
        	int read = 0;
                byte[] buffer = new byte[1024];
                while ((read = fileInputStream.read(buffer)) != -1) { // 1024바이트씩 계속 읽으면서 outputStream에 저장, -1이 나오면 더이상 읽을 파일이 없음
                    out.write(buffer, 0, read);
                }
                
        } catch (Exception e) {
            throw new Exception("download error");
        }
    }
    */
	
	// 파일 다운 로드
	// 첨부파일을 다운로드는 MIME 타입을 다운로드 타입으로 지정.
	// APPLICATION_OCTET_STREAM_VALUE : 다운로드할 수 있는 MIME타입
	// 한글 이름 다운로드 시 IE는 Content-Disposition의 값을 처리하는
	// 방식이 Chrome과 달라 따로 처리를 더 해줘야 함
	// User-Agent : HTTP 헤더 메시지 중에서 디바이스의 정보를 제공
	// (웹브라우저의 종류, 모바일, 데스크톱..)
	@RequestMapping(value = "/Bdownload", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String boardFile) {
		logger.info("download file : " + boardFile);

		// 파일이 있는 윈도 경로
		String uploadFolder = FileUploadUtil3.uploadFolder;

		logger.info("uploadFolderuploadFolder : " + uploadFolder);
		// ...resources_upload_2021_11_05_개똥이.jpg
		org.springframework.core.io.Resource resource = new FileSystemResource(uploadFolder + "\\" + boardFile);

		logger.info("resource resource :" + resource);

		// 해당 파일이 없을때..
		if (resource.isFile() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} else {

			logger.info("resource : " + resource);
			logger.info("resourceName : " + resource.getFilename());

			// 파일명 가져오기
			String resourceName = resource.getFilename();
			// 파일명이 한글이면 HttpHeaders 객체를 통해 처리
			org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
			try {
				String downloadName = null;

				if (userAgent.contains("Trident")) {// IE11
					logger.info("IE browser");

					downloadName = URLEncoder.encode(resourceName, "UTF-8").replaceAll("\\+", " ");
				} else if (userAgent.contains("Edge")) {// Edge
					logger.info("Edge browser");

					downloadName = URLEncoder.encode(resourceName, "UTF-8");
				} else {
					logger.info("Chrome browser");
					downloadName = new String(resourceName.getBytes("UTF-8"), "ISO-8859-1"); // ISO-8859-1
				}

				// Content-disposition : 다운로드 시 저장되는 이름을 처리해줌
				headers.add("Content-disposition", "attachment;filename=" + downloadName);
			} catch (UnsupportedEncodingException ex) {
				ex.printStackTrace();
			}
			// resource : 첨부파일 객체
			// headers : 파일명 처리 정보
			// ...OK : 200(성공)
			return new ResponseEntity<Resource>((Resource) resource, headers, HttpStatus.OK);
		}
	}
}
