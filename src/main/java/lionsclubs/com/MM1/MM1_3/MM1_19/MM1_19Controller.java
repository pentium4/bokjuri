package lionsclubs.com.MM1.MM1_3.MM1_19;

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
public class MM1_19Controller {
	@Resource private MM1_19Service service;
	
	/**
	 * 회원 입/출 현황
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_3/MM1_19/MM1_19.do")
	public String MM1_19(ModelMap model, @ModelAttribute("MM1_19VO") MM1_19VO vo) throws Exception{
		
		/** 회기년도 세팅 */
		String sessionyear = StringUtils.isEmpty(vo.getSessionYear()) ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();		
		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		List<MM1_19VO> resultList = service.MM1_19(vo);
        model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
		
		return "lionsclubs/com/MM1/MM1_3/MM1_19/MM1_19";
	}
}
