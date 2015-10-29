package lionsclubs.com.MM5.MM5_1.MM5_04;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MM5_04Controller {
	@Resource
	private MM5_04Service service;
	
	@RequestMapping("/MM5/MM5_1/MM5_04/MM5_04.do")
	public String MM5_04(ModelMap model, @ModelAttribute("MM5_04VO") MM5_04VO vo) throws Exception{
		return "lionsclubs/com/MM5/MM5_1/MM5_04/MM5_04";
	}	
}
