package micro.apple.groupware.main.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import micro.apple.groupware.main.service.MainService;
import micro.apple.groupware.member.vo.MemberVO;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	MainService mainService;
	
	//편지쓰기페이지
	@RequestMapping("/mainPage")
	public String mainPage(HttpSession session ,Model model){
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
	    model.addAttribute("member", member);
		logger.info("mainPage");
		
		return "main/mainPage";
	}
	
}
