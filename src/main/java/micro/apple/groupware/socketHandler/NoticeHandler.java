package micro.apple.groupware.socketHandler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import micro.apple.groupware.member.vo.MemberVO;

// 웹소켓 핸들러
@Repository
public class NoticeHandler extends TextWebSocketHandler {
	
	private static final Logger logger =
			LoggerFactory.getLogger(NoticeHandler.class);
	
	// 로그인 한 전체
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1대1
	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
		
	//서버에 접속이 성공 했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);	// 접속되어 있는 유저들 담기
		logger.info("소켓 연결 성공 : " + session.getId());
		
		
		String userName = getUserName(session);	// 현재 접속한 사람
		userSessionsMap.put(userName , session);
		
		// messageMapper라는 interface에 count- 메소드 호출 (해보기)
//		session.sendMessage(new TextMessage("webMessage : " + messageMapper.countMessageView(userName)));
	}
	
	// 소켓에 메세지를 보냈을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String senderId = session.getId();
		for(WebSocketSession sess : sessions) {
			sess.sendMessage(new TextMessage(senderId + " : " + message.getPayload()));
		}
		
		
		
		
		/*
		//protocol : cmd , 댓글작성자, 게시글 작성자 , seq (reply , user2 , user1 , 12)
		String msg = message.getPayload();	// 현재 접속중인 이름은 이 함수를 통해 메시지에 담긴 텍스트값을 얻을 수 있음
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			
			if(strs != null && strs.length == 4) {
				String boardIdx = strs[0];	// 게시글 번호
				String writer = strs[1]; 	// 글 작성자
				String receiver = strs[2];	// 수신자
				String title = strs[3];		// 제목
				
				String comment = " 님이 자유게시판에서 회원님을 태그하셨습니다.";
				
				String memId = getUserName(session);
				
				// 글 작성자가 현재 접속중인지 체크
				WebSocketSession writerSession = userSessionsMap.get(writer);
				
				// 자유게시판 회원 태그
				if(writerSession != null) {	// 글 작성자의 session
					TextMessage txtmsg = new TextMessage(writer + comment);
					writerSession.sendMessage(txtmsg);
				}else {	// null일 경우 다시 자신에게 그 메시지를 보내도록 설정
					TextMessage txtmsg = new TextMessage(writer + comment);
					session.sendMessage(txtmsg);
				}
				
			}
		
		}
		*/
	}
	
	//연결 해제될때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("소켓 연결 끊음");
		userSessionsMap.remove(getUserName(session), session);
		sessions.remove(session);
	}
	
	//웹소켓 email 가져오기
	private String getUserName(WebSocketSession session) {
	
//		Map<String, Object> httpSession = session.getAttributes();
//		MemberVO loginUser = (MemberVO)httpSession.get("memberVO");
		
		String memId = session.getPrincipal().getName();
		
		return memId;
	}
}