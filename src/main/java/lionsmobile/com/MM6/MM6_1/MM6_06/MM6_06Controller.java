package lionsmobile.com.MM6.MM6_1.MM6_06;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MM6_06Controller {
	@RequestMapping("/m/MM6/MM6_1/MM6_06/MM6_06.do")
	public String MM6_01(ModelMap model) throws Exception{
		return "lionsmobile/com/MM6/MM6_1/MM6_06/MM6_06";
	}	
}
