package lionsclubs.com.MM3.MM3_12.MM3_52;

import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_52Controller {
	@Resource private MM3_52Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_12/MM3_52/MM3_52.do")
	public String MM3_52(ModelMap model, @ModelAttribute("MM3_52VO") MM3_52VO vo) throws Exception{
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */		
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		List<MM3_52VO> resultList = service.MM3_52(vo);
        model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
        model.addAttribute("sum", service.sum(vo));
        
		return "lionsclubs/com/MM3/MM3_12/MM3_52/MM3_52";
	}	
	
}
