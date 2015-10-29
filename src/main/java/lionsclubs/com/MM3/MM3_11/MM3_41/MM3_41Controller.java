package lionsclubs.com.MM3.MM3_11.MM3_41;

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

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_41Controller {
	@Resource private MM3_41Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_11/MM3_41/MM3_41.do")
	public String MM3_41(ModelMap model, @ModelAttribute("MM3_41VO") MM3_41VO vo) throws Exception{
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		/** 조직코드 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		List<MM3_41VO> resultList = service.MM3_41(vo);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		model.addAttribute("sum", service.amountSum(vo));
		
		return "lionsclubs/com/MM3/MM3_11/MM3_41/MM3_41";
	}
	
	@RequestMapping("/MM3/MM3_11/MM3_41/expendPopup.do")
	public String expendPopup(ModelMap model, @ModelAttribute("MM3_41VO") MM3_41VO vo) throws Exception{
		
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			model.addAttribute("MM3_41VO", service.objectExpend(vo));
		}
		
		return "lionsclubs/com/MM3/MM3_11/MM3_41/expendPopup";
	}
	
	@RequestMapping("/MM3/MM3_11/MM3_41/saveExpend.do")
	public ModelAndView saveExpend(ModelMap model, @ModelAttribute("MM3_41VO") MM3_41VO vo) throws Exception{
		
		model.put("result", service.saveExpend(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM3/MM3_11/MM3_41/deleteExpend.do")
	public ModelAndView deleteExpend(ModelMap model, @ModelAttribute("MM3_41VO") MM3_41VO vo) throws Exception{
		
		model.put("result", service.deleteExpend(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM3/MM3_11/MM3_41/excelDownload.do")
	public String excelDownload(@RequestParam Map<String, String> params
			,ModelMap modelMap
			,@ModelAttribute("MM3_41VO") MM3_41VO vo) throws Exception {

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
	@RequestMapping("/MM3/MM3_11/MM3_41/excelUploadPopup.do")
	public String excelUploadPopup(ModelMap model, @ModelAttribute("MM3_41VO") MM3_41VO vo) throws Exception{
		return "lionsclubs/com/MM3/MM3_11/MM3_41/excelUploadPopup";
	}
	
	/**
	 * 엑셀 올리기
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_11/MM3_41/excelUpload.do")
	@ResponseBody
	public ModelAndView excelUpload(HttpServletRequest request, @ModelAttribute("MM3_41VO") MM3_41VO vo) throws Exception{
		ajaxMainView.setContentType("text/html");
		Map<String, Object> model = new HashMap<String, Object>();
		
		String message = service.excelUpload(vo, request);
		model.put("result", message);
		 
		return new ModelAndView(ajaxMainView, model);
	}	
}
