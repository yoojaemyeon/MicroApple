package micro.apple.groupware.conference.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import micro.apple.groupware.conference.vo.AttendVO;
import micro.apple.groupware.conference.vo.ConferenceVO;

public interface ConferenceMapper {

	List<Map<String,Object>> list(Map<String, Object> map);

	//게시물 상세조회
	Map<String, Object> conferenceDetail(Map<String, Object> map);

	//회의록 작성
	void insert(ConferenceVO conferenceVO);

	//clob조회
	ConferenceVO information(String mtngIdx);

	//게시글 수정전 조회
	List<ConferenceVO> updateConference(Map<String, Object> map);

	//게시글 수정 POST
	void updateConferencePost(ConferenceVO conferenceVO);

	//회의록 삭제
	int deleteConference(String mtngIdx);

	//회의록 검색
	List<Map<String, Object>> searchConference(Map<String, Object> map);

	//전체 게시글 행의 수
	int totalConference();

	//출근 체크
	int hiCheck(Map<String, Object> map);
	
	//퇴근 체크
	int ByeCheck(Map<String, Object> mem);

	//퇴근 체크전 idx 조회
	Map<String, Object> LoginMem(Map<String, Object> mem);

	//출근 체크
	List<AttendVO> workCheck(Map<String, Object> map);
	
	//마지막 퇴근 체크
	int LastBye(Map<String, Object> mem2);

	//전사원 출석조회
	List<AttendVO> AllworkCheck();

	//사원 출석부에서 검색
	List<AttendVO> MemSearchGo(Map<String,Object> map);

	//출근 기록 내용 작성
	int saveAtmnCont(Map<String, Object> map);
	
	//출근 일수 쿼리
	Map<String, Object> attend(Map<String, Object> map);

	
}
