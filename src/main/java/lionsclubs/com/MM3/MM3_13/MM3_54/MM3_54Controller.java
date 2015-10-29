package lionsclubs.com.MM3.MM3_13.MM3_54;

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
public class MM3_54Controller {
	@Resource private MM3_54Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_13/MM3_54/MM3_54.do")
	public String MM3_54(ModelMap model, @ModelAttribute("MM3_54VO") MM3_54VO vo) throws Exception{
		/** 회기년도 세팅 */
		if(StringUtils.isEmpty(vo.getStartYearMonth())) {
			vo.setStartYearMonth(String.valueOf(Integer.parseInt(CommonUtil.thisSessionYear()) - 1) + "07");
		}
		
		if(StringUtils.isEmpty(vo.getEndYearMonth())) {
			vo.setEndYearMonth(String.valueOf(Integer.parseInt(CommonUtil.thisSessionYear())) + "06");
		}
		/** 회기년도 세팅 */
        
		/** 조직코드 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}		
		
		List<Map<String,Object>> headInfo = service.headInfo(vo);
		if(headInfo.size() > 0){
			List<Map<String, Object>> resultList = service.MM3_54(vo);
	        model.addAttribute("resultList", resultList);
	        model.addAttribute("sum", service.sum(vo));
	        model.addAttribute("totalCount", resultList.size());
		}
		
		model.addAttribute("headList", headInfo);
		model.addAttribute("listMemberNo", service.listMemberNo(vo));
		
		return "lionsclubs/com/MM3/MM3_13/MM3_54/MM3_54";
	}
	
	@RequestMapping("/MM3/MM3_13/MM3_54/excelDownload.do")
	public String excelDownload(@RequestParam Map<String, String> params
			,ModelMap modelMap
			,@ModelAttribute("MM3_54VO") MM3_54VO vo) throws Exception {

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
	@RequestMapping("/MM3/MM3_13/MM3_54/excelUploadPopup.do")
	public String excelUploadPopup(ModelMap model, @ModelAttribute("MM3_54VO") MM3_54VO vo) throws Exception{
		return "lionsclubs/com/MM3/MM3_13/MM3_54/excelUploadPopup";
	}
	
	/**
	 * 엑셀 올리기
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_13/MM3_54/excelUpload.do")
	@ResponseBody
	public ModelAndView excelUpload(HttpServletRequest request, @ModelAttribute("MM3_54VO") MM3_54VO vo) throws Exception{
		ajaxMainView.setContentType("text/html");
		Map<String, Object> model = new HashMap<String, Object>();
		
		String message = service.excelUpload(vo, request);
		model.put("result", message);
		 
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM3/MM3_13/MM3_54/deleteSecretary.do")
	public ModelAndView deleteSecretary(ModelMap model, @ModelAttribute("MM3_54VO") MM3_54VO vo) throws Exception{
		
		model.put("result", service.deleteSecretary(vo));
		 
		return new ModelAndView(ajaxMainView, model);
	}	
	
}
