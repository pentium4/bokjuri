package lionsclubs.com.MM3.MM3_12.MM3_46;

import java.util.Map;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.pagging.Page;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovDoubleSubmitHelper;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_46Controller {
	@Resource private MM3_46Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_12/MM3_46/MM3_46.do")
	public String MM3_46(ModelMap model, @ModelAttribute("MM3_46VO") MM3_46VO vo) throws Exception{
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		/** 조직코드 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		if(vo.getClubCode() == null){
			vo.setClubCode(user.getSearchClubCode());	
		}
		
		Page resultList = service.MM3_46(vo);
        model.addAttribute("resultList", resultList.getResultList());
        model.addAttribute("paginationInfo", resultList.getPaginationInfo());
        model.addAttribute("totalCount", resultList.getTotalCount());
		model.addAttribute("sum", service.sum(vo));
		
		return "lionsclubs/com/MM3/MM3_12/MM3_46/MM3_46";
	}
	
	@RequestMapping("/MM3/MM3_12/MM3_46/paymentPopup.do")
	public String paymentPopup(ModelMap model, @ModelAttribute("MM3_46VO") MM3_46VO vo) throws Exception{
		
		if(StringUtils.isNotEmpty(vo.getPaymentIdnNo())){
			model.addAttribute("MM3_46VO", service.objectPayment(vo));
		} else if(StringUtils.isNotEmpty(vo.getIdnNo())){
			model.addAttribute("MM3_46VO", service.objectImpost(vo));
		}
		
		return "lionsclubs/com/MM3/MM3_12/MM3_46/paymentPopup";
	}
	
	@RequestMapping("/MM3/MM3_12/MM3_46/savePayment.do")
	public ModelAndView savePayment(ModelMap model, @ModelAttribute("MM3_46VO") MM3_46VO vo) throws Exception{
		
		if (EgovDoubleSubmitHelper.checkAndSaveToken("payment")) {
			model.put("result", service.savePayment(vo));
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM3/MM3_12/MM3_46/deletePayment.do")
	public ModelAndView deletePayment(ModelMap model, @ModelAttribute("MM3_46VO") MM3_46VO vo) throws Exception{
		
		model.put("result", service.deletePayment(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM3/MM3_12/MM3_46/listPayment.do")
	public ModelAndView listPayment(ModelMap model, @ModelAttribute("MM3_46VO") MM3_46VO vo) throws Exception{
		
		model.put("resultList", service.listPayment(vo));
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}	
	
	@RequestMapping("/MM3/MM3_12/MM3_46/excelDownload.do")
	public String excelDownload(@RequestParam Map<String, String> params
			,ModelMap modelMap
			,@ModelAttribute("MM3_46VO") MM3_46VO vo) throws Exception {

		service.excelDownload(vo, modelMap);
		
		return "jettMultipleSheetsExcelView";
	}
	
	@RequestMapping("/MM3/MM3_12/MM3_46/receiptPrintPopup.do")
	public String receiptPrintPopup(ModelMap model, @ModelAttribute("MM3_46VO") MM3_46VO vo) throws Exception{
		
		model.put("result", service.objectPayment(vo));
		model.put("treasurer", service.objectTreasurer(vo));
		
		return "lionsclubs/com/MM3/MM3_12/MM3_46/receiptPrintPopup";
	}
}

