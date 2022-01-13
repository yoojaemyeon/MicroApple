package micro.apple.groupware.notify.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import micro.apple.groupware.member.vo.MemberVO;
import micro.apple.groupware.notify.mapper.NotifyMapper;
import micro.apple.groupware.notify.vo.NotifyVO;

public interface NotifyService {

	List<NotifyVO> notifyList(MemberVO memberVO);	// 알림 목록 조회

	int insertNotify(Map<String, Object> map, String senderMemIdx);// 알림 등록

	int notifyDelete(String noticeIdx);	// 알림 삭제


}
