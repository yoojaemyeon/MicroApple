package micro.apple.groupware.notice.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import micro.apple.groupware.notice.mapper.NoticeMapper;
import micro.apple.groupware.notice.service.NoticeService;
import micro.apple.groupware.notice.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeMapper noticeMapper;
	
	// 알림 목록 조회
	@Override
	public List<NoticeVO> noticeList(Map<String, Object> map) {
		return this.noticeMapper.noticeList(map);
	}

}
