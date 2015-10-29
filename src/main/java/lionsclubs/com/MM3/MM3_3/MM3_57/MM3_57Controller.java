package lionsclubs.com.MM3.MM3_3.MM3_57;

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
public class MM3_57Controller {
	@Resource private MM3_57Service service;
	@Resource private ProfileService profileService;	
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_3/MM3_57/MM3_57.do")
	public String MM3_57(ModelMap model, @ModelAttribute("MM3_57VO") MM3_57VO vo) throws Exception{
		/** 회기년도 세팅 */
		if(vo.getSessionYear() == null) {
			vo.setSessionYear(CommonUtil.thisSessionYear());
		}
		/** 회기년도 세팅 */
		
		/** 조직코드 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		List<MM3_57VO> resultList = service.MM3_57(vo);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());		
		
		return "lionsclubs/com/MM3/MM3_3/MM3_57/MM3_57";
	}

}
