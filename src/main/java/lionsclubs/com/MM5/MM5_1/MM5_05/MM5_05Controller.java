package lionsclubs.com.MM5.MM5_1.MM5_05;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MM5_05Controller {
	@Resource
	private MM5_05Service service;
	
	@RequestMapping("/MM5/MM5_1/MM5_05/MM5_05.do")
	public String MM5_05(ModelMap model, @ModelAttribute("MM5_05VO") MM5_05VO vo) throws Exception{
		return "lionsclubs/com/MM5/MM5_1/MM5_05/MM5_05";
	}	
}
