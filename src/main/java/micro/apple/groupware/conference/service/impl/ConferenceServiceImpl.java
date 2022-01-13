package micro.apple.groupware.conference.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import micro.apple.groupware.conference.mapper.ConferenceMapper;
import micro.apple.groupware.conference.service.ConferenceService;
import micro.apple.groupware.conference.vo.AttendVO;
import micro.apple.groupware.conference.vo.ConferenceVO;

@Service
public class ConferenceServiceImpl implements ConferenceService {

	@Autowired
	ConferenceMapper conferenceMapper;
	
	
	@Override
	public List<Map<String,Object>> list(Map<String, Object> map) {
		return conferenceMapper.list(map);
	}

	@Override
	public void Insert(ConferenceVO conferenceVO, MultipartFile file) throws Exception{
		System.out.println("Insert에 왔다");
		//String projectPath = "C:\\workspace\\microApple\\src\\main\\webapp\\resources\\conferenceFile"; 
		String projectPath = "D:\\workspaces\\workspace4web\\MicroApple\\src\\main\\webapp\\resources\\conferenceFile"; 
		
		UUID uuid = UUID.randomUUID();
		
		String fileName = uuid + "_" + file.getOriginalFilename();
		
		File saveFile = new File(projectPath,fileName);
		
		file.transferTo(saveFile);
		
		conferenceVO.setMtngFile(saveFile.getName());
		
		conferenceMapper.insert(conferenceVO);
	}

	//게시글 수정POST
	@Override
	public void updateConferencePost(ConferenceVO conferenceVO, MultipartFile file) throws Exception{
		
		//String projectPath = "C:\\workspace\\microApple\\src\\main\\webapp\\resources\\conferenceFile";
		String projectPath = "D:\\workspaces\\workspace4web\\MicroApple\\src\\main\\webapp\\resources\\conferenceFile";
		UUID uuid = UUID.randomUUID();
		
		String fileName = uuid + "_" + file.getOriginalFilename();
		
		File saveFile = new File(projectPath,fileName);
		
		file.transferTo(saveFile);
		
		conferenceVO.setMtngFile(saveFile.getName());
		
		conferenceMapper.updateConferencePost(conferenceVO);
		
	}
	
	
	
	//게시물 상세조회
	@Override
	public Map<String, Object> conferenceDetail(Map<String, Object> map) {
		return this.conferenceMapper.conferenceDetail(map);
	}

	//clob조회
	@Override
	public ConferenceVO information(String mtngIdx) {
		return this.conferenceMapper.information(mtngIdx);
	}

	//게시글 수정
	@Override
	public List<ConferenceVO> updateConference(Map<String, Object> map) {
		return this.conferenceMapper.updateConference(map);
	}

	//회의록 삭제
	@Override
	public int deleteConference(String mtngIdx) {
		return this.conferenceMapper.deleteConference(mtngIdx);
	}

	//회의록 검색
	@Override
	public List<Map<String, Object>> searchConference(Map<String, Object> map) {
		return this.conferenceMapper.searchConference(map);
	}

	// 전체 게시글 행의 수(total)
	@Override
	public int totalConference() throws Exception{
		return this.conferenceMapper.totalConference();
	}

	
	////////////////////////////////////////////////////////////
	
	//출근 체크
	@Override
	public int hiCheck(Map<String, Object> map) {
		return this.conferenceMapper.hiCheck(map);
	}


	//퇴근 체크전 idx 조회
	@Override
	public Map<String, Object> LoginMem(Map<String, Object> mem) {
		Map<String, Object> res = this.conferenceMapper.LoginMem(mem);
		if(res != null) {
			return res;
		}else {
			return null;
		}
	}

	//퇴근 체크
	@Override
	public int ByeCheck(Map<String, Object> mem) {
		return this.conferenceMapper.ByeCheck(mem);
	}

	//출근 체크
	@Override
	public List<AttendVO> workCheck(Map<String, Object> map) {
		System.out.println("workCheck->map : " + map);
		return this.conferenceMapper.workCheck(map);
	}

	//마지막 퇴근 체크
	@Override
	public int LastBye(Map<String, Object> mem2) {
		return this.conferenceMapper.LastBye(mem2);
	}

	//전사원 출석 조회
	@Override
	public List<AttendVO> AllworkCheck() {
		return this.conferenceMapper.AllworkCheck();
	}

	//사원 검색
	@Override
	public List<AttendVO> MemSearchGo(Map<String,Object> map) {
		return this.conferenceMapper.MemSearchGo(map);
	}

	//출근 기록 내용 작성
	@Override
	public int saveAtmnCont(Map<String, Object> map) {
		return this.conferenceMapper.saveAtmnCont(map);
	}

	//출근 일수 쿼리
	@Override
	public Map<String, Object> attend(Map<String, Object> map) {
		return this.conferenceMapper.attend(map);
	}
	
	

}
