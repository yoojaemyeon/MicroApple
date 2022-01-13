package micro.apple.groupware.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import micro.apple.groupware.notice.mapper.NoticeMapper;
import micro.apple.groupware.notice.vo.NoticeVO;

public interface NoticeService {

	List<NoticeVO> noticeList(Map<String, Object> map);	// 알림 목록 조회

}
