package micro.apple.groupware.mcaShop.vo;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class McaShopVO {

   private int prodIdx;
   private String prodNm;
   private int prodPrice;
   private int prodQty;
   private String prodCont;
   private Date prodDate;
   private String prodFile;
   private MultipartFile[] file;
   private List<FProdVO> fProdVO;
   
   public int getProdIdx() {
      return prodIdx;
   }
   public void setProdIdx(int prodIdx) {
      this.prodIdx = prodIdx;
   }
   public String getProdNm() {
      return prodNm;
   }
   public void setProdNm(String prodNm) {
      this.prodNm = prodNm;
   }
   public int getProdPrice() {
      return prodPrice;
   }
   public void setProdPrice(int prodPrice) {
      this.prodPrice = prodPrice;
   }
   public int getProdQty() {
      return prodQty;
   }
   public void setProdQty(int prodQty) {
      this.prodQty = prodQty;
   }
   public String getProdCont() {
      return prodCont;
   }
   public void setProdCont(String prodCont) {
      this.prodCont = prodCont;
   }
   public Date getProdDate() {
      return prodDate;
   }
   public void setProdDate(Date prodDate) {
      this.prodDate = prodDate;
   }
   public String getProdFile() {
      return prodFile;
   }
   public void setProdFile(String prodFile) {
      this.prodFile = prodFile;
   }
   public MultipartFile[] getFile() {
      return file;
   }
   public void setFile(MultipartFile[] file) {
      this.file = file;
   }
   public List<FProdVO> getfProdVO() {
      return fProdVO;
   }
   public void setfProdVO(List<FProdVO> fProdVO) {
      this.fProdVO = fProdVO;
   }
   
   @Override
   public String toString() {
      return "McaShopVO [prodIdx=" + prodIdx + ", prodNm=" + prodNm + ", prodPrice=" + prodPrice + ", prodQty="
            + prodQty + ", prodCont=" + prodCont + ", prodDate=" + prodDate + ", prodFile=" + prodFile + ", file="
            + Arrays.toString(file) + ", fProdVO=" + fProdVO + "]";
   }
   
   
   
   
}