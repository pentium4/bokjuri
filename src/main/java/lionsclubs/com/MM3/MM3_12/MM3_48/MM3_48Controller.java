package lionsclubs.com.MM3.MM3_12.MM3_48;

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

import egovframework.com.cmm.util.EgovDoubleSubmitHelper;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_48Controller {
	@Resource private MM3_48Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_12/MM3_48/MM3_48.do")
	public String MM3_48(ModelMap model, @ModelAttribute("MM3_48VO") MM3_48VO vo) throws Exception{
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		/** 조직코드 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		List<MM3_48VO> resultList = service.MM3_48(vo);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		model.addAttribute("sum", service.amountSum(vo));
		
		return "lionsclubs/com/MM3/MM3_12/MM3_48/MM3_48";
	}
	
	@RequestMapping("/MM3/MM3_12/MM3_48/incomePopup.do")
	public String incomePopup(ModelMap model, @ModelAttribute("MM3_48VO") MM3_48VO vo) throws Exception{
		
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			model.addAttribute("MM3_48VO", service.objectIncome(vo));
		}
		
		return "lionsclubs/com/MM3/MM3_12/MM3_48/incomePopup";
	}
	
	@RequestMapping("/MM3/MM3_12/MM3_48/saveIncome.do")
	public ModelAndView saveIncome(ModelMap model, @ModelAttribute("MM3_48VO") MM3_48VO vo) throws Exception{
		
		if (EgovDoubleSubmitHelper.checkAndSaveToken("income")) {
			model.put("result", service.saveIncome(vo));
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM3/MM3_12/MM3_48/deleteIncome.do")
	public ModelAndView deleteIncome(ModelMap model, @ModelAttribute("MM3_48VO") MM3_48VO vo) throws Exception{
		
		model.put("result", service.deleteIncome(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
}
