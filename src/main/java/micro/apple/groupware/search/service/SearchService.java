package micro.apple.groupware.search.service;

import java.util.List;
import java.util.Map;

import micro.apple.groupware.board.vo.BoardVO;


public interface SearchService {

	List<BoardVO> freeSearch(Map<String, Object> map) throws Exception;	// 자유게시판 조회

	List<BoardVO> announceSearch(Map<String, Object> map);	// 공지 게시판 조회

	List<BoardVO> mcaBoardSearch(Map<String, Object> map);	// 복지몰 건의사항 조회

	List<BoardVO> schdList(Map<String, Object> map);	// 일정 목록 조회


}
