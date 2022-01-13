package micro.apple.groupware.webDisk.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;


public class WebDiskVO {
	private String webIdx;
	private String webPw;
	private String webSaveNm;
	private String webOriginNm;
	private String webExtn;
	private String webExpl;
	private String webWrdate;
	private String webSize;
	private String webWriter;
	private String webPath;
	private String webUptoIdx;
	private String webNm;
	private String webRead;
	private String webWrite;
	private String webIsfile;
	private String memIdx;
	private MultipartFile file;
	
	public String getWebIdx() {
		return webIdx;
	}

	public void setWebIdx(String webIdx) {
		this.webIdx = webIdx;
	}

	public String getWebPw() {
		return webPw;
	}

	public void setWebPw(String webPw) {
		this.webPw = webPw;
	}

	public String getWebSaveNm() {
		return webSaveNm;
	}

	public void setWebSaveNm(String webSaveNm) {
		this.webSaveNm = webSaveNm;
	}

	public String getWebOriginNm() {
		return webOriginNm;
	}

	public void setWebOriginNm(String webOriginNm) {
		this.webOriginNm = webOriginNm;
	}

	public String getWebExtn() {
		return webExtn;
	}

	public void setWebExtn(String webExtn) {
		this.webExtn = webExtn;
	}

	public String getWebExpl() {
		return webExpl;
	}

	public void setWebExpl(String webExpl) {
		this.webExpl = webExpl;
	}

	public String getWebWrdate() {
		return webWrdate;
	}

	public void setWebWrdate(String webWrdate) {
		this.webWrdate = webWrdate;
	}

	public String getWebSize() {
		return webSize;
	}

	public void setWebSize(String webSize) {
		this.webSize = webSize;
	}

	public String getWebWriter() {
		return webWriter;
	}

	public void setWebWriter(String webWriter) {
		this.webWriter = webWriter;
	}

	public String getWebPath() {
		return webPath;
	}

	public void setWebPath(String webPath) {
		this.webPath = webPath;
	}

	public String getWebUptoIdx() {
		return webUptoIdx;
	}

	public void setWebUptoIdx(String webUptoIdx) {
		this.webUptoIdx = webUptoIdx;
	}

	public String getWebNm() {
		return webNm;
	}

	public void setWebNm(String webNm) {
		this.webNm = webNm;
	}

	public String getWebRead() {
		return webRead;
	}

	public void setWebRead(String webRead) {
		this.webRead = webRead;
	}

	public String getWebWrite() {
		return webWrite;
	}

	public void setWebWrite(String webWrite) {
		this.webWrite = webWrite;
	}

	public String getWebIsfile() {
		return webIsfile;
	}

	public void setWebIsfile(String webIsfile) {
		this.webIsfile = webIsfile;
	}

	public String getMemIdx() {
		return memIdx;
	}

	public void setMemIdx(String memIdx) {
		this.memIdx = memIdx;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	@Override
	public String toString() {
		return "WebDiskVO [webIdx=" + webIdx + ", webPw=" + webPw + ", webSaveNm=" + webSaveNm + ", webOriginNm="
				+ webOriginNm + ", webExtn=" + webExtn + ", webExpl=" + webExpl + ", webWrdate=" + webWrdate
				+ ", webSize=" + webSize + ", webWriter=" + webWriter + ", webPath=" + webPath + ", webUptoIdx="
				+ webUptoIdx + ", webNm=" + webNm + ", webRead=" + webRead + ", webWrite=" + webWrite + ", webIsfile="
				+ webIsfile + ", memIdx=" + memIdx + ", file=" + file + "]";
	}

}
