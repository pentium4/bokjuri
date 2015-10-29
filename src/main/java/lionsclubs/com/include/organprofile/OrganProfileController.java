package lionsclubs.com.include.organprofile;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

@Controller
public class OrganProfileController {
	@Resource private OrganProfileService service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	/**
	 * 클럽정보
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/include/clubprofile/clubProfile.do")
	public String profile(ModelMap model, @ModelAttribute("clubProfileVO") OrganProfileVO vo) throws Exception{
//		model.addAttribute("profile", service.profile(vo));
		
		return "lionsclubs/include/clubprofile/clubProfile";
	}	
}
