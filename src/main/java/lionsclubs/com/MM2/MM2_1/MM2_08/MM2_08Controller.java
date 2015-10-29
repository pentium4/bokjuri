package lionsclubs.com.MM2.MM2_1.MM2_08;

import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM2_08Controller {
	@Resource
	private MM2_08Service service;
	
	@RequestMapping("/MM2/MM2_1/MM2_08/MM2_08.do")
	public String MM2_08(ModelMap model, @ModelAttribute("MM2_08VO") MM2_08VO vo) throws Exception{

		/** 회원번호 및 조직 세션에서 가져오기 */
		String organCode = vo.getOrganCode();
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(StringUtils.isEmpty(organCode)) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		/*
		 * 리스트
		 */
		List<MM2_08VO> memberList = service.memberList(vo);
		
		model.addAttribute("memberList", memberList);
        model.addAttribute("totalCount", memberList.size());
		
		return "lionsclubs/com/MM2/MM2_1/MM2_08/MM2_08";
	}
}
