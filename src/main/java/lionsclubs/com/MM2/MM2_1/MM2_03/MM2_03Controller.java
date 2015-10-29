package lionsclubs.com.MM2.MM2_1.MM2_03;

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
public class MM2_03Controller {
	@Resource
	private MM2_03Service service;
	
	@RequestMapping("/MM2/MM2_1/MM2_03/MM2_03.do")
	public String MM2_03(ModelMap model, @ModelAttribute("MM2_03VO") MM2_03VO vo) throws Exception{
		
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */

		/** 회원번호 및 조직 세션에서 가져오기 */
		String organCode = vo.getOrganCode();
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(StringUtils.isEmpty(organCode)) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		List<MM2_03VO> resultList = service.List(vo);
        model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());	

		return "lionsclubs/com/MM2/MM2_1/MM2_03/MM2_03";
	}	
}
