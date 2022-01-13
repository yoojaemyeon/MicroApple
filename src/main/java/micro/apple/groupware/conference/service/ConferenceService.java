package micro.apple.groupware.conference.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import micro.apple.groupware.conference.vo.AttendVO;
import micro.apple.groupware.conference.vo.ConferenceVO;

public interface ConferenceService {

	public List<Map<String,Object>> list(Map<String, Object> map);

	//게시물 상세조회
	public Map<String, Object> conferenceDetail(Map<String, Object> map);

	//게시판 등록
	public void Insert(ConferenceVO conferenceVO, MultipartFile file) throws Exception;

	//clob조회
	public ConferenceVO information(String mtngIdx);

	//게시글 수정전 조회
	public List<ConferenceVO> updateConference(Map<String, Object> map);

	//게시판 수정 Post
	public void updateConferencePost(ConferenceVO conferenceVO, MultipartFile file) throws Exception;

	//회의록 삭제
	public int deleteConference(String mtngIdx);

	public List<Map<String, Object>> searchConference(Map<String, Object> map);

	// 전체 게시글 행의 수(total)
	public int totalConference() throws Exception;

	// 출근 체크
 	public int hiCheck(Map<String, Object> map);

 	//퇴근 체크전 idx 조회
 	public Map<String, Object> LoginMem(Map<String, Object> map);

 	// 퇴근 체크
	public int ByeCheck(Map<String, Object> map);

	//출근 조회
	public List<AttendVO> workCheck(Map<String, Object> map);

	//마지막 퇴근 체크
	public int LastBye(Map<String, Object> mem2);

	//사원 출석 모음
	public List<AttendVO> AllworkCheck();

	//사원 검색
	public List<AttendVO> MemSearchGo(Map<String,Object> map);

	//출근 기록 내용 작성
	public int saveAtmnCont(Map<String, Object> map);

	//출근 기록 갯수
	public Map<String, Object> attend(Map<String, Object> map);



}
