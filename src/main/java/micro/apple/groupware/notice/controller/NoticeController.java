package micro.apple.groupware.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import micro.apple.groupware.member.vo.MemberVO;
import micro.apple.groupware.notice.service.NoticeService;
import micro.apple.groupware.notice.vo.NoticeVO;


@Controller
public class NoticeController {
   private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
   
   @Autowired
   NoticeService noticeService;
   
   // 알림 목록 조회
   @ResponseBody
   @RequestMapping(value = "/noticeList", method = RequestMethod.GET)
   public List<NoticeVO> noticeList(HttpServletRequest request, HttpServletResponse response, 
         HttpSession session, Model model, NoticeVO noticeVO) {
      
      MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
       String memIdx = member.getMemIdx();
         
       logger.info("알림 세션 사번 : " + memIdx);
       
       List<NoticeVO> mapList = new ArrayList<NoticeVO>();
       Map<String, Object> map = new HashMap<String, Object>();
      logger.info(" 컨트 : " + member.getMemIdx());
      
//      map.put("member", member.getMemIdx());
      
      List<NoticeVO> noticeList = this.noticeService.noticeList(map);
      
      for(int i=0; i<noticeList.size(); i++) {
         mapList.add(noticeList.get(i));
      }
      
      model.addAttribute("member", member);
      model.addAttribute("noticeList", noticeList);
      
      return mapList;
   }
}