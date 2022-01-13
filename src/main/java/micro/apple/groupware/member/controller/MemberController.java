package micro.apple.groupware.member.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import micro.apple.groupware.member.service.MemberService;
import micro.apple.groupware.member.vo.DeptVO;
import micro.apple.groupware.member.vo.memberCriteria;
import net.coobird.thumbnailator.Thumbnailator;
import micro.apple.groupware.member.vo.MemberVO;
import micro.apple.groupware.member.vo.PageVO;
import micro.apple.groupware.member.vo.PositionVO;



@Controller
@AllArgsConstructor
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService memService;
	
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		//로그아웃
		session.invalidate();
		
		
		model.addAttribute("member", new MemberVO());
		
		//forwarding
		return "redirect:/loginForm";
	}
	
	// 회원가입 등록 폼
		@RequestMapping("/registerForm")
		public String registerList(Model model) throws Exception {
			logger.info("register");
			
			MemberVO memberVO = new MemberVO();
			
			logger.info("memberVO : " + memberVO);
			
			model.addAttribute("member", new MemberVO());
			
			return "member/mem/registerForm";
		}
	
	// 회원가입
	@RequestMapping(value = "/registerPost", method = RequestMethod.POST)
	public String registerPost(@ModelAttribute("member") 
								@Validated MemberVO memberVO, 
								BindingResult result,
								@RequestParam("memId") String memId
									) throws Exception {
		logger.info("result : " + result.hasErrors());
		
		if(result.hasErrors()) {
			List<ObjectError> allErrors = result.getAllErrors();
			List<ObjectError> globalErrors = result.getGlobalErrors();
			List<FieldError> fieldErrors = result.getFieldErrors();
			
			logger.info("allErrors.size() : " + allErrors.size());
			logger.info("globalErrors.size() : " + globalErrors.size());
			logger.info("fieldErrors.size() : " + fieldErrors.size());
			
			for(int i=0;i<allErrors.size();i++) {
				ObjectError objectError = allErrors.get(i);
				logger.info("objectError : " + objectError);
			}
			for(int i=0;i<globalErrors.size();i++) {
				ObjectError objectError = globalErrors.get(i);
				logger.info("objectError : " + objectError);
			}
			for(int i=0;i<fieldErrors.size();i++) {
				FieldError fieldError = fieldErrors.get(i);
				logger.info("fieldError : "+ fieldError.getDefaultMessage());
			}
			return "redirect:/registerForm";
		}
		int insertResult = this.memService.insert(memberVO);
		
		System.out.println("회원가입");
		return "redirect:/loginForm";
		
	}
	
	// 아이디 체크
    @GetMapping("/idCheck")
    @ResponseBody
    public int idCheck(@RequestParam("memId") String memId){
        logger.info("userIdCheck 진입");
        logger.info("전달받은 id:"+memId);
        int cnt = memService.idCheck(memId);
        logger.info("확인 결과:"+cnt);
        return cnt;
    }
	
	
	
	
	
	//직원 로그인 폼
	@RequestMapping("/loginForm")
	public String loginForm(Model model) {
		System.out.println("로그인폼");
		model.addAttribute("member", new MemberVO());
		
		//forwarding
		return "member/mem/loginForm";
	}
	
	/*
	 * public String login(@ModelAttribute("member") @Validated MemberVO memberVO, 
						@RequestParam Map<String, Object> map,
						BindingResult result, 
						Model model, 
						HttpServletRequest request, 
						HttpServletResponse response,
						String customCheck) throws Exception {
	 * */
	
	//로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("member") @Validated MemberVO memberVO, 
						@RequestParam (value = "customCheck", required = false) String customCheck, 
						BindingResult result, 
						Model model, 
						HttpServletRequest request, 
						HttpServletResponse response) throws Exception {
		
		
//		logger.info("map : 확인" + map);
		
//		아이디 기억하기 체크박스(customckeck : on)
		logger.info("customCheck : " + customCheck);
		
		logger.info("member : " + memberVO.toString());
		
		logger.info("result.hasErrors() : " + result.hasErrors());
		
		
		if(result.hasErrors()) {	// validated 결과 문제가 발생
			return "member/mem/loginForm";
		}	
		//문제가 없으면 로그인처리..
		HttpSession session = request.getSession();
		
		// 아이디에 해당되는 직원이 있는가?
		String memId = memberVO.getMemId();
		String password = memberVO.getMemPw();
		
		String memdvsn = memberVO.getMemDvsn();
		logger.info("정보확인" + "memId : " + memId + ", password : " + password
				, "memDvsn" + memdvsn);
		
		// db정보
		MemberVO dbmemberVO = this.memService.detail(memId);
		logger.info("dbmemberVO : " + dbmemberVO);
		
		if(dbmemberVO!=null) {	//아이디에 해당되는 직원이 있다면
			logger.info("password : " + password + ", dbmemberVO.getMemPw() : " + 
						dbmemberVO.getMemPw() + ", dbmemberVO.getMemDvsn() : " + 
						dbmemberVO.getMemDvsn());
			// 그리고 입력한 비밀번호화 해당 아이디의 db쪽 비밀번호가 일치하면 로그인
			if(password.equals(dbmemberVO.getMemPw())) {
				// 회원아이디가 있다 -> 비밀번호가 맞는다 -> 오라클DB의 memdvsn이 맞을 경우 로그인 성공
				logger.info("패스워드 통과");
				
				System.out.println("확인 : " + dbmemberVO.getMemDvsn());
				System.out.println("deptIdx : " + dbmemberVO.getDeptIdx());
				if(dbmemberVO.getMemDvsn().equals("2")) {
					logger.info("승인권한");
					logger.info("MemberController->login()->dbmemberVO : " + dbmemberVO.toString());
					session.setAttribute("MEMBERVO", dbmemberVO);
					logger.info("로그인 성공");
					
					if(customCheck!=null) {
						//아이디 기억하기를 체크했을 경우..
						if(customCheck.equals("on")) {
							logger.info("customCheck on 실행");
						// 쿠키 생성(직원 번호)
						Cookie cookie = new Cookie("memId", memberVO.getMemId());
						Cookie cookie3 = new Cookie("customCheck","Y");
						
						// 초단위 설정(60초 -> 1분 -> 하루 -> 한달)
						cookie.setMaxAge(60 * 60 * 24 * 30);
						// 초단위 설정(60초 -> 1분 -> 하루 -> 한달)
						cookie3.setMaxAge(60 * 60 * 24 * 30);
						response.addCookie(cookie);
						response.addCookie(cookie3);
						}else { //아이디 기억하기를 체크하지 않았을 경우
							// 쿠키 삭제
							Cookie cookie = new Cookie("memId", "");
							// 초단위 설정(0)
							cookie.setMaxAge(0);
							response.addCookie(cookie);
						}
					}else {
						// 쿠키 삭제
						Cookie cookie = new Cookie("memId", "");
						// 초단위 설정(0)
						cookie.setMaxAge(0);
						response.addCookie(cookie);
					}//end if
					//forwarding
					return "redirect:/mainPage";
					
				
				}else {
					logger.info("승인된 회원이 아닙니다.");
					return "redirect:/loginForm";
				}
			}else {//로그인 실패
				memberVO = new MemberVO();
				logger.info("비밀번호 실패2");
				model.addAttribute("loginFail", "비밀번호가 잘 못 되었습니다.");
				return "redirect:/loginForm";
			}
		}else {		// 아이디에 해당하는 직원이 없다면,
			memberVO = new MemberVO();
			logger.info("아이디 실패");
			model.addAttribute("loginFail", "해당 아이디가 없습니다.");
			return "redirect:/loginForm";
		}
	}

	//캡챠API
	@ResponseBody
	@RequestMapping(value = "/VerifyRecaptcha", method = RequestMethod.POST)
	public String VerifyRecaptcha(HttpServletRequest request) {
		// 시크릿 키를 캡챠를 받아올수 있는 Class에 보내서 그곳에서 값을 출력한다
	    VerifyRecaptcha.setSecretKey("6LcRNWodAAAAAKBaatBV611zufN5wRONPaltSXQM");
	    String gRecaptchaResponse = request.getParameter("recaptcha");
	    logger.info("gRecaptchaResponse" + gRecaptchaResponse);
	    try {
	       if(VerifyRecaptcha.verify(gRecaptchaResponse)) {
	    	   System.out.println("리캡챠성공");
	          return "0"; // 성공
	       }else 
	       System.out.println("리캡챠실패");
	       return "1"; // 실패
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "-1"; //에러
	    }
	}
	
	
	
	
	
	
	//미승인/거부 회원 목록
	@RequestMapping("/memberApprovalList")
	public String approvalList(Model model
			, HttpServletRequest request, HttpServletResponse response, HttpSession session
			) throws Exception {
		logger.info("memberApprovalList");
		
		
		logger.info("profile");
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
		
	    logger.info("세션 담은 정보  : " + member);
	    model.addAttribute("member", member);
		
		
//		MemberVO memberVO = new MemberVO();
		
		List<MemberVO> list = this.memService.list();
		for(int i=0;i<list.size();i++) {
//			logger.info("list(" + i + ") : " + list.get(i).toString());
		}
		model.addAttribute("list", list);
//		model.addAttribute("member", new MemberVO());
		
		List<DeptVO> deptList = memService.deptList();
		logger.info("deptList : " + deptList.get(0).toString());
		model.addAttribute("deptList", memService.deptList());

		List<PositionVO> positionList = memService.positionList();
		logger.info("positionList : " + positionList.get(0).toString());
		model.addAttribute("positionList", memService.positionList());
		  
		return "member/memberApprovalList";
	}
	
	@RequestMapping(value = "/memberApprovalListPost", method = RequestMethod.POST)
	public String memberApprovalListPost(@ModelAttribute("member") 
											@Validated MemberVO memberVO,
											BindingResult result,
											Model model) throws Exception {

		logger.info("result : " + result.hasErrors());
		//validate 후 문제가 발생하면 실행하는 부분
		if(result.hasErrors()) {
			List<ObjectError> allErrors = result.getAllErrors();
			List<ObjectError> globalErrors = result.getGlobalErrors();
			List<FieldError> fieldErrors =  result.getFieldErrors();
			
			logger.info("allErrors.size() : " + allErrors.size());
			logger.info("globalErrors.size() : " + globalErrors.size());
			logger.info("fieldErrors.size() : " + fieldErrors.size());
			
			for(int i=0;i<allErrors.size();i++) {
				ObjectError objectError = allErrors.get(i);
				logger.info("objectError : " + objectError);
			}
			for(int i=0;i<globalErrors.size();i++) {
				ObjectError objectError = globalErrors.get(i);
				logger.info("objectError : " + objectError);
			}
			for(int i=0;i<fieldErrors.size();i++) {
				FieldError fieldError = fieldErrors.get(i);
				logger.info("fieldError : " + fieldError.getDefaultMessage());
			}
			model.addAttribute("member", memberVO);
			
			return "redirect:/memberApprovalList";
		}
		// 정보가 있으면 업데이트....
		int insertResult = this.memService.insert(memberVO);
		
		return "redirect:/memberApprovalList";
	
	}
	
	// 승인 
	@RequestMapping(value = "/memDivisionsPost", method = RequestMethod.POST)
	public String memDivisionsPost(@RequestParam Map<String, Object> map, Model model) throws Exception{
		logger.info("memDivisionsPost -> map : " + map);
		
		// 정보가 있으면  업데이트...
		int insertResult = this.memService.memDivisions(map);
		
		return "redirect:/memberApprovalList";
	}
	// 거부
	@RequestMapping(value = "/memDenialPost", method = RequestMethod.POST)
	public String memDenialPost(@RequestParam Map<String, Object> map, Model model) throws Exception{
		logger.info("memDenialPost -> map : " + map);
		
		// 정보가 있으면  업데이트...
		int insertResult = this.memService.memDenial(map);
		
		return "redirect:/memberApprovalList";
	}
	
	// 승인 거부 사유 수정
	@RequestMapping(value = "/memberApprovalDeny", method = RequestMethod.POST)
	public String memberApprovalDeny(@RequestParam Map<String,Object> map, Model model) throws Exception {
		logger.info("memberApprovalDeny -> map : " + map);
		
		// 정보가 있으면 업데이트....
		int insertResult = this.memService.memberApprovalDeny(map);
		
		logger.info("memberApprovalDeny -> insertResult" + insertResult);
		return "redirect:/memberApprovalList";
	
	}
	

	// 페이징 처리된 승인된 사원 목록
	@GetMapping("/memberList")
	//RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public String list(memberCriteria cri, Model model
			, HttpServletRequest request, HttpServletResponse response, HttpSession session
			) {
		cri.setMemDvsn("2");
		logger.info("list :" + cri);
		
		
		logger.info("profile");
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
		
	    logger.info("세션 담은 정보  : " + member);
	    model.addAttribute("member", member);
		
		
		
		List<MemberVO> list = memService.getList(cri);
		
		if(list.size()!=0) {
			list.get(0).toString();
			logger.info(list.get(0).toString());
		}
		model.addAttribute("list", list);
		
		
		int total = memService.getTotal(cri);
		logger.info("total : " + total);
		
		
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
		return "member/memberList";
	}
	
	// 퇴사retirementPost
	@RequestMapping(value = "/retirementPost", method = RequestMethod.POST)
	public String retirementPost(@RequestParam Map<String,Object> map, Model model) throws Exception {
		logger.info("retirementPost -> map : " + map);
		// 정보가 있으면 업데이트....
		int insertResult = this.memService.retirementPost(map);
		
		logger.info("retirementPost -> insertResult" + insertResult);
		return "redirect:/memberList";
	
	}
	
	// 페이징 처리된 퇴직된 사원 목록
	@GetMapping("/retirementList")
	//RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public String retirementList(memberCriteria cri, Model model
			, HttpServletRequest request, HttpServletResponse response, HttpSession session
			) {
		cri.setMemDvsn("4");
		logger.info("list :" + cri);
		
		logger.info("profile");
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
		
	    logger.info("세션 담은 정보  : " + member);
	    model.addAttribute("member", member);
		
		List<MemberVO> list = memService.retirementGetList(cri);
		
		if(list.size()!=0) {
			list.get(0).toString();
			logger.info(list.get(0).toString());
		}
		model.addAttribute("list", list);
		
		int total = memService.retirementGetTotal(cri);
		logger.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
		return "member/retirementList";
	}
	
	

	
	
	
	// 회원정보 수정(예정)
	@RequestMapping("/memberMyPage")
		public String memberMyPage(HttpServletRequest request, HttpServletResponse response, HttpSession session,
									Model model) throws Exception {
		logger.info("memberMyPage");
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
	    MemberVO vo = this.memService.detail(member.getMemId());
	     
	    logger.info("마이페이지 세션 담은 사번 : " + memIdx);
	    logger.info("마이페이지 세션 담은  : " + member);
	    
//	    model.addAttribute("member", member);
	    model.addAttribute("member", vo);
		
//		List<MemberVO> list = (List<MemberVO>) this.memService.memberMyPage(memIdx);
//		model.addAttribute("list", list);
//		logger.info("memberMyPage -> list : " + list);
		
		return "member/memberMyPage";
	}
	
	@RequestMapping(value = "/memberMyPagePost",method=RequestMethod.POST)
	public String memberMyPagePost(@ModelAttribute("member") 
									@Validated MemberVO member,
									BindingResult result,
									Model model, HttpSession session) throws Exception {
		//기존 파일 가져오기
		MultipartFile multipartFile = member.getMultipartFile();
		logger.info("memberMyPagePost에 들어왔다");
		//파일 수정할거임?
		if(multipartFile.getSize()>0) { 
			//파일이 전송된 경우 (하나) 
			//기존 파일 삭제 (수정이 되면 기존에 전송했던 파일을 삭제하고 새로운 파일을 전송해야 함) 
			//(지울 곳의 경로, 먼저 저장한 파일명) 
//			memService.deleteProfilePhoto(member);
			//신규파일 저장 (경로랑 함께?)
//			String photo = (String)memService.profileImgUpdate(member, multipartFile);
			logger.info("memberMyPagePost의 if에 들어왔다");
			member.setMemPicture(multipartFile.getOriginalFilename());
			//실제로 이미지가 해당 경로로 업로드 됨
			this.memService.profileImgUpdate(member, multipartFile);
		}else { 
			logger.info("memberMyPagePost의 else에 들어왔다");
			//파일이 전송되지 않는 경우  어떻게 할거임?
			member.setMemPicture(multipartFile.getName());
		}//if end

		
		logger.info("multipartFile : " + multipartFile);
		logger.info("파일 실제 명 : " + multipartFile.getOriginalFilename());
		logger.info("----------------------------------------------");
		logger.info("result : " + result.hasErrors());
		
		
		if(result.hasErrors()) {
			List<ObjectError> allErrors = result.getAllErrors();
			List<ObjectError> globalErrors = result.getGlobalErrors();
			List<FieldError> fieldErrors =  result.getFieldErrors();
			
			logger.info("allErrors.size() : " + allErrors.size());
			logger.info("globalErrors.size() : " + globalErrors.size());
			logger.info("fieldErrors.size() : " + fieldErrors.size());
			
			for(int i=0;i<allErrors.size();i++) {
				ObjectError objectError = allErrors.get(i);
				logger.info("objectError : " + objectError);
			}
			for(int i=0;i<globalErrors.size();i++) {
				ObjectError objectError = globalErrors.get(i);
				logger.info("objectError : " + objectError);
			}
			for(int i=0;i<fieldErrors.size();i++) {
				FieldError fieldError = fieldErrors.get(i);
				logger.info("fieldError : " 
				+ fieldError.getDefaultMessage());
			}
			
			return "redirect:/memberMyPage";
		}
		
		logger.info("member : " + member.toString());
		//직원 등록 및 직원 존재 시 정보 업데이트 처리
		this.memService.insert(member);
		MemberVO newMemberVO = this.memService.detail(member.getMemIdx());
		session.removeAttribute("MEMBERVO");
		model.addAttribute("member", newMemberVO);
		session.setAttribute("MEMBERVO", newMemberVO);
		
		Thread.sleep(3000);
		
		//직원 목록으로 이동
		return "member/memberMyPage";
	}
	
		
	
	
}


