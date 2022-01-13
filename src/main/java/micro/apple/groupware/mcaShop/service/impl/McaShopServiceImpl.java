package micro.apple.groupware.mcaShop.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import micro.apple.groupware.mcaShop.mapper.McaShopMapper;
import micro.apple.groupware.mcaShop.service.McaShopService;
import micro.apple.groupware.mcaShop.vo.ChargeVO;
import micro.apple.groupware.mcaShop.vo.McaShopVO;
import micro.apple.groupware.mcaShop.vo.OrdrVO;
import micro.apple.groupware.member.vo.MemberVO;

@Service
public class McaShopServiceImpl implements McaShopService {

   private static final Logger logger = LoggerFactory.getLogger(McaShopServiceImpl.class);
   
   
   @Autowired
   McaShopMapper mcaMapper;

   //상품 조회   
   @Override
   public List<McaShopVO> list() {
      return this.mcaMapper.list();
   }
   
   //상품 상세조회
   @Override
   public List<McaShopVO> productDetail(String prodIdx) {
      return this.mcaMapper.productDetail(prodIdx);
   }
   
   //상품 수정전 상세조회
   @Override
   public List<McaShopVO> updateList(String prodIdx) {
      return this.mcaMapper.updateList(prodIdx);
   }
   
   
   //상품 등록
   public int insert(McaShopVO mcaShopVO) {
      return this.mcaMapper.insert(mcaShopVO);
   }

   //상품 등록 이미지 multiple
   @Override
   public int insertFProd(List<Map<String, Object>> list) {
      return this.mcaMapper.insertFProd(list);
   }

   

   //상품 삭제
   @Override
   public int delete(String prodIdx) {
      return this.mcaMapper.delete(prodIdx);
   }

   //상품 수정
   @Override
   public int update(McaShopVO mcaShopVO) {
      logger.info("수정 service mcaShopVO : " + mcaShopVO);
      return this.mcaMapper.update(mcaShopVO);
   }
   //상품 이미지 수정
   @Override
   public int updateFProd(List<Map<String, Object>> list) {
      logger.info("수정 service list : " + list);
      return this.mcaMapper.updateImage(list);
   }

   //회원 포인트 수정
   @Override
   public int pointUpdate(Map<String, Object> map) {
      logger.info("회원 포인트 수정 service map값 : "+map);
      return this.mcaMapper.pointUpdate(map);
   }

   //포인트 값 넣기
   @Override
   public int insertPointGo(Map<String, Object> map) {
      return this.mcaMapper.insertPointGo(map);
   }

   //포인트 충전 이력
   @Override
   public int insertChargeGo(Map<String, Object> map) {
      return this.mcaMapper.insertChargeGo(map);
   }

   //포인트 이력 넣은거 조회해서
   @Override
   public List<ChargeVO> selectCharge(Map<String, Object> map) {
      return this.mcaMapper.selectCharge(map);
   }

   
   //로그인한 멤버 조회
   @Override
   public Map<String, Object> LoginMember(MemberVO member) {
      return this.mcaMapper.LoginMember(member);
   }

   //조회한 멤버 포인트 조회
	@Override
	public Map<String, Object> LoginMemberPoint(Map<String, Object> map) {
		return this.mcaMapper.LoginMemberPoint(map);
	}

	 //주문후 포인트 다운 값 넣기
	@Override
	public int pointDownUpdate(Map<String, Object> map) {
		return this.mcaMapper.pointDownUpdate(map);
	}
	
	//상품 수량 감소
	@Override
	public int ProdQtyDown(Map<String, Object> map) {
		return this.mcaMapper.ProdQtyDown(map);
	}
	
	
	//주문 값 넣기
	@Override
	public int OrderInsert(Map<String, Object> map) {
		return this.mcaMapper.OrderInsert(map);
	}

	//주문 테이블 조회해서 화면 넘겨서 주문 정보 보여주기
	@Override
	public List<OrdrVO> OrderList(Map<String, Object> map) {
		return this.mcaMapper.OrderList(map);
	}

	//상품 검색
	@Override
	public List<McaShopVO> Search(Map<String, Object> map) {
		return this.mcaMapper.Search(map);
	}

	//주문내역삭제
	@Override
	public int deleteOrlist(Map<String, Object> map) {
		return this.mcaMapper.deleteOrlist(map);
	}


   
   
}