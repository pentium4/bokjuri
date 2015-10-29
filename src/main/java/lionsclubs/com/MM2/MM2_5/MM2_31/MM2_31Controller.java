package lionsclubs.com.MM2.MM2_5.MM2_31;

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
public class MM2_31Controller {
	@Resource private MM2_31Service service;
	
	@RequestMapping("/MM2/MM2_5/MM2_31/MM2_31.do")
	public String MM2_31(ModelMap model, @ModelAttribute("MM2_31VO") MM2_31VO vo) throws Exception{
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(StringUtils.isEmpty(vo.getOrganCode())){
			vo.setOrganCode(user.getSearchOrganCode());	
		}
		
		List<MM2_31VO> resultList = service.list(vo);
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());		
		
		return "lionsclubs/com/MM2/MM2_5/MM2_31/MM2_31";
	}	
}
