package micro.apple.groupware.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import micro.apple.groupware.member.vo.DeptVO;
import micro.apple.groupware.member.vo.memberCriteria;
import micro.apple.groupware.member.vo.MemberVO;
import micro.apple.groupware.member.vo.PositionVO;

public interface MemberService {

	public List<MemberVO> list() throws Exception;

	public int insert(MemberVO memVo) throws Exception;
	
	public MemberVO detail(String memId) throws Exception;
	// 아이디 중복확인
	public int idCheck(String memId);

	public List<MemberVO> memChat(String string);

	public int memberApprovalDeny(Map<String, Object> map);

	public int memberApprovalOk(Map<String, Object> map);


	List<DeptVO> deptList();

	public List<PositionVO> positionList();

	public int memDivisions(Map<String, Object> map);

	public int getTotal(memberCriteria cri);
	
//	public List<MemberVO> getListWithPaging(memberCriteria cri);

	public List<MemberVO> getList(memberCriteria cri);


	int total(memberCriteria cri) throws Exception;

	public int memDenial(Map<String, Object> map);

	public MemberVO detailMember(String memIdx);

	public List<MemberVO> retirementGetList(memberCriteria cri);

	public int retirementGetTotal(memberCriteria cri);

	public int retirementPost(Map<String, Object> map);

//	public MemberVO memberMyPage(String memId); 
	public MemberVO memberMyPage(String memIdx) throws Exception;

	public void profileImgUpdate(MemberVO memberVO, MultipartFile file) throws Exception;

	public void deleteProfilePhoto(MemberVO member) throws Exception;




}
