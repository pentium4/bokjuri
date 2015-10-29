package lionsclubs.com.MM2.MM2_2.MM2_14;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import lionsclubs.com.MM1.MM1_2.MM1_09.MM1_09Service;
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
public class MM2_14Controller {
	@Resource private MM2_14Service service;	
	@Resource private MM1_09Service mm109Service;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	@RequestMapping("/MM2/MM2_2/MM2_14/MM2_14.do")
	public String MM2_14(ModelMap model, @ModelAttribute("MM2_14VO") MM2_14VO vo) throws Exception{
		/** 현재년월 세팅 */
		String sessionYear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		String month = vo.getMonth() == null ? CommonUtil.thisMonth() : vo.getMonth(); //이번달을 구한다
		vo.setSessionYear(sessionYear);
		vo.setMonth(month);
		/** 현재년월 세팅 */

		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		List<MM2_14VO> resultList = service.MM2_14(vo);
        model.addAttribute("totalCount", resultList.size());
        model.addAttribute("resultList", resultList);
        model.addAttribute("total", service.total(vo));
        
		return "lionsclubs/com/MM2/MM2_2/MM2_14/MM2_14";
	}	
	
	@RequestMapping("/MM2/MM2_2/MM2_14/impostPopup.do")
	public String impostPopup(ModelMap model, @ModelAttribute("MM2_14VO") MM2_14VO vo) throws Exception{
		/*
		 * 분류항목코드 : classItemCode
		 */
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("gubn", "B");
        model.addAttribute("classList", mm109Service.SelectClassList(map));
        
        if(StringUtils.isNotEmpty(vo.getIdnNo())){
        	model.addAttribute("MM2_14VO", service.detail(vo));
        }
        
		return "lionsclubs/com/MM2/MM2_2/MM2_14/impostPopup";
	}
	
	@RequestMapping("/MM2/MM2_2/MM2_14/listImpostMember.do")
	public ModelAndView listImpostMember(ModelMap model, @ModelAttribute("MM2_14VO") MM2_14VO vo) throws Exception{
		model.put("resultList", service.listImpostMember(vo));	
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}	
	
	@RequestMapping("/MM2/MM2_2/MM2_14/insertImpost.do")
	public ModelAndView insertImport(ModelMap model, @ModelAttribute("MM2_14VO") MM2_14VO vo) throws Exception{
		model.put("result", service.insertImpost(vo));
		return new ModelAndView(ajaxMainView, model);
	}

	@RequestMapping("/MM2/MM2_2/MM2_14/updateImpost.do")
	public ModelAndView updateImpost(ModelMap model, @ModelAttribute("MM2_14VO") MM2_14VO vo) throws Exception{
		model.put("result", service.updateImpost(vo));
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM2/MM2_2/MM2_14/deleteImpost.do")
	public ModelAndView deleteImpost(ModelMap model, @ModelAttribute("MM2_14VO") MM2_14VO vo) throws Exception{
		model.put("result", service.deleteImpost(vo));
		return new ModelAndView(ajaxMainView, model);
	}	
	
	@RequestMapping("/MM2/MM2_2/MM2_14/paymentPopup.do")
	public String paymentPopup(ModelMap model, @ModelAttribute("MM2_14VO") MM2_14VO vo) throws Exception{
		
		model.addAttribute("MM2_14VO", service.detail(vo));
        model.addAttribute("resultList", service.listPaymentMember(vo));
        
		return "lionsclubs/com/MM2/MM2_2/MM2_14/paymentPopup";
	}
	
	@RequestMapping("/MM2/MM2_2/MM2_14/payment.do")
	public ModelAndView payment(ModelMap model, @ModelAttribute("MM2_14VO") MM2_14VO vo) throws Exception{
		
		model.put("result", service.payment(vo));
		return new ModelAndView(ajaxMainView, model);
	}	
}
