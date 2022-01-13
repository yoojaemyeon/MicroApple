package micro.apple.groupware.reservation.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;

import micro.apple.groupware.calendar.vo.CalendarVO;
import micro.apple.groupware.reservation.vo.ArticleVO;
import micro.apple.groupware.reservation.vo.ReservationVO;

public interface ReservationMapper {
	
	//전체 물품 목록 List
	public List<ArticleVO> getArticleListAll();
	//물품별 목록 List
	public List<ReservationVO> getArtiRsvsList(int artiIdx);
	//물품 이름 
	public ArticleVO getArtiInfo(int artiIdx);
	//나의 예약현황 List	
	public List<ReservationVO> getMyReservationList(String memIdx);
	
	//예약 등록	
	public int insertReservation(Map<String, Object> map);
	
	//물품 등록	
	public String insertArti(Map<String, Object> map);
	
	//물품 삭제
	public String deleteArti(int artiIdx);

}
