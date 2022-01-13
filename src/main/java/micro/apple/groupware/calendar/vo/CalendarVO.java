package micro.apple.groupware.calendar.vo;

import java.util.Date;

public class CalendarVO {
	
	
	private int schdIdx;
	private String schdDvsn;
	private String schdTitle;
	private String schdCont;
	private String schdPlace;
	private String schdStart;
	private String schdEnd;
	private Long memIdx;
	private String schdAd;
	private String memNm;
	private String share;
	private String schdShare;
	private String schdShareDvsn;
	
	
	
	
	
	public String getSchdShareDvsn() {
		return schdShareDvsn;
	}
	public void setSchdShareDvsn(String schdShareDvsn) {
		this.schdShareDvsn = schdShareDvsn;
	}
	public String getSchdShare() {
		return schdShare;
	}
	public void setSchdShare(String schdShare) {
		this.schdShare = schdShare;
	}
	public String getShare() {
		return share;
	}
	public void setShare(String share) {
		this.share = share;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	private String schdStartFmt;
	private String schdEndFmt;
	
	
	public String getSchdStartFmt() {
		return schdStartFmt;
	}
	public void setSchdStartFmt(String schdStartFmt) {
		this.schdStartFmt = schdStartFmt;
	}
	public String getSchdEndFmt() {
		return schdEndFmt;
	}
	public void setSchdEndFmt(String schdEndFmt) {
		this.schdEndFmt = schdEndFmt;
	}
	public int getSchdIdx() {
		return schdIdx;
	}
	public void setSchdIdx(int schdIdx) {
		this.schdIdx = schdIdx;
	}
	public String getSchdDvsn() {
		return schdDvsn;
	}
	public void setSchdDvsn(String schdDvsn) {
		this.schdDvsn = schdDvsn;
	}
	public String getSchdTitle() {
		return schdTitle;
	}
	public void setSchdTitle(String schdTitle) {
		this.schdTitle = schdTitle;
	}
	public String getSchdCont() {
		return schdCont;
	}
	public void setSchdCont(String schdCont) {
		this.schdCont = schdCont;
	}
	public String getSchdPlace() {
		return schdPlace;
	}
	public void setSchdPlace(String schdPlace) {
		this.schdPlace = schdPlace;
	}
	public String getSchdStart() {
		return schdStart;
	}
	public void setSchdStart(String schdStart) {
		this.schdStart = schdStart;
	}
	public String getSchdEnd() {
		return schdEnd;
	}
	public void setSchdEnd(String schdEnd) {
		this.schdEnd = schdEnd;
	}
	public Long getMemIdx() {
		return memIdx;
	}
	public void setMemIdx(Long memIdx) {
		this.memIdx = memIdx;
	}
	public String getSchdAd() {
		return schdAd;
	}
	public void setSchdAd(String schdAd) {
		this.schdAd = schdAd;
	}
	@Override
	public String toString() {
		return "CalendarVO [schdIdx=" + schdIdx + ", schdDvsn=" + schdDvsn + ", schdTitle=" + schdTitle + ", schdCont="
				+ schdCont + ", schdPlace=" + schdPlace + ", schdStart=" + schdStart + ", schdEnd=" + schdEnd
				+ ", memIdx=" + memIdx + ", schdAd=" + schdAd + ", memNm=" + memNm + ", share=" + share + ", schdShare="
				+ schdShare + ", schdShareDvsn=" + schdShareDvsn + ", schdStartFmt=" + schdStartFmt + ", schdEndFmt="
				+ schdEndFmt + "]";
	}
	
	
}
