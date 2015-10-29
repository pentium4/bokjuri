package lionsclubs.com.MM1.MM1_1.MM1_06;

import javax.annotation.Resource;

import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MM1_06Controller {
	@Resource private MM1_06Service service;
	
	@RequestMapping("/MM1/MM1_1/MM1_06/MM1_06.do")
	public String MM1_06(ModelMap model, @ModelAttribute("MM1_06VO") MM1_06VO vo) throws Exception{				
		
		Page page = service.selectList(vo);
			
		
        model.addAttribute("resultList", page.getResultList());
        model.addAttribute("paginationInfo", page.getPaginationInfo());
        model.addAttribute("totalCount", page.getTotalCount());		
		
		return "lionsclubs/com/MM1/MM1_1/MM1_06/MM1_06";
	}	
}
