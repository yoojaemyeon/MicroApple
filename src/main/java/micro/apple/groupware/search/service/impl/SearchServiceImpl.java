package micro.apple.groupware.search.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import micro.apple.groupware.board.vo.BoardVO;
import micro.apple.groupware.search.mapper.SearchMapper;
import micro.apple.groupware.search.service.SearchService;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	SearchMapper searchMapper;

	// 자유게시판 조회
	@Override
	public List<BoardVO> freeSearch(Map<String, Object> map) throws Exception{
		return this.searchMapper.freeSearch(map);
	}

	// 공지게시판 조회
	@Override
	public List<BoardVO> announceSearch(Map<String, Object> map) {
		return this.searchMapper.announceSearch(map);
	}

	// 복지몰 건의사항 조회
	@Override
	public List<BoardVO> mcaBoardSearch(Map<String, Object> map) {
		return this.searchMapper.mcaBoardSearch(map);
	}

	// 일정 목록 조회
	@Override
	public List<BoardVO> schdList(Map<String, Object> map) {
		return this.searchMapper.schdList(map);
	}
	

}
