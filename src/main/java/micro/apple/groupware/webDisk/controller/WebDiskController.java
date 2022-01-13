package micro.apple.groupware.webDisk.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import micro.apple.groupware.member.vo.MemberVO;
import micro.apple.groupware.webDisk.service.WebDiskService;
import micro.apple.groupware.webDisk.vo.WebDiskVO;

@Controller
public class WebDiskController {
	private static final Logger logger = LoggerFactory.getLogger(WebDiskController.class);

	
	@Autowired
	WebDiskService webDiskService;
	 
	/** 웹디스크 메인페이지 */
	@RequestMapping(value="/webDiskMain", method=RequestMethod.GET)
	public ModelAndView webDisk(ModelAndView mav,HttpSession session, @RequestParam Map<String, Object> map, HttpServletRequest req, WebDiskVO webIdx){
		//회원정보 가져올경우 사용하기
		MemberVO member = (MemberVO) session.getAttribute("MEMBERVO");
		WebDiskVO webDisk = (WebDiskVO) session.getAttribute("WEBDISKVO");
		int memIdx = Integer.parseInt(member.getMemIdx());
		logger.info("세션담은 회원번호 : " + memIdx);
		List<Map<String, Object>> folderList = new ArrayList<Map<String, Object>>();
		folderList = this.webDiskService.getJSTree(memIdx);
		System.out.println(folderList);
		mav.addObject("folderList", folderList);
		
		mav.setViewName("webDisk/webDiskMain");
		
		return mav; 
	}
	
	 /**대상 폴더 내용 */
	 @ResponseBody
	 @PostMapping("/webDisk/ajax/getContents")
	 public Map<String, Object> ajaxGetContents(Model model, @RequestParam Map<String, Object> map,
				HttpSession session, HttpServletRequest req){
		 
		 MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
		 map.put("memIdx", member.getMemIdx());
		 model.addAttribute("member",member);
		 Map<String, Object> result = new HashMap<String, Object>();
		 result = this.webDiskService.ajaxGetContents(map);
		 return result;
	 } 
	/** 폴더 생성 */
	@RequestMapping(value="/folderInsert", method=RequestMethod.POST)
	public String webDiskMainPost(@RequestParam Map<String,Object> map, HttpServletRequest request) {
//		logger.info("폴더생성 : " + map);
		this.webDiskService.insertFolder(map);
		return "redirect:/webDiskMain";
	}
	
	/** 폴더 수정 */
	@RequestMapping(value="/updateFolder", method=RequestMethod.POST)
	public String webDiskMainUpdate(@RequestParam Map<String, Object> map
			, HttpServletRequest request) {
		
		if(map.get("webRead")==null) {
			map.put("webRead", "Y");
		}
		if(map.get("webWrite")==null) {
			map.put("webWrite", "N");
		}
		
//		logger.info("폴더수정 : " + map);
		
		int result = this.webDiskService.updateFolder(map);
		
		return "redirect:/webDiskMain";
	}
	
	/** 폴더 삭제 */
	@RequestMapping(value="/deleteFolder", method=RequestMethod.POST)
	public ModelAndView webDiskMainDelete(ModelAndView mav, String webIdx3, WebDiskVO webDiskVO) {
		logger.info("폴더삭제 : " + webIdx3);
		
		webDiskVO.setWebIdx(webIdx3);
		
		int result = this.webDiskService.deleteFolder(webDiskVO);
		
		mav.setViewName("redirect:/webDiskMain");
		
		return mav;
	}
	
