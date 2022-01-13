package micro.apple.groupware.mail.vo;

import java.sql.Date;

public class MailVO {
	
	private int mailNum;
	private String fromMail;
	private String fromName;
	private String toMail;
	private String toName;
	private Date mailSendtime;
	private String mailTitle;
	private String mailContent;
	private String mailFile;
	private String mailFilepath;
	
	
	
	public String getFromMail() {
		return fromMail;
	}
	public void setFromMail(String fromMail) {
		this.fromMail = fromMail;
	}
	public String getToMail() {
		return toMail;
	}
	public void setToMail(String toMail) {
		this.toMail = toMail;
	}
	public Date getMailSendtime() {
		return mailSendtime;
	}
	public void setMailSendtime(Date mailSendtime) {
		this.mailSendtime = mailSendtime;
	}
	public String getMailTitle() {
		return mailTitle;
	}
	public void setMailTitle(String mailTitle) {
		this.mailTitle = mailTitle;
	}
	public String getMailContent() {
		return mailContent;
	}
	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}
	public String getMailFile() {
		return mailFile;
	}
	public void setMailFile(String mailFile) {
		this.mailFile = mailFile;
	}
	public String getFromName() {
		return fromName;
	}
	public void setFromName(String fromName) {
		this.fromName = fromName;
	}
	public String getToName() {
		return toName;
	}
	public void setToName(String toName) {
		this.toName = toName;
	}
	public int getMailNum() {
		return mailNum;
	}
	public void setMailNum(int mailNum) {
		this.mailNum = mailNum;
	}
	public String getMailFilepath() {
		return mailFilepath;
	}
	public void setMailFilepath(String mailFilepath) {
		this.mailFilepath = mailFilepath;
	}
	@Override
	public String toString() {
		return "mailVO [mailNum=" + mailNum + ", fromMail=" + fromMail + ", fromName=" + fromName + ", toMail=" + toMail
				+ ", toName=" + toName + ", mailSendtime=" + mailSendtime + ", mailTitle=" + mailTitle
				+ ", mailContent=" + mailContent + ", mailFile=" + mailFile + ", mailFilepath=" + mailFilepath + "]";
	}
	
}
