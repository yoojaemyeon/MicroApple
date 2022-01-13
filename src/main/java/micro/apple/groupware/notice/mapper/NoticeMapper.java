package micro.apple.groupware.notice.mapper;

import java.util.List;
import java.util.Map;

import micro.apple.groupware.notice.vo.NoticeVO;

public interface NoticeMapper {

	// 알림 목록 조회
	List<NoticeVO> noticeList(Map<String, Object> map);

}
