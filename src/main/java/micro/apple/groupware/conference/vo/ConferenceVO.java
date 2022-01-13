package micro.apple.groupware.conference.vo;

import java.util.Arrays;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ConferenceVO {

	private int mtngIdx;
//	private Date mtngDate;
	private String mtngDate;
	private String mtngTitle; //
	private String mtngCont; //
	private String mtngResults; //
	private String mtngFile; //
	private String memNm; //
	private MultipartFile file;
	private String memIdx;

	public String getMemNm() {
		return memNm;
	}

	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public int getMtngIdx() {
		return mtngIdx;
	}

	public void setMtngIdx(int mtngIdx) {
		this.mtngIdx = mtngIdx;
	}

	public String getMtngDate() {
		return mtngDate;
	}

	public void setMtngDate(String mtngDate) {
		this.mtngDate = mtngDate;
	}

	public String getMtngTitle() {
		return mtngTitle;
	}

	public void setMtngTitle(String mtngTitle) {
		this.mtngTitle = mtngTitle;
	}

	public String getMtngCont() {
		return mtngCont;
	}

	public void setMtngCont(String mtngCont) {
		this.mtngCont = mtngCont;
	}

	public String getMtngResults() {
		return mtngResults;
	}

	public void setMtngResults(String mtngResults) {
		this.mtngResults = mtngResults;
	}

	public String getMtngFile() {
		return mtngFile;
	}

	public void setMtngFile(String mtngFile) {
		this.mtngFile = mtngFile;
	}

	public String getMemIdx() {
		return memIdx;
	}

	public void setMemIdx(String memIdx) {
		this.memIdx = memIdx;
	}

	@Override
	public String toString() {
		return "ConferenceVO [mtngIdx=" + mtngIdx + ", mtngDate=" + mtngDate + ", mtngTitle=" + mtngTitle
				+ ", mtngCont=" + mtngCont + ", mtngResults=" + mtngResults + ", mtngFile=" + mtngFile + ", memNm="
				+ memNm + ", file=" + file + ", memIdx=" + memIdx + "]";
	}

}
