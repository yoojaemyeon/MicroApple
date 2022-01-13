package micro.apple.groupware.notify.mapper;

import java.util.List;
import java.util.Map;

import micro.apple.groupware.member.vo.MemberVO;
import micro.apple.groupware.notify.vo.NotifyVO;

public interface NotifyMapper {

	// 알림 목록 조회
	List<NotifyVO> notifyList(MemberVO memberVO);

	// 알림 등록
	int insertNotify(Map<String, Object> map);

	// 알림 삭제
	int notifyDelete(String noticeIdx);

}
