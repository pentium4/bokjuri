package lionsclubs.com.SM1.SM1_4.SM1_15;

import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
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
public class SM1_15Controller {
	@Resource private SM1_15Service service;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	@RequestMapping("/SM1/SM1_4/SM1_15/SM1_15.do")
	public String selectList(ModelMap model, @ModelAttribute("SM1_15VO") SM1_15VO vo) throws Exception{
        
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		List<SM1_15VO> resultList = service.SM1_15(vo);
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		
		return "lionsclubs/com/SM1/SM1_4/SM1_15/SM1_15";
	}
	
	@RequestMapping("/SM1/SM1_4/SM1_15/calculateConfirm.do")
	public ModelAndView calculateConfirm(ModelMap model, @ModelAttribute("SM1_15VO") SM1_15VO vo) throws Exception{
		model.put("result", service.calculateConfirm(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}	

	@RequestMapping("/SM1/SM1_4/SM1_15/calculateConfirmCancel.do")
	public ModelAndView calculateConfirmCancel(ModelMap model, @ModelAttribute("SM1_15VO") SM1_15VO vo) throws Exception{
		model.put("result", service.calculateConfirmCancel(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}

	@RequestMapping("/SM1/SM1_4/SM1_15/calculateConfirmLock.do")
	public ModelAndView calculateConfirmLock(ModelMap model, @ModelAttribute("SM1_15VO") SM1_15VO vo) throws Exception{
		model.put("result", service.calculateConfirmLock(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/SM1/SM1_4/SM1_15/calculateConfirmLockCancel.do")
	public ModelAndView calculateConfirmLockCancel(ModelMap model, @ModelAttribute("SM1_15VO") SM1_15VO vo) throws Exception{
		model.put("result", service.calculateConfirmLockCancel(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
}
