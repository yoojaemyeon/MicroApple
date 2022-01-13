package micro.apple.groupware.search.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import micro.apple.groupware.board.vo.BoardVO;
import micro.apple.groupware.member.vo.MemberVO;
import micro.apple.groupware.search.service.SearchService;



@Controller
public class SearchController {
	
	@Autowired
	SearchService searchService;
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	// 통합검색
	@RequestMapping(value = "/allSearch", method = RequestMethod.GET)
	public String allSearch(Model model, HttpServletRequest request, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
		
		String memIdx = member.getMemIdx();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member", member);
		map.put("memIdx", memIdx);
		
		return "board/allSearch";
	}
	
	// 통합검색 버튼 누를때
	@RequestMapping(value = "/allSearchPost", method = RequestMethod.GET)
	public String allSearchPost(Model model, HttpServletRequest request, HttpSession session
			, @RequestParam String keyword) throws Exception {
		
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
	      
	    logger.info("통합검색 세션 담은 사번 : " + memIdx);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member", member.getMemIdx());
		map.put("memIdx", memIdx);
		map.put("memNm", member.getMemNm());
		map.put("keyword", keyword);
		logger.info("통합검색 keyword : " + keyword);
		
		List<BoardVO> freeList = this.searchService.freeSearch(map);	// 자유게시판 키워드 조회
		List<BoardVO> announceList = this.searchService.announceSearch(map);	// 공지게시판키워드 조회
		List<BoardVO> mcaBoardList = this.searchService.mcaBoardSearch(map);	// 복지몰 건의사항키워드 조회
		
		SimpleDateFormat format = new SimpleDateFormat("YY-MM-dd");
		List<BoardVO> schdList = this.searchService.schdList(map);	// 일정 키워드 조회
		 for(BoardVO boardVO : schdList) {
			 boardVO.setSchdStart(format.format(new Date(boardVO.getSchdStart())));
			 boardVO.setSchdEnd(format.format(new Date(boardVO.getSchdEnd())));
          }
		
		if(freeList.size()!=0) {
			map.put("boardIdx", freeList.get(0).getBoardIdx());		// 게시판 번호
			map.put("boardTitle", freeList.get(0).getBoardTitle());	// 게시판 제목
			map.put("boardCont", freeList.get(0).getBoardCont());	// 게시판 내용
		}
		if(schdList.size()!=0) {
			map.put("schdIdx", schdList.get(0).getSchdIdx());		// 일정 번호
			map.put("schdTitle", schdList.get(0).getSchdTitle());	// 일정 제목
			map.put("schdStart", schdList.get(0).getSchdStart());	// 일정 시작일
			map.put("schdEnd", schdList.get(0).getSchdEnd());		// 일정 종료일
		}
		
		
		logger.info("통합 검색 freeList : " + freeList);
		logger.info("통합 검색 announceList : " + announceList);
		logger.info("통합 검색 mcaBoardList : " + mcaBoardList);
		logger.info("통합 검색 schdList : " + schdList);
		
		model.addAttribute("member", member);
		model.addAttribute("freeList", freeList);
		model.addAttribute("announceList", announceList);
		model.addAttribute("mcaBoardList", mcaBoardList);
		model.addAttribute("schdList", schdList);
		model.addAttribute("map", map);
		model.addAttribute("keyword", keyword);
		
		return "board/allSearch";
	}
	
}
