package micro.apple.groupware.calendar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.json.JsonArray;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonFormat;

import micro.apple.groupware.calendar.mapper.CalendarMapper;
import micro.apple.groupware.calendar.service.CalendarService;
import micro.apple.groupware.calendar.vo.CalendarListVO;
import micro.apple.groupware.calendar.vo.CalendarVO;
import micro.apple.groupware.mail.vo.MessageVO;
import micro.apple.groupware.member.vo.MemberVO;


@Controller
public class CalendarController {

	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);

	
	
	@Autowired
	CalendarService calendarService;
	
	//일정페이지 & 불러오기
	@RequestMapping(value = "calendar")
	public ModelAndView calendar(HttpSession session, Model model, CalendarVO calendarVo, CalendarListVO calListVo) throws IOException, JspException{
		ModelAndView mav = new ModelAndView("calendar/calendar");
		logger.info("calendarPage");
		//세션 가져오기(회원정보/로그인)
		MemberVO myAccount = (MemberVO)session.getAttribute("MEMBERVO");
		String memberNum = myAccount.getMemIdx();
		String fromMail = myAccount.getMemEm();
		logger.info("세션 담은 메일 : "+fromMail);
		logger.info("세션 담은 사번 : "+memberNum);
		 
		 //임시로 사원번호 임력(db의 사원번호)
		 calendarVo.setMemIdx((long) Integer.parseInt(memberNum));
		 logger.info("vo에 세팅된 값 : "+calendarVo.toString());
		 logger.info("세팅에러 1");
			 
				 SimpleDateFormat format = new SimpleDateFormat("MM. dd");
				 logger.info("실행 1");
				 //쿼리 작동하여 값 가져오기(데이터가 없을경우도 상정해야함 ex)처음시작)
				 List<CalendarVO> list = calendarService.scheduleList(calendarVo);
				 logger.info("실행 2");
				 if (list.size()!=0 && list.get(0).getSchdTitle()!=null) {
				
				 //String형식의 날짜데이터 jsp에서 String으로 포맷할수 있도록 형식 변환
				 	for(CalendarVO calendarVO : list) {
				 		logger.info("for 실행 1");
						 calendarVO.setSchdStartFmt(format.format(new Date(calendarVO.getSchdStart())));
						 logger.info("---------------");
						 Date endD = (new Date(calendarVO.getSchdEnd()));
						 endD.setDate(endD.getDate()-1);
						 logger.info("출력할 일자 : "+endD);
						 String endDate = format.format(endD);
						 
						 
						 logger.info("---------------");
						 calendarVO.setSchdEndFmt(endDate);
						 logger.info("for 실행 2");
					 }
				 	logger.info("실행 3");
	//			 logger.info("3번째 리스트 번호는 : "+list.get(3).getSchdIdx());
				 System.out.println("list >>");
				 System.out.println(list);
				 
				 logger.info("---------------");
				 logger.info("---------------");
				 
				 //ModelAndView에 리스트 세팅
				 mav.addObject("list", list);
				 logger.info("mav"+mav.getModelMap());
				 
				 
				 //vo에 값 담아서 세팅
				 calendarVo.setMemIdx((long) Integer.parseInt(memberNum));
				 calendarVo.setSchdShareDvsn("Y");
				 logger.info("memberNum : "+memberNum);
			 
				//공유일정을 띄울 쿼리 실행전 map세팅
				//쿼리 실행
				 List<CalendarVO> schdList = calendarService.shareSchd(calendarVo); // 오른쪽 데이터(날짜데이터포함)
				logger.info("-------------------------");
				for(CalendarVO calendarVO : schdList) {
					 calendarVO.setSchdStartFmt(format.format(new Date(calendarVO.getSchdStart())));
					 calendarVO.setSchdEndFmt(format.format(new Date(calendarVO.getSchdEnd())));
				 }
				logger.info(calendarVo.getSchdEndFmt()); 
				logger.info("EndDate1 : "+ schdList.toString());
				logger.info("EndDate2 : "+ calendarVo.toString());
				logger.info("-------------------------");
				//리턴할 map에 세팅
		
				logger.info("세팅에러 2");
				mav.addObject("schdList", schdList);
//				logger.info("view : "+schdList.get(0).toString());
				
				} else {
					logger.info("mav값이 비어있다.");
					list.add(calendarVo);
					mav.addObject("list", list);
				}
				 logger.info("세팅에러 3 if문 종료후 나온상태");
		 
		return mav;
	}
	
	
	//일정 저장
	@ResponseBody
	@RequestMapping(value = "/calendar1", method = RequestMethod.POST)
	public Map<String, Object> calendar1(@RequestParam Map<String,Object> map, HttpSession session, Model model, CalendarVO calendarVo){
		
		MemberVO myAccount = (MemberVO)session.getAttribute("MEMBERVO");
		String memberNum = myAccount.getMemIdx();
		String fromMail = myAccount.getMemEm();
		logger.info("세션 담은 메일 : "+fromMail);
		logger.info("세션 담은 사번 : "+memberNum);
		 
		 //임시로 사원번호 임력(db의 사원번호)
		calendarVo.setMemIdx((long) Integer.parseInt(memberNum));		
		
		Map<String, Object> result = new HashMap<String, Object>();
		//map에 세팅
		map.get("title");
		map.get("end");
		map.get("start");
		map.get("allDay");
		logger.info("title은 : "+map.get("title").toString());
		logger.info("allDay는 : "+map.get("allDay").toString());
		
		//vo에 세팅
		calendarVo.setSchdTitle(map.get("title").toString());
		calendarVo.setSchdAd(map.get("allDay").toString());
		calendarVo.setSchdStart(map.get("start").toString());
		calendarVo.setSchdEnd(map.get("end").toString());
		calendarVo.setMemIdx((long) Integer.parseInt(memberNum));
		logger.info("vo에 담긴값 : "+calendarVo.toString());
		
		//저장하면 신규일정 저장, 바뀐 일정 업데이트 로직
		calendarService.scheduleJSON(calendarVo);
		logger.info("생긴 번호 : "+calendarVo.getSchdIdx()); //저장하면 생기는 일정번호
		logger.info("저장후의 vo값"+calendarVo.toString());
		calendarService.duplicationDelete(calendarVo);//전체적인 중복일정 제거
		calendarService.duplicationDelete2(calendarVo);//저장시 생성된 일정의 중복일정 제거
		
		result.put("map", map);
		logger.info("map값은? "+map.toString());
		
		return result;
	}
	
	
	@RequestMapping(value = "/calendarDetail")
	public ModelAndView calDetail(HttpSession session, Model model, CalendarVO calendarVo, int schdIdx){
		ModelAndView mav = new ModelAndView("calendar/popUp/calendarDetail");
		
		MemberVO myAccount = (MemberVO)session.getAttribute("MEMBERVO");
		String memberNum = myAccount.getMemIdx();
		String fromMail = myAccount.getMemEm();
		logger.info("세션 담은 메일 : "+fromMail);
		logger.info("세션 담은 사번 : "+memberNum);
		
//		Map<String, Object> result = new HashMap<String, Object>();
//		result.put("list", "test");
		calendarVo.setMemIdx((long) Integer.parseInt(memberNum));
		calendarVo.setSchdIdx(schdIdx);
		logger.info("vo에 세팅된 값 : "+calendarVo.toString());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		//개인일정
		//쿼리 작동하여 값 가져오기(데이터가 없을경우도 상정해야함 ex)처음시작)
		List<CalendarVO> list = calendarService.scheduleDetailList(calendarVo);
		
		//String형식의 날짜데이터 jsp에서 String으로 포맷할수 있도록 형식 변환
		 for(CalendarVO calendarVO : list) {
			 calendarVO.setSchdStartFmt(format.format(new Date(calendarVO.getSchdStart())));
			 calendarVO.setSchdEndFmt(format.format(new Date(calendarVO.getSchdEnd())));
		 }
		 
		 //공유일정
		 logger.info("공유일정 띄울때 사용되는 vo 값");
		 logger.info(calendarVo.toString());
		 
		 List<CalendarVO> shareList = calendarService.scheduleDetailShareList(calendarVo);
			
			//String형식의 날짜데이터 jsp에서 String으로 포맷할수 있도록 형식 변환
			 for(CalendarVO calendarVO : shareList) {
				 calendarVO.setSchdStartFmt(format.format(new Date(calendarVO.getSchdStart())));
				 calendarVO.setSchdEndFmt(format.format(new Date(calendarVO.getSchdEnd())));
			 }
			 
			 logger.info("공유자 값 : "+shareList);
			 
		//일정 상세에서 일정공유자 선택을 위한 이름 불러오기
		List<CalendarVO> Nm = calendarService.scheduleShareNm(calendarVo);
		
		mav.addObject("list", list);
		mav.addObject("Nm", Nm);
		mav.addObject("shareList", shareList);
		
		return mav;
	}
	@RequestMapping(value = "/calendarDetail2")
	public ModelAndView calDetail2(HttpSession session, Model model, CalendarVO calendarVo, int schdIdx){
		ModelAndView mav = new ModelAndView("calendar/popUp/calendarDetail2");
		
		MemberVO myAccount = (MemberVO)session.getAttribute("MEMBERVO");
		String memberNum = myAccount.getMemIdx();
		String fromMail = myAccount.getMemEm();
		logger.info("세션 담은 메일 : "+fromMail);
		logger.info("세션 담은 사번 : "+memberNum);
		
//		Map<String, Object> result = new HashMap<String, Object>();
//		result.put("list", "test");
		calendarVo.setMemIdx((long) Integer.parseInt(memberNum));
		calendarVo.setSchdIdx(schdIdx);
		logger.info("vo에 세팅된 값 : "+calendarVo.toString());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		//개인일정
		//쿼리 작동하여 값 가져오기(데이터가 없을경우도 상정해야함 ex)처음시작)
		List<CalendarVO> list = calendarService.scheduleDetailList(calendarVo);
		
		//String형식의 날짜데이터 jsp에서 String으로 포맷할수 있도록 형식 변환
		for(CalendarVO calendarVO : list) {
			calendarVO.setSchdStartFmt(format.format(new Date(calendarVO.getSchdStart())));
			calendarVO.setSchdEndFmt(format.format(new Date(calendarVO.getSchdEnd())));
		}
		
		//공유일정
		logger.info("공유일정 띄울때 사용되는 vo 값");
		logger.info(calendarVo.toString());
		
		List<CalendarVO> shareList = calendarService.scheduleDetailShareList(calendarVo);
		
		//String형식의 날짜데이터 jsp에서 String으로 포맷할수 있도록 형식 변환
		for(CalendarVO calendarVO : shareList) {
			calendarVO.setSchdStartFmt(format.format(new Date(calendarVO.getSchdStart())));
			calendarVO.setSchdEndFmt(format.format(new Date(calendarVO.getSchdEnd())));
		}
		
		logger.info("공유자 값 : "+shareList);
		
		//일정 상세에서 일정공유자 선택을 위한 이름 불러오기
		List<CalendarVO> Nm = calendarService.scheduleShareNm(calendarVo);
		
		mav.addObject("list", list);
		mav.addObject("Nm", Nm);
		mav.addObject("shareList", shareList);
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateDetail", method = RequestMethod.POST)
	public Map<String, Object> updateDetail(HttpServletRequest request, @RequestBody HashMap<String, Object> map, HttpSession session, Model model, CalendarVO calendarVo){
		logger.info("안되는지 테스트");
		Map<String, Object> detailUpdate = new HashMap<String, Object>();
		
		logger.info("map : "+map);
		//vo에 json값들 셋팅(저장할 내용들)
		int schdmemIdx = Integer.parseInt((String)map.get("memIdx"));
		String schdShareNm = (String) map.get("share");
		
		calendarVo.setSchdTitle((String) map.get("title"));
		calendarVo.setSchdCont((String) map.get("textarea"));
		calendarVo.setSchdStart((String) map.get("start"));
		
		//end날짜를 다음날로 설정 필요 +1
//		Date dt = new Date((String) map.get("end"));
//        System.out.println("날짜:    "+dt);
//        Calendar c = Calendar.getInstance();
//        c.setTime(dt);
//        c.add(Calendar.DATE, 1);
//        dt = c.getTime();
//        System.out.println("Tomorrow: "+dt);
//        String endDate = dt.toString();
		
		calendarVo.setSchdEnd((String) map.get("end"));
		calendarVo.setShare(schdShareNm);
		calendarVo.setMemIdx((long) schdmemIdx);
		calendarVo.setSchdIdx(Integer.parseInt((String)map.get("schdIdx")));
		calendarVo.setSchdShareDvsn("Y");
//		calendarVo.setSchdShare(schdShare);
		
		logger.info("vo값 확인"+calendarVo.toString());
		logger.info("schdmemIdx"+schdmemIdx);
		logger.info("schdShareNm"+schdShareNm);
//		if(schdmemIdx==0) {
//			logger.info("true1");
//		}
//		if(schdShareNm.equals("null")){
//			logger.info("true2");
//		}
		
		if(schdmemIdx==0 && schdShareNm.equals("null")) {
			logger.info("null값 받을경우");
			calendarService.updateDetail(calendarVo);
		} else {
			logger.info("제대로 된 값 받을경우");
			calendarService.schdShare(calendarVo);
		}
		
		
		return detailUpdate;
	}
	
	//삭제 내용
	 @RequestMapping("/schdDelete")
	 public String schdDelete(@RequestParam List<String> checkBox, HttpSession session, Model model, HttpServletRequest request, CalendarVO calendarVo) throws Exception{
		logger.info("schdDelete");
		
		MemberVO myAccount = (MemberVO)session.getAttribute("MEMBERVO");
		String memberNum = myAccount.getMemIdx();
		logger.info("세션 담은 사번 : "+memberNum);
		logger.info("삭제확인1");
		for (String idx : checkBox) {
			logger.info("삭제확인2-1");
			calendarVo.setSchdIdx(Integer.parseInt(idx));
			logger.info("삭제확인2-2");
			logger.info("삭제확인2-2 : "+calendarVo.getSchdIdx());
			calendarService.schdDelete(calendarVo);
			logger.info("삭제확인2-3");
        }
		logger.info("삭제확인3");
			 
//			calendarService.schdDelete(calendarVo);
		logger.info("vo");
		System.out.println("--------------------");
		 return "redirect:calendar";
	 }
	 
	//공유 지우기
	@RequestMapping(value = "/shareDelete", method = RequestMethod.POST)
	@ResponseBody
	public void shareDelete(@RequestParam Map<String, Object> map, HttpServletResponse response, HttpServletRequest request, HttpSession session, Model model, CalendarVO calendarVo, CalendarListVO calLvo) throws IOException{
		
		MemberVO myAccount = (MemberVO)session.getAttribute("MEMBERVO");
		String memberNum = myAccount.getMemIdx();
		int schdIdx = Integer.parseInt((String) map.get("schdIdx"));
		logger.info("데이터 : "+schdIdx);
		calendarVo.setMemIdx((long) Integer.parseInt(memberNum));
		calendarVo.setSchdIdx(schdIdx);
		
		String schdIdxA = (String) map.get("schdIdx"); // 
		
		calLvo.setSchdIdx(schdIdx);
		
		//멤버IDX는 위에 세팅 끝, 스케줄의 멤버IDX가져오기
		List<CalendarListVO> list = this.calendarService.schdIdxDetact(calLvo);
		logger.info("list : "+list.toString());
		for (int i = 0; i < list.size(); i++) {
			int memIdxA = list.get(i).getMemIdx();
			logger.info("memIdxA : "+memIdxA);
			calLvo.setSchdIdx(memIdxA);
		}
		int scheduleIdx = calLvo.getSchdIdx();
		logger.info("scheduleIdx : "+scheduleIdx);
		
		//세션으로 받은 멤버 IDX와 스케쥴의 멤버 IDX가 같을경우 실행
		if (Integer.parseInt(memberNum) == scheduleIdx) {
			this.calendarService.deleteShare(calendarVo);
			} else {
				PrintWriter out= response.getWriter();
				response.setContentType("text/html; charset=utf-8");
				out.println("<script language='javascript'>");
				out.println("alert('공유를 걸어준 사람만 지울수 있습니다.');");
				out.println("</script>");
				out.flush();
			}
		
	}
}
