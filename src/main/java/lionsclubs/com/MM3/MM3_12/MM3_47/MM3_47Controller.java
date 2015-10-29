package lionsclubs.com.MM3.MM3_12.MM3_47;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_47Controller {
	@Resource private MM3_47Service service;
	
	@RequestMapping("/MM3/MM3_12/MM3_47/MM3_47.do")
	public String MM3_47(ModelMap model, @ModelAttribute("MM3_47VO") MM3_47VO vo) throws Exception{
		String sessionYear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		String month = vo.getMonth() == null ? CommonUtil.thisMonth() : vo.getMonth(); //이번달을 구한다
		
		/** 조직코드 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		vo.setSessionYear(sessionYear);
		vo.setMonth(month);

		model.addAttribute("resultList", service.MM3_47(vo));
		model.addAttribute("sum", service.sum(vo));

		
		return "lionsclubs/com/MM3/MM3_12/MM3_47/MM3_47";
	}
	
}
