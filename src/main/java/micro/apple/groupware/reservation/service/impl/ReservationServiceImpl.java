package micro.apple.groupware.reservation.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import micro.apple.groupware.reservation.mapper.ReservationMapper;
import micro.apple.groupware.reservation.service.ReservationService;
import micro.apple.groupware.reservation.vo.ArticleVO;
import micro.apple.groupware.reservation.vo.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationMapper reservationMapper;
	
	//전체 물품 목록 List
	@Override
	public List<ArticleVO> getArticleListAll() {
		return reservationMapper.getArticleListAll();
	}

	//물품별 목록 List
	@Override
	public List<ReservationVO> getArtiRsvsList(int artiIdx) {
		return reservationMapper.getArtiRsvsList(artiIdx);
	}
	
	//물품 이름 
	@Override
	public ArticleVO getArtiInfo(int artiIdx) {
		return reservationMapper.getArtiInfo(artiIdx);
	}
	
	//나의 예약현황 List
	@Override
	public List<ReservationVO> getMyReservationList(String memIdx) {
		return reservationMapper.getMyReservationList(memIdx);
	}
	
	//예약 등록
	@Override
	public int insertReservation(Map<String, Object> map) {
		return reservationMapper.insertReservation(map);
	}
	
	//물품 등록
	@Override
	public String insertArti(Map<String, Object> map) {
		return reservationMapper.insertArti(map);
	}
	//물품 삭제
	@Override
	public String deleteArti(int artiIdx) {
		return this.reservationMapper.deleteArti(artiIdx);
	}
















		
	

}
