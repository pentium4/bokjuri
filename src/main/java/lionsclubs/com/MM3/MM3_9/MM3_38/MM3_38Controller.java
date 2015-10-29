package lionsclubs.com.MM3.MM3_9.MM3_38;

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
public class MM3_38Controller {
	@Resource private MM3_38Service service;
	
	@RequestMapping("/MM3/MM3_9/MM3_38/MM3_38.do")
	public String MM3_38(ModelMap model, @ModelAttribute("MM3_38VO") MM3_38VO vo) throws Exception{
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(StringUtils.isEmpty(vo.getClubCode())){
			vo.setClubCode(user.getSearchClubCode());
		}
		
		List<MM3_38VO> resultList = service.MM3_38(vo);
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		model.addAttribute("sum", service.sum(vo));
		
		return "lionsclubs/com/MM3/MM3_9/MM3_38/MM3_38";
	}	
}
