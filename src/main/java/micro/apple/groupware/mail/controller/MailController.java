package micro.apple.groupware.mail.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.ibatis.annotations.Options;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.ResourceUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import micro.apple.groupware.calendar.vo.CalendarVO;
import micro.apple.groupware.mail.service.MailService;
import micro.apple.groupware.mail.vo.AttachFileVO;
import micro.apple.groupware.mail.vo.Criteria;
import micro.apple.groupware.mail.vo.MailVO;
import micro.apple.groupware.mail.vo.MessageDetailVO;
import micro.apple.groupware.mail.vo.MessageVO;
import micro.apple.groupware.mail.vo.PageMaker;
import micro.apple.groupware.mail.vo.SearchCriteria;
import micro.apple.groupware.member.vo.MemberVO;


@Controller
public class MailController {

	private static final Logger logger = LoggerFactory.getLogger(MailController.class);
	private static final String uploadFolder = "C:\\\\storage";
	
	@Autowired
	MailService mailService;
	

	
		
	//받은메시지함 페이지(메일 메인페이지)
	@RequestMapping(value = "mail", method = RequestMethod.GET)
	public String mail(Model model, HttpSession session, MessageVO messageVo) throws Exception{
		logger.info("mailPage");
		logger.info(session.getAttribute("MEMBERVO")+"asdasd");
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
		String memberNum = member.getMemIdx();
		String fromMail = member.getMemEm();
		
		
		logger.info("세션 담은 메일 : "+fromMail);
		logger.info("세션 담은 사번 : "+memberNum);

		messageVo.setEmOut(fromMail);
		messageVo.setMemIdx(Integer.parseInt(memberNum));
		logger.info(messageVo.toString());
		
		List<MessageVO> list = this.mailService.messageList();
		model.addAttribute("list", list);
		logger.info("list : "+list.get(0).toString());
		model.addAttribute("member",member);
		
		return "mail/mail";
	}
	
		//메일쓰기페이지
		@RequestMapping("mailSend")
		public String mailsend(Model model) throws Exception{
			logger.info("mailSend");
			return "mail/mailSend";
		}
	
		// 메일 사용시 사용할 로직
		@Autowired
		private JavaMailSender mailSender;
		
		//메일보내는 로직
		//메일보내는 로직
		@RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
		public String sendEmail(@Validated MailVO vo, HttpServletRequest request,
				HttpServletResponse response, MultipartFile [] uploadFile) throws Exception {
			
			String uploadFolder2 = "C:\\storage\\mail";
			long FileSize = 0;
			
			for (MultipartFile multipartFile : uploadFile) {
				logger.info("-------------------");
				logger.info("upload File Name" + multipartFile.getOriginalFilename());
				logger.info("upload File Size" + multipartFile.getSize());
				FileSize = multipartFile.getSize();
				if (multipartFile.getSize() != 0) {
				
					File saveFile = new File(uploadFolder2, multipartFile.getOriginalFilename());
	
					try {
						multipartFile.transferTo(saveFile);
						} catch (Exception e) {
							logger.error(e.getMessage());
						}
					}
				}

			try {

				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

				String html = vo.getMailContent();

				messageHelper.setSubject(vo.getMailTitle());
				messageHelper.setText(html, true); // 전송할 데이터, html형식으로 전송할것인가요?true
				messageHelper.setFrom("kms19609999@naver.com", vo.getFromName()); // 보내는 사람 이메일, 보내는 사람의 이름
				messageHelper.setTo(new InternetAddress(vo.getToMail(), vo.getToName(), "utf-8")); // 받는사람 이메일, 받는사람의 이름, charset

				logger.info("test0");
				if (FileSize != 0) {
					logger.info("test1");
				//업로드 폴더의 경로만 넣어주고 +filenames[0]을 넣어준다.
				//폴더에 선택한 파일이 복사된 후 메일을 통해 발송되면 delete명령어를 통해 삭제된다.
				String DATA_DIRECTORY = "C:\\storage\\mail\\";
				File dir = new File(DATA_DIRECTORY);
				String[] filenames = dir.list(); 
				
					for (String filename : filenames) { 
							System.out.println("filename : " + filename);
						}
					logger.info("test2");
				// 파일 첨부 설정 //import javax.activation.DataSource;
				DataSource source = new FileDataSource(DATA_DIRECTORY+filenames[0]);
				messageHelper.addAttachment(MimeUtility.encodeText(filenames[0], "utf-8", "B"), source);
				
				mailSender.send(message);
				logger.info("test3");
				Path filePath = Paths.get(DATA_DIRECTORY+filenames[0]);
				try {
						Files.delete(filePath);
						logger.info("filePath : "+filePath);
						logger.info("test4");
					} catch (Exception e) {
						e.printStackTrace();
						logger.info("test5");
					}
				}
				if (FileSize == 0) {
					mailSender.send(message);
				}
				logger.info("test6");
					} catch (MessagingException e) {
						logger.info("test7");
						e.printStackTrace();
					}
			return "redirect:/mailSend";
		}
		
