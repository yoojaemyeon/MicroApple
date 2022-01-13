package micro.apple.groupware.chatting.mapper;

import java.util.List;
import java.util.Map;

import micro.apple.groupware.chatting.vo.ChatMessageVO;

public interface ChattingMapper {

	
	//채팅방 리스트
	public List<Map<String, Object>> getRoomList(String memIdx);
	//채팅 메시지 리스트
	public List<Map<String, Object>> getChatMsgList(String chatIdx);
	
	public Map<String, Object> saveChat(String string);
	public void insertMessage(Map<String, Object> map);
	public int createChattingRoom(Map<String, Object> map);
	public int setChattingRoomMember(Map<String, Object> map);
	public ChatMessageVO getChatMsgOne(int chatIdx);

}
