package micro.apple.groupware.board.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import micro.apple.groupware.board.mapper.BoardMapper;
import micro.apple.groupware.board.service.BoardService;
import micro.apple.groupware.board.vo.BoardVO;
import micro.apple.groupware.board.vo.CommVO;
import micro.apple.groupware.member.vo.MemberVO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper boardMapper;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	// 공지 게시판 작성 시 전사원 알림 전송
	@Override
	public int announceNotify(Map<String, Object> map) {
		return this.boardMapper.announceNotify(map);
	}
	
	
// 자유게시판 //
	// 자유게시글 전체 조회
	@Override
	public List<BoardVO> freeList(Map<String,Object> map) {
		return this.boardMapper.freeList(map);
	}

	// 자유게시글 댓글 전체 조회
	@Override
	public List<CommVO> freeCommList(Map<String,Object> map) {
		return this.boardMapper.freeCommList(map);
	}
	
	// 게시글 번호 자동 생성
//	@Override
//	public int createBoardIdx() {
//		return this.boardMapper.createBoardIdx();
//	}
	
	// 자유 게시글 작성
	@Override
	public int freeInsert(BoardVO boardVO) {
		return this.boardMapper.freeInsert(boardVO);
	}
	 
	// 자유 게시글 수정 전 상세 조회
	@Override
	public List<BoardVO> freeUpdateDetail(String boardIdx) {
		return this.boardMapper.freeUpdateDetail(boardIdx);
	}
	
	// 자유게시글 수정
	@Override
	public int freeUpdate(BoardVO boardVO) {
		return this.boardMapper.freeUpdate(boardVO);
	}
	
	// 자유게시글 삭제
	@Override
	public int freeDelete(String boardIdx) {
		return this.boardMapper.freeDelete(boardIdx);
	}
	
	// 자유 게시판 댓글 등록
	@Override
	public int freeCommInsert(Map<String,Object> map) {
		logger.info("댓글 post map 서비스 : " + map);
		logger.info("boardMapper.freeCommInsert >> ");
		System.out.print(this.boardMapper.freeCommInsert(map));
		return 1;
	}

	// 자유게시판 방금 작성한 댓글 조회
	@Override
	public CommVO freeCommSelectOne(int commIdx) {
		return this.boardMapper.freeCommSelectOne(commIdx);
	}
	
	// 자유게시판 댓글 삭제
	@Override
	public int freeCommDel(String commIdx) {
		return this.boardMapper.freeCommDel(commIdx);
	}
	
	// 자유게시판 검색
	@Override
	public List<BoardVO> freeSearch(Map<String, Object> map) {
		return this.boardMapper.freeSearch(map);
	}
	
	// 자유게시판 댓글 검색
	@Override
	public List<CommVO> freeCommSearch(Map<String, Object> map) {
		return this.boardMapper.freeCommSearch(map);
	}
	


