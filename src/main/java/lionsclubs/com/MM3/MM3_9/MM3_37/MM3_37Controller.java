package lionsclubs.com.MM3.MM3_9.MM3_37;

import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_37Controller {
	@Resource private MM3_37Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_9/MM3_37/MM3_37.do")
	public String MM3_35(ModelMap model, @ModelAttribute("MM3_37VO") MM3_37VO vo) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String districtCode = StringUtils.isEmpty(vo.getDistrictCode()) ? user.getSearchDistrictCode() : vo.getDistrictCode();
		vo.setDistrictCode(districtCode);
		
		return "lionsclubs/com/MM3/MM3_9/MM3_37/MM3_37";
	}
	
	@RequestMapping("/MM3/MM3_9/MM3_37/listMerit.do")
	public ModelAndView listMerit(ModelMap model, @ModelAttribute("MM3_37VO") MM3_37VO vo) throws Exception{
		
		model.addAttribute("objectBasicMerit", service.objectBasicMerit(vo));
		
		List<MM3_37VO> resultList = service.listMerit(vo);
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		
		model.addAttribute("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}	
	
	@RequestMapping("/MM3/MM3_9/MM3_37/saveMerit.do")
	public ModelAndView saveMerit(ModelMap model, @ModelAttribute("MM3_37VO") MM3_37VO vo) throws Exception{
		
		model.addAttribute("result", service.saveMerit(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}	
}
