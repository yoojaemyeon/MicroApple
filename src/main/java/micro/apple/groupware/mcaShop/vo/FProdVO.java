package micro.apple.groupware.mcaShop.vo;

//첨부파일
public class FProdVO {
	private int fprodIdx;
	private int prodIdx;
	private String fprodNm;
	private String fprodSavenm;
	private String fprodPath;
	public int getFprodIdx() {
		return fprodIdx;
	}
	public void setFprodIdx(int fprodIdx) {
		this.fprodIdx = fprodIdx;
	}
	public int getProdIdx() {
		return prodIdx;
	}
	public void setProdIdx(int prodIdx) {
		this.prodIdx = prodIdx;
	}
	public String getFprodNm() {
		return fprodNm;
	}
	public void setFprodNm(String fprodNm) {
		this.fprodNm = fprodNm;
	}
	public String getFprodSavenm() {
		return fprodSavenm;
	}
	public void setFprodSavenm(String fprodSavenm) {
		this.fprodSavenm = fprodSavenm;
	}
	public String getFprodPath() {
		return fprodPath;
	}
	public void setFprodPath(String fprodPath) {
		this.fprodPath = fprodPath;
	}
	@Override
	public String toString() {
		return "FProd [fprodIdx=" + fprodIdx + ", prodIdx=" + prodIdx + ", fprodNm=" + fprodNm + ", fprodSavenm="
				+ fprodSavenm + ", fprodPath=" + fprodPath + "]";
	}
	
	
}
