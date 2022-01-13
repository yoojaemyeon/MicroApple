package micro.apple.groupware.conference.vo;

import java.util.Date;

public class AttendVO {

	private int atmnIdx;
	private String aprvIdx; // 결재번호
	private String atmnStart; // 출근 일시
	private String atmnEnd; // 퇴근 일시
	private String atmnDvsn; // 근태 구분 코드
	private String atmnCont; // 근태관리 내용
	private String atmnDate; // 근태관리 일자
	private String memIdx; // 사원번호
	private String memNm; // 사원이름

	public String getMemNm() {
		return memNm;
	}

	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}

	public int getAtmnIdx() {
		return atmnIdx;
	}

	public void setAtmnIdx(int atmnIdx) {
		this.atmnIdx = atmnIdx;
	}

	public String getAprvIdx() {
		return aprvIdx;
	}

	public void setAprvIdx(String aprvIdx) {
		this.aprvIdx = aprvIdx;
	}

	public String getAtmnStart() {
		return atmnStart;
	}

	public void setAtmnStart(String atmnStart) {
		this.atmnStart = atmnStart;
	}

	public String getAtmnEnd() {
		return atmnEnd;
	}

	public void setAtmnEnd(String atmnEnd) {
		this.atmnEnd = atmnEnd;
	}

	public String getAtmnDvsn() {
		return atmnDvsn;
	}

	public void setAtmnDvsn(String atmnDvsn) {
		this.atmnDvsn = atmnDvsn;
	}

	public String getAtmnCont() {
		return atmnCont;
	}

	public void setAtmnCont(String atmnCont) {
		this.atmnCont = atmnCont;
	}

	public String getAtmnDate() {
		return atmnDate;
	}

	public void setAtmnDate(String atmnDate) {
		this.atmnDate = atmnDate;
	}

	public String getMemIdx() {
		return memIdx;
	}

	public void setMemIdx(String memIdx) {
		this.memIdx = memIdx;
	}

	@Override
	public String toString() {
		return "AttendVO [atmnIdx=" + atmnIdx + ", aprvIdx=" + aprvIdx + ", atmnStart=" + atmnStart + ", atmnEnd="
				+ atmnEnd + ", atmnDvsn=" + atmnDvsn + ", atmnCont=" + atmnCont + ", atmnDate=" + atmnDate + ", memIdx="
				+ memIdx + ", memNm=" + memNm + "]";
	}

	

}
