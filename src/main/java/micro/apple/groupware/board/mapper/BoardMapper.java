package micro.apple.groupware.board.mapper;

import java.util.List;
import java.util.Map;

import micro.apple.groupware.board.vo.BoardVO;
import micro.apple.groupware.board.vo.CommVO;
import micro.apple.groupware.member.vo.MemberVO;

public interface BoardMapper {

	// 공지 게시판 작성 시 전사원 알림 전송
	int announceNotify(Map<String, Object> map);
	
// 자유 게시판	//
	
	List<BoardVO> freeList(Map<String,Object> map);		// 자유게시글 전체 조회
	
	int freeInsert(BoardVO boardVO);	// 자유 게시글 작성
	
	List<BoardVO> freeUpdateDetail(String boardIdx); // 자유게시물 수정전 상세 조회
	int freeUpdate(BoardVO boardVO); // 자유게시글 수정
	
	int freeDelete(String boardIdx);	// 자유게시글 삭제
	
	List<BoardVO> freeSearch(Map<String, Object> map);	// 자유게시판 검색
	List<CommVO> freeCommSearch(Map<String, Object> map);	// 자유게시판 댓글 검색
	
	// 자유게시판 댓글 
	List<CommVO> freeCommList(Map<String,Object> map);	// 자유 게시글 댓글 전체 조회
	
	int freeCommInsert(Map<String, Object> map);	// 자유 게시글 댓글 등록
	CommVO freeCommSelectOne(int commIdx);	// 자유 게시글 댓글 등록한거 다시 조회
	
	int freeCommDel(String commIdx);	// 자유게시판 댓글 삭제
	
// 공지 게시판	//
	
	List<BoardVO> announceList(Map<String,Object> map);	// 공지게시글 전체 조회
	
	void announceInsert(BoardVO boardVO); // 공지 게시글 작성
	
	List<BoardVO> announceUpdateDetail(String boardIdx);	// 공지 게시물 수정전 상세 조회
	int announceUpdate(BoardVO boardVO);// 공지 게시글 수정
	
	int announceDelete(String boardIdx);	// 공지 게시물 삭제
	
	List<BoardVO> announceSearch(Map<String, Object> map);	// 공지게시판 검색
	
	
// 복지 게시판
	
	List<BoardVO> mcaBoardList(Map<String,Object> map); // 복지몰 건의사항 전체 조회
		
	int mcaBoardInsert(BoardVO boardVO);	// 복지 게시글 작성
	
	List<BoardVO> mcaBoardUpdateDetail(String boardIdx);	// 복지 게시글 수정 전 상세조회
	int mcaBoardUpdate(BoardVO boardVO);	// 복지 게시글 수정
	
	int mcaBoardDelete(String boardIdx);	// 복지 게시글 삭제

	List<BoardVO> mcaBoardSearch(Map<String, Object> map);	// 복지 건의사항 검색
	
	// 복지 게시판 댓글
	List<BoardVO> mcaBoardCommList(Map<String,Object> map); // 복지몰 건의사항 댓글 전체 조회
	int mcaBoardComm(Map<String, Object> map);	// 복지몰 댓글 작성
	CommVO mcaBoardSelectOne(int commIdx);	// 복지몰 방금 작성한 댓글 조회
	int mcaBoardCommDel(String commIdx);	// 복지몰 댓글 삭제

	// 게시판 상세조회
	List<BoardVO> boardDetail(Map<String, Object> map);	// 게시판 상세 조회
	List<CommVO> commList(Map<String, Object> map);	// 게시판 상세(댓글 조회)

	List<MemberVO> memList(Map<String, Object> map);	// 사원 사진

	

	
}
