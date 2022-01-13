package micro.apple.groupware.mcaShop.vo;

public class PointVO {

	private int pointIdx; 
	private String pointUserec; //증감
	private int pointAmt; //금액
	private int ordrIdx; //주문IDX
	private int chargeIdx; //충전IDX
	private int memIdx;	//사원번호
	
	public int getPointIdx() {
		return pointIdx;
	}
	public void setPointIdx(int pointIdx) {
		this.pointIdx = pointIdx;
	}
	public String getPointUserec() {
		return pointUserec;
	}
	public void setPointUserec(String pointUserec) {
		this.pointUserec = pointUserec;
	}
	public int getPointAmt() {
		return pointAmt;
	}
	public void setPointAmt(int pointAmt) {
		this.pointAmt = pointAmt;
	}
	public int getOrdrIdx() {
		return ordrIdx;
	}
	public void setOrdrIdx(int ordrIdx) {
		this.ordrIdx = ordrIdx;
	}
	public int getChargeIdx() {
		return chargeIdx;
	}
	public void setChargeIdx(int chargeIdx) {
		this.chargeIdx = chargeIdx;
	}
	public int getMemIdx() {
		return memIdx;
	}
	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}
	
	@Override
	public String toString() {
		return "Point [pointIdx=" + pointIdx + ", pointUserec=" + pointUserec + ", pointAmt=" + pointAmt + ", ordrIdx="
				+ ordrIdx + ", chargeIdx=" + chargeIdx + ", memIdx=" + memIdx + "]";
	}
	
}
