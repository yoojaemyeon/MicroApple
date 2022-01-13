package micro.apple.groupware.board.vo;

public class FBoardVO {
	private int fboardIdx;	// 파일 번호
	private String fboardSavenm;	// 저장 파일명
	private String fboardNm;		// 원본 파일명
	private String fboardExtn;		// 파일 확장자
	private String fboardPath;		// 파일 경로
	private int boardIdx;			// 게시판 IDX
	
	public int getFboardIdx() {
		return fboardIdx;
	}
	public void setFboardIdx(int fboardIdx) {
		this.fboardIdx = fboardIdx;
	}
	public String getFboardSavenm() {
		return fboardSavenm;
	}
	public void setFboardSavenm(String fboardSavenm) {
		this.fboardSavenm = fboardSavenm;
	}
	public String getFboardNm() {
		return fboardNm;
	}
	public void setFboardNm(String fboardNm) {
		this.fboardNm = fboardNm;
	}
	public String getFboardExtn() {
		return fboardExtn;
	}
	public void setFboardExtn(String fboardExtn) {
		this.fboardExtn = fboardExtn;
	}
	public String getFboardPath() {
		return fboardPath;
	}
	public void setFboardPath(String fboardPath) {
		this.fboardPath = fboardPath;
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	@Override
	public String toString() {
		return "FBoardVO [fboardIdx=" + fboardIdx + ", fboardSavenm=" + fboardSavenm + ", fboardNm=" + fboardNm
				+ ", fboardExtn=" + fboardExtn + ", fboardPath=" + fboardPath + ", boardIdx=" + boardIdx + "]";
	}
}
