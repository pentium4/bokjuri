package lionsclubs.com.MM5.MM5_1.MM5_02;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MM5_02Controller {
	@Resource
	private MM5_02Service service;
	
	@RequestMapping("/MM5/MM5_1/MM5_02/MM5_02.do")
	public String MM5_02(ModelMap model, @ModelAttribute("MM5_02VO") MM5_02VO vo) throws Exception{
		return "lionsclubs/com/MM5/MM5_1/MM5_02/MM5_02";
	}	
}