		//편지 상세보기
		@RequestMapping(value = "/Detail", method = RequestMethod.GET)
		public ModelAndView mailDetail(Model model, int mailIdx, MessageDetailVO MDVo, HttpSession session) throws Exception{
			logger.info("mailDetail");
			ModelAndView data = new ModelAndView("mail/mailDetail");
			MDVo.setEmIdx(mailIdx);
			logger.info("mailIdx : "+mailIdx);
			List<MessageDetailVO> list = this.mailService.MailDetail(MDVo);
			
			if (list.size() != 0) { //파일이 있다면
					logger.info("data : "+list);
					data.addObject("data", list);
					session.setAttribute("mailIdx", mailIdx);
				} else { //파일이 없다면
					MDVo.setEmNm("첨부된 파일이 없습니다.");
					List<MessageDetailVO> list2 = this.mailService.mailDetail2(MDVo);
					logger.info("data : "+list2);
					list2.get(0).setEmNm("첨부된 파일이 없습니다.");
					data.addObject("data", list2);
				}
			
			
			
			return data;
		}
		
		
		//메세지보내기
		@RequestMapping("messageSend")
		public ModelAndView messageSend(MessageVO messageVo, Model model){
			logger.info("messageSendPage");
			ModelAndView mav = new ModelAndView("mail/messageSend");
			
			List<MessageVO> nameList = mailService.selectNm(messageVo);
			mav.addObject("List", nameList);
			logger.info(nameList.get(0).toString());
			
			return mav;
		}	
		
		
		//메세지 쓰기
		@RequestMapping(value = "/write", method = RequestMethod.POST)
		public String messageInsert(@Validated MessageVO messageVo, HttpServletRequest request,
				HttpServletResponse response, MultipartFile [] uploadFile, HttpSession session, 
				MultipartHttpServletRequest multipartRequest, AttachFileVO attachFileVo, imgUpload imgUpload) throws Exception{
			logger.info("write"); 
			logger.info(messageVo.toString());
			MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
			String memberNum = member.getMemIdx();
			String fromMail = member.getMemEm();
			String memNm = member.getMemNm();
			logger.info("세션 담은 메일 : "+fromMail);
			logger.info("세션 담은 사번 : "+memberNum);

			messageVo.setEmOut(fromMail);
			messageVo.setMemIdx(Integer.parseInt(memberNum));
			messageVo.setMemNm(memNm);
			
			
			logger.info("---------------1---------------");
			int insertResult = this.mailService.messageinsert(messageVo);
			logger.info("새로운 emIdx : "+messageVo.getEmIdx());
			logger.info("---"+insertResult);
			logger.info("------------------------------");
			
			File uploadPath = new File(uploadFolder);
			logger.info("upload path : "+ uploadPath); 
			
			if(uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}
			
			for(MultipartFile multipartFile : uploadFile) {
				logger.info("Upload File Name : " + multipartFile.getOriginalFilename());
				logger.info("Upload File Size : " + multipartFile.getSize());
	
				
				
				String uploadFileName = multipartFile.getOriginalFilename();
				
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
				logger.info("only file name : " + uploadFileName);
				logger.info("uploadFile.length : "+ uploadFile.length);
				
				UUID uuid = UUID.randomUUID();
				uploadFileName = uuid.toString() + "_" + uploadFileName;
				File savefile = new File(uploadPath, uploadFileName);
				try {
					multipartFile.transferTo(savefile);
					} catch (Exception e) {
						logger.info(e.getMessage());
					}
				
				
				attachFileVo.setEmNm(multipartFile.getOriginalFilename());
				attachFileVo.setEmFpath(uploadPath+"\\\\"+uploadFileName);
				String file = multipartFile.getOriginalFilename();
				int find = multipartFile.getOriginalFilename().lastIndexOf(".");
				
				//파일이 있을경우만 실행
				if (find != -1) {
					attachFileVo.setEmExtn(file.substring(find, file.length()));
					long fileSize = multipartFile.getSize();
					attachFileVo.setEmfSize(fileSize/1024+"Kb");
					attachFileVo.setEmIdx(messageVo.getEmIdx());
					
					logger.info("확장자명"+attachFileVo.getEmExtn());
					logger.info(attachFileVo.toString());
					logger.info("uploadFile : "+ uploadFile.toString());
					logger.info("uploadSize : "+fileSize/1024+"Mb");
					this.mailService.messageFileInsert(attachFileVo);
				}
			}
			logger.info(messageVo.toString());
			return "mail/success";
		}
		
		 
		 
