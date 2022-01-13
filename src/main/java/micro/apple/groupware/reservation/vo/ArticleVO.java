package micro.apple.groupware.reservation.vo;

public class ArticleVO {
	private int artiIdx;
	private String artiDvsn;
	private String artiNm;
	
	

	public String getArtiDvsn() {
		return artiDvsn;
	}
	public void setArtiDvsn(String artiDvsn) {
		this.artiDvsn = artiDvsn;
	}
	public String getArtiNm() {
		return artiNm;
	}
	public void setArtiNm(String artiNm) {
		this.artiNm = artiNm;
	}
	public int getArtiIdx() {
		return artiIdx;
	}
	public void setArtiIdx(int artiIdx) {
		this.artiIdx = artiIdx;
	}
	@Override
	public String toString() {
		return "ArticleVO [artiIdx=" + artiIdx + ", artiDvsn=" + artiDvsn + ", artiNm=" + artiNm + "]";
	}


	
	
	
	
}
