package micro.apple.groupware.eDocument.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import micro.apple.groupware.eDocument.service.EDocumentService;
import micro.apple.groupware.member.vo.MemberVO;

@Controller
public class EDocumentController {

	private static final Logger logger = LoggerFactory.getLogger(EDocumentController.class);

	@Autowired
	EDocumentService eDocumentService;
	
	@RequestMapping("/eDocument")
	public String eDocument(HttpSession session,Model model){
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
	    model.addAttribute("member", member);
		return "eDocument/eDocumentMain";
	}
	
	@RequestMapping("/eDocument/write")
	public String eDocumentWrite(HttpSession session,Model model) {
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
		return "eDocument/write";
	}
	
	@RequestMapping("/eDocument/lineView")
	public String eDocumentLineView(HttpSession session,Model model) {
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
		model.addAttribute("data", this.eDocumentService.ajaxLineView());
		return "eDocument/popup/lineView";
	}
	
	@ResponseBody
	@RequestMapping("/ajax/save_document")
	public Map<String, Object> ajaxSaveDocument(HttpSession session, Model model, @RequestParam Map<String, Object> param) {
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(this.eDocumentService.ajaxSaveDocument(session, param) == 1) resultMap.put("check", true);
		else resultMap.put("check", false);
		return resultMap;
	}
	
	@ResponseBody
	@RequestMapping("/ajax/getCount")
	public Map<String, Object> ajaxGetCount(HttpSession session, Model model) {
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = this.eDocumentService.ajaxGetCount(session);
		return resultMap;
	}
	
	@ResponseBody
	@RequestMapping("/ajax/getDocumentList")
	public Map<String, Object> ajaxGetDocumentList(HttpSession session, Model model, @RequestParam Map<String, Object> param) {
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = this.eDocumentService.ajaxGetDocumentList(session, param);
		return resultMap;
	}
	
	@ResponseBody
	@RequestMapping("/ajax/getDocumentInfo")
	public Map<String, Object> ajaxGetDocumentInfo(HttpSession session, Model model, @RequestParam Map<String, Object> param) {
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = this.eDocumentService.ajaxGetDocumentInfo(session, param);
		return resultMap;
	}
	
	@ResponseBody
	@RequestMapping("/ajax/documentConfirm")
	public Map<String, Object> ajaxDocumentConfirm(HttpSession session, Model model, @RequestParam Map<String, Object> param) {
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = this.eDocumentService.ajaxDocumentConfirm(session, param);
		return resultMap;
	}
}
