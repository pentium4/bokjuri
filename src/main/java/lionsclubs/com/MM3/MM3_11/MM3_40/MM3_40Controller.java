package lionsclubs.com.MM3.MM3_11.MM3_40;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovDoubleSubmitHelper;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_40Controller {
	@Resource private MM3_40Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_11/MM3_40/MM3_40.do")
	public String MM3_40(ModelMap model, @ModelAttribute("MM3_40VO") MM3_40VO vo) throws Exception{
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		/** 조직코드 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		List<MM3_40VO> resultList = service.MM3_40(vo);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		model.addAttribute("sum", service.amountSum(vo));
		
		return "lionsclubs/com/MM3/MM3_11/MM3_40/MM3_40";
	}
	
	@RequestMapping("/MM3/MM3_11/MM3_40/incomePopup.do")
	public String incomePopup(ModelMap model, @ModelAttribute("MM3_40VO") MM3_40VO vo) throws Exception{
		
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			model.addAttribute("MM3_40VO", service.objectIncome(vo));
		}
		
		return "lionsclubs/com/MM3/MM3_11/MM3_40/incomePopup";
	}
	
	@RequestMapping("/MM3/MM3_11/MM3_40/saveIncome.do")
	public ModelAndView saveIncome(ModelMap model, @ModelAttribute("MM3_40VO") MM3_40VO vo) throws Exception{
		
		if (EgovDoubleSubmitHelper.checkAndSaveToken("income")) {
			model.put("result", service.saveIncome(vo));
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM3/MM3_11/MM3_40/deleteIncome.do")
	public ModelAndView deleteIncome(ModelMap model, @ModelAttribute("MM3_40VO") MM3_40VO vo) throws Exception{
		
		model.put("result", service.deleteIncome(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM3/MM3_11/MM3_40/excelDownload.do")
	public String excelDownload(@RequestParam Map<String, String> params
			,ModelMap modelMap
			,@ModelAttribute("MM3_40VO") MM3_40VO vo) throws Exception {

		service.excelDownload(vo, modelMap);
		
		return "jettMultipleSheetsExcelView";
	}
	
	/**
	 * 엑셀올리기 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_11/MM3_40/excelUploadPopup.do")
	public String excelUploadPopup(ModelMap model, @ModelAttribute("MM3_40VO") MM3_40VO vo) throws Exception{
		return "lionsclubs/com/MM3/MM3_11/MM3_40/excelUploadPopup";
	}
	
	/**
	 * 엑셀 올리기
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_11/MM3_40/excelUpload.do")
	@ResponseBody
	public ModelAndView excelUpload(HttpServletRequest request, @ModelAttribute("MM3_40VO") MM3_40VO vo) throws Exception{
		ajaxMainView.setContentType("text/html");
		Map<String, Object> model = new HashMap<String, Object>();
		
		String message = service.excelUpload(vo, request);
		model.put("result", message);
		 
		return new ModelAndView(ajaxMainView, model);
	}	
}
