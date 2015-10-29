package lionsclubs.com.MM2.MM2_1.MM2_09;

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
public class MM2_09Controller {
	@Resource private MM2_09Service service;
	
	@RequestMapping("/MM2/MM2_1/MM2_09/MM2_09.do")
	public String MM2_09(ModelMap model, @ModelAttribute("MM2_09VO") MM2_09VO vo) throws Exception{
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** getSessionYear 세팅 */
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		if(StringUtils.isEmpty(vo.getMemberNo())) {
			vo.setMemberNo(user.getSearchId());
		}
		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		/*
		 * 리스트
		 */
		List<MM2_09VO> resultList = service.List(vo);
        model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
		
		return "lionsclubs/com/MM2/MM2_1/MM2_09/MM2_09";
	}	
}
