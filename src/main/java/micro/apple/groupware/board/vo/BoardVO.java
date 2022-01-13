package micro.apple.groupware.board.vo;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

import micro.apple.groupware.member.vo.MemberVO;

public class BoardVO {

	private int boardIdx; // 게시판 번호
	private String boardDvsn; // 게시판 구분명
	private String boardTitle; // 게시판 제목
	private String boardCont; // 게시판 내용
	private String boardWrdate; // 게시판 작성일
	private String memIdx; // 사원번호
	
	private String memPicture; // 사원 사진
	private String memNm; // 사원명
	private MemberVO memberVO; // 사원객체
	
	private String keyword; // 통합 검색 키워드
	private String type; // 검색 타입
	private String[] typeArr; // 검색 타입 배열
	private String boardFile;	// 게시판 파일
	private MultipartFile file;
	// 2021-12-22 추가
	private int schdIdx;		// 일정 번호
	private String schdTitle;	// 일정 제목
	private String schdStart;	// 일정 시작일
	private String schdEnd;		// 일정 종료일
	
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public String getBoardDvsn() {
		return boardDvsn;
	}
	public void setBoardDvsn(String boardDvsn) {
		this.boardDvsn = boardDvsn;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardCont() {
		return boardCont;
	}
	public void setBoardCont(String boardCont) {
		this.boardCont = boardCont;
	}
	public String getBoardWrdate() {
		return boardWrdate;
	}
	public void setBoardWrdate(String boardWrdate) {
		this.boardWrdate = boardWrdate;
	}
	public String getMemIdx() {
		return memIdx;
	}
	public void setMemIdx(String memIdx) {
		this.memIdx = memIdx;
	}
	public String getMemPicture() {
		return memPicture;
	}
	public void setMemPicture(String memPicture) {
		this.memPicture = memPicture;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String[] getTypeArr() {
		return typeArr;
	}
	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}
	public String getBoardFile() {
		return boardFile;
	}
	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getSchdIdx() {
		return schdIdx;
	}
	public void setSchdIdx(int schdIdx) {
		this.schdIdx = schdIdx;
	}
	public String getSchdTitle() {
		return schdTitle;
	}
	public void setSchdTitle(String schdTitle) {
		this.schdTitle = schdTitle;
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
	
	@Override
	public String toString() {
		return "BoardVO [boardIdx=" + boardIdx + ", boardDvsn=" + boardDvsn + ", boardTitle=" + boardTitle
				+ ", boardCont=" + boardCont + ", boardWrdate=" + boardWrdate + ", memIdx=" + memIdx + ", memPicture="
				+ memPicture + ", memNm=" + memNm + ", memberVO=" + memberVO + ", keyword=" + keyword + ", type=" + type
				+ ", typeArr=" + Arrays.toString(typeArr) + ", boardFile=" + boardFile + ", file=" + file + ", schdIdx="
				+ schdIdx + ", schdTitle=" + schdTitle + ", schdStart=" + schdStart + ", schdEnd=" + schdEnd + "]";
	}
	
}
