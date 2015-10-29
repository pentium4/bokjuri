package lionsclubs.com.MM3.MM3_7.MM3_33_A;

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
public class MM3_33_AController {
	@Resource private MM3_33_AService service;
	
	@RequestMapping("/MM3/MM3_7/MM3_33_A/MM3_33_A.do")
	public String MM3_33_A(ModelMap model, @ModelAttribute("MM3_33_AVO") MM3_33_AVO vo) throws Exception{
		String sessionYear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionYear);
		
		/** 조직코드 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		/*
		 * 리스트
		 */
		List<MM3_33_AVO> resultList = service.List(vo);
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		model.addAttribute("sum", service.sum(vo));
		
		return "lionsclubs/com/MM3/MM3_7/MM3_33_A/MM3_33_A";
	}
}
