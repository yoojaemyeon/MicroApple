package micro.apple.groupware.mail.vo;

import java.util.Date;

public class MessageDetailVO {

	private int emIdx;  //mailIdx
	private String emOut; //fromMail
	private String emIn;  //toMail
	private Date emOuttime;  // outtime
	private String emTitle;//title
	private String emCont;//content
	private int memIdx; //memberNum
	private String emboxRead; //read
	private String emboxDvsn;  //division
	private int emfIdx;  //fileIdx
	private String emNm; //fileName(원본)
	private String emExtn; //확장자
	private String emfSize;  //파일 크기
	private String emFpath; // filePath
	private String emDel;  //emfDel(파일삭제여부)
	private String memNm;
	
	
	
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
	public int getEmfIdx() {
		return emfIdx;
	}
	public void setEmfIdx(int emfIdx) {
		this.emfIdx = emfIdx;
	}
	public String getEmNm() {
		return emNm;
	}
	public void setEmNm(String emNm) {
		this.emNm = emNm;
	}
	public String getEmExtn() {
		return emExtn;
	}
	public void setEmExtn(String emExtn) {
		this.emExtn = emExtn;
	}
	public String getEmfSize() {
		return emfSize;
	}
	public void setEmfSize(String emfSize) {
		this.emfSize = emfSize;
	}
	public String getEmFpath() {
		return emFpath;
	}
	public void setEmFpath(String emFpath) {
		this.emFpath = emFpath;
	}
	public String getEmDel() {
		return emDel;
	}
	public void setEmDel(String emDel) {
		this.emDel = emDel;
	}
	@Override
	public String toString() {
		return "MessageDetailVO [emIdx=" + emIdx + ", emOut=" + emOut + ", emIn=" + emIn + ", emOuttime=" + emOuttime
				+ ", emTitle=" + emTitle + ", emCont=" + emCont + ", memIdx=" + memIdx + ", emboxRead=" + emboxRead
				+ ", emboxDvsn=" + emboxDvsn + ", emfIdx=" + emfIdx + ", emNm=" + emNm + ", emExtn=" + emExtn
				+ ", emfSize=" + emfSize + ", emFpath=" + emFpath + ", emDel=" + emDel + ", memNm=" + memNm + "]";
	}
	
	
}
