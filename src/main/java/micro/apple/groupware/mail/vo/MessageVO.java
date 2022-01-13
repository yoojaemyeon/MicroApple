package micro.apple.groupware.mail.vo;

import java.util.Date;

public class MessageVO {
	
	private int emIdx;  //mailIdx
	private String emOut; //fromMail
	private String emIn;  //toMail
	private Date emOuttime;  // outtime
	private String emTitle;//title
	private String emCont;//content
	private int memIdx; //memberNum
	private String emboxRead; //read
	private String emboxDvsn;  //division
	private String memNm;
	private String memEm;
	
	
	public String getMemEm() {
		return memEm;
	}
	public void setMemEm(String memEm) {
		this.memEm = memEm;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public int getEmIdx() {
		return emIdx;
	}
	public void setEmIdx(int emIdx) {
		this.emIdx = emIdx;
	}
	public String getEmOut() {
		return emOut;
	}
	public void setEmOut(String emOut) {
		this.emOut = emOut;
	}
	public String getEmIn() {
		return emIn;
	}
	public void setEmIn(String emIn) {
		this.emIn = emIn;
	}
	public Date getEmOuttime() {
		return emOuttime;
	}
	public void setEmOuttime(Date emOuttime) {
		this.emOuttime = emOuttime;
	}
	public String getEmTitle() {
		return emTitle;
	}
	public void setEmTitle(String emTitle) {
		this.emTitle = emTitle;
	}
	public String getEmCont() {
		return emCont;
	}
	public void setEmCont(String emCont) {
		this.emCont = emCont;
	}
	public int getMemIdx() {
		return memIdx;
	}
	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}
	public String getEmboxRead() {
		return emboxRead;
	}
	public void setEmboxRead(String emboxRead) {
		this.emboxRead = emboxRead;
	}
	public String getEmboxDvsn() {
		return emboxDvsn;
	}
	public void setEmboxDvsn(String emboxDvsn) {
		this.emboxDvsn = emboxDvsn;
	}
	@Override
	public String toString() {
		return "MessageVO [emIdx=" + emIdx + ", emOut=" + emOut + ", emIn=" + emIn + ", emOuttime=" + emOuttime
				+ ", emTitle=" + emTitle + ", emCont=" + emCont + ", memIdx=" + memIdx + ", emboxRead=" + emboxRead
				+ ", emboxDvsn=" + emboxDvsn + ", memNm=" + memNm + ", memEm=" + memEm + "]";
	}
	
}