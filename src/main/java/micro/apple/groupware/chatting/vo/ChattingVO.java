package micro.apple.groupware.chatting.vo;

import java.sql.Date;


public class ChattingVO {
	private int chatIdx;
	private String chatNm;
	private Date chatCrdate;
	
	public ChattingVO() {
		super();
	}
	
	public int getChatIdx() {
		return chatIdx;
	}
	public void setChatIdx(int chatIdx) {
		this.chatIdx = chatIdx;
	}
	public String getChatNm() {
		return chatNm;
	}
	public void setChatNm(String chatNm) {
		this.chatNm = chatNm;
	}
	public Date getChatCrdate() {
		return chatCrdate;
	}
	public void setChatCrdate(Date chatCrdate) {
		this.chatCrdate = chatCrdate;
	}
	
	@Override
	public String toString() {
		return "ChattingVO [chatIdx=" + chatIdx + ", chatNm=" + chatNm + ", chatCrdate=" + chatCrdate + "]";
	}
	
	
	
}
