package micro.apple.groupware.calendar.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import micro.apple.groupware.calendar.vo.CalendarListVO;
import micro.apple.groupware.calendar.vo.CalendarVO;

public interface CalendarService {

	void scheduleJSON(CalendarVO calendarVo);

	public List<CalendarVO> scheduleList(CalendarVO calendarVo);

	List<CalendarVO> searchSdIdx(CalendarVO calendarVo);

	void duplicationDelete(CalendarVO calendarVo);

	void duplicationDelete2(CalendarVO calendarVo);

	List<CalendarVO> scheduleDetailList(CalendarVO calendarVo);

	List<CalendarVO> scheduleShareNm(CalendarVO calendarVo);

	int updateDetail(CalendarVO calendarVo);

	void schdDelete(CalendarVO calendarVo);

	void schdShare(CalendarVO calendarVo);

	List<CalendarVO> shareSchd(CalendarVO calendarVo);

	void deleteShare(CalendarVO calendarVo);

	List<CalendarListVO> schdIdxDetact(CalendarListVO calLvo);

	List<CalendarVO> scheduleDetailShareList(CalendarVO calendarVo);

//	List<CalendarVO> scheduleDetailList2(CalendarVO calendarVo);


}
