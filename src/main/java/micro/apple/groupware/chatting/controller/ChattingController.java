package micro.apple.groupware.chatting.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mvel2.util.ThisLiteral;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import micro.apple.groupware.chatting.service.ChattingService;
import micro.apple.groupware.chatting.vo.ChatMessageVO;
import micro.apple.groupware.member.service.MemberService;
import micro.apple.groupware.member.vo.MemberVO;

@Controller
public class ChattingController {

	@Autowired
	ChattingService chattingService;
	MemberService memService;
	
	private static final Logger logger = LoggerFactory.getLogger(ChattingController.class);
	
//채팅방 목록
		@ResponseBody
		@PostMapping("/chat/getRoomList")
		public List<Map<String, Object>> chatList(Model model,@RequestParam Map<String, Object> map) throws Exception {
			List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
			
			result = chattingService.getRoomList((String) map.get("memIdx"));
			return result;
		}
		
//채팅방 입장
		@ResponseBody
		@GetMapping("/view_chat")
		public ModelAndView view_chat(Model model, @RequestParam Map<String, Object> map) throws Exception {
			ModelAndView mav = new ModelAndView("chatting/chat/view_chat");
			mav.addObject("chatList", (List<Map<String, Object>>)(this.chattingService.getChatMsgList(map.get("chatIdx").toString())));
			return mav;
		}
		// 채팅방생성
		@ResponseBody
		@PostMapping("/createChattingRoom")
		public Map<String, Object> createChattingRoom(Model model, @RequestParam Map<String, Object> map) throws Exception {
			Map<String, Object> result = new HashMap<String, Object>();
			
			map.put("chatIdx", 0);;
			int sqlResult = this.chattingService.createChattingRoom(map);
			
			result.put("sqlResult", sqlResult);
			
			return result;
		}
		
		

//채팅메시지 저장
		@PostMapping("/saveChat")
		public void saveChat(Model model, @RequestParam Map<String, Object> map,HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
			
//			MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
//			String memIdx = member.getMemIdx();
//			String memId = "a001";
			chattingService.insertMessage(map);
		}
		
		
	}
	 

