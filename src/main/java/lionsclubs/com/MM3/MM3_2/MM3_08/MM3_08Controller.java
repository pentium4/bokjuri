package lionsclubs.com.MM3.MM3_2.MM3_08;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MM3_08Controller {
	@Resource
	private MM3_08Service service;
	
	@RequestMapping("/MM3/MM3_2/MM3_08/MM3_08.do")
	public String MM3_08(ModelMap model, @ModelAttribute("MM3_08VO") MM3_08VO vo) throws Exception{
		return "lionsclubs/com/MM3/MM3_2/MM3_08/MM3_08";
	}	
}
