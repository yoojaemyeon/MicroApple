package micro.apple.groupware.test.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import micro.apple.groupware.main.service.MainService;
import micro.apple.groupware.test.service.TestService;


@Controller
public class TestController {
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);

	
	
	@Autowired
	TestService testService;
	
//조직도 페이지
	@RequestMapping("test2")
	public String test(Model model){
		logger.info("testPage");
		
		return "main/test2";
	}
	
}
