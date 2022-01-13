package micro.apple.groupware.reservation.vo;

public class ReservationVO {
	private int rsrvIdx;
	private String rsrvStart;
	private String rsrvEnd;
	private String rsrvCont;
	private String artiIdx;
	private String memIdx;
	
	
	
	public int getRsrvIdx() {
		return rsrvIdx;
	}
	public void setRsrvIdx(int rsrvIdx) {
		this.rsrvIdx = rsrvIdx;
	}

	public String getRsrvCont() {
		return rsrvCont;
	}
	public void setRsrvCont(String rsrvCont) {
		this.rsrvCont = rsrvCont;
	}
	public String getArtiIdx() {
		return artiIdx;
	}
	public void setArtiIdx(String artiIdx) {
		this.artiIdx = artiIdx;
	}
	public String getMemIdx() {
		return memIdx;
	}
	public void setMemIdx(String memIdx) {
		this.memIdx = memIdx;
	}
	public String getRsrvStart() {
		return rsrvStart;
	}
	public void setRsrvStart(String rsrvStart) {
		this.rsrvStart = rsrvStart;
	}
	public String getRsrvEnd() {
		return rsrvEnd;
	}
	public void setRsrvEnd(String rsrvEnd) {
		this.rsrvEnd = rsrvEnd;
	}
	@Override
	public String toString() {
		return "ReservationVO [rsrvIdx=" + rsrvIdx + ",  rsrvStart=" + rsrvStart
				+ ", rsrvEnd=" + rsrvEnd + ", rsrvCont=" + rsrvCont + ", artiIdx=" + artiIdx + ", memIdx=" + memIdx
				+ "]";
	}

	
	

	

	
	
	
	
}
