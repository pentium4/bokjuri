package lionsclubs.com.SM1.SM1_2.SM1_05;

import javax.annotation.Resource;

import lionsclubs.com.SM1.SM1_2.SM1_04.SM1_04Service;
import lionsclubs.com.SM1.SM1_2.SM1_04.SM1_04VO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SM1_05Controller {
	@Resource private SM1_05Service service;
	@Resource private SM1_04Service sm104Service;
	
	@RequestMapping("/SM1/SM1_2/SM1_05/SM1_05.do")
	public String SM1_05(ModelMap model, @ModelAttribute("SM1_05VO") SM1_05VO vo) throws Exception{
		SM1_04VO sm104vo = new SM1_04VO();
		sm104vo.setOrganCode(vo.getOrganCode());
		SM1_04VO result = sm104Service.SM1_04(sm104vo);
		model.addAttribute("result", result);
		model.addAttribute("organCode", sm104Service.organCode(sm104vo));	// 이전/다음 조직코드

		model.addAttribute("organHistoryCount", sm104Service.organHistoryCount(sm104vo));
		model.addAttribute("history", sm104Service.organHistory(sm104vo));
		
		vo.setOrganCode(result.getOrganCode());
		model.addAttribute("organHistoryList", service.organHistoryList(vo));
		
		return "lionsclubs/com/SM1/SM1_2/SM1_05/SM1_05";
	}
}
