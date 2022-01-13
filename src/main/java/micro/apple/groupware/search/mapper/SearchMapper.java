package micro.apple.groupware.search.mapper;

import java.util.List;
import java.util.Map;

import micro.apple.groupware.board.vo.BoardVO;


public interface SearchMapper {

	List<BoardVO> freeSearch(Map<String, Object> map); // 자유게시판 조회

	List<BoardVO> announceSearch(Map<String, Object> map); // 공지게시판 조회

	List<BoardVO> mcaBoardSearch(Map<String, Object> map); // 복지몰 건의사항 조회

	List<BoardVO> schdList(Map<String, Object> map);	// 일정 목록 조회
 
	
	
}
