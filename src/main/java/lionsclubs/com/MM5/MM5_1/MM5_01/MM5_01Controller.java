package lionsclubs.com.MM5.MM5_1.MM5_01;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MM5_01Controller {
	@Resource
	private MM5_01Service service;
	
	@RequestMapping("/MM5/MM5_1/MM5_01/MM5_01.do")
	public String MM5_01(ModelMap model, @ModelAttribute("MM5_01VO") MM5_01VO vo) throws Exception{
		return "lionsclubs/com/MM5/MM5_1/MM5_01/MM5_01";
	}	
}
