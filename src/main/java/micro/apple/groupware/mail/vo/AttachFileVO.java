package micro.apple.groupware.mail.vo;

public class AttachFileVO {
	
	private int emfIdx;  //fileIdx
	private int emIdx;  //mailIdx
	private String emNm; //fileName(원본)
	private String emExtn; //확장자
	private String emfSize;  //파일 크기
	private String emFpath; // filePath
	private String emDel;  //emfDel(파일삭제여부)
	
	
	public int getEmfIdx() {
		return emfIdx;
	}
	public void setEmfIdx(int emfIdx) {
		this.emfIdx = emfIdx;
	}
	public int getEmIdx() {
		return emIdx;
	}
	public void setEmIdx(int emIdx) {
		this.emIdx = emIdx;
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
		return "AttachFileVO [emfIdx=" + emfIdx + ", emIdx=" + emIdx + ", emNm=" + emNm + ", emExtn=" + emExtn
				+ ", emfSize=" + emfSize + ", emFpath=" + emFpath + ", emDel=" + emDel + "]";
	}
	
}
