package lionsclubs.com.MM3.MM3_4.MM3_20;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import lionsclubs.com.MM3.MM3_4.MM3_20.CODE_ADD_INFO;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_20Controller {
	@Resource
	private MM3_20Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_4/MM3_20/MM3_20.do")
	public String MM3_20(ModelMap model, @ModelAttribute("MM3_20VO") MM3_20VO vo) throws Exception{
		
		List<Map<String, Object>> resultList = null;
		List<CODE_ADD_INFO> codeList = null;
		Map<String, Object> resultSum = null;
		
		if(vo.getDistrictCode() == null) {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			vo.setDistrictCode(user.getSearchDistrictCode());
			user.setSearchOrganCode(vo.getDistrictCode());
		}
		
		if(vo.getThisYear() == null) {
			vo.setThisYear(CommonUtil.thisSessionYear());
		}
		
		if(vo.getThisMonth() == null) {
			vo.setThisMonth(CommonUtil.thisMonth());			
		}
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		codeList = service.getCodeList(vo);
		
		if(codeList.size() > 0) {
			String moneyCode[] = new String[codeList.size()];
			for(int i = 0; i < codeList.size(); i++) {
				moneyCode[i] = "["+codeList.get(i).getCode()+"]";
			}
			vo.setMoneyCode(moneyCode);
			vo.setCodeList(codeList);
			resultList = service.selectList(vo);
			resultSum = service.selectSum(vo);
		}
		
		model.addAttribute("codeList", codeList);  //동적 컬럼명 리스트
		model.addAttribute("resultList", resultList);
		model.addAttribute("resultSum", resultSum);

		return "lionsclubs/com/MM3/MM3_4/MM3_20/MM3_20";
	}
	
	@RequestMapping("/MM3/MM3_4/MM3_20/excelUploadPopup.do")
	public String excelUploadPopup(ModelMap model, @ModelAttribute("MM3_20VO") MM3_20VO vo) throws Exception{
		return "lionsclubs/com/MM3/MM3_4/MM3_20/excelUploadPopup";
	}
	
	@RequestMapping("/MM3/MM3_4/MM3_20/excelUpload.do")
	public ModelAndView excelUpload(HttpServletRequest request, @ModelAttribute("MM3_20VO") MM3_20VO vo) throws Exception{
		ajaxMainView.setContentType("text/html");
		
		Map<String, Object> model = new HashMap<String, Object>();
		List<CODE_ADD_INFO> codeList = null;
		String message = "";
		
		if(vo.getDistrictCode() != null || "".equals(vo.getDistrictCode())) {
			// 동적인 컬럼의 정보를 구한다(퇴회사유코드)
			codeList = service.getCodeList(vo);
			vo.setCodeList(codeList);
		}
		message = service.excelUpload(vo, request);
		
		model.put("result", message);
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM3/MM3_4/MM3_20/excelTemplateDownload.do")
	public String excelDownload(@RequestParam Map<String, String> params
			,Map<String, Object> modelMap
			,@ModelAttribute("MM3_20VO") MM3_20VO vo) throws Exception {

		List<CODE_ADD_INFO> codeList = null;
		
		if(vo.getDistrictCode() != null || "".equals(vo.getDistrictCode())) {
			// 동적인 컬럼의 정보를 구한다(퇴회사유코드) 
			codeList = service.getCodeList(vo);
			
			if(codeList !=null){
				vo.setCodeList(codeList);
			}
		}

		service.excelTemplateDownload(vo, modelMap);

		return "genericExcelView";

	}	
}
