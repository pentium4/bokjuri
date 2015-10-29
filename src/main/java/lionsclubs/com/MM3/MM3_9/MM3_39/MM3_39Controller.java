package lionsclubs.com.MM3.MM3_9.MM3_39;

import java.util.List;
import java.util.Map;

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
public class MM3_39Controller {
	@Resource private MM3_39Service service;
	
	@RequestMapping("/MM3/MM3_9/MM3_39/MM3_39.do")
	public String MM3_35(ModelMap model, @ModelAttribute("MM3_39VO") MM3_39VO vo) throws Exception{
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String districtCode = StringUtils.isEmpty(vo.getDistrictCode()) ? user.getSearchDistrictCode() : vo.getDistrictCode();
		vo.setDistrictCode(districtCode);
		
		List<Map<String, Object>> resultList = service.MM3_39(vo);
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		model.addAttribute("sum", service.sum(vo));
		model.addAttribute("eventList", service.listEvent(vo));
		
		return "lionsclubs/com/MM3/MM3_9/MM3_39/MM3_39";
	}	
}
