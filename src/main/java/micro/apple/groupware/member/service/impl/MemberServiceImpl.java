package micro.apple.groupware.member.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import micro.apple.groupware.member.mapper.MemberMapper;
import micro.apple.groupware.member.service.MemberService;
import micro.apple.groupware.member.vo.DeptVO;
import micro.apple.groupware.member.vo.memberCriteria;
import micro.apple.groupware.member.vo.MemberVO;
import micro.apple.groupware.member.vo.PositionVO;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper memMapper;
	
	
	@Override
	public List<MemberVO> list() {
		return this.memMapper.list();
	}

	@Override
	public int insert(MemberVO memberVO) {
		return this.memMapper.insert(memberVO);
	}

	@Override
	public MemberVO detail(String memId) throws Exception {
		return this.memMapper.detail(memId);
	}

	@Override
	public int idCheck(String memId) {
		int cnt = memMapper.idCheck(memId);
		return cnt;
	}

	@Override
	public List<MemberVO> memChat(String string) {
		return this.memMapper.memChat();
	}

	@Override
	public int memberApprovalDeny(Map<String, Object> map) {
		return this.memMapper.memberApprovalDeny(map);
	}

	@Override
	public int memberApprovalOk(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.memMapper.memberApprovalOk(map);
	}
	
	@Override
	public List<DeptVO> deptList() {
		return this.memMapper.deptList();
	}
	
	@Override
	public List<PositionVO> positionList() {
		// TODO Auto-generated method stub
		return this.memMapper.positionList();
	}
	

	@Override
	public int memDivisions(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.memMapper.memDivisions(map);
	}




	@Override
	public int memDenial(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.memMapper.memDenial(map);
	}

	@Override
	public MemberVO detailMember(String memIdx) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//승인된 회원 리스트

	@Override
	public int getTotal(memberCriteria cri) {
		System.out.println("getTotal");
		return this.memMapper.getTotal(cri);
	}

	@Override
	public List<MemberVO> getList(memberCriteria cri) {
		// TODO Auto-generated method stub
		return this.memMapper.getListWithPaging(cri);
	}
	//전체 게시글 행의 수(total)
	@Override
	public int total(memberCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return this.memMapper.getTotal(cri);
	}
	
	
	//퇴직된 회원 리스트
	
	@Override
	public int retirementGetTotal(memberCriteria cri) {
		// TODO Auto-generated method stub
		return this.memMapper.retirementGetTotal(cri);
	}
	@Override
	public List<MemberVO> retirementGetList(memberCriteria cri) {
		// TODO Auto-generated method stub
		return this.memMapper.getListWithPaging(cri);
	}

	@Override
	public int retirementPost(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.memMapper.retirementPost(map);
	}

	@Override
	public MemberVO memberMyPage(String memIdx) throws Exception{
		return this.memMapper.memberMyPage(memIdx);
	}

	@Override
	public void profileImgUpdate(MemberVO memberVO, MultipartFile file) throws Exception{
		//String projectPath = "C:\\A_TeachingMaterial\\6.JspSpring\\MicroApple1230\\MicroApple\\src\\main\\webapp\\resources\\images\\profile"; 
		String projectPath = "D:\\workspaces\\workspace4web\\MicroApple\\src\\main\\webapp\\resources\\images\\profile"; 
		
		
		UUID uuid = UUID.randomUUID();
		
		String fileName = uuid + "_" + file.getOriginalFilename();
		
		File saveFile = new File(projectPath,fileName);
		
		file.transferTo(saveFile);
		
		memberVO.setMemPicture(saveFile.getName());	
		
//		memMapper.profileImgUpdate(memberVO);
		
//		return this.memMapper.profileImgUpdate(memberVO);
	}

	@Override
	public void deleteProfilePhoto(MemberVO member) throws Exception{
		
		memMapper.deleteProfilePhoto(member);
	}







	
	

}
