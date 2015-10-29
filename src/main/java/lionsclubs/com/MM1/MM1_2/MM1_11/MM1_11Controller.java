package lionsclubs.com.MM1.MM1_2.MM1_11;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MM1_11Controller {
	@Resource
	private MM1_11Service service;
	
	@RequestMapping("/MM1/MM1_2/MM1_11/MM1_11.do")
	public String MM1_11(ModelMap model, @ModelAttribute("MM1_11VO") MM1_11VO vo) throws Exception{
		return "lionsclubs/com/MM1/MM1_2/MM1_11/MM1_11";
	}	
}
