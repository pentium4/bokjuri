package lionsclubs.com.MM3.MM3_4.MM3_22;

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
public class MM3_22Controller {
	@Resource private MM3_22Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_4/MM3_22/MM3_22.do")
	public String MM3_22(ModelMap model, @ModelAttribute("MM3_22VO") MM3_22VO vo) throws Exception{
		/** 현재년월 세팅 */
		String sessionYear = StringUtils.isEmpty(vo.getSessionYear()) ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionYear);
		/** 현재년월 세팅 */
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String clubCode = StringUtils.isEmpty(vo.getClubCode()) ? user.getSearchClubCode() : vo.getClubCode();
		vo.setClubCode(clubCode);
		
		List<MM3_22VO> resultList = service.MM3_22(vo);
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());		
		
		return "lionsclubs/com/MM3/MM3_4/MM3_22/MM3_22";
	}
	
	
	@RequestMapping("/MM3/MM3_4/MM3_22/payment.do")
	public ModelAndView insertClubPayment(ModelMap model, @ModelAttribute("MM3_22VO") MM3_22VO vo) throws Exception{
		
		if (EgovDoubleSubmitHelper.checkAndSaveToken()) {
			model.put("result", service.payment(vo));	
		}
		
		return new ModelAndView(ajaxMainView, model);
	}	

	@RequestMapping("/MM3/MM3_4/MM3_22/listClubPayment.do")
	public ModelAndView listClubPayment(ModelMap model, @ModelAttribute("MM3_22VO") MM3_22VO vo) throws Exception{
		
		model.put("resultList", service.listClubPayment(vo));
		model.addAttribute("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}	

	
}
