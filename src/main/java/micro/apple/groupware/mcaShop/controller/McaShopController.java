package micro.apple.groupware.mcaShop.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import micro.apple.groupware.calendar.service.CalendarService;
import micro.apple.groupware.mcaShop.service.McaShopService;
import micro.apple.groupware.mcaShop.vo.ChargeVO;
import micro.apple.groupware.mcaShop.vo.FProdVO;
import micro.apple.groupware.mcaShop.vo.McaShopVO;
import micro.apple.groupware.mcaShop.vo.OrdrVO;
import micro.apple.groupware.mcaShop.vo.PointVO;
import micro.apple.groupware.member.service.MemberService;
import micro.apple.groupware.member.vo.MemberVO;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class McaShopController {
	private static final Logger logger = LoggerFactory.getLogger(McaShopController.class);

	@Autowired
	McaShopService mcaShopService;

	// 파일 업로드에 대한 부분
	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}

	private boolean checkImageType(File file) {

		try {
			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 파일 업로드에 대한 부분 끝

	// 목록
	@RequestMapping(value = "/mcaShop", method = RequestMethod.GET)
	public String mailsend(Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {

		MemberVO member = (MemberVO) session.getAttribute("MEMBERVO");

		logger.info("member !!!!!!" + member.toString());

		List<McaShopVO> list = this.mcaShopService.list();

		logger.info("mcaShopPage" + list);

		model.addAttribute("list", list);
		model.addAttribute("member", member);

		return "mcaShop/mcaShop";
	}

	// 상품 상세
	@RequestMapping(value = "/productDetail", method = RequestMethod.GET)
	public String productDetail(Model model, @RequestParam("prodIdx") String prodIdx, 
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		MemberVO member = (MemberVO) session.getAttribute("MEMBERVO");

		Map<String, Object> map = this.mcaShopService.LoginMember(member);
		model.addAttribute("map", map);

		logger.info("prodIdx 들어왔늬~" + prodIdx);
		logger.info("list 들어왔늬~" + map);

		List<McaShopVO> list = this.mcaShopService.productDetail(prodIdx);

		logger.info("상품 상세 정보 : " + list.get(0));

		model.addAttribute("detail", list.get(0));
		model.addAttribute("map", map);

		return "mcaShop/ProductDetail";

	}

	// 상품 추가
	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public String addProduct() {

		return "mcaShop/addProduct";
	}

	// 상품 추가 포스트
	@RequestMapping(value = "/addProductPost", method = RequestMethod.POST)
	public String addProductPost(Model model, @ModelAttribute McaShopVO mcaShopVO) {

		logger.info("mcaShopVO : " + mcaShopVO);

		// 1. product 테이블로 insert(1행)->mcaShopVO.prodFile : 3
		this.mcaShopService.insert(mcaShopVO);

		logger.info("mcaShopVO.getProdIdx() : " + mcaShopVO.getProdIdx());

		//String uploadFolder = "C:\\workspace\\microApple\\src\\main\\webapp\\resources\\images";
		String uploadFolder = "D:\\workspaces\\workspace4web\\MicroApple\\src\\main\\webapp\\resources\\images";

		//String thumbnailFolder = "C:\\workspace\\microApple\\src\\main\\webapp\\resources\\images\\thumbnail";
		String thumbnailFolder = "D:\\workspaces\\workspace4web\\MicroApple\\src\\main\\webapp\\resources\\images\\thumbnail";

		// makefolder
		File uploadPath = new File(uploadFolder, getFolder());
		logger.info("upload path :" + uploadPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		// make yyyy/MM/dd folder

		MultipartFile[] multipartFiles = mcaShopVO.getFile();

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		int cnt = 1;

		for (MultipartFile multipartFile : multipartFiles) {
			logger.info("======================");
			logger.info(multipartFile.getOriginalFilename());
			logger.info("upload File Name " + multipartFile.getSize());

			String uploadFileName = multipartFile.getOriginalFilename();

			// IE has file
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

			logger.info("only file name: " + uploadFileName);

			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				Map<String, Object> map = new HashMap<String, Object>();
				// cnt : 1씩 증가
				map.put("fprodIdx", cnt++);
				// prodFile : 3
				map.put("prodIdx", mcaShopVO.getProdIdx());
				map.put("fprodNm", uploadFileName);

				list.add(map);

				// check image type file
				if (checkImageType(saveFile)) {

					FileOutputStream thumbnail = new FileOutputStream(new File(thumbnailFolder, "s_" + uploadFileName));

					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);

					thumbnail.close();

				}

			} catch (Exception e) {
				logger.error(e.getMessage());
			}

		} // end for
			// 2.F_PROD 테이블로 다중 insert
		this.mcaShopService.insertFProd(list);

		return "redirect:/mcaShop";
	}

	// 상품 수정전 조회
	@RequestMapping(value = "/updateProduct", method = RequestMethod.GET)
	public String updateList(Model model, @RequestParam("prodIdx") String prodIdx) {

		List<McaShopVO> list = this.mcaShopService.updateList(prodIdx);

		model.addAttribute("detail", list.get(0));

		return "mcaShop/updateProduct";
	}

	// 상품 수정 POST
	@RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
	public String updateProduct(Model model, @ModelAttribute McaShopVO mcaShopVO) {

		logger.info("mcaShopVO 수정 Post : " + mcaShopVO);

		// 1. product 테이블로 insert(1행)->mcaShopVO.prodFile : 3
		this.mcaShopService.update(mcaShopVO);

		logger.info("mcaShopVO.getProdIdx() : " + mcaShopVO.getProdIdx());

		//String uploadFolder = "C:\\workspace\\microApple\\src\\main\\webapp\\resources\\images";
		String uploadFolder = "D:\\workspaces\\workspace4web\\MicroApple\\src\\main\\webapp\\resources\\images";

		//String thumbnailFolder = "C:\\workspace\\microApple\\src\\main\\webapp\\resources\\images\\thumbnail";
		String thumbnailFolder = "D:\\workspaces\\workspace4web\\MicroApple\\src\\main\\webapp\\resources\\images\\thumbnail";

		// makefolder
		File uploadPath = new File(uploadFolder, getFolder());
		logger.info("upload path :" + uploadPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		// make yyyy/MM/dd folder

		MultipartFile[] multipartFiles = mcaShopVO.getFile();

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		int cnt = 1;

		for (MultipartFile multipartFile : multipartFiles) {
			logger.info("======================");
			logger.info(multipartFile.getOriginalFilename());
			logger.info("upload File Name " + multipartFile.getSize());

			String uploadFileName = multipartFile.getOriginalFilename();

			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

			logger.info("only file name: " + uploadFileName);

			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				Map<String, Object> map = new HashMap<String, Object>();
				// cnt : 1씩 증가
				map.put("fprodIdx", cnt);
				// prodFile : 3
				map.put("prodIdx", mcaShopVO.getProdIdx());
				map.put("fprodNm", uploadFileName);

				list.add(map);

				// check image type file
				if (checkImageType(saveFile)) {

					FileOutputStream thumbnail = new FileOutputStream(new File(thumbnailFolder, "s_" + uploadFileName));

					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);

					thumbnail.close();

				}

			} catch (Exception e) {
				logger.error(e.getMessage());
			}

		} // end for
			// 2.F_PROD 테이블로 다중 insert
		logger.info("list !!!!!!!!:" + list);
		logger.info("mcaShopVO!!!!!!!!!!:" + mcaShopVO);

		this.mcaShopService.updateFProd(list);

		return "redirect:/mcaShop";

	}

	// 상품 삭제
	@RequestMapping(value = "/deleteProduct", method = RequestMethod.GET)
	public String deleteProduct(@RequestParam String prodIdx) {

		this.mcaShopService.delete(prodIdx);

		return "redirect:/mcaShop";
	}

	// 상품 구매
	@ResponseBody
	@RequestMapping(value = "/buyProduct", method = RequestMethod.POST)
	public Map<String, Object> buyProduct(Model model, @RequestParam Map<String, Object> map) {
		Map<String, Object> result = new HashMap<>();
		logger.info("구매 클릭시 가져오는 값 : " + map);
		MemberVO memberVO = new MemberVO();
		OrdrVO orderVO = new OrdrVO();
		FProdVO fprodVO = new FProdVO();
		// 상품 정보를 불러옴 사원idx 상품idx,상품가격,주문수량,상품수량 map으로 받아옴 (성공)
		// 회원 현재 포인트 조회를 하고 조회한 포인트 조건문으로 작으면 return 크면 포인트 차감 포인트 내역 적어주고
		Map<String, Object> res = this.mcaShopService.LoginMemberPoint(map);
		logger.info("구매 가입자 포인트 정보list : " + res); // (로그인한 사원 포인트 가져오기 성공)
		logger.info("상품 포인트 정보 : " + map); // (상품가격 가져오기 성공)

		int memPoint = Integer.parseInt(res.get("MEM_POINT").toString());
		int orderAmount = Integer.parseInt(map.get("prodPrice").toString())
				* Integer.parseInt(map.get("ordrProdqty").toString());
		logger.info("orderAmount : " + orderAmount);
		logger.info("memPoint : " + memPoint);

		boolean check = true;
		String reason = "";

		if (Integer.parseInt(map.get("prodQty").toString()) < Integer.parseInt(map.get("ordrProdqty").toString())) {
			check = false;
			reason = "남은 재고가 없거나 재고보다 구매수량이 많습니다.";
		} else if (orderAmount > memPoint) {
			check = false;
			reason = "가지고있는 포인트보다 구매금액이 많습니다.";
		}

		if (check) {
			// 차감 후 주문 테이블에 정보 입력 상품idx,처리구분,상품명,주문 가격, 주문 수량 값넣고 return은 주문 테이블 조회
			// 포인트에서 orderAmount(주문합) 빼고 변수에 넣고 주문 처리

			int order = memPoint - orderAmount;
			logger.info("order :" + order);
			map.put("memPoint", order); // 보유 포인트에서 주문 포인트 뺀값(성공)
			logger.info("주문가능할때 map : " + map);
			this.mcaShopService.pointDownUpdate(map); // 포인트 수정 완료!! 아싸바리
			logger.info("주문가능할때22222 map : " + map);
			this.mcaShopService.ProdQtyDown(map); // 상품 수량 감소 ㄱㄱ

			// 상품 주문 테이블 정보 넣어주고
			// ㄴ prodIdx,memIdx,상품명,주문 가격(mempoint로 되있는디),주문 수량,상품 내용
			map.put("ordrProdprice", orderAmount);
			logger.info("주문테이블 값 넣기전 map : " + map);

			this.mcaShopService.OrderInsert(map); // 주문테이블 값 넣기 성공!

			// 주문 테이블 조회해서 화면 넘겨서 주문 정보 보여주기

		}

		result.put("check", check);
		result.put("reason", reason);
		result.put("ordrIdx", map.get("ordrIdx"));

		return result;
	}

	// 주문 테이블 조회해서 화면 넘겨서 주문 정보 보여주기
	@RequestMapping(value = "/orlist", method = RequestMethod.POST)
	public String orlist(Model model,HttpSession session, @RequestParam Map<String, Object> map) {

		logger.info("주문 정보 map : " + map);
		List<OrdrVO> orlist = this.mcaShopService.OrderList(map);
		logger.info("orlist : " + orlist);
	      MemberVO member = (MemberVO)session.getAttribute("MEMBERVO");
		String memIdx = map.get("memIdx").toString();
		
		for (OrdrVO ordrVO : orlist) {
			model.addAttribute("ordrIdx" +  ordrVO.getOrdrIdx());
		}
		
		
		model.addAttribute("member", member);
		model.addAttribute("orlist", orlist);

		return "mcaShop/orlist";
	}

	// 주문 테이블 조회 aside
	@RequestMapping(value = "/orlist", method = RequestMethod.GET)
	public String orlist(Model model, HttpServletRequest request,  HttpServletResponse response,
			HttpSession session) {

		MemberVO member = (MemberVO) session.getAttribute("MEMBERVO");
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("memIdx", member.getMemIdx());

		List<OrdrVO> orlist = this.mcaShopService.OrderList(map);
		logger.info("orlist1 : " + orlist);
		
		
		if (orlist.isEmpty()) {
			map.put("memIdx", "7901");

			logger.info("orlist 개똥이: " + map);
			model.addAttribute("map", map);

			String memIdx = map.get("memIdx").toString();
			model.addAttribute("orlist", orlist);

		} else {
			String memIdx = map.get("memIdx").toString();
			logger.info("orlist.size : " + orlist.size());
			for(OrdrVO vo : orlist) {
				logger.info("ordrIdx : " + vo.getOrdrIdx());
				model.addAttribute("ordrIdx",vo.getOrdrIdx());
			}
			
			logger.info("왔다2");
		    model.addAttribute("member", member);
			model.addAttribute("orlist", orlist);
			logger.info("왔다3");
		}
		logger.info("왔다5");
		return "mcaShop/orlist";
	}

	// 포인트 메인창
	@RequestMapping(value = "/point", method = RequestMethod.GET)
	public String point(Model model, HttpServletRequest request,  HttpServletResponse response,
			HttpSession session) {

		MemberVO member = (MemberVO) session.getAttribute("MEMBERVO");

		Map<String, Object> map = this.mcaShopService.LoginMember(member);

		logger.info("map" + map);
	    model.addAttribute("member", member);
		model.addAttribute("map", map);

		return "mcaShop/point";
	}

	// 포인트 구매창
	@RequestMapping(value = "/pointBuy", method = RequestMethod.GET)
	public String pointBuy(Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {

		MemberVO member = (MemberVO) session.getAttribute("MEMBERVO");

		logger.info("member : " + member);

		model.addAttribute("member", member);

		return "mcaShop/point/pointBuy";
	}

	// 포인트 구매 POST
	@RequestMapping(value = "/pointBuy", method = RequestMethod.POST)
	public String pointBuyKakao(Model model, HttpServletRequest request, @RequestParam Map<String, Object> map) {
		logger.info("map 카카오 post : " + map);
		MemberVO member = new MemberVO();

		model.addAttribute("map", map);

		return "mcaShop/point/kakaoPay";
	}

	// 포인트 구매 POST 성공시 데이터 넣기
	@RequestMapping(value = "/pointBuy/success", method = RequestMethod.POST)
	public String pointBuySuccess(Model model, @RequestParam Map<String, Object> map) {
		logger.info("map 카카오 post 성공시 값: " + map);
		MemberVO member = new MemberVO();
		ChargeVO chargeVO = new ChargeVO();
		PointVO pointVO = new PointVO();

		// 회원 포인트 수정
		this.mcaShopService.pointUpdate(map);

		////////////////// 포인트 이력(날짜) 넣기//////////////////////
		logger.info("포인트 이력(넣기전)" + map);
		this.mcaShopService.insertChargeGo(map);

		logger.info("조회전 map : " + map);

		////////////////// 포인트 값 넣기//////////////////////////
		logger.info("포인트 값 넣기전 map" + map);
		this.mcaShopService.insertPointGo(map);

		return "redirect:/point";
	}

	// 상품 검색
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String Search(Model model, @RequestParam Map<String, Object> map) {
		logger.info("mapmapmapmap : " + map);
		if (map.get("prodNm").toString().isEmpty() ) { //빈값 검색시
			return "mcaShop/searchNull";
		}else {
			List<McaShopVO> list = this.mcaShopService.Search(map);
	
			logger.info("list : " + list);
	
			model.addAttribute("list", list);
	
			return "mcaShop/search";
		}
	}

	//주문내역삭제
	@RequestMapping("/deleteOrlist")
	public String deleteOrlist(Model model, @RequestParam Map<String,Object> map) {
		
		logger.info("deleteOrlist 삭제전 : "+map);
		
		this.mcaShopService.deleteOrlist(map);
		
		return "redirect:/orlist";
	}
	
	
}
