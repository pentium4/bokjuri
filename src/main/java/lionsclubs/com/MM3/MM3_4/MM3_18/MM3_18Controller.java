package lionsclubs.com.MM3.MM3_4.MM3_18;

import java.util.HashMap;
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
public class MM3_18Controller {
	@Resource private MM3_18Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	/**
	 * 입주클럽관리비 부과
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_4/MM3_18/MM3_18.do")
	public String MM3_18(ModelMap model, @ModelAttribute("MM3_18VO") MM3_18VO vo) throws Exception{
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String districtCode = StringUtils.isEmpty(vo.getDistrictCode()) ? user.getSearchDistrictCode() : vo.getDistrictCode();
		vo.setDistrictCode(districtCode);
		
		String sessionYear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear();
		vo.setSessionYear(sessionYear);
		
		model.addAttribute("resultList", service.selectList(vo));
		model.addAttribute("expensesSum", service.expensesSum(vo));
		
		return "lionsclubs/com/MM3/MM3_4/MM3_18/MM3_18";
	}
	
	/**
	 * 엑셀올리기 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_4/MM3_18/excelUploadPopup.do")
	public String excelUploadPopup(ModelMap model, @ModelAttribute("MM3_18VO") MM3_18VO vo) throws Exception{
		return "lionsclubs/com/MM3/MM3_4/MM3_18/excelUploadPopup";
	}
	
	/**
	 * 입주클럽관리비 부과 엑셀 올리기
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_4/MM3_18/excelUpload.do")
	@ResponseBody
	public ModelAndView excelUpload(HttpServletRequest request, @ModelAttribute("MM3_18VO") MM3_18VO vo) throws Exception{
		ajaxMainView.setContentType("text/html");
		Map<String, Object> model = new HashMap<String, Object>();
		String message = service.excelUpload(vo, request);
		model.put("result", message);
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 입주클럽관리비 부과 엑셀 템플릿 받기
	 * @param params
	 * @param modelMap
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_4/MM3_18/excelTemplateDownload.do")
	public String excelDownload(@RequestParam Map<String, String> params
			,Map<String, Object> modelMap
			,@ModelAttribute("MM3_18VO") MM3_18VO vo) throws Exception {

		service.excelTemplateDownload(vo, modelMap);

		return "genericExcelView";

	}	
}
