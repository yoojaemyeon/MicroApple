package micro.apple.groupware.search.vo;

import java.util.Arrays;
import java.util.Date;

public class BoardVO {

	private int boardIdx; // 게시판 번호
	private String boardDvsn; // 게시판 구분명
	private String boardTitle; // 게시판 제목
	private String boardCont; // 게시판 내용
	private Date boardWrdate; // 게시판 작성일
	private int memIdx; // 사원번호
	private String keyword; // 통합 검색 키워드
	private String type; // 검색 타입
	private String[] typeArr; // 검색 타입 배열

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

	public Date getBoardWrdate() {
		return boardWrdate;
	}

	public void setBoardWrdate(Date boardWrdate) {
		this.boardWrdate = boardWrdate;
	}

	public int getMemIdx() {
		return memIdx;
	}

	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
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

	@Override
	public String toString() {
		return "BoardVO [boardIdx=" + boardIdx + ", boardDvsn=" + boardDvsn + ", boardTitle=" + boardTitle
				+ ", boardCont=" + boardCont + ", boardWrdate=" + boardWrdate + ", memIdx=" + memIdx + ", keyword="
				+ keyword + ", type=" + type + ", typeArr=" + Arrays.toString(typeArr) + "]";
	}

}
