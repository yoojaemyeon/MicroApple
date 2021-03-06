package micro.apple.groupware.mail.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import micro.apple.groupware.mail.service.MailService;
import micro.apple.groupware.mail.vo.MessageDetailVO;
import micro.apple.groupware.mail.vo.MessageVO;



@RestController
public class DownloadController {
	
	private static final Logger logger = LoggerFactory.getLogger(DownloadController.class);
	
	@Autowired
	MailService mailService;
	
//	@GetMapping("/download")
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void download(HttpServletResponse response, HttpSession session, MessageDetailVO MDVo, int emfIdx, Model model) throws Exception {
		logger.info("download");
		MDVo.setEmfIdx(emfIdx);
		int mailIdx = (int) session.getAttribute("mailIdx");
		MDVo.setEmIdx(mailIdx);
		logger.info("mailIdx : " + mailIdx);
		logger.info("emfIdx : " + emfIdx);
		
//		Map<String, Object> fileData = this.mailService.fileSearch(MDVo);
		
		List<MessageDetailVO> fileData = this.mailService.fileSearch(MDVo);
//			for (MessageDetailVO messageDetailVO : fileData) {
				logger.info("emfPath1 : "+fileData.get(0).getEmFpath());
				logger.info("emNm1 : "+fileData.get(0).getEmNm());
//		
		
				String emNm = new String(fileData.get(0).getEmNm().getBytes("UTF-8"),"iso-8859-1");
				String emFpath = fileData.get(0).getEmFpath();
//			}
			logger.info("emNm"+emNm);
			logger.info("emFpath"+emFpath);
//			logger.info("????????? : "+mailIdx);
	        try {
	//        	String path = "C:\\storage\\1c27af07-970c-47f5-9e9a-a3058ac3ea6c_a2.png"; // ????????? ????????? ??? ????????????('\') ??????
	        	String path = emFpath; // ????????? ????????? ??? ????????????('\') ??????
	        	
	        	File file = new File(path);
	        	response.setHeader("Content-Disposition", "attachment;filename=\"" + emNm+"\";"); // ???????????? ????????? ????????? ???????????? ????????? ??????????????? ???????????? ??????
	        	
	        	FileInputStream fileInputStream = new FileInputStream(path); // ?????? ???????????? 
	        	OutputStream out = response.getOutputStream();
	        	
	        	int read = 0;
	                byte[] buffer = new byte[1024];
	                while ((read = fileInputStream.read(buffer)) != -1) { // 1024???????????? ?????? ???????????? outputStream??? ??????, -1??? ????????? ????????? ?????? ????????? ??????
	                    out.write(buffer, 0, read);
	                }
	                
	        } catch (Exception e) {
	            throw new Exception("download error");
	        }
		}
    }

