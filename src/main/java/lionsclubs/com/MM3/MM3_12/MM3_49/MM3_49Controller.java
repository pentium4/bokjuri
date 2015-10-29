package lionsclubs.com.MM3.MM3_12.MM3_49;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.pagging.Page;
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
public class MM3_49Controller {
	@Resource private MM3_49Service service;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	@RequestMapping("/MM3/MM3_12/MM3_49/MM3_49.do")
	public String MM3_49(ModelMap model, @ModelAttribute("MM3_49VO") MM3_49VO vo) throws Exception{
		/** 현재년월 세팅 */
		String sessionYear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionYear);
		/** 현재년월 세팅 */

		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		Page resultList = service.MM3_49(vo);
		
        model.addAttribute("resultList", resultList.getResultList());
        model.addAttribute("paginationInfo", resultList.getPaginationInfo());
        model.addAttribute("totalCount", resultList.getTotalCount());			
        model.addAttribute("total", service.total(vo));
        
		return "lionsclubs/com/MM3/MM3_12/MM3_49/MM3_49";
	}	
	
	@RequestMapping("/MM3/MM3_12/MM3_49/impostPopup.do")
	public String impostPopup(ModelMap model, @ModelAttribute("MM3_49VO") MM3_49VO vo) throws Exception{
        
        if(StringUtils.isNotEmpty(vo.getIdnNo())){
        	model.addAttribute("MM3_49VO", service.objectImpost(vo));
        }
        
		return "lionsclubs/com/MM3/MM3_12/MM3_49/impostPopup";
	}
	
	@RequestMapping("/MM3/MM3_12/MM3_49/listDistrictMoney.do")
	public ModelAndView listImpost(ModelMap model, @ModelAttribute("MM3_49VO") MM3_49VO vo) throws Exception{
		model.put("resultList", service.listImpost(vo));	
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}	
	
	@RequestMapping("/MM3/MM3_12/MM3_49/saveImpost.do")
	public ModelAndView insertImport(ModelMap model, @ModelAttribute("MM3_49VO") MM3_49VO vo) throws Exception{
		model.put("result", service.saveImpost(vo));
		return new ModelAndView(ajaxMainView, model);
	}

	@RequestMapping("/MM3/MM3_12/MM3_49/deleteImpost.do")
	public ModelAndView deleteImpost(ModelMap model, @ModelAttribute("MM3_49VO") MM3_49VO vo) throws Exception{
		model.put("result", service.deleteImpost(vo));
		return new ModelAndView(ajaxMainView, model);
	}	
	
	@RequestMapping("/MM3/MM3_12/MM3_49/paymentPopup.do")
	public String paymentPopup(ModelMap model, @ModelAttribute("MM3_49VO") MM3_49VO vo) throws Exception{
		
		model.addAttribute("MM3_49VO", service.objectImpost(vo));
		model.addAttribute("resultList", service.listPayment(vo));
		
		return "lionsclubs/com/MM3/MM3_12/MM3_49/paymentPopup";
	}
	
	@RequestMapping("/MM3/MM3_12/MM3_49/payment.do")
	public ModelAndView payment(ModelMap model, @ModelAttribute("MM3_49VO") MM3_49VO vo) throws Exception{
		
		model.put("result", service.payment(vo));
		return new ModelAndView(ajaxMainView, model);
	}	
}
