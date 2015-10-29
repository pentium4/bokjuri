package lionsclubs.com.MM3.MM3_12.MM3_50;

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
public class MM3_50Controller {
	@Resource private MM3_50Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_12/MM3_50/MM3_50.do")
	public String MM3_50(ModelMap model, @ModelAttribute("MM3_50VO") MM3_50VO vo) throws Exception{
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		if(vo.getMonth() == null) {
			vo.setMonth(CommonUtil.thisMonth());
		}
		
		/** 조직코드 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		List<MM3_50VO> resultList = service.MM3_50(vo);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		model.addAttribute("sum", service.amountSum(vo));
		
		return "lionsclubs/com/MM3/MM3_12/MM3_50/MM3_50";
	}
	
	@RequestMapping("/MM3/MM3_12/MM3_50/expendPopup.do")
	public String expendPopup(ModelMap model, @ModelAttribute("MM3_50VO") MM3_50VO vo) throws Exception{
		
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			model.addAttribute("MM3_50VO", service.objectExpend(vo));
		}
		
		return "lionsclubs/com/MM3/MM3_12/MM3_50/expendPopup";
	}
	
	@RequestMapping("/MM3/MM3_12/MM3_50/saveExpend.do")
	public ModelAndView saveExpend(ModelMap model, @ModelAttribute("MM3_50VO") MM3_50VO vo) throws Exception{
		
		if (EgovDoubleSubmitHelper.checkAndSaveToken("expend")) {
			model.put("result", service.saveExpend(vo));
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM3/MM3_12/MM3_50/deleteExpend.do")
	public ModelAndView deleteExpend(ModelMap model, @ModelAttribute("MM3_50VO") MM3_50VO vo) throws Exception{
		
		model.put("result", service.deleteExpend(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
}
