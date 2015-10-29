package lionsclubs.com.SM1.SM1_4.SM1_13;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.MM7.MM7_1.MM7_01.MM7_01VO;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginService;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class SM1_13Controller {
	@Resource private SM1_13Service service;
	@Resource private LoginService loginService;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	@RequestMapping("/SM1/SM1_4/SM1_13/SM1_13.do")
	public String selectList(ModelMap model, @ModelAttribute("SM1_13VO") SM1_13VO vo) throws Exception{
        
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		List<SM1_13VO> resultList = service.SM1_13(vo);
		model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
		
		return "lionsclubs/com/SM1/SM1_4/SM1_13/SM1_13";
	}
	
	@RequestMapping("/SM1/SM1_4/SM1_13/sessionChange.do")
	public ModelAndView deleteDoc(HttpServletRequest request, @ModelAttribute("MM7_01VO") MM7_01VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		LoginVO loginVO = new LoginVO();
		loginVO.setId(vo.getMemberNo());
		model.put("result", loginService.sessionChange(loginVO));
		
		return new ModelAndView(ajaxMainView, model);
	}		
}
