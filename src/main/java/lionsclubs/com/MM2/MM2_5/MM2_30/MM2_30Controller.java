package lionsclubs.com.MM2.MM2_5.MM2_30;

import java.util.List;

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
public class MM2_30Controller {
	@Resource private MM2_30Service service;
	
	@RequestMapping("/MM2/MM2_5/MM2_30/MM2_30.do")
	public String MM2_30(ModelMap model, @ModelAttribute("MM2_30VO") MM2_30VO vo) throws Exception{
		
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(StringUtils.isEmpty(vo.getOrganCode())){
			vo.setOrganCode(user.getSearchDistrictCode());	
		}
		
		List<MM2_30VO> resultList = service.MM2_30(vo);
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		model.addAttribute("total", service.total(vo));
		
		return "lionsclubs/com/MM2/MM2_5/MM2_30/MM2_30";
	}	
}