		 // 게시글 목록(페이징) + 검색
		 @RequestMapping(value = "/mail/listSearch", method = RequestMethod.GET)
		 public void listSearch(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
			 
			 List<MessageVO> list = mailService.listSearch(scri);
			 model.addAttribute("list", list);
			 
			 PageMaker pageMaker = new PageMaker();
			 pageMaker.setCri(scri);
			 pageMaker.setTotalCount(mailService.listCount());
			 model.addAttribute("pageMaker", pageMaker);
			 
		 }
		 
		 // 게시글 목록(페이징)
		 @RequestMapping(value = "/mail/listPage", method = RequestMethod.GET)
		 public void listPage(Criteria cri, Model model, HttpSession session) throws Exception {
			 MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
				String memberNum = member.getMemIdx();
				String fromMail = member.getMemEm();
			 logger.info("세션 담은 메일 : "+fromMail);
			 logger.info("세션 담은 사번 : "+memberNum);
			 logger.info(session.getAttribute("MEMBERVO")+"asdasd");
			 cri.setEmOut(fromMail);
			 
			 logger.info("rowStart : "+cri.getRowStart());
			 logger.info("rowEnd : "+cri.getRowEnd());
			 
			 List<MessageVO> list = mailService.listPage(cri);
			 model.addAttribute("listPage", list);
//			 logger.info(list.get(0).toString());

			 PageMaker pageMaker = new PageMaker();
			 pageMaker.setCri(cri);
			 pageMaker.setTotalCount(mailService.listCount());
			 model.addAttribute("pageMaker", pageMaker);
			 model.addAttribute("member", member);
			 logger.info("pageMakerNext : "+pageMaker.isNext());
			 logger.info("pageMakerPrev : "+pageMaker.isPrev());
			 logger.info("cri값 : "+cri);
			 logger.info("page : "+cri.getPage());
		 }
		
		 //보낸편지페이지
		 @RequestMapping(value = "mail/sentMailBox", method = RequestMethod.GET)
		 public void sentMailBox(Criteria cri, Model model, HttpSession session, MessageVO messageVo){
			 logger.info("sentMailBoxPage");
			 MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
				String memberNum = member.getMemIdx();
				String fromMail = member.getMemEm();
			 
			 cri.setEmOut(fromMail);
			 
			 logger.info("rowStart : "+cri.getRowStart());
			 logger.info("rowEnd : "+cri.getRowEnd());
			 logger.info("멤넘 : "+ cri.getMemIdx());
			 
			 cri.setMemIdx(Integer.parseInt(memberNum));
			 cri.setEmIn(fromMail);
			 
			 List<MessageVO> list = mailService.sentMailList(cri);
			 model.addAttribute("listPage", list);
			 logger.info("멤버넘버는"+model.getAttribute(memberNum));
			 
			 PageMaker pageMaker = new PageMaker();
			 pageMaker.setCri(cri);
			 pageMaker.setTotalCount(mailService.listCount());
			 model.addAttribute("pageMaker", pageMaker);
		 }
		 
		 //내게쓴 편지페이지
		 @RequestMapping(value = "mail/mailToMe", method = RequestMethod.GET)
		 public void mailToMe(Criteria cri, Model model, HttpSession session, MessageVO messageVo){
			 logger.info("mailToMePage");
			 
			 MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
				String memberNum = member.getMemIdx();
				String fromMail = member.getMemEm();
			 
			 cri.setEmOut(fromMail);
			 
			 logger.info("rowStart : "+cri.getRowStart());
			 logger.info("rowEnd : "+cri.getRowEnd());
			 
			 cri.setMemIdx(Integer.parseInt(memberNum));
			 cri.setEmIn(fromMail);
			 
			 List<MessageVO> list = mailService.mailToMeList(cri);
			 model.addAttribute("listPage", list);
			 
			 PageMaker pageMaker = new PageMaker();
			 pageMaker.setCri(cri);
			 pageMaker.setTotalCount(mailService.listCount());
			 model.addAttribute("pageMaker", pageMaker);
			 
		 }
		 
