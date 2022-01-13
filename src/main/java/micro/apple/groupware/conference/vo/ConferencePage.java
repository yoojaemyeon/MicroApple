package micro.apple.groupware.conference.vo;

import java.util.List;
import java.util.Map;


public class ConferencePage {

	private int total; // 전체 행의 수 : 70
	private int currentPage; // 현재 페이지 번호
	private List<Map<String, Object>> content;	// 게시글 목록(우리는 이것을 사용함)
	private List<ConferenceVO> contentVO; // 게시글 목록
	private int totalPages; // 전체 페이지 개수 : 7
	private int startPage; // 시작 페이지 번호 [*1] [2] [3] [4] [5] 다음
	private int endPage; // 종료 페이지 번호 [1] [2] [3] [4] [*5] 다음

	//생성자
	public ConferencePage(int total, int currentPage,
			int size, List<Map<String, Object>> content) {
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;

	if(total==0){ // 결과 행이 없을 때
		totalPages = 0;
		startPage = 0;
		endPage = 0;
	}else
	{ // 글이 있다면
		// ex) 72행이 있고 5페이지씩 묶을 때, 한 화면에 10개씩 보일 때
		// 7 <= 72 / 10
		totalPages = total / size;
		// 나머지 행이 있으면 전체 페이지 수를 1증가
		if (total % size > 0) {
			totalPages++;
		}
		// 시작 페이지번호 공식
		int modVal = currentPage % 5;

		startPage = currentPage / 5 * 5 + 1;
		// 묶음의 마지막 페이지가 현재 페이지 일 때 (5, 10, 15..)
		if (modVal == 0)
			startPage -= 5;

		endPage = startPage + 4;
		// [1] [2] [3] [4] [5]
		// [6(startPage)] [7] [8(totalPages)] 9..10(endPage)
		if (endPage > totalPages)
			endPage = totalPages;
	}
}// end 생성자

public int getTotal() {
	return total;
}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public List<Map<String, Object>> getContent() {
		return content;
	}

	public void setContent(List<Map<String, Object>> content) {
		this.content = content;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "ConferencePage [total=" + total + ", currentPage=" + currentPage + ", content=" + content
				+ ", contentVO=" + contentVO + ", totalPages=" + totalPages + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}

	

}
