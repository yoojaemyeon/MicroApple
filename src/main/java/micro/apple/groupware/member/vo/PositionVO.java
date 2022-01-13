package micro.apple.groupware.member.vo;

public class PositionVO {

	private int positionIdx;
	private String positionNm;
	private String positionStep;
	public int getPositionIdx() {
		return positionIdx;
	}
	public void setPositionIdx(int positionIdx) {
		this.positionIdx = positionIdx;
	}
	public String getPositionNm() {
		return positionNm;
	}
	public void setPositionNm(String positionNm) {
		this.positionNm = positionNm;
	}
	public String getPositionStep() {
		return positionStep;
	}
	public void setPositionStep(String positionStep) {
		this.positionStep = positionStep;
	}
	@Override
	public String toString() {
		return "Position [positionIdx=" + positionIdx + ", positionNm=" + positionNm + ", positionStep=" + positionStep
				+ "]";
	}
	
}
