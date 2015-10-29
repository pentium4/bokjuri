package lionsclubs.com.MM3.MM3_2.MM3_07;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MM3_07Controller {
	@Resource
	private MM3_07Service service;
	
	@RequestMapping("/MM3/MM3_2/MM3_07/MM3_07.do")
	public String MM3_07(ModelMap model, @ModelAttribute("MM3_07VO") MM3_07VO vo) throws Exception{
		return "lionsclubs/com/MM3/MM3_2/MM3_07/MM3_07";
	}	
}