		 //중요 편지페이지
		 @RequestMapping(value = "mail/importMailBox", method = RequestMethod.GET)
		 public void importMailBox(Criteria cri, Model model, HttpSession session, MessageVO messageVo){
			 logger.info("importMailBoxPage");
			 MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
				String memberNum = member.getMemIdx();
				String fromMail = member.getMemEm();
			 
			 cri.setEmOut(fromMail);
			 
			 logger.info("rowStart : "+cri.getRowStart());
			 logger.info("rowEnd : "+cri.getRowEnd());
			 
			 cri.setMemIdx(Integer.parseInt(memberNum));
			 cri.setEmIn(fromMail);
			 
			 List<MessageVO> list = mailService.ImportList(cri);
			 model.addAttribute("listPage", list);
			 
			 PageMaker pageMaker = new PageMaker();
			 pageMaker.setCri(cri);
			 pageMaker.setTotalCount(mailService.listCount());
			 model.addAttribute("pageMaker", pageMaker);
		 }
		 
		 //휴지통페이지
		 @RequestMapping(value = "mail/trashBox", method = RequestMethod.GET)
		 public void trashBox(Criteria cri, Model model, HttpSession session, MessageVO messageVo){
			 logger.info("trashBoxPage");
			 MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
				String memberNum = member.getMemIdx();
				String fromMail = member.getMemEm();
			 
			 cri.setEmOut(fromMail);
			 
			 logger.info("rowStart : "+cri.getRowStart());
			 logger.info("rowEnd : "+cri.getRowEnd());
			 
			 cri.setMemIdx(Integer.parseInt(memberNum));
			 
			 cri.setEmIn(fromMail);
			 logger.info(cri.toString());
			 List<MessageVO> list = mailService.DeleteList(cri);
			 model.addAttribute("listPage", list);
			 
			 PageMaker pageMaker = new PageMaker();
			 pageMaker.setCri(cri);
			 pageMaker.setTotalCount(mailService.listCount());
			 model.addAttribute("pageMaker", pageMaker);
		 }
		 
		 //휴지통으로 보내기(업데이트)
		 @RequestMapping("MessageDelete")
		 public String MessageDelete(HttpSession session, Model model, HttpServletRequest request, MessageVO messageVo) throws Exception{
			 logger.info("messageDelete");
			 
			 MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
				String memberNum = member.getMemIdx();
				String fromMail = member.getMemEm();
			 logger.info("세션 담은 메일 : "+fromMail);
			 logger.info("세션 담은 사번 : "+memberNum);
			 
				int Num = Integer.parseInt(request.getParameter("mailNumber"));
				logger.info("Num값 : "+Num);
				messageVo.setEmIdx(Num);
				logger.info("vo"+messageVo.toString());
				 
				 
				 mailService.garbage(messageVo);
				 logger.info("vo");
			 	System.out.println("--------------------");
//			 51번의 내용을 가져와 division을 N으로 바꿔줘야 함
			 return "redirect:mail/listPage";
//			 return "mail/MessageDelete";
		 }
		 
