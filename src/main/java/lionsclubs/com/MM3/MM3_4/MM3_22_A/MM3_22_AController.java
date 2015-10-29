package lionsclubs.com.MM3.MM3_4.MM3_22_A;

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
public class MM3_22_AController {
	@Resource private MM3_22_AService service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_4/MM3_22_A/MM3_22_A.do")
	public String MM3_22(ModelMap model, @ModelAttribute("MM3_22_AVO") MM3_22_AVO vo) throws Exception{
		
		/** 현재년월 세팅 */
		String sessionYear = StringUtils.isEmpty(vo.getSessionYear()) ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionYear);
		/** 현재년월 세팅 */
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String clubCode = StringUtils.isEmpty(vo.getClubCode()) ? user.getSearchClubCode() : vo.getClubCode();
		vo.setClubCode(clubCode);
		
		List<MM3_22_AVO> resultList = service.select(vo);
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		
		return "lionsclubs/com/MM3/MM3_4/MM3_22_A/MM3_22_A";
	}
	
	@RequestMapping("/MM3/MM3_4/MM3_22_A/insertClubPayment.do")
	public ModelAndView insertClubPayment(ModelMap model, @ModelAttribute("MM3_22_AVO") MM3_22_AVO vo) throws Exception{
		
		if (EgovDoubleSubmitHelper.checkAndSaveToken("mm322a")) {
			model.put("result", service.insertClubPayment(vo));
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM3/MM3_4/MM3_22_A/updateClubPayment.do")
	public ModelAndView updateClubPayment(ModelMap model, @ModelAttribute("MM3_22_AVO") MM3_22_AVO vo) throws Exception{
		
		model.put("result", service.updateClubPayment(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM3/MM3_4/MM3_22_A/deleteClubPayment.do")
	public ModelAndView deleteClubPayment(ModelMap model, @ModelAttribute("MM3_22_AVO") MM3_22_AVO vo) throws Exception{
		
		model.put("result", service.deleteClubPayment(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM3/MM3_4/MM3_22_A/objectClubPayment.do")
	public ModelAndView objectClubPayment(ModelMap model, @ModelAttribute("MM3_22_AVO") MM3_22_AVO vo) throws Exception{
		
		model.put("objectClubPayment", service.objectClubPayment(vo));
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}	
}
