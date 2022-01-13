package micro.apple.groupware.board.vo;

import java.util.Date;

import micro.apple.groupware.member.vo.MemberVO;

public class CommVO {

	private int commIdx;		// 댓글 번호
	private String commDate;		// 댓글 작성일
	private String commCont;	// 댓글 내용
	private int boardIdx;		// 게시판 번호
	private String memIdx;			// 사원번호
	private String memNm;	//사원명
	private MemberVO memberVO;		// 사원객체
	private String memPicture; // 사원 사진
	
	public int getCommIdx() {
		return commIdx;
	}
	public void setCommIdx(int commIdx) {
		this.commIdx = commIdx;
	}
	public String getCommDate() {
		return commDate;
	}
	public void setCommDate(String commDate) {
		this.commDate = commDate;
	}
	public String getCommCont() {
		return commCont;
	}
	public void setCommCont(String commCont) {
		this.commCont = commCont;
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public String getMemIdx() {
		return memIdx;
	}
	public void setMemIdx(String memIdx) {
		this.memIdx = memIdx;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getMemPicture() {
		return memPicture;
	}
	public void setMemPicture(String memPicture) {
		this.memPicture = memPicture;
	}
	
	@Override
	public String toString() {
		return "CommVO [commIdx=" + commIdx + ", commDate=" + commDate + ", commCont=" + commCont + ", boardIdx="
				+ boardIdx + ", memIdx=" + memIdx + ", memNm=" + memNm + ", memberVO=" + memberVO + ", memPicture="
				+ memPicture + "]";
	}
	
}
