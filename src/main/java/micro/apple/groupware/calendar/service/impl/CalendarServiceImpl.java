package micro.apple.groupware.calendar.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import micro.apple.groupware.calendar.mapper.CalendarMapper;
import micro.apple.groupware.calendar.service.CalendarService;
import micro.apple.groupware.calendar.vo.CalendarListVO;
import micro.apple.groupware.calendar.vo.CalendarVO;
import micro.apple.groupware.mail.vo.MessageDetailVO;
import micro.apple.groupware.mail.vo.MessageVO;

@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	CalendarMapper calendarMapper;
	

	@Override
	public void scheduleJSON(CalendarVO calendarVo) {
		this.calendarMapper.scheduleJSON(calendarVo);
	}


	@Override
	public List<CalendarVO> scheduleList(CalendarVO calendarVo) {
		return this.calendarMapper.scheduleList(calendarVo);
	}


	@Override
	public List<CalendarVO> searchSdIdx(CalendarVO calendarVo) {
		return this.calendarMapper.searchSdIdx(calendarVo);
	}


	@Override
	public void duplicationDelete(CalendarVO calendarVo) {
		this.calendarMapper.duplicationDelete(calendarVo);
	}


	@Override
	public void duplicationDelete2(CalendarVO calendarVo) {
		this.calendarMapper.duplicationDelete2(calendarVo);
	}


	@Override
	public List<CalendarVO> scheduleDetailList(CalendarVO calendarVo) {
		return this.calendarMapper.scheduleDetailList(calendarVo);
	}


	@Override
	public List<CalendarVO> scheduleShareNm(CalendarVO calendarVo) {
		return this.calendarMapper.scheduleShareNm(calendarVo);
	}


	@Override
	public int updateDetail(CalendarVO calendarVo) {
		return this.calendarMapper.updateDetail(calendarVo);
	}


	@Override
	public void schdDelete(CalendarVO calendarVo) {
		this.calendarMapper.schdDelete(calendarVo);
	}


	@Override
	public void schdShare(CalendarVO calendarVo) {
		this.calendarMapper.schdShare(calendarVo);
	}


	@Override
	public List<CalendarVO> shareSchd(CalendarVO calendarVo) {
		return this.calendarMapper.shareSchd(calendarVo);
	}


	@Override
	public void deleteShare(CalendarVO calendarVo) {
		this.calendarMapper.deleteShare(calendarVo);
	}


	@Override
	public List<CalendarListVO> schdIdxDetact(CalendarListVO calLvo) {
		return this.calendarMapper.schdIdxDetact(calLvo);
	}


	@Override
	public List<CalendarVO> scheduleDetailShareList(CalendarVO calendarVo) {
		return this.calendarMapper.scheduleDetailShareList(calendarVo);
	}


//	@Override
//	public List<CalendarVO> scheduleDetailList2(CalendarVO calendarVo) {
//		return this.calendarMapper.scheduleDetailList2(calendarVo);
//	}







}
