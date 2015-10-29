package lionsclubs.com.MM2.MM2_1.MM2_04;

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
public class MM2_04Controller {
	@Resource private MM2_04Service service;
	
	@RequestMapping("/MM2/MM2_1/MM2_04/MM2_04.do")
	public String MM2_04(ModelMap model, @ModelAttribute("MM2_04VO") MM2_04VO vo) throws Exception{
		/** 현재년 세팅 */
		String sessionYear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionYear);
		/** 현재년 세팅 */
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		if(StringUtils.isEmpty(vo.getMemberNo())) {
			vo.setMemberNo(user.getSearchId());
		}
		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		List<MM2_04VO> listVo = service.List(vo);
        model.addAttribute("resultList", listVo);
        model.addAttribute("totalCount", listVo.size());
		
		return "lionsclubs/com/MM2/MM2_1/MM2_04/MM2_04";
	}	
}
