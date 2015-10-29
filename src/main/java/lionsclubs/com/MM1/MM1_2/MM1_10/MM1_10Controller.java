package lionsclubs.com.MM1.MM1_2.MM1_10;

import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.include.profile.ProfileService;
import lionsclubs.com.include.profile.ProfileVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

@Controller
public class MM1_10Controller {
	@Resource private MM1_10Service service;
	@Resource private ProfileService serviceprofile;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	@RequestMapping("/MM1/MM1_2/MM1_10/MM1_10.do")
	public String MM1_10(ModelMap model, @ModelAttribute("profileVO") ProfileVO pvo, @ModelAttribute("MM1_10VO") MM1_10VO vo) throws Exception{
		/*
		 * 회원정보
		 */
		pvo = serviceprofile.profile(pvo);
		model.addAttribute("profile", pvo);
		
		vo.setMemberNo(pvo.getMemberNo());
		/*
		 * 리스트
		 */
		List<MM1_10VO> resultList = service.MM1_10(vo);
        model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
        
		return "lionsclubs/com/MM1/MM1_2/MM1_10/MM1_10";
	}	
	
	
}
