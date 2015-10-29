package lionsclubs.com.MM2.MM2_2.MM2_12;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.include.organprofile.OrganProfileService;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM2_12Controller {
	@Resource private MM2_12Service service;
	@Resource private OrganProfileService organProfileService;
	
	@RequestMapping("/MM2/MM2_2/MM2_12/MM2_12.do")
	public String MM2_12(ModelMap model, @ModelAttribute("MM2_12VO") MM2_12VO vo) throws Exception{
		String sessionYear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		String month = vo.getMonth() == null ? CommonUtil.thisMonth() : vo.getMonth(); //이번달을 구한다
		
		/** 조직코드 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		vo.setSessionYear(sessionYear);
		vo.setMonth(month);

		model.addAttribute("resultList", service.MM2_12(vo));
		model.addAttribute("sum", service.sum(vo));
		
		return "lionsclubs/com/MM2/MM2_2/MM2_12/MM2_12";
	}	
}
