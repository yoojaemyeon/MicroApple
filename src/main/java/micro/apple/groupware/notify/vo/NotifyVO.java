package micro.apple.groupware.notify.vo;

import micro.apple.groupware.member.vo.MemberVO;

public class NotifyVO {
	private int noticeIdx;	// 알림번호
	private int memIdx;		// 사원번호
	private String noticeCont;	// 알림내용
	private String noticeUrl;	// 주소(url)
	private String noticeWrdate;	// 작성일시
	private String noticeRead;		// 조회여부
	private String noticeAddr;		// 알림출처
	private String noticeSendall;	// 전체 전송여부
	private MemberVO memberVO;		// 사원객체
	private String memNm;		// 사원명
	
	public int getNoticeIdx() {
		return noticeIdx;
	}
	public void setNoticeIdx(int noticeIdx) {
		this.noticeIdx = noticeIdx;
	}
	public int getMemIdx() {
		return memIdx;
	}
	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}
	public String getNoticeCont() {
		return noticeCont;
	}
	public void setNoticeCont(String noticeCont) {
		this.noticeCont = noticeCont;
	}
	public String getNoticeUrl() {
		return noticeUrl;
	}
	public void setNoticeUrl(String noticeUrl) {
		this.noticeUrl = noticeUrl;
	}
	public String getNoticeWrdate() {
		return noticeWrdate;
	}
	public void setNoticeWrdate(String noticeWrdate) {
		this.noticeWrdate = noticeWrdate;
	}
	public String getNoticeRead() {
		return noticeRead;
	}
	public void setNoticeRead(String noticeRead) {
		this.noticeRead = noticeRead;
	}
	public String getNoticeAddr() {
		return noticeAddr;
	}
	public void setNoticeAddr(String noticeAddr) {
		this.noticeAddr = noticeAddr;
	}
	public String getNoticeSendall() {
		return noticeSendall;
	}
	public void setNoticeSendall(String noticeSendall) {
		this.noticeSendall = noticeSendall;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	@Override
	public String toString() {
		return "NoticeVO [noticeIdx=" + noticeIdx + ", memIdx=" + memIdx + ", noticeCont=" + noticeCont + ", noticeUrl="
				+ noticeUrl + ", noticeWrdate=" + noticeWrdate + ", noticeRead=" + noticeRead + ", noticeAddr="
				+ noticeAddr + ", noticeSendall=" + noticeSendall + ", memberVO=" + memberVO + ", memNm=" + memNm + "]";
	}
	
}
