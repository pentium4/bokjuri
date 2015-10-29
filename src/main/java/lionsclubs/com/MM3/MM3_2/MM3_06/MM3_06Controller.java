package lionsclubs.com.MM3.MM3_2.MM3_06;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MM3_06Controller {
	@Resource
	private MM3_06Service service;
	
	@RequestMapping("/MM3/MM3_2/MM3_06/MM3_06.do")
	public String MM3_06(ModelMap model, @ModelAttribute("MM3_06VO") MM3_06VO vo) throws Exception{
		return "lionsclubs/com/MM3/MM3_2/MM3_06/MM3_06";
	}	
}
