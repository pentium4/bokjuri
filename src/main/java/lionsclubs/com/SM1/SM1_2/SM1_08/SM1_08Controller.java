package lionsclubs.com.SM1.SM1_2.SM1_08;

import javax.annotation.Resource;

import lionsclubs.com.SM1.SM1_2.SM1_07.SM1_07Service;
import lionsclubs.com.SM1.SM1_2.SM1_07.SM1_07VO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SM1_08Controller {
	@Resource private SM1_08Service service;
	@Resource private SM1_07Service sm107Service;
	
	@RequestMapping("/SM1/SM1_2/SM1_08/SM1_08.do")
	public String SM1_08(ModelMap model, @ModelAttribute("SM1_08VO") SM1_08VO vo) throws Exception{
		
		SM1_07VO sm107vo = new SM1_07VO();
		
		// 그룹코드 리스트
		model.addAttribute("resultList", sm107Service.SM1_07(sm107vo));
		
		return "lionsclubs/com/SM1/SM1_2/SM1_08/SM1_08";
	}	
}
