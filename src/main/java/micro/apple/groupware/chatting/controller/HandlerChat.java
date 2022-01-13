package micro.apple.groupware.chatting.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import micro.apple.groupware.chatting.service.ChattingService;
import micro.apple.groupware.chatting.vo.ChatMessageVO;

@Component
public class HandlerChat extends TextWebSocketHandler {
	//Handler 채팅에 접속한 사용자 세션을 관리하고, 모든 사용자에게 채팅 메세지를 전달
	
	private static final Logger logger = LoggerFactory.getLogger(HandlerChat.class);
	// (<"chatIdx", 방ID>, <"session", 세션>) - (<"chatIdx", 방ID>, <"session", 세션>) - (<"chatIdx", 방ID>, <"session", 세션>) 형태 
	private List<Map<String, Object>> sessionList = new ArrayList<Map<String, Object>>();
	
	@Autowired
	ChattingService chattingService;
	
	// 클라이언트가 서버로 메세지 전송 처리
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		super.handleTextMessage(session, message);
		// JSON --> Map으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, String> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);

		switch (mapReceive.get("cmd")) {
		
		// CLIENT 입장
		case "CMD_ENTER":
			// 세션 리스트에 저장
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("chatIdx", mapReceive.get("chatIdx"));
			map.put("session", session);
			sessionList.add(map);
			
			// 같은 채팅방에 입장 메세지 전송
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);
				String chatIdx = (String) mapSessionList.get("chatIdx");
				
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");
				
				if(chatIdx.equals(mapReceive.get("chatIdx"))) {
					Map<String, String> mapToSend = new HashMap<String, String>();
					mapToSend.put("chatIdx", chatIdx);
					mapToSend.put("cmd", "CMD_ENTER");
//					mapToSend.put("msg", session.getId() +  "님이 입장 했습니다.");
					
//					String jsonStr = objectMapper.writeValueAsString(mapToSend);
//					sess.sendMessage(new TextMessage(jsonStr));
				}
			}
			break;
			
		// CLIENT 메세지
		case "CMD_MSG_SEND":
			// 같은 채팅방에 메세지 전송
			for (int i = 0; i < sessionList.size(); i++) {
				Map<String, Object> mapSessionList = sessionList.get(i);
				String chatIdx = (String) mapSessionList.get("chatIdx");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

				if (chatIdx.equals(mapReceive.get("chatIdx"))) {
					Map<String, String> mapToSend = new HashMap<String, String>();
					mapToSend.put("chatIdx", chatIdx);
					
					ChatMessageVO info = new ChatMessageVO();
					info = this.chattingService.getChatMsgOne(Integer.parseInt(chatIdx));
					mapToSend.put("chmsgWrdate", info.getChmsgWrdate().toString());
					mapToSend.put("memIdx", info.getMemIdx() + "");
					mapToSend.put("chmsgCont", info.getChmsgCont());
					
					
					mapToSend.put("cmd", "CMD_MSG_SEND");
//					mapToSend.put("msg", session.getId() + " : " + mapReceive.get("msg"));
					mapToSend.put("msg", mapReceive.get("msg"));
					

					String jsonStr = objectMapper.writeValueAsString(mapToSend);
					sess.sendMessage(new TextMessage(jsonStr));
				}
			}
			break;
		}
	}

	// 클라이언트가 연결을 끊음 처리
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		super.afterConnectionClosed(session, status);
        
		ObjectMapper objectMapper = new ObjectMapper();
		String now_chatIdx = "";
		
		// 사용자 세션을 리스트에서 제거
		for (int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> map = sessionList.get(i);
			String chatIdx = (String) map.get("chatIdx");
			WebSocketSession sess = (WebSocketSession) map.get("session");
			
			if(session.equals(sess)) {
				now_chatIdx = chatIdx;
				sessionList.remove(map);
				break;
			}	
		}
		
		// 같은 채팅방에 퇴장 메세지 전송 
		for (int i = 0; i < sessionList.size(); i++) {
			Map<String, Object> mapSessionList = sessionList.get(i);
			String chatIdx = (String) mapSessionList.get("chatIdx");
			WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

			if (chatIdx.equals(now_chatIdx)) {
				Map<String, String> mapToSend = new HashMap<String, String>();
				mapToSend.put("chatIdx", chatIdx);
				mapToSend.put("cmd", "CMD_EXIT");

				String jsonStr = objectMapper.writeValueAsString(mapToSend);
				sess.sendMessage(new TextMessage(jsonStr));
			}
		}
	}
}
