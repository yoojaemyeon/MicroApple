package micro.apple.groupware.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import micro.apple.groupware.board.service.BoardService;
import micro.apple.groupware.board.vo.BoardVO;
import micro.apple.groupware.board.vo.CommVO;
import micro.apple.groupware.member.vo.MemberVO;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardService boardService;
	
	// 공지게시판 작성하면 전사원에게 알림 전송	
	// 공지게시판 글 작성
	@RequestMapping("/announceWrite")
	public String announceWrite(Model model, 
			HttpServletRequest request, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
	      
	    logger.info("공지 글작성 세션 담은 사번 : " + memIdx);
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("member", member.getMemIdx());
	    
		model.addAttribute("member", member);
		
		return "board/announceWrite";
	}
	
	// 공지게시판 글 작성버튼 누를 때 POST & 전 사원에게 알림 전송
	@RequestMapping(value = "/announceWritePost", method = RequestMethod.POST)
	public String announceWritePost(Model model, @ModelAttribute BoardVO boardVO,
			MultipartFile file, HttpServletRequest request, HttpSession session,
			@RequestParam Map<String,Object> map) throws Exception {
		
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
      
	    logger.info("공지 알림 전송 세션 사번 : " + memIdx);
	    
	    logger.info("공지 알림 전송 map : " + map);
		
		this.boardService.announceInsert(boardVO,file);	// 공지 작성
		
		logger.info("왔니?");
		
		return "redirect:/announce?boardDvsn=2";
	}
	//////////
	

// 자유게시판 //
	
	// 자유게시판 목록, 댓글 조회
	@RequestMapping(value = "/free", method = RequestMethod.GET)
	public String freeList(Model model, BoardVO boardVO, String boardDvsn, 
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
	      
	    logger.info("세션 담은 사번 : " + memIdx);
		
		Map<String,Object> map = new HashMap<String, Object>();
		logger.info(" 컨트 : " + member.getMemIdx());
		
		map.put("member", member.getMemIdx());
		map.put("memNm", member.getMemNm());
		map.put("boardDvsn", boardDvsn);
		
		List<BoardVO> freeList = this.boardService.freeList(map); // 게시글 전체 조회
		logger.info("자유 조회:" + freeList);
		List<CommVO> freeCommList = this.boardService.freeCommList(map); // 게시글 댓글 전체 조회
		logger.info("자유 댓글 조회 : " + freeCommList);

		
		model.addAttribute("member", member);
		model.addAttribute("freeList", freeList);
		model.addAttribute("map", map);
		//댓글목록
		model.addAttribute("freeCommList", freeCommList);

		return "board/free";
	}

	// 자유게시판 속 검색
	@RequestMapping(value = "/freeSearch", method = RequestMethod.POST)
	public String freeSearch(Model model, BoardVO boardVO, String boardDvsn, 
			@RequestParam Map<String, Object> map) {
		
		map.put("boardDvsn", boardDvsn);
		logger.info("map : 확인"+map);
		
		String  boardCont =	map.get("boardTitle").toString();
		
		map.put("boardCont", boardCont);

		List<BoardVO> list = this.boardService.freeSearch(map);
		if(list.isEmpty()) {
			return "board/searchNull";
		}else {
		
			if(list.size()!=0) {
				map.put("memIdx",list.get(0).getMemIdx());
			}
			List<CommVO> commList = this.boardService.freeCommSearch(map);
			
			logger.info("자유검색 list : " + list);
			
			model.addAttribute("map", map);
			model.addAttribute("list", list);
			model.addAttribute("commList", commList);
			
			return "board/freeSearch";
		}
	}
	
	// 자유게시판 글 작성
	@RequestMapping(value = "/freeWrite", method = RequestMethod.GET)
	public String freeWrite(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, Model model) {
		
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
	      
	    logger.info("자유글작성 세션 담은 사번 : " + memIdx);
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("member", member.getMemIdx());
		
		model.addAttribute("member", member);
		
		return "board/freeWrite";
	}
	
	// 자유게시판 글 작성버튼 눌렀을때 POST
	@RequestMapping(value = "/freeWritePost", method = RequestMethod.POST)
	public String freeWritePost(Model model, @ModelAttribute BoardVO boardVO, 
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		this.boardService.freeInsert(boardVO);
		
		model.addAttribute("freeWrite", boardVO);
		
		return "redirect:/free?boardDvsn=1";
	}

	// 자유게시판 글 수정
	@RequestMapping(value = "/freeEdit", method = RequestMethod.GET)
	public String freeEdit(Model model, @RequestParam("boardIdx") String boardIdx,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
		
		List<BoardVO> list = this.boardService.freeUpdateDetail(boardIdx);
		
		model.addAttribute("list", list);
		model.addAttribute("member", member);

		return "board/freeEdit";
	}
	
	// 자유게시판 글 수정 Post
	@RequestMapping(value = "/freeEditPost", method = RequestMethod.POST)
	public String freeEditPost(Model model, @ModelAttribute BoardVO boardVO) {
		
		this.boardService.freeUpdate(boardVO);
		
		return "redirect:/free?boardDvsn=1";
	}
	
	// 자유게시판 글 삭제 
	@RequestMapping(value = "/freeDelete", method = RequestMethod.GET)
	public String freeDelete(@RequestParam String boardIdx) {
		
		this.boardService.freeDelete(boardIdx);
		
		return "redirect:/free?boardDvsn=1";
	}

