package micro.apple.groupware.reservation.service;

import java.util.List;
import java.util.Map;

import micro.apple.groupware.reservation.mapper.ReservationMapper;
import micro.apple.groupware.reservation.vo.ArticleVO;
import micro.apple.groupware.reservation.vo.ReservationVO;

public interface ReservationService {
	
	
//전체 물품 목록 List
	public List<ArticleVO> getArticleListAll();
//물품별 목록 List
	public List<ReservationVO> getArtiRsvsList(int artiIdx);
//물품 이름 
	public ArticleVO getArtiInfo(int artiIdx);
//나의 예약현황 List
	public List<ReservationVO> getMyReservationList(String memIdx);
	
	//각 물품의 예약 현황 List
	
	//예약 등록
	public int insertReservation(Map<String, Object> map);
	
	//물품 등록
	public String insertArti(Map<String, Object> map);
	
	//물품 삭제
	public String deleteArti(int artiIdx);


	





	
}
