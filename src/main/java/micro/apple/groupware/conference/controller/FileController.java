package micro.apple.groupware.conference.controller;

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

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FileController {
	
	@GetMapping("/downloadFile")
	public void download(HttpServletResponse response) throws Exception {
        try {
        	//String path = "C:\\workspace\\microApple\\src\\main\\webapp\\resources\\conferenceFile"; // 경로에 접근할 때 역슬래시('\') 사용
        	String path = "D:\\workspaces\\workspace4web\\MicroApple\\src\\main\\webapp\\resources\\conferenceFile"; // 경로에 접근할 때 역슬래시('\') 사용
        	
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
}
