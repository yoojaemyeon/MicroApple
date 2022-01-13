package micro.apple.groupware.calendar.vo;

import java.util.Date;

public class CalendarListVO {
	
	private int schdIdx;
	private String schdDvsn;
	private String schdTitle;
	private String schdCont;
	private String schdPlace;
	private Date schdStart;
	private Date schdEnd;
	private int memIdx;
	private String schdAd;
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
	public Date getSchdStart() {
		return schdStart;
	}
	public void setSchdStart(Date schdStart) {
		this.schdStart = schdStart;
	}
	public Date getSchdEnd() {
		return schdEnd;
	}
	public void setSchdEnd(Date schdEnd) {
		this.schdEnd = schdEnd;
	}
	public int getMemIdx() {
		return memIdx;
	}
	public void setMemIdx(int memIdx) {
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
		return "CalendarListVO [schdIdx=" + schdIdx + ", schdDvsn=" + schdDvsn + ", schdTitle=" + schdTitle
				+ ", schdCont=" + schdCont + ", schdPlace=" + schdPlace + ", schdStart=" + schdStart + ", schdEnd="
				+ schdEnd + ", memIdx=" + memIdx + ", schdAd=" + schdAd + "]";
	}
	
}
