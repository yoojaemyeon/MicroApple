package micro.apple.groupware.notify.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import micro.apple.groupware.member.vo.MemberVO;
import micro.apple.groupware.notify.service.NotifyService;
import micro.apple.groupware.notify.vo.NotifyVO;


@Controller
public class NotifyController {
	private static final Logger logger = LoggerFactory.getLogger(NotifyController.class);

	@Autowired
	NotifyService notifyService;

	// 알림 목록 조회
	@ResponseBody
	@RequestMapping(value = "/notifyList", method = RequestMethod.GET)
	public Map<String, Object> notifyList(HttpServletRequest request, HttpSession session) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("member", (MemberVO)session.getAttribute("MEMBERVO"));
		resultMap.put("notifyList", this.notifyService.notifyList((MemberVO)session.getAttribute("MEMBERVO")));
		return resultMap;
	}

	// 알림 전송
	@ResponseBody
	@RequestMapping(value = "/insertNotify", method = RequestMethod.POST)
	public Map<String, Object> insertNotify(Model model, HttpServletRequest request, HttpSession session, @RequestParam Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("member", (MemberVO)session.getAttribute("MEMBERVO"));
		resultMap.put("insertCount", this.notifyService.insertNotify(map, ((MemberVO)session.getAttribute("MEMBERVO")).getMemIdx()));
		resultMap.put("check", true);
		
		return resultMap;
	}


	// 알림 삭제
	@ResponseBody
	@RequestMapping(value = "/notifyDelete", method = RequestMethod.GET)
	public Map<String, Object> notifyDelete(@RequestParam String noticeIdx) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("notifyDelete", this.notifyService.notifyDelete(noticeIdx));
		
		return resultMap;
	}

}