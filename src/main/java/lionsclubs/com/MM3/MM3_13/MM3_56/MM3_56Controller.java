package lionsclubs.com.MM3.MM3_13.MM3_56;

import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.include.profile.ProfileService;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_56Controller {
	@Resource private MM3_56Service service;
	@Resource private ProfileService profileService;	
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_13/MM3_56/MM3_56.do")
	public String MM3_56(ModelMap model, @ModelAttribute("MM3_56VO") MM3_56VO vo) throws Exception{
		/** 회기년도 세팅 */
		String sessionyear = StringUtils.isEmpty(vo.getSessionYear()) ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		/** 조직코드 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		List<MM3_56VO> resultList = service.MM3_56(vo);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		
		return "lionsclubs/com/MM3/MM3_13/MM3_56/MM3_56";
	}

	@RequestMapping("/MM3/MM3_13/MM3_56/repOrganHistoryPopup.do")
	public String repOrganHistoryPopup(ModelMap model, @ModelAttribute("MM3_56VO") MM3_56VO vo) throws Exception{
		
		model.addAttribute("resultList", service.listRepOrganHistory(vo));
		
		return "lionsclubs/com/MM3/MM3_13/MM3_56/repOrganHistoryPopup";
	}
}
