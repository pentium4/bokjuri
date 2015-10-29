package lionsclubs.com.MM3.MM3_8.MM3_35;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MM3_35Controller {
	@Resource
	private MM3_35Service service;
	
	@RequestMapping("/MM3/MM3_8/MM3_35/MM3_35.do")
	public String MM3_35(ModelMap model, @ModelAttribute("MM3_35VO") MM3_35VO vo) throws Exception{
		return "lionsclubs/com/MM3/MM3_8/MM3_35/MM3_35";
	}	
}
