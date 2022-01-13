package micro.apple.groupware.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import micro.apple.groupware.board.vo.BoardVO;
import micro.apple.groupware.board.vo.CommVO;
import micro.apple.groupware.member.vo.MemberVO;

public interface BoardService {
	
	// 공지 게시판 작성 시 전사원 알림 전송
	public int announceNotify(Map<String, Object> map);

// 자유게시판 //
	
	public List<BoardVO> freeList(Map<String,Object> map);	// 자유게시글 전체 조회
	
	public int freeInsert(BoardVO boardVO);	// 자유 게시글 작성
	
	public List<BoardVO> freeUpdateDetail(String boardIdx);	// 자유게시글 수정 전 상세 조회
	public int freeUpdate(BoardVO boardVO);	// 자유게시글 수정
	
	public int freeDelete(String boardIdx);	// 자유 게시글 삭제
	
	public List<BoardVO> freeSearch(Map<String, Object> map);	// 자유게시판 게시글 검색
	public List<CommVO> freeCommSearch(Map<String, Object> map);	// 자유게시판 글 검색

	// 자유게시판 댓글
	public List<CommVO> freeCommList(Map<String,Object> map);	// 자유게시글 댓글 전체 조회
	
	public int freeCommInsert(Map<String,Object> map);	// 자유 게시글 댓글 작성
	public CommVO freeCommSelectOne(int commIdx); // 자유 게시글 댓글 작성한거 다시 조회
	
	public int freeCommDel(String commIdx);	// 자유게시글 댓글 삭제
	
	
	
// 공지 게시판 //
	
	public List<BoardVO> announceList(Map<String,Object> map);	// 공지게시글 전체 조회
	
	public void announceInsert(BoardVO boardVO,MultipartFile file) throws Exception;	// 공지게시글 작성
	
	public int announceUpdate(BoardVO boardVO); // 공지게시글 수정
	public List<BoardVO> announceUpdateDetail(String boardIdx); // 공지 게시물 수정전 상세 조회
	
	public int announceDelete(String boardIdx); // 공지 게시물 삭제
	
	public List<BoardVO> announceSearch(Map<String, Object> map);	// 공지게시판 검색
	

// 복지 게시판 //
	
	
	public List<BoardVO> mcaBoardList(Map<String,Object> map);	// 복지몰 건의사항 전체 조회
	
	public int mcaBoardInsert(BoardVO boardVO);	// 복지몰 게시글 작성
	
	public List<BoardVO> mcaBoardUpdateDetail(String boardIdx); // 복지물 수정 전 상세 조회
	public int mcaBoardUpdate(BoardVO boardVO);	// 복지물 게시글 수정
	
	public int mcaBoardDelete(String boardIdx);	// 복지물 게시글 삭제

	public List<BoardVO> mcaBoardSearch(Map<String, Object> map);	// 복지몰 건의사항 검색
	
	// 복지 게시판 댓글
	public List<BoardVO> mcaBoardCommList(Map<String,Object> map);	// 복지몰 건의사항 댓글 전체 조회
	public int mcaBoardComm(Map<String, Object> map);	// 복지몰 건의사항 댓글 작성
	public CommVO mcaBoardSelectOne(int commIdx);	// 복지몰 건의사항 방금 작성한 댓글 조회
	public int mcaBoardCommDel(String commIdx);	// 복지몰 건의사항 댓글 삭제

	// 통합검색 게시판 상세 조회
	public List<BoardVO> boardDetail(Map<String, Object> map);	// 게시판 상세 조회
	public List<CommVO> commList(Map<String, Object> map);	// 게시판 상세(댓글 조회)

	public List<MemberVO> memList(Map<String, Object> map);	// 사원 사진

	

}
