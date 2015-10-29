package lionsclubs.com.MM3.MM3_13.MM3_55;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.include.profile.ProfileService;
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
public class MM3_55Controller {
	@Resource private MM3_55Service service;
	@Resource private ProfileService profileService;	
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_13/MM3_55/MM3_55.do")
	public String MM3_55(ModelMap model, @ModelAttribute("MM3_55VO") MM3_55VO vo) throws Exception{
		/** 회기년도 세팅 */
		String sessionyear = StringUtils.isEmpty(vo.getSessionYear()) ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		/** 조직코드 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		model.addAttribute("result", service.MM3_55(vo));
		
		// 이전/다음 memberNo
		model.addAttribute("memberNo", service.memberNo(vo));
		
		model.addAttribute("resultList", service.listRepOrgan(vo));
		
		return "lionsclubs/com/MM3/MM3_13/MM3_55/MM3_55";
	}
	
	@RequestMapping("/MM3/MM3_13/MM3_55/repOrganPopup.do")
	public String repOrganPopup(ModelMap model, @ModelAttribute("MM3_55VO") MM3_55VO vo) throws Exception{
		
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			model.addAttribute("MM3_55VO", service.objectRepOrgan(vo));
		}
		
		return "lionsclubs/com/MM3/MM3_13/MM3_55/repOrganPopup";
	}
	
	@RequestMapping("/MM3/MM3_13/MM3_55/saveRepOrgan.do")
	public ModelAndView saveRepOrgan(ModelMap model, @ModelAttribute("MM3_55VO") MM3_55VO vo) throws Exception{
		
		model.put("result", service.saveRepOrgan(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM3/MM3_13/MM3_55/deleteRepOrgan.do")
	public ModelAndView deleteRepOrgan(ModelMap model, @ModelAttribute("MM3_55VO") MM3_55VO vo) throws Exception{
		
		model.put("result", service.deleteRepOrgan(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
}