// 자유게시판 댓글 
	
	// 자유게시판 목록중 댓글 등록
	@ResponseBody
	@RequestMapping(value = "/freeCommWritePOST", method = RequestMethod.POST)
	public Map<String, Object> freeCommWritePOST(
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		logger.info("boardIdx : " + request.getParameter("boardIdx"));
		logger.info("commCont : " + request.getParameter("commCont"));
		
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
		
		logger.info("댓글 등록 사번 : " + memIdx);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memIdx", member.getMemIdx());
		map.put("boardIdx", request.getParameter("boardIdx"));
		map.put("commCont", request.getParameter("commCont"));
		map.put("commIdx", 0);
		
		int freeCommInsert = this.boardService.freeCommInsert(map);
		System.out.println("vo idx >> " + map.get("commIdx"));
		
		Map<String, Object> result = new HashMap<String, Object>();
		// 댓글 입력한걸 다시 Select해서 가져오기
		result.put("info", (CommVO)this.boardService.freeCommSelectOne(Integer.parseInt(map.get("commIdx").toString())));
		
		return result;
	}
	
	// 자유게시판 댓글 삭제
	@RequestMapping(value = "/freeCommDel", method = RequestMethod.GET)
	public String freeCommDel(@RequestParam String commIdx) {
		
		this.boardService.freeCommDel(commIdx);
		
		return "redirect:/free?boardDvsn=1";
	}
	


// 공지 게시판 //
	
	// 공지게시판 목록 조회
	@RequestMapping(value = "/announce", method = RequestMethod.GET)
	public String announceList(Model model, BoardVO boardVO, String boardDvsn,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
	    String deptIdx = member.getDeptIdx();
	      
	    logger.info("공지 세션 담은 사번 : " + memIdx);
	    logger.info("공지 관리자인가(4) : " + deptIdx);
	    
	    Map<String, Object> map = new HashMap<String, Object>();
	    
	    map.put("member", member.getMemIdx());
	    map.put("boardDvsn", boardDvsn);
	    map.put("deptIdx", member.getDeptIdx());
	    logger.info("map : " + map);
	    
		List<BoardVO> announceList = this.boardService.announceList(map); // 게시글 전체 조회
		logger.info("공지 전체 조회 : " + announceList);
		
		model.addAttribute("member", member);
		model.addAttribute("announceList", announceList);
		model.addAttribute("deptIdx", deptIdx);

		return "board/announce";
	}
	
	// 공지게시판 속 검색
	@RequestMapping(value = "/announceSearch", method = RequestMethod.POST)
	public String announceSearch(Model model, BoardVO boardVO, String boardDvsn, 
			@RequestParam Map<String, Object> map) {
		
		map.put("boardDvsn", boardDvsn);
		logger.info("공지 검색 map : " + map);
		
		String  boardCont =	map.get("boardTitle").toString();
		
		map.put("boardCont", boardCont);
		
		List<BoardVO> list = this.boardService.announceSearch(map);
		if(list.isEmpty()) {
			return "board/searchNull2";
		}else {
		
			if(list.size()!=0) {
				map.put("memIdx",list.get(0).getMemIdx());
			}
			
			logger.info("공지검색 list : " + list);
			
			model.addAttribute("map", map);
			model.addAttribute("list", list);
			
			return "board/announceSearch";
		}
	}
	
		/*
	// 공지게시판 글 작성
	@RequestMapping("/announceWrite")
	public String announceWrite(Model model, 
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
	      
	    logger.info("공지 글작성 세션 담은 사번 : " + memIdx);
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("member", member.getMemIdx());
		
		model.addAttribute("member", member);
		
		return "board/announceWrite";
	}
	
	// 공지게시판 글 작성버튼 누를 때 POST
	@RequestMapping(value = "/announceWritePost", method = RequestMethod.POST)
	public String announceWritePost(Model model, @ModelAttribute BoardVO boardVO,
			MultipartFile file, HttpServletResponse response) throws Exception {
		
		this.boardService.announceInsert(boardVO,file);
		
		model.addAttribute("announceWrite", boardVO);
		
		return "redirect:/announce?boardDvsn=2";
	}
		*/
	
	// 공지게시판 글 수정
	@RequestMapping(value = "/announceEdit", method = RequestMethod.GET)
	public String announceEdit(Model model, @RequestParam("boardIdx") String boardIdx) {
		
		List<BoardVO> list = this.boardService.announceUpdateDetail(boardIdx);
		
		model.addAttribute("list",list);
		
		return "board/announceEdit";
	}
		
	// 공지게시판 글 수정 POST
	@RequestMapping(value = "/announceEditPost", method = RequestMethod.POST)
	public String announceEditPost(Model model, @ModelAttribute BoardVO boardVO) {
		
		logger.info("boardVO : " + boardVO);
		
		this.boardService.announceUpdate(boardVO);

		return "redirect:/announce?boardDvsn=2";
	}
	
	// 공지게시판 글 삭제 
	@RequestMapping(value = "/announceDelete", method = RequestMethod.GET)
	public String announceDelete(Model model, @RequestParam String boardIdx) {
		
		this.boardService.announceDelete(boardIdx);
		
		return "redirect:/announce?boardDvsn=2";
	}
	
	
