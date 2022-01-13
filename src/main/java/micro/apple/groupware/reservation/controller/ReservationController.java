package micro.apple.groupware.reservation.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import micro.apple.groupware.member.vo.MemberVO;
import micro.apple.groupware.reservation.service.ReservationService;
import micro.apple.groupware.reservation.vo.ArticleVO;
import micro.apple.groupware.reservation.vo.ReservationVO;


@Controller
public class ReservationController {
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);

	@Autowired
	ReservationService reservationService;
	
//reservation 페이지 출력
	@GetMapping("/reservation")
	public String reservation(Model model, HttpSession session){
		logger.info("reservationPage");
		
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
		String memIdx = member.getMemIdx();
		List<ReservationVO> myList = reservationService.getMyReservationList(member.getMemIdx());
		List<ArticleVO> arti_list = reservationService.getArticleListAll();
		model.addAttribute("arti_list", arti_list);
		model.addAttribute("myList", myList);
		model.addAttribute("member", member);
		
		return "reservation/reservation";
	}
	
//reservation_arti 페이지 물품별 리스트 출력
		@GetMapping("/arti_reservation")
		public String arti_reservation(Model model, HttpSession session){
			logger.info("reservationPage");
			MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
			model.addAttribute("member", member);
			
			return "reservation/reservation";
		}
	


//reservation_arti 페이지 물품 리스트 불러오기
	@GetMapping("/reservation_arti")
	public String reservation_arti(Model model,HttpSession session,@RequestParam Map<String, Object> map){
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
		model.addAttribute("member", member);
		
		//artiIdx null처리
		if(map.get("artiIdx") == null) {
			map.put("artiIdx", "0");
		}
		
		model.addAttribute("arti_list", (List<ArticleVO>)reservationService.getArticleListAll());
		model.addAttribute("arti_rsvList", (List<ReservationVO>)reservationService.getArtiRsvsList(Integer.parseInt(map.get("artiIdx").toString())));
		//이름 가져오기
		model.addAttribute("arti_info", (ArticleVO)reservationService.getArtiInfo(Integer.parseInt(map.get("artiIdx").toString())));
		
		return "reservation/reservation_arti";
	}
	
	
	
//예약 내용 등록
	@RequestMapping(value = "/reservationSave", method = RequestMethod.POST)
	public String reservation_artis(@ModelAttribute ReservationVO reservationVO, HttpSession session, Model model, HttpServletRequest request, @RequestParam Map<String, Object> map) {
		logger.info("예약 정보 map : " + map);
		logger.info("예약 정보 VO : " + reservationVO);
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
		String memIdx = member.getMemIdx();
		model.addAttribute("member", member);
		map.put("memIdx", Integer.parseInt(memIdx));
		map.put("artiIdx", Integer.parseInt(map.get("artiIdx").toString()));
		logger.info("예약 정보 map+Idx : " + map);
		System.out.println(map.get("memIdx").getClass());
		System.out.println(map.get("artiIdx").getClass());
		this.reservationService.insertReservation(map);
		
		return "redirect:/reservation_arti";
	}


	
	
//updateArticle 페이지 물품 리스트 불러오기	
	@GetMapping("/updateArticle")
	public String updateArticle(Model model, @RequestParam Map<String, Object> map, HttpSession session,HttpServletRequest request, HttpServletResponse response){
		MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
		model.addAttribute("member", member);
		
		model.addAttribute("arti_list", (List<ArticleVO>)reservationService.getArticleListAll());
		return "reservation/updateArticle";
	}
	
	
//updateArticle 페이지 물품 추가 하기
	@RequestMapping("/insertArticle")
	public String insertArticle(Model model) {
		
		model.addAttribute("insertArti", new MemberVO());
		return "reservation/updateArticle";
		
	}
	
	

}
