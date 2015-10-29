package lionsclubs.com.MM3.MM3_12.MM3_45;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.pagging.Page;
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
public class MM3_45Controller {
	@Resource private MM3_45Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_12/MM3_45/MM3_45.do")
	public String MM3_45(ModelMap model, @ModelAttribute("MM3_45VO") MM3_45VO vo) throws Exception{
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
		
		Page resultList = service.MM3_45(vo);
		
        model.addAttribute("resultList", resultList.getResultList());
        model.addAttribute("paginationInfo", resultList.getPaginationInfo());
        model.addAttribute("totalCount", resultList.getTotalCount());			
		model.addAttribute("sum", service.sum(vo));		
		
		return "lionsclubs/com/MM3/MM3_12/MM3_45/MM3_45";
	}

	@RequestMapping("/MM3/MM3_12/MM3_45/impostPopup.do")
	public String impostPopup(ModelMap model, @ModelAttribute("MM3_45VO") MM3_45VO vo) throws Exception{
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			model.addAttribute("MM3_45VO", service.objectImpost(vo));
		} else {
			/** 조직코드 세션에서 가져오기 */
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			vo.setClubCode(user.getSearchClubCode());
		}
		
		return "lionsclubs/com/MM3/MM3_12/MM3_45/impostPopup";
	}
	
	@RequestMapping("/MM3/MM3_12/MM3_45/saveImpost.do")
	public ModelAndView saveImpost(ModelMap model, @ModelAttribute("MM3_45VO") MM3_45VO vo) throws Exception{
		
		if (EgovDoubleSubmitHelper.checkAndSaveToken("impost")) {
			model.put("result", service.saveImpost(vo));
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM3/MM3_12/MM3_45/deleteImpost.do")
	public ModelAndView deleteImpost(ModelMap model, @ModelAttribute("MM3_45VO") MM3_45VO vo) throws Exception{
		
		model.put("result", service.deleteImpost(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM3/MM3_12/MM3_45/excelDownload.do")
	public String excelDownload(@RequestParam Map<String, String> params
			,ModelMap modelMap
			,@ModelAttribute("MM3_45VO") MM3_45VO vo) throws Exception {

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
	@RequestMapping("/MM3/MM3_12/MM3_45/excelUploadPopup.do")
	public String excelUploadPopup(ModelMap model, @ModelAttribute("MM3_45VO") MM3_45VO vo) throws Exception{
		return "lionsclubs/com/MM3/MM3_12/MM3_45/excelUploadPopup";
	}
	
	/**
	 * 엑셀 올리기
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_12/MM3_45/excelUpload.do")
	@ResponseBody
	public ModelAndView excelUpload(HttpServletRequest request, @ModelAttribute("MM3_45VO") MM3_45VO vo) throws Exception{
		ajaxMainView.setContentType("text/html");
		Map<String, Object> model = new HashMap<String, Object>();
		
		String message = service.excelUpload(vo, request);
		model.put("result", message);
		 
		return new ModelAndView(ajaxMainView, model);
	}		
}