		//중요메세지로 보내기(업데이트)
		 @RequestMapping("MessageImport")
		 public String MessageImport(HttpSession session, Model model, HttpServletRequest request, MessageVO messageVo) throws Exception{
			 logger.info("MessageImport");
			 
			 MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
				String memberNum = member.getMemIdx();
				String fromMail = member.getMemEm();
			 logger.info("세션 담은 메일 : "+fromMail);
			 logger.info("세션 담은 사번 : "+memberNum);
			 
				int Num = Integer.parseInt(request.getParameter("mailNumber"));
				logger.info("Num값 : "+Num);
				messageVo.setEmIdx(Num);
				logger.info("vo"+messageVo.toString());
				 
				 
				 mailService.messageImport(messageVo);
				 logger.info("vo");
			 	System.out.println("--------------------");
//			 51번의 내용을 가져와 division을 N으로 바꿔줘야 함
			 return "redirect:mail/listPage";
//			 return "mail/MessageDelete";
		 }
		//휴지통에서 복구/노말로(업데이트)
		 @RequestMapping("Restoration")
		 public String restoration(HttpSession session, Model model, HttpServletRequest request, MessageVO messageVo) throws Exception{
			logger.info("MessageImport");
			 
			MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
			String memberNum = member.getMemIdx();
			String fromMail = member.getMemEm();
			logger.info("세션 담은 메일 : "+fromMail);
			logger.info("세션 담은 사번 : "+memberNum);
			 
				int Num = Integer.parseInt(request.getParameter("mailNumber"));
				logger.info("Num값 : "+Num);
				messageVo.setEmIdx(Num);
				logger.info("vo"+messageVo.toString());
				 
				 
				 mailService.Restoration(messageVo);
				 logger.info("vo");
			 	System.out.println("--------------------");
//			 51번의 내용을 가져와 division을 N으로 바꿔줘야 함
			 return "redirect:mail/listPage";
//			 return "mail/MessageDelete";
		 }
		 
		 
		 @RequestMapping("deleteComplete")
		 public String deleteComplete(HttpSession session, Model model, HttpServletRequest request, MessageVO messageVo) throws Exception{
			logger.info("deleteComplete");
			 
			MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
			String memberNum = member.getMemIdx(); //memIdx
			String fromMail = member.getMemEm(); //email
			
			logger.info("세션 담은 메일 : "+fromMail);
			logger.info("세션 담은 사번 : "+memberNum);
			 
			 
			 
			int Num = Integer.parseInt(request.getParameter("mailNumber"));
//			int Num = Integer.parseInt(request.getParameter("emIdx"));
			logger.info("Num값 : "+Num);
			messageVo.setEmIdx(Num);
			messageVo.setEmOut(fromMail);
			messageVo.setMemIdx(Integer.parseInt(memberNum));
			messageVo.setEmIn(fromMail);
			logger.info("vo"+messageVo.toString());
			

			mailService.deleteComplete(messageVo);
			System.out.println("--------------------");
//			51번의 내용을 가져와 division을 N으로 바꿔줘야 함
			return "redirect:mail/listPage";
		 }
		 
		 //파일 다운로드
		    @RequestMapping(value = "fileDownload.do")
		    public void fileDownload4(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		        String path =  request.getSession().getServletContext().getRealPath(uploadFolder);
		        
		        String filename = request.getParameter("fileName");
		        String downname = request.getParameter("downName");
		        String realPath = "";
		        System.out.println("downname: "+downname);
		        if (filename == null || "".equals(filename)) {
		            filename = downname;
		        }
		        logger.info("테스트 메세지1");
		         
		        try {
		            String browser = request.getHeader("User-Agent"); 
		            //파일 인코딩 
		            if (browser.contains("MSIE") || browser.contains("Trident")
		                    || browser.contains("Chrome")) {
		                filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+",
		                        "%20");
		            } else {
		                filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
		            }
		        } catch (UnsupportedEncodingException ex) {
		            System.out.println("UnsupportedEncodingException");
		        }
		        realPath = path +"/" +downname.substring(0,4) + "/"+downname;
		        System.out.println(realPath);
		        File file1 = new File(realPath);
		        if (!file1.exists()) {
		            return ;
		        }
		        logger.info("테스트 메세지2");
		        // 파일명 지정        
		        response.setContentType("application/octer-stream");
		        response.setHeader("Content-Transfer-Encoding", "binary;");
		        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
		        try {
		            OutputStream os = response.getOutputStream();
		            FileInputStream fis = new FileInputStream(realPath);
		 
		            int ncount = 0;
		            byte[] bytes = new byte[512];
		 
		            while ((ncount = fis.read(bytes)) != -1 ) {
		                os.write(bytes, 0, ncount);
		            }
		            fis.close();
		            os.close();
		        } catch (FileNotFoundException ex) {
		            System.out.println("FileNotFoundException");
		        } catch (IOException ex) {
		            System.out.println("IOException");
		        }
		        logger.info("테스트 메세지3");
		    }
		 
		    
		    
		    @RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
			@ResponseBody
			public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
				JsonObject jsonObject = new JsonObject();
				
		        /*
				 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
				 */
				
				// 내부경로로 저장
				String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
				String fileRoot = contextRoot+"resources/fileupload/";
				
				String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
				String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
				
				logger.info("파일 명 : "+originalFileName);
				logger.info("저장 명 : "+savedFileName);
				logger.info("경로1 : "+contextRoot);
				logger.info("경로2 : "+fileRoot);
				
				
				File targetFile = new File(fileRoot + savedFileName);	
				try {
					InputStream fileStream = multipartFile.getInputStream();
					FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
					jsonObject.addProperty("url", "/summernote/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
					jsonObject.addProperty("responseCode", "success");
						
				} catch (IOException e) {
					FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
					jsonObject.addProperty("responseCode", "error");
					e.printStackTrace();
				}
				String a = jsonObject.toString();
				return a;
			}
}
