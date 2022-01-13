package micro.apple.groupware.chatting.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import micro.apple.groupware.chatting.mapper.ChattingMapper;
import micro.apple.groupware.chatting.service.ChattingService;
import micro.apple.groupware.chatting.vo.ChatMessageVO;

@Service
public class ChattingServiceImpl implements ChattingService {
	private static final Logger logger = 
			LoggerFactory.getLogger(ChattingServiceImpl.class);
	
	@Autowired
	ChattingMapper chattingMapper;
	

	//채팅방 리스트
	@Override
	public List<Map<String, Object>> getRoomList(String memIdx) {
		System.out.println("memIdx(getRoomList) : " + memIdx);
		return this.chattingMapper.getRoomList(memIdx);
	}

	//채팅 메시지 리스트
	@Override
	public List<Map<String, Object>> getChatMsgList(String chatIdx) {
		return this.chattingMapper.getChatMsgList(chatIdx);
	}

	@Override
	public void insertMessage(Map<String, Object> map) {
		this.chattingMapper.insertMessage(map);
	}

	@Override
	public int createChattingRoom(Map<String, Object> map) {
		
		int result = 0;
		int chatIdx = this.chattingMapper.createChattingRoom(map);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("chatIdx", Integer.parseInt(map.get("chatIdx").toString()));
		param.put("memIdx", map.get("memIdx"));
		result += this.chattingMapper.setChattingRoomMember(param);
		
		param.put("chmsgCont", "<< 방이 생성되었습니다. >>");
		this.chattingMapper.insertMessage(param);
		
		param.replace("memIdx", map.get("targetMemIdx"));
		result += this.chattingMapper.setChattingRoomMember(param);
		
		
		
		return result;
	}

	@Override
	public ChatMessageVO getChatMsgOne(int chatIdx) {
		return this.chattingMapper.getChatMsgOne(chatIdx);
	}
}
