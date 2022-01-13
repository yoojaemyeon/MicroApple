package micro.apple.groupware.mcaShop.vo;

import java.util.Date;

public class ChargeVO {

	private int chargeIdx; //충전IDX
	private int memIdx; //사원번호
	private Date pointCharge; //충전 일시
	
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
	public Date getPointCharge() {
		return pointCharge;
	}
	public void setPointCharge(Date pointCharge) {
		this.pointCharge = pointCharge;
	}
	
	@Override
	public String toString() {
		return "Charge [chargeIdx=" + chargeIdx + ", memIdx=" + memIdx + "]";
	}
	
	
}
