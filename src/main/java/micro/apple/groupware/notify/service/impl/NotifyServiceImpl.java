package micro.apple.groupware.notify.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import micro.apple.groupware.member.vo.MemberVO;
import micro.apple.groupware.notify.mapper.NotifyMapper;
import micro.apple.groupware.notify.service.NotifyService;
import micro.apple.groupware.notify.vo.NotifyVO;

@Service
public class NotifyServiceImpl implements NotifyService {

	@Autowired
	NotifyMapper notifyMapper;
	
	// 알림 목록 조회
	@Override
	public List<NotifyVO> notifyList(MemberVO memberVO) {
		
		List<NotifyVO> resultList = this.notifyMapper.notifyList(memberVO);
		
		return resultList;
	}


	// 알림 등록
	@Override
	public int insertNotify(Map<String, Object> map, String senderMemIdx) {
		System.out.println("insertNotify map >>");
		System.out.println(map);
		
		if(Integer.parseInt(map.get("memIdx").toString()) == 0) map.replace("memIdx", senderMemIdx);
		
		int result = 0;
		
		result = this.notifyMapper.insertNotify(map);
		
		return result;
	}


	@Override
	public int notifyDelete(String noticeIdx) {
		
		int result = this.notifyMapper.notifyDelete(noticeIdx);
		
		return result;
	}


}
