package lionsclubs.com.MM3.MM3_4.MM3_21;

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
public class MM3_21Controller {
	@Resource private MM3_21Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
		
	@RequestMapping("/MM3/MM3_4/MM3_21/MM3_21.do")
	public String MM3_21(ModelMap model, @ModelAttribute("MM3_21VO") MM3_21VO vo) throws Exception{
		
		/** 현재년 세팅 */
		String getSessionYear = StringUtils.isEmpty(vo.getSessionYear()) ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(getSessionYear);
		/** 현재년 세팅 */
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		if(StringUtils.isEmpty(vo.getDistrictCode())) {
			vo.setDistrictCode(user.getSearchDistrictCode());
		}
		
		model.addAttribute("resultList", service.selectList(vo));
		model.addAttribute("expensesSum", service.expensesSum(vo));
		model.addAttribute("objectPaymentSettle", service.objectPaymentSettle(vo));
		
		return "lionsclubs/com/MM3/MM3_4/MM3_21/MM3_21";
	}
	
	/**
	 * 정산처리
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_4/MM3_21/confirm.do")
	public ModelAndView confirm(ModelMap model, @ModelAttribute("MM3_21VO") MM3_21VO vo) throws Exception{
		
		model.put("result", service.confirm(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 정산취소
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_4/MM3_21/confirmCancel.do")
	public ModelAndView confirmCancel(ModelMap model, @ModelAttribute("MM3_21VO") MM3_21VO vo) throws Exception{
		
		model.put("result", service.confirmCancel(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 정산확정
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_4/MM3_21/confirmLock.do")
	public ModelAndView confirmLock(ModelMap model, @ModelAttribute("MM3_21VO") MM3_21VO vo) throws Exception{
		
		model.put("result", service.confirmLock(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
}