// 공지 게시판 //
	
	// 공지게시글 전체 조회
	@Override
	public List<BoardVO> announceList(Map<String,Object> map) {
		return this.boardMapper.announceList(map);
	}
	
	// 공지게시판 검색
	@Override
	public List<BoardVO> announceSearch(Map<String, Object> map) {
		return this.boardMapper.announceSearch(map);
	}
	
	// 공지게시글 작성
	@Override
	public void announceInsert(BoardVO boardVO,MultipartFile file) throws Exception{
		//한주연 폴더
//		 String projectPath = "D:\\A_teaching\\workspace\\microApple\\src\\main\\webapp\\resources\\announceFile"; 
		//유재면 폴더		 
		 String projectPath = "D:\\workspaces\\workspace4web\\MicroApple\\src\\main\\webapp\\resources\\announceFile"; 
//		 File cKFile = new File("");
//		 String realPathString = cKFile.getAbsolutePath() + \\main\\webapp\\resources\\announceFile;
	      UUID uuid = UUID.randomUUID();
	      String fileName = "";
	      if(!file.isEmpty()) {
	    	  fileName = uuid + "_" + file.getOriginalFilename();
	    	  
	    	  logger.info("공지글 작성 fileName : " + fileName);
	    	  
	    	  File saveFile = new File(projectPath,fileName);
	    	  
	    	  file.transferTo(saveFile);
	    	  
	    	  boardVO.setBoardFile(saveFile.getName());
	      }else {
	    	  fileName = "";
	    	  
	    	  logger.info("공지글 작성 fileName : " + fileName);
	    	  
	    	  boardVO.setBoardFile(fileName);
	      }
	      
		 this.boardMapper.announceInsert(boardVO);
	}
	
	// 공지게시글 수정 전 상세조회
	@Override
	public List<BoardVO> announceUpdateDetail(String boardIdx) {
		return this.boardMapper.announceUpdateDetail(boardIdx);
	}
	
	// 공지게시글 수정
	@Override
	public int announceUpdate(BoardVO boardVO) {
		return this.boardMapper.announceUpdate(boardVO);
	}
	
	//공지 게시글 삭제
	@Override
	public int announceDelete(String boardIdx) {
		return this.boardMapper.announceDelete(boardIdx);
	}

	
// 복지 게시판 //
	
	// 복지몰 건의사항 전체 조회
	@Override
	public List<BoardVO> mcaBoardList(Map<String,Object> map) {
		return this.boardMapper.mcaBoardList(map);
	}
	
	// 복지몰 게시글 작성
	@Override
	public int mcaBoardInsert(BoardVO boardVO) {
		return this.boardMapper.mcaBoardInsert(boardVO);
	}

	// 복지몰 건의사항 댓글 전체 조회
	@Override
	public List<BoardVO> mcaBoardCommList(Map<String,Object> map) {
		return this.boardMapper.mcaBoardCommList(map);
	}
	
	// 복지물 건의사항 게시글 수정 전 상세조회
	@Override
	public List<BoardVO> mcaBoardUpdateDetail(String boardIdx) {
		return this.boardMapper.mcaBoardUpdateDetail(boardIdx);
	}

	// 복지물 건의사항 게시글 수정
	@Override
	public int mcaBoardUpdate(BoardVO boardVO) {
		return this.boardMapper.mcaBoardUpdate(boardVO);
	}
	
	// 복지물 게시글 삭제
	@Override
	public int mcaBoardDelete(String boardIdx) {
		return this.boardMapper.mcaBoardDelete(boardIdx);
	}

	// 복지몰 댓글 작성
	@Override
	public int mcaBoardComm(Map<String, Object> map) {
		return this.boardMapper.mcaBoardComm(map);
	}

	// 복지몰 방금 작성한 댓글 조회
	@Override
	public CommVO mcaBoardSelectOne(int commIdx) {
		return this.boardMapper.mcaBoardSelectOne(commIdx);
	}

	// 복지몰 댓글 삭제
	@Override
	public int mcaBoardCommDel(String commIdx) {
		return this.boardMapper.mcaBoardCommDel(commIdx);
	}

	// 복지몰 건의사항 검색
	@Override
	public List<BoardVO> mcaBoardSearch(Map<String, Object> map) {
		return this.boardMapper.mcaBoardSearch(map);
	}

	// 게시판 상세조회
	@Override
	public List<BoardVO> boardDetail(Map<String, Object> map) {
		logger.info("게시판 상세 map : " + map );
		return this.boardMapper.boardDetail(map);
	}

	// 게시판 상세 (댓글 조회)
	@Override
	public List<CommVO> commList(Map<String, Object> map) {
		return this.boardMapper.commList(map);
	}


	// 사원 사진
	@Override
	public List<MemberVO> memList(Map<String, Object> map) {
		logger.info("사원 사진 : " + map);
		return this.boardMapper.memList(map);
	}

	

}