// 복지 게시판 //
	
	// 복지몰 건의사항 목록, 댓글 조회
	@RequestMapping(value = "/mcaBoard", method = RequestMethod.GET)
	public String mcaBoardList(Model model, BoardVO boardVO, String boardDvsn, 
			@RequestParam(value="boardIdx",required=false,defaultValue="1") int boardIdx,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
		String memIdx = member.getMemIdx();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member", member.getMemIdx());
		map.put("boardDvsn", boardDvsn);
		
		List<BoardVO> mcaBoardList = this.boardService.mcaBoardList(map); // 게시글 전체 조회
		List<BoardVO> mcaBoardCommList = this.boardService.mcaBoardCommList(map); // 게시글 댓글 전체 조회
		 
		model.addAttribute("member", member);
		model.addAttribute("mcaBoardList", mcaBoardList);
		model.addAttribute("mcaBoardCommList", mcaBoardCommList);

		return "board/mcaBoard";
	}

	// 복지몰 건의사항게시판 게시글 작성
	@RequestMapping("/mcaBoardWrite")
	public String mcaBoardWrite(Model model,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
	      
	    logger.info("복지 건의글 작성 세션 담은 사번 : " + memIdx);
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("member", member.getMemIdx());
		
		model.addAttribute("member", member);
		
		return "board/mcaBoardWrite";
	}
	
	// 복지몰 게시글 작성 누를때 POST
	@RequestMapping(value = "/mcaBoardPost", method = RequestMethod.POST)
	public String mcaBoardPost(Model model, @ModelAttribute BoardVO boardVO) {
		
		this.boardService.mcaBoardInsert(boardVO);
		
		model.addAttribute("mcaBoardWrite", boardVO);
		
		return "redirect:/mcaBoard?boardDvsn=3";
	}
	
	// 복지몰 건의사항 게시글 수정
	@RequestMapping(value = "/mcaBoardEdit", method = RequestMethod.GET)
	public String mcaBoardEdit(Model model, @RequestParam("boardIdx") String boardIdx) {
		
		List<BoardVO> list = this.boardService.mcaBoardUpdateDetail(boardIdx);
		
		model.addAttribute("list",list);
		
		return "board/mcaBoardEdit";
	}
	
	// 복지몰 건의사항게시판 게시글 수정 Post
	@RequestMapping(value = "/mcaBoardEditPost", method = RequestMethod.POST)
	public String mcaBoardEditPost(Model model, @ModelAttribute BoardVO boardVO) {
		
		this.boardService.mcaBoardUpdate(boardVO);

		return "redirect:/mcaBoard?boardDvsn=3";
	}
	
	// 복지몰 건의사항 글 삭제 
	@RequestMapping(value = "/mcaBoardDelete", method = RequestMethod.GET)
	public String mcaBoardDelete(Model model, @RequestParam String boardIdx) {
		
		this.boardService.mcaBoardDelete(boardIdx);
		
		return "redirect:/mcaBoard?boardDvsn=3";
	}
	
	// 복지몰 건의사항 댓글 등록
	@ResponseBody
	@RequestMapping(value = "/mcaBoardComm", method = RequestMethod.POST)
	public Map<String, Object> mcaBoardComm(
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		logger.info("boardIdx : " + request.getParameter("boardIdx"));
		logger.info("commCont : " + request.getParameter("commCont"));
		
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
	    String memIdx = member.getMemIdx();
		
		logger.info("복지몰 댓글 등록 사번 : " + memIdx);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memIdx", member.getMemIdx());
		map.put("boardIdx", request.getParameter("boardIdx"));
		map.put("commCont", request.getParameter("commCont"));
		map.put("commIdx", 0);
		
		int mcaBoardComm = this.boardService.mcaBoardComm(map);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("info", (CommVO)this.boardService.mcaBoardSelectOne(Integer.parseInt(map.get("commIdx").toString())));
//			result.put("info", 
//					(CommVO)this.boardService.mcaBoardSelectOne(Integer.parseInt(map.get("commIdx").toString())));
		
		return result;
	}
	
	// 복지몰 댓글 삭제
	@RequestMapping(value = "/mcaBoardCommDel", method = RequestMethod.GET)
	public String mcaBoardCommDel(@RequestParam String commIdx) {
		
		this.boardService.mcaBoardCommDel(commIdx);
		
		return "redirect:/mcaBoard?boardDvsn=3";
	}
	
	// 복지몰 건의사항 속 검색
	@RequestMapping(value = "/mcaBoardSearch", method = RequestMethod.POST)
	public String mcaBoardSearch(Model model, BoardVO boardVO, String boardDvsn, 
			@RequestParam Map<String, Object> map) {
		
		map.put("boardDvsn", boardDvsn);
		logger.info("복지 검색 map : " + map);
		 
		String  boardCont =	map.get("boardTitle").toString();
		
		map.put("boardCont", boardCont);
		
		List<BoardVO> list = this.boardService.mcaBoardSearch(map);
		if(list.isEmpty()) {
			return "board/searchNull3";
		}else {
		
			if(list.size()!=0) {
				map.put("memIdx",list.get(0).getMemIdx());
			}
			List<CommVO> commList = this.boardService.freeCommSearch(map);
			
			logger.info("복지검색 list : " + list);
			
			model.addAttribute("map", map);
			model.addAttribute("list", list);
			model.addAttribute("commList", commList);
			
			return "board/mcaBoardSearch";
		}
	}
	
	// 자유게시판 상세 페이지
	@RequestMapping(value = "/boardDetail", method = RequestMethod.GET)
	public String boardDetail(Model model, @RequestParam Map<String, Object> map
			, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
		logger.info("member membermember: " + map);
	      
	    List<BoardVO> Bdetail = this.boardService.boardDetail(map);	// 게시판 하나 조회
	    List<CommVO> commList = this.boardService.commList(map);	// 해당 게시판에 대한 댓글 조회
	    
	    logger.info("Bdetail : " + Bdetail);
	    logger.info("commList : " + commList);
	    logger.info("member : " + member);
	    
	    model.addAttribute("boardDetail", Bdetail);
	    model.addAttribute("commList", commList);
	    model.addAttribute("member", member);
		
		return "board/boardDetail";
	}
	
	// 공지게시판 상세 페이지
	@RequestMapping(value = "/announceDetail", method = RequestMethod.GET)
	public String announceDetail(Model model, @RequestParam Map<String, Object> map
			, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
		logger.info("member membermember: " + map);
		
		List<BoardVO> Bdetail = this.boardService.boardDetail(map);	// 게시판 하나 조회
		
		logger.info("Bdetail : " + Bdetail);
		logger.info("member : " + member);
		
		model.addAttribute("boardDetail", Bdetail);
		model.addAttribute("member", member);
		
		return "board/announceDetail";
	}
	
	// 복지게시판 상세 페이지
	@RequestMapping(value = "/mcaBoardDetail", method = RequestMethod.GET)
	public String mcaBoardDetail(Model model, @RequestParam Map<String, Object> map
			, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
		logger.info("member membermember: " + map);
		
		List<BoardVO> Bdetail = this.boardService.boardDetail(map);	// 게시판 하나 조회
		List<CommVO> commList = this.boardService.commList(map);	// 해당 게시판에 대한 댓글 조회
		
		logger.info("Bdetail : " + Bdetail);
		logger.info("commList : " + commList);
		logger.info("member : " + member);
		
		model.addAttribute("boardDetail", Bdetail);
		model.addAttribute("commList", commList);
		model.addAttribute("member", member);
		
		return "board/mcaBoardDetail";
	}

}
