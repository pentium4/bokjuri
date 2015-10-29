package lionsclubs.com.SM1.SM1_4.SM1_16;

import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginService;
import lionsclubs.com.login.LoginVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class SM1_16Controller {
	@Resource private SM1_16Service service;
	@Resource private LoginService loginService;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	@RequestMapping("/SM1/SM1_4/SM1_16/SM1_16.do")
	public String SM1_16(ModelMap model, @ModelAttribute("SM1_16VO") SM1_16VO vo) throws Exception{
		/** 회기년도 세팅 */
		if(vo.getSessionYear() == null) {
			vo.setSessionYear(CommonUtil.thisSessionYear());
		}
		/** 회기년도 세팅 */
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(vo.getOrganCode() == null) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		List<SM1_16VO> resultList = service.SM1_16(vo);
		model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
		
		return "lionsclubs/com/SM1/SM1_4/SM1_16/SM1_16";
	}
	
	@RequestMapping("/SM1/SM1_4/SM1_16/updatePassword.do")
	public ModelAndView updatePassword(ModelMap model, @ModelAttribute("SM1_16VO") SM1_16VO vo) throws Exception{
		
		model.put("result", service.updatePassword(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}		
}
