package micro.apple.groupware.member.mapper;

import java.util.List;
import java.util.Map;

import micro.apple.groupware.member.vo.DeptVO;
import micro.apple.groupware.member.vo.memberCriteria;
import micro.apple.groupware.member.vo.MemberVO;
import micro.apple.groupware.member.vo.PositionVO;

public interface MemberMapper {

	int insert(MemberVO memberVO);

	List<MemberVO> list();

	MemberVO detail(String memId);

	int idCheck(String memId);
	
	List<MemberVO> memChat();

	int memberApprovalDeny(Map<String, Object> map);

	int memberApprovalOk(Map<String, Object> map);
	
	List<DeptVO> deptList();

	List<PositionVO> positionList();

	public List<MemberVO> getListWithPaging(memberCriteria cri);

	int getTotal(memberCriteria cri);

	int memDivisions(Map<String, Object> map);
	
	int memDenial(Map<String, Object> map);
	
	public MemberVO detailMember(String memIdx);

	List<MemberVO> retirementGetList(memberCriteria cri);

	int retirementGetTotal(memberCriteria cri);

	int retirementPost(Map<String, Object> map); 
	
//	MemberVO memberMyPage(String memId); 
	MemberVO memberMyPage(String memIdx);

	void deleteProfilePhoto(MemberVO memberVO);

	void profileImgUpdate(MemberVO memberVO); 
}
