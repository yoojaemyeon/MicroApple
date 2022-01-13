package micro.apple.groupware.notify.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Message;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import micro.apple.groupware.member.vo.MemberVO;
import micro.apple.groupware.notify.service.NotifyService;

// 알림 웹소켓 핸들러
//@Repository
@Component
public class NotifyHandler extends TextWebSocketHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(NotifyHandler.class);
	
	@Autowired
	NotifyService notifyService;
	
	// 로그인 한 전체 (웹소켓 세션을 담아둘 리스트)
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1대1
	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
		
	//서버에 접속이 성공 했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);	// 접속되어 있는 유저들 담기
		logger.info("알림 소켓 연결 성공 : " + session.getId());
		logger.info("알림 소켓 연결 attributes >> ");
		logger.info(session.getAttributes().toString());
		
		String senderId = getMemberIdx(session);	// 현재 접속한 사람
		userSessionsMap.put(senderId , session);
		logger.info("알림 소켓 senderId : " + senderId);
		
	}
	
	// 클라이언트가 소켓에 메세지를 보냈을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
 
			logger.info("소켓에 메시지 보낼때 session : " + session.getAttributes());
 
			String msg = message.getPayload();
 
			logger.info("메시지 가나요 : " + msg);
 
			String senderId = getMemberIdx(session);
			
			if(msg != null) {
				String[] strs = msg.split("#@#");
				logger.info(Arrays.toString(strs));
				if(strs != null && strs.length == 5) {
//					String noticeAddr = strs[0];
//					String noticeCont = strs[1]; 
//					String noticeUrl = strs[2];
					String memIdx = strs[3];
//					String noticeSendall = strs[4];
// 
					if(memIdx.equals("0")) {	// 사원번호가 전체라면 
						for(WebSocketSession wss : sessions) {
							TextMessage tmpMsg =  new TextMessage(msg);
							wss.sendMessage(tmpMsg);
						}
// 
					}else{	// 특정 사원에게 보낸다면
// 
						WebSocketSession targetSession = userSessionsMap.get(memIdx); // 메시지를 받을 세션 조회
// 
						// 보낼 사원이 null이 아니라면 메시지 전송
						if(targetSession!=null) {
							TextMessage tmpMsg =  new TextMessage(msg);
							targetSession.sendMessage(tmpMsg);
						}
					}
				}
			}
	}
	
	//연결 해제될때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String senderId = getMemberIdx(session);
		if(senderId!=null) {	// 로그인 되어있다면
			logger.info(senderId + "님 소켓 연결 끊음");
			userSessionsMap.remove(senderId);
			sessions.remove(session);
		}
//		userSessionsMap.remove(getMemberIdx(session), session);
//		sessions.remove(session);
	}
	
	// 웹소켓에 id 가져오기
 // 접속한 유저의 http세션을 조회하여 id를 얻는 함수
	private String getMemberIdx(WebSocketSession session) {
		
		Map<String, Object> httpSession = session.getAttributes();
		MemberVO memberInfo = (MemberVO)httpSession.get("MEMBERVO"); // 세션에 저장된 memberIdx 조회
		
		if(memberInfo == null) {
			return session.getId();
		}else {
			return memberInfo.getMemIdx();
		}
	}
	
	// 알림 갯수 세기
	public void countAlarm(String alarm) {
		
		TextMessage message = new TextMessage(alarm);
		
		String msg = message.getPayload();
		if(!StringUtils.isEmpty(msg)) {
			String[] strs = msg.split(",");
			
			if(strs != null && strs.length == 2) {
				String cmd = strs[0];
				String reMemIdx = strs[1];
				
				WebSocketSession reSession = userSessionsMap.get(reMemIdx);
				
				try {
					if(reSession != null) {
						TextMessage tmpMsg = new TextMessage(cmd);
						reSession.sendMessage(tmpMsg);
					}
				} catch (Exception e) {
					System.out.println("countAlarm 에러 " + e);
				}
			}
		}
		
	}
	
	// 알림 보여주기
	public void AlarmShow(String alarm) {
		
		TextMessage message = new TextMessage(alarm);
		
		String msg = message.getPayload();
		if(!StringUtils.isEmpty(msg)) {
			String[] strs = msg.split(",");
			
			if(strs != null && strs.length == 2) {
				String cmd = strs[0];
				String reMemIdx = strs[1];
				
				WebSocketSession reSession = userSessionsMap.get(reMemIdx);
				
				try {
					if("1".equals(cmd) && reSession != null) {
						TextMessage tmpMsg = new TextMessage(cmd);
						reSession.sendMessage(tmpMsg);
					} else if("2".equals(cmd) && reSession != null) {
						TextMessage tmpMsg = new TextMessage(cmd);
						reSession.sendMessage(tmpMsg);
					} else if("3".equals(cmd) && reSession != null) {
						TextMessage tmpMsg = new TextMessage(cmd);
						reSession.sendMessage(tmpMsg);
					} else if("4".equals(cmd) && reSession != null) {
						TextMessage tmpMsg = new TextMessage(cmd);
						reSession.sendMessage(tmpMsg);
					} else if("5".equals(cmd) && reSession != null) {
						TextMessage tmpMsg = new TextMessage(cmd);
						reSession.sendMessage(tmpMsg);
					} 
					
				} catch (Exception e) {
					System.out.println("AlarmShow 에러 " + e);
				}
				
			}
			
			
		}
		
		
	}
	
	
	
	
}