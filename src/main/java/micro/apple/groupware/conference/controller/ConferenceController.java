package micro.apple.groupware.conference.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.core.io.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.core.io.FileSystemResource;
import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.collect.Range;

import micro.apple.groupware.conference.service.ConferenceService;
import micro.apple.groupware.conference.vo.AttendVO;
import micro.apple.groupware.conference.vo.ConferencePage;
import micro.apple.groupware.conference.vo.ConferenceVO;
import micro.apple.groupware.mcaShop.controller.FileUploadUtil2;
import micro.apple.groupware.member.vo.MemberVO;

@Controller
public class ConferenceController {
	private static final Logger logger = LoggerFactory.getLogger(ConferenceController.class);

	@Autowired
	ConferenceService conferenceService;

	// 파일 업로드에 대한 부분 끝

	// 회의록 조회
	@RequestMapping("/conference")
	public String conference(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "currentPage", defaultValue = "1") String currentPage) throws Exception {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("currentPage", currentPage);
		
		MemberVO member = (MemberVO) session.getAttribute("MEMBERVO");
		logger.info("member : " + member);
		logger.info("conferencePage : " + map);

		List<Map<String, Object>> list = this.conferenceService.list(map);
		if (list.isEmpty()) {
			return "conference/conferenceNull";
		} else {
			Map<String, Object> Title = new HashMap<String, Object>();

			// 전체 게시글 행의 수(total)
			int total = this.conferenceService.totalConference();

			Title.put(currentPage, Title);

			// 회의록, 회의록 내용 조인 결과 목록

			Title.put("mtngTitle", list.get(0).toString());
			logger.info("Title :" + Title);
			
			model.addAttribute("mtngTitle", Title);
			//list : 회의록의 목록
			model.addAttribute("list", list);
			//total : 행의수, currentPage : 현재 페이지, size : 한 화면에 보여질 목록, list : select결과
			model.addAttribute("conferencePage",new ConferencePage(total, Integer.parseInt(currentPage), 10, list));
			
			model.addAttribute("member", member);
			return "conference/conference";
		}

	}

	// 회의록 검색
	@RequestMapping(value = "/searchConference", method = RequestMethod.POST)
	public String searchConference(Model model, @RequestParam Map<String, Object> map, HttpServletRequest request,
			HttpServletResponse response, HttpSession session,
			@RequestParam(value = "currentPage", defaultValue = "1") String currentPage) throws Exception {
		
		Map<String,Object> mep = new HashMap<String,Object>();
		mep.put("currentPage", currentPage);
		
		
		MemberVO member = (MemberVO) session.getAttribute("MEMBERVO");
		logger.info("검색 map : " + map);
		
		if (map.get("memNm").toString().equals("")) {
			return "conference/searchConferenceNull";
		}else {
			
			List<Map<String, Object>> list = this.conferenceService.searchConference(map);
			logger.info("list : " + list);
			
			if (list.isEmpty()) {
				return "conference/searchConferenceNull";
			}else {
				
			Map<String, Object> Title = new HashMap<String, Object>();
			
			// 전체 게시글 행의 수(total)
			int total = this.conferenceService.totalConference();
			
			Title.put(currentPage, Title);
			
			// 회의록, 회의록 내용 조인 결과 목록
			
			Title.put("mtngTitle", list.get(0).toString());
			logger.info("Title :" + Title);
			
			model.addAttribute("mtngTitle", Title);
			//list : 회의록의 목록
			model.addAttribute("list", list);
			//total : 행의수, currentPage : 현재 페이지, size : 한 화면에 보여질 목록, list : select결과
			model.addAttribute("conferencePage",new ConferencePage(total, Integer.parseInt(currentPage), 10, list));
			
			model.addAttribute("member", member);
			
			return "conference/searchConference";
		}
	  }
	}

	
	// 회의록 상세조회
	@RequestMapping(value = "/conferenceDetail")
	public String conferenceDetail(Model model, @RequestParam Map<String, Object> map, 
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		MemberVO member = (MemberVO) session.getAttribute("MEMBERVO");

		logger.info("member !!!!" + member);

		Map<String, Object> detail = this.conferenceService.conferenceDetail(map);
		logger.info("detail : " + detail);

		// CLOB내용 가져오기
		ConferenceVO conVO = new ConferenceVO();
		String mtngIdx = detail.get("MTNG_IDX").toString();
		logger.info("보내기전 mtngIdx" + mtngIdx);
		conVO = this.conferenceService.information(mtngIdx);
		logger.info("conVO : " + conVO);

		model.addAttribute("member", member);
		model.addAttribute("detail", detail);
		model.addAttribute("conVO", conVO);

		return "conference/conferenceDetail";
	}

	// 회의록 글쓰기 눌렀을때
	@RequestMapping(value = "/ConferenceWrite", method = RequestMethod.GET)
	public String writeGet(Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {

		MemberVO member = (MemberVO) session.getAttribute("MEMBERVO");
		logger.info("member !!!!" + member);
		model.addAttribute("member", member);

		return "conference/write";
	}

	// 회의록 작성 POST
	@RequestMapping(value = "/ConferenceWrite", method = RequestMethod.POST)
	public String write(Model model, @ModelAttribute ConferenceVO conferenceVO, MultipartFile file) throws Exception {

		logger.info("conferenceVO: " + conferenceVO);

		this.conferenceService.Insert(conferenceVO, file);

		return "redirect:/conference";
	}

	// 파일 다운 로드
	// 첨부파일을 다운로드는 MIME 타입을 다운로드 타입으로 지정.
	// APPLICATION_OCTET_STREAM_VALUE : 다운로드할 수 있는 MIME타입
	// 한글 이름 다운로드 시 IE는 Content-Disposition의 값을 처리하는
	// 방식이 Chrome과 달라 따로 처리를 더 해줘야 함
	// User-Agent : HTTP 헤더 메시지 중에서 디바이스의 정보를 제공
	// (웹브라우저의 종류, 모바일, 데스크톱..)
	@RequestMapping(value = "/Cdownload", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String mtngFile) {
		logger.info("download file : " + mtngFile);

		// 파일이 있는 윈도 경로
		String uploadFolder = FileUploadUtil2.uploadFolder;

		logger.info("uploadFolderuploadFolder : " + uploadFolder);
		// ...resources_upload_2021_11_05_개똥이.jpg
		org.springframework.core.io.Resource resource = new FileSystemResource(uploadFolder + "\\" + mtngFile);

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

	// 게시글 수정
	@RequestMapping("/updateConference")
	public String updateConference(Model model, @RequestParam Map<String, Object> map, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {

		MemberVO member = (MemberVO) session.getAttribute("MEMBERVO");

		logger.info("member !!!!" + member);

		logger.info("게시글 수정전 map :" + map);

		List<ConferenceVO> list = this.conferenceService.updateConference(map);

		logger.info("sel :" + list.get(0));

		model.addAttribute("detail", list.get(0));
		model.addAttribute("member", member);

		return "conference/updateConference";
	}

	// 회의록 수정 POST
	@RequestMapping(value = "/updateConference", method = RequestMethod.POST)
	public String updateConference(Model model, @ModelAttribute ConferenceVO conferenceVO, MultipartFile file)
			throws Exception {

		logger.info("conferenceVO: " + conferenceVO);

		this.conferenceService.updateConferencePost(conferenceVO, file);

		return "redirect:/conference";
	}

	// 회의록 삭제
	@RequestMapping("/deleteConference")
	public String deleteConference(Model model, @RequestParam String mtngIdx) {

		this.conferenceService.deleteConference(mtngIdx);

		return "redirect:/conference";
	}


//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< !!!!!!!!!회의록 끝!!!!!!!!!!! >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>	

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< !!!!!!!!!근태관리!!!!!!!!!!! >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>		

	@RequestMapping("/attend")
	public String test(Model model,HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		MemberVO member = (MemberVO) session.getAttribute("MEMBERVO");

		logger.info("member !!!!" + member);
		logger.info("eDocumentPage");
		
		model.addAttribute("member",member);
		
		return "conference/attend";
	}

	
	//출근 체크
	@RequestMapping(value = "/workCheckHi", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> hiCheck(Model model,@RequestParam Map<String,Object> map) {
		Map<String, Object> result = new HashMap<>();
		
		logger.info("출근 map : "+  map);
		String currentIp = map.get("currentIp").toString();
		String reason = "";
		boolean check = true;
		
		Map<String,Object> mem = this.conferenceService.LoginMem(map);	
		logger.info("mem : "+ mem);
		
		if (!currentIp.substring(0,7).toString().equals("192.168") ) {
			check = false;
			reason = "회사 IP가 아닙니다. 당신은 누규~~!";
		}else if(currentIp.substring(0,7).toString().equals("192.168")) {
			if(mem.get("ATMN_START").equals("00")) {
				logger.info("출근 체크 보내기전 map : " + map);
				this.conferenceService.hiCheck(map);
				reason = "반가워요 오늘도 힘내봐요~!";
			}else if(!mem.get("ATMN_START").equals("00")){
				reason = "이미 출근 하셨습니다.";
			}
		}
		result.put("check", check);
		result.put("reason", reason);
		
		return result;
	}
	
	//퇴근 체크
	@RequestMapping(value = "/workCheckBye", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> workCheckBye(Model model,@RequestParam Map<String,Object> map) {
		Map<String, Object> result = new HashMap<>();
		String currentIp = map.get("currentIp").toString();
		String reason = "";
		boolean check = true;
		
		logger.info("퇴근 map : "+  map);
		Map<String,Object> mem = this.conferenceService.LoginMem(map);	
		logger.info("mem : "+ mem);
		
		
		String atmnIdx = mem.get("ATMN_IDX").toString();
		String memIdx = mem.get("MEM_IDX").toString();
		mem.put("atmnIdx", atmnIdx);
		mem.put("memIdx", memIdx);
		
		if (!currentIp.substring(0,7).toString().equals("192.168") ) {
			check = false;
			reason = "회사 IP가 아닙니다. 당신은 누규~~!";
		}else if(currentIp.substring(0,7).toString().equals("192.168")) {
			logger.info("퇴근 체크 보내기전 mem : " + mem);
			
			String atmnStart2 = mem.get("ATMN_START").toString();
			String atmnStart = atmnStart2.substring(0,2);
			logger.info("atmnStart : "+ atmnStart); //출근시간
			
			if(!mem.get("ATMN_END").toString().equals("00") || mem.get("ATMN_END").toString().equals("00")) {
			
			String atmnEnd2 = mem.get("ATMN_END").toString();
			String atmnEnd = atmnEnd2.substring(0,2);
			logger.info("atmnEnd : "+ atmnEnd); //퇴근 시간
			
			String atmnDvsn; //구분
			
			if(Integer.parseInt(atmnStart) < 10  && Integer.parseInt(atmnEnd) >= 18) {
				//출근시간 10시까지 / 퇴근시간 18시 이후 = 퇴근
				atmnDvsn = "출근";
			}else if(12 < Integer.parseInt(atmnStart) && Integer.parseInt(atmnStart) <= 13  && 18 <= Integer.parseInt(atmnEnd) && Integer.parseInt(atmnEnd) <= 23){
				//출근시간 12시이후 / 퇴근시간 18시 이후 = 반가
				atmnDvsn = "반가";
			}else if(Integer.parseInt(atmnStart) > 10 && Integer.parseInt(atmnStart) <= 12  && Integer.parseInt(atmnEnd) >= 18 && Integer.parseInt(atmnEnd) <= 23) {
				//출근시간 10시 이후 12시 이전 / 퇴근 18시 이후 = 지각
				atmnDvsn = "지각";
			}else {
				atmnDvsn = "미출근";
			}
			
			mem.put("atmnDvsn", atmnDvsn);
			
			logger.info("마지막 퇴근전 : " + mem);
			this.conferenceService.ByeCheck(mem);
			}
		}
		
		result.put("check", check);
		result.put("reason", reason);
		
		return result;
	}
	
	
	//출근 조회
	@RequestMapping(value = "/workCheck", method = RequestMethod.GET)
	public String workCheck(Model model, @RequestParam Map<String,Object> map) {
		
		logger.info("출근 조회 전 map : " + map);
		List<AttendVO> list = this.conferenceService.workCheck(map); 
		logger.info("list : " + list);

		//출근 일수 쿼리
		Map<String,Object> attend = this.conferenceService.attend(map);
		logger.info("attend : " + attend);
		
		model.addAttribute("attend",attend);
		model.addAttribute("list",list);
		return "conference/workCheck/workCheck";
	}
	
	//사원 출근 조회
	@RequestMapping(value = "/AllworkCheck", method = RequestMethod.GET)
	public String AllworkCheck(Model model, @RequestParam Map<String,Object> map) {
		
		logger.info("출근 조회 전 map : " + map);
		List<AttendVO> list = this.conferenceService.AllworkCheck(); 
		
		logger.info("list : " + list);
		
		model.addAttribute("list",list);
		
		return "conference/workCheck/AllworkCheck";
	}

	//사원 검색
	@RequestMapping(value = "/MemSearchGo", method = RequestMethod.POST)
	public String MemSearchGo(Model model, @RequestParam Map<String,Object> map) {
		
		logger.info("멤버 검색 map : " + map);
		List<AttendVO> list = this.conferenceService.MemSearchGo(map); 
		
		logger.info("list : " + list);
		
		model.addAttribute("list",list);
		return "conference/workCheck/MemSearchGo";
	}
	
	//전체목록 출근 기록 내용 작성
	@RequestMapping("/saveAtmnCont")
	public String saveAtmnCont(Model model,@RequestParam Map<String,Object> map) {
		
		logger.info("map :" + map);
		this.conferenceService.saveAtmnCont(map);
		
		return "redirect:/AllworkCheck";
	}
	
	//개인 출근 기록 내용 작성
	@RequestMapping("/saveAtmnContOne")
	public String saveAtmnContOne(Model model,@RequestParam Map<String,Object> map) {
		
		logger.info("map :" + map);
		this.conferenceService.saveAtmnCont(map);
		
		return "redirect:/workCheck?memIdx="+map.get("memIdx").toString();
	}

}