	/** 파일 업로드
	 * @throws Exception */
	@RequestMapping(value="/fileUpload",method= {RequestMethod.POST,RequestMethod.GET})
	public String fildupload(Model model, HttpServletRequest request, @ModelAttribute WebDiskVO webDiskVO, MultipartFile file,
			/* @RequestParam Map<String, Object> map, */@RequestParam (value="webIdx" ) String webIdx) throws Exception {
		
		logger.info(webDiskVO+"ddddddddd");
//		logger.info(map+"ddddddddd");
//		logger.info(map.get("file")+"");
//		logger.info(map.get("webDiskVO")+" 파일업로드 브이오");
		
		MultipartFile multiFile = webDiskVO.getFile();
		logger.info("----multiFile :: getContentType"+ multiFile.getContentType());
		logger.info("----multiFile :: getName"+ multiFile.getName());
		logger.info("----multiFile :: getOriginalFilename"+ multiFile.getOriginalFilename());
		logger.info("----multiFile :: getSize"+ multiFile.getSize());
		logger.info("----multiFile :: getResource"+ multiFile.getResource());
		logger.info("----multiFile :: getInputStream"+ multiFile.getInputStream());
		 
		
//		if(map.get("webRead")==null) {
//			map.put("webRead", "Y");
//		}
//		if(map.get("webWrite")==null) {
//			map.put("webWrite", "N");
//		}
		//유재면 폴더		 
		String webPath = "D:\\workspaces\\workspace4web\\MicroApple\\src\\main\\webapp\\resources\\webDiskFile";
		//강주희 폴더
		//String webPath = "C:\\ddit\\JspSpring\\MicroApple\\src\\main\\webapp\\resources\\webDiskFile";
		String webPath2 = multiFile.getOriginalFilename();
		String webExtn = FilenameUtils.getExtension(webPath2);
		String webOriginNm = multiFile.getOriginalFilename();
		String temp = String.valueOf(multiFile.getSize());
		
		
		
//		System.out.println(temp.substring(temp.length()-2, (temp.length()* -1)));
//		temp = temp.substring(0, temp.length()-2);
//	      System.out.println(temp);
		
		webDiskVO.setWebPath(webPath);
		webDiskVO.setWebExtn(webExtn);
		webDiskVO.setWebOriginNm(webOriginNm);
		webDiskVO.setWebSize(temp);
		logger.info("webPath2 : "+ webPath2);
		logger.info("webExtn : "+ webExtn);
		
		// 서비스호출
		this.webDiskService.uploadFile(webDiskVO, multiFile);
		logger.info("webDiskVO : " + webDiskVO);
		
		String result = webDiskService.convertFileSize(multiFile.getSize());
		logger.info(result);
		webDiskVO.setWebSize(result);
		model.addAttribute(webDiskVO);
		return "redirect:/webDiskMain";
	}
	
	
	
	/** 파일 수정 */
	@RequestMapping(value="/updateFile", method=RequestMethod.POST)
	public String updateFile(@RequestParam Map<String, Object> map, HttpServletRequest request, MultipartFile file,
			@ModelAttribute WebDiskVO webDiskVO, BindingResult result, Model model ) throws Exception {
		
		logger.info("WebDiskController - updateFile - map : {}", map);
		if(map.get("webRead")==null) {
			map.put("webRead", "Y"); 
		}
		if(map.get("webWrite")==null) {
			map.put("webWrite", "N"); 
		}
		// 기존파일가져오기
		MultipartFile multipartFile = webDiskVO.getFile();
		
		
		logger.info("업로드된 파일 정보 가져오기 ====> "+multipartFile);     //////////null
		logger.info("===================file :  "+ file);
		//파일 수정시
//		if(file.getSize()>0) {
//			//신규파일 저장
//			multipartFile.setWebOriginNm(file.getOriginalFilename());
//			//실제로 이미지가 해당 경로로 업로드됨
//			this.webDiskService.updateFile(map); 
//		}else {
//			logger.info("파일수정 else");
//			//파일이 전송되지 않는 경우
//			multipartFile.setWebPath(file.getOriginalFilename());
//		}
		logger.info("==================== ====> "+map);  
		 
		int resultupdate = this.webDiskService.updateFile(map);
		
		return "redirect:/webDiskMain";
	}
	
	/** 체크박스 선택된 파일 삭제 */ 
	@ResponseBody
	@RequestMapping(value="/removeFile", method = RequestMethod.POST)
	public boolean removeFile(WebDiskVO webDiskVO, @RequestParam String webIdx6) {
		boolean flag = false;
		
		webDiskVO.setWebIdx(webIdx6);
		logger.info("파일삭제 : " + webIdx6);
		logger.info("webDiskVO : " + webDiskVO);
		int deleteResult = this.webDiskService.removeFile(webDiskVO);
		
		logger.info("WebDiskController - removeFile - deleteResult : {}", deleteResult);
		
		if(deleteResult > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	//본래 삭제 메소드 
////	@ResponseBody
//	@RequestMapping(value="/removeFile", method = RequestMethod.POST)
//	public ModelAndView removeFile(ModelAndView mav,
//			WebDiskVO webDiskVO,
//			@RequestParam String webIdx6) {

//		webDiskVO.setWebIdx(webIdx6);
//		System.out.println("========================================================================================");
//		System.out.println("========================================================================================");
//		System.out.println("========================================================================================");
//		System.out.println("========================================================================================");
//		System.out.println("========================================================================================");
//		logger.info("파일삭제 : " + webIdx6);
//		logger.info("webDiskVO : " + webDiskVO);
//		this.webDiskService.removeFile(webDiskVO);
//		mav.setViewName("redirect:/webDiskMain");
//		
//		return mav;
//	}

	//////////////////////////////////////////
	@ResponseBody
	@RequestMapping(value="/getFileInfo",method=RequestMethod.GET)
	public ModelAndView getFileInfo(ModelAndView mav, Map<String, Object> fileMap, String webIdx){
		logger.info("getFileInfo");
		
		// 파일명으로 파일 관련 정보를 가져오는 쿼리 실행
		// ex. 
		fileMap = this.webDiskService.getFileInfo(webIdx);
		logger.info("fileMap : " + fileMap);
		
		mav.addObject("fileMap", fileMap);
		mav.setViewName("webDisk/webDiskMain");
		return mav;
	}
	
	/** 파일다운로드 */
	 @RequestMapping(value = "/fileDownload", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE, method=RequestMethod.POST)
	   public ResponseEntity<Resource> fileDownload(@RequestHeader("User-Agent") String userAgent, String webIdx7,
	         @RequestParam(required=false) WebDiskVO webIdx) {
	      
	      logger.info("download File : " + webIdx7);

	      // 파일 목록 조회 쿼리 실행
	      // 파일 경로 가져와서 파일 경로 + "\\" + fileName !!
	      Map<String, Object> map = this.webDiskService.getFileInfo(webIdx7);

	      String webPath = map.get("WEB_PATH").toString();
	      String webSaveNm = map.get("WEB_SAVENM").toString();

	      String uploadFolder = webPath.replace("\\", "\\\\");

//	      String uploadFolder = "C:\\upload";
	      Resource resource = new FileSystemResource(uploadFolder + "\\" + webSaveNm);

	      String resourceName = resource.getFilename();
	      HttpHeaders headers = new HttpHeaders();

	      try {
	         String downloadName = null;

	         if (userAgent.contains("Trident")) { // IE 버전 11
	            downloadName = URLEncoder.encode(resourceName, "UTF-8").replaceAll("\\+", " ");

	         } else if (userAgent.contains("Edge")) {
	            downloadName = URLEncoder.encode(resourceName, "UTF-8");

	         } else {
	            downloadName = new String(resourceName.getBytes("UTF-8"), "ISO-8859-1");
	            int index = downloadName.lastIndexOf("_");
	            downloadName = downloadName.substring(index + 1);
	         }
	         headers.add("Content-disposition", "attachment;filename=" + downloadName);

	      } catch (UnsupportedEncodingException e) {
	         e.printStackTrace();
	      }
	      return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	   }

	

	//파일 상세보기
	@RequestMapping(value ="/selectFileDetail", method= RequestMethod.GET)
	public String selectFileDetail(Model model, String webIdx7, @RequestParam WebDiskVO vo){
		this.webDiskService.selectFileDetail(vo);
		
		vo.setWebIdx(webIdx7);
		model.addAttribute("fileNm", vo.getWebNm());
		model.addAttribute("fileExpl", vo.getWebExpl());
		logger.info("fileNm:" + vo.getWebNm());
		return "redirect:/webDiskMain";
	}
	
}
