package lionsclubs.com.MM2.MM2_6.MM2_33;

import java.util.Map;

import javax.annotation.Resource;

import lionsclubs.com.MM2.MM2_6.MM2_32.MM2_32Service;
import lionsclubs.com.MM2.MM2_6.MM2_32.MM2_32VO;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.web.organ.OrganService;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM2_33Controller {
	@Resource private MM2_33Service service;
	@Resource private MM2_32Service mm232Service;
	@Resource private OrganService organService;
	
	@RequestMapping("/MM2/MM2_6/MM2_33/MM2_33.do")
	public String MM2_33(ModelMap model, @ModelAttribute("MM2_33VO") MM2_33VO vo, @ModelAttribute("MM2_32VO") MM2_32VO mm232Vo) throws Exception{
		String sessionYear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		String month = vo.getMonth() == null ? CommonUtil.thisMonth() : vo.getMonth(); //이번달을 구한다
		
		/** 조직코드 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		vo.setSessionYear(sessionYear);
		vo.setMonth(month);

		mm232Vo.setOrganCode(vo.getOrganCode());
		mm232Vo.setSessionYear(vo.getSessionYear());
		mm232Vo.setMonth(vo.getMonth());
		
		model.addAttribute("summary", mm232Service.summary(mm232Vo));
		model.addAttribute("resultList", service.MM2_33(vo));
		
		return "lionsclubs/com/MM2/MM2_6/MM2_33/MM2_33";
	}
	
	@RequestMapping("/MM2/MM2_6/MM2_33/excelDownload.do")
	public String excelDownload(@RequestParam Map<String, String> params
			,Map<String, Object> modelMap
			,@ModelAttribute("MM2_33VO") MM2_33VO vo
			, @ModelAttribute("MM2_32VO") MM2_32VO mm232Vo) throws Exception {

		modelMap.put("summary", mm232Service.summary(mm232Vo));
		modelMap.put("resultList", service.MM2_33(vo));
		service.excelDownload(vo, modelMap);
		
		vo.setOrganName(organService.organCodetoName(vo.getOrganCode()));
		vo.setSessionYear(CommonUtil.calcYearMonth(vo.getSessionYear(), vo.getMonth()).substring(0, 4));
		modelMap.put("info", vo);

		return "jxlsExcelView";
	}	
}
