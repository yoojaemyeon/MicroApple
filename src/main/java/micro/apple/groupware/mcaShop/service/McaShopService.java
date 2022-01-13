package micro.apple.groupware.mcaShop.service;

import java.util.List;
import java.util.Map;

import micro.apple.groupware.mcaShop.vo.ChargeVO;
import micro.apple.groupware.mcaShop.vo.McaShopVO;
import micro.apple.groupware.mcaShop.vo.OrdrVO;
import micro.apple.groupware.member.vo.MemberVO;

public interface McaShopService {

   //상품조회
   public List<McaShopVO> list();
   
   //상품 등록
   public int insert(McaShopVO mcaShopVO);

   //상품 등록 이미지들
   public int insertFProd(List<Map<String, Object>> list);

   //상품 상세조회
   public List<McaShopVO> productDetail(String prodIdx);

   
   //상품 삭제
   public int delete(String prodIdx);

   
   //상품 수정전 조회
   public List<McaShopVO> updateList(String prodIdx);

   //상품 수정 포스트
   public int update(McaShopVO mcaShopVO);
   
   //상품 이미지 수정 포스트
   public int updateFProd(List<Map<String, Object>> list);

   //회원 포인트 수정
   public int pointUpdate(Map<String, Object> map);

   //포인트 충전 이력
   public int insertChargeGo(Map<String, Object> map);

   //포인트 이력 넣은거 조회해서 
   public List<ChargeVO> selectCharge(Map<String, Object> map);

   //포인트 값 넣기
   public int insertPointGo(Map<String, Object> map);

   //주문후 포인트 다운 값 넣기
   public int pointDownUpdate(Map<String, Object> map);

   //로그인 한 멤버 조회
   public Map<String, Object> LoginMember(MemberVO member);

   //로그인 한 멤버 포인트 조회
   public Map<String, Object> LoginMemberPoint(Map<String, Object> map);

   //주문값 넣기
   public int OrderInsert(Map<String, Object> map);
   
   //주문 테이블 조회해서 화면 넘겨서 주문 정보 보여주기
   public List<OrdrVO> OrderList(Map<String, Object> map);

   //상품 수량 감소
 	public int ProdQtyDown(Map<String, Object> map);

 	//상품 검색
	public List<McaShopVO> Search(Map<String, Object> map);

	//주문내역삭제
	public int deleteOrlist(Map<String, Object> map);
 	

}