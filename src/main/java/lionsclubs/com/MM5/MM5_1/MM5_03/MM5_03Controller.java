package lionsclubs.com.MM5.MM5_1.MM5_03;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MM5_03Controller {
	@Resource
	private MM5_03Service service;
	
	@RequestMapping("/MM5/MM5_1/MM5_03/MM5_03.do")
	public String MM5_03(ModelMap model, @ModelAttribute("MM5_03VO") MM5_03VO vo) throws Exception{
		return "lionsclubs/com/MM5/MM5_1/MM5_03/MM5_03";
	}	
}
