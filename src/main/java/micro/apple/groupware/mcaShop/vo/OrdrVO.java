package micro.apple.groupware.mcaShop.vo;

import java.util.Date;

public class OrdrVO {

	private int ordrIdx;
	private int prodIdx; // prodIdx
	private int memIdx; // memIdx
	private String ordrDate; // 주문 날짜
	private String ordrDvsn; // 처리구분
	private String ordrProdnm; // 상품명
	private int ordrProdprice; // 주문 가격
	private int ordrProdqty; // 주문 수량
	private String ordrCont; // 상품 내용

	public int getOrdrIdx() {
		return ordrIdx;
	}

	public void setOrdrIdx(int ordrIdx) {
		this.ordrIdx = ordrIdx;
	}

	public int getProdIdx() {
		return prodIdx;
	}

	public void setProdIdx(int prodIdx) {
		this.prodIdx = prodIdx;
	}

	public int getMemIdx() {
		return memIdx;
	}

	public void setMemIdx(int memIdx) {
		this.memIdx = memIdx;
	}

	public String getOrdrDate() {
		return ordrDate;
	}

	public void setOrdrDate(String ordrDate) {
		this.ordrDate = ordrDate;
	}

	public String getOrdrDvsn() {
		return ordrDvsn;
	}

	public void setOrdrDvsn(String ordrDvsn) {
		this.ordrDvsn = ordrDvsn;
	}

	public String getOrdrProdnm() {
		return ordrProdnm;
	}

	public void setOrdrProdnm(String ordrProdnm) {
		this.ordrProdnm = ordrProdnm;
	}

	public int getOrdrProdprice() {
		return ordrProdprice;
	}

	public void setOrdrProdprice(int ordrProdprice) {
		this.ordrProdprice = ordrProdprice;
	}

	public int getOrdrProdqty() {
		return ordrProdqty;
	}

	public void setOrdrProdqty(int ordrProdqty) {
		this.ordrProdqty = ordrProdqty;
	}

	public String getOrdrCont() {
		return ordrCont;
	}

	public void setOrdrCont(String ordrCont) {
		this.ordrCont = ordrCont;
	}

	@Override
	public String toString() {
		return "OrdrVO [ordrIdx=" + ordrIdx + ", prodIdx=" + prodIdx + ", memIdx=" + memIdx + ", ordrDate=" + ordrDate
				+ ", ordrDvsn=" + ordrDvsn + ", ordrProdnm=" + ordrProdnm + ", ordrProdprice=" + ordrProdprice
				+ ", ordrProdqty=" + ordrProdqty + ", ordrCont=" + ordrCont + "]";
	}

}
