package lionsmobile.com.MM6.MM6_1.MM6_07;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MM6_07Controller {
	@Resource private MM6_07Service service;
	
	@RequestMapping("/m/MM6/MM6_1/MM6_07/MM6_07.do")
	public String MM6_07(ModelMap model,@ModelAttribute("MM6_07VO") MM6_07VO vo) throws Exception{
			
        model.addAttribute("resultList", service.selectList(vo));
//        model.addAttribute("paginationInfo", page.getPaginationInfo());
//        model.addAttribute("totalCount", page.getTotalCount());	
		
		return "lionsmobile/com/MM6/MM6_1/MM6_07/MM6_07";
	}	
}
