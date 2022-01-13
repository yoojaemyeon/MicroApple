package micro.apple.groupware.chatting.vo;

import java.sql.Date;

public class ChatMessageVO {
	private int chmsgIdx;
	private int chatIdx;
	private int memIdx;
	private String chmsgCont;
	private Date chmsgWrdate;

	public ChatMessageVO() {
	}

	public int getChmsgIdx() {
		return chmsgIdx;
	}

	public void setChmsgIdx(int chmsgIdx) {
		this.chmsgIdx = chmsgIdx;
	}

	public int getChatIdx() {
		return chatIdx;
	}

	public void setChatIdx(int chatIdx) {
		this.chatIdx = chatIdx;
	}

	public int getMemIdx() {
		return memIdx;
	}

	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}

	public String getChmsgCont() {
		return chmsgCont;
	}

	public void setChmsgCont(String chmsgCont) {
		this.chmsgCont = chmsgCont;
	}

	public Date getChmsgWrdate() {
		return chmsgWrdate;
	}

	public void setChmsgWrdate(Date chmsgWrdate) {
		this.chmsgWrdate = chmsgWrdate;
	}

	@Override
	public String toString() {
		return "ChatMessageVO [chmsgIdx=" + chmsgIdx + ", chatIdx=" + chatIdx + ", memIdx=" + memIdx + 
				", chmsgCont=" + chmsgCont + ", chmsgWrdate=" + chmsgWrdate + "]";
	}

}