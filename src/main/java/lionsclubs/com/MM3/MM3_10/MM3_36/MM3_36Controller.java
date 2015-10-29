package lionsclubs.com.MM3.MM3_10.MM3_36;

import java.util.Map;

import javax.annotation.Resource;

import lionsclubs.com.MM3.MM3_4.MM3_24.MM3_24Service;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_36Controller {
	@Resource private MM3_36Service service;
	@Autowired private MM3_24Service mm324Service;
	
	@RequestMapping("/MM3/MM3_10/MM3_36/MM3_36.do")
	public String MM3_35(ModelMap model, @ModelAttribute("MM3_36VO") MM3_36VO vo) throws Exception{
		String sessionYear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		String month = vo.getMonth() == null ? CommonUtil.thisMonth() : vo.getMonth(); //이번달을 구한다
		
		/** 조직코드 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		vo.setSessionYear(sessionYear);
		vo.setMonth(month);
		
		model.addAttribute("clubMemberShipList", service.clubMemberShip(vo));
		model.addAttribute("serviceStatusList", service.serviceStatus(vo));
		model.addAttribute("lcifStatusList", service.lcifStatus(vo));
		model.addAttribute("serviceHistoryList", service.serviceHistory(vo));
		model.addAttribute("reportSummary", service.reportSummary(vo));
		int objectRates = mm324Service.objectRates(CommonUtil.calcYearMonth(vo.getSessionYear(), vo.getMonth()));
		model.addAttribute("objectRates", objectRates);
		model.addAttribute("lcifStatusSummary", service.lcifStatusSummary(vo));
		
		return "lionsclubs/com/MM3/MM3_10/MM3_36/MM3_36";
	}
	
	@RequestMapping("/MM3/MM3_10/MM3_36/excelDownload.do")
	public String excelDownload(@RequestParam Map<String, String> params
			,Map<String, Object> modelMap
			,@ModelAttribute("MM3_36VO") MM3_36VO vo) throws Exception {

		int objectRates = mm324Service.objectRates(CommonUtil.calcYearMonth(vo.getSessionYear(), vo.getMonth()));
		modelMap.put("objectRates", CommonUtil.comma(objectRates));
		service.excelDownload(vo, modelMap);
		
		return "jettMultipleSheetsExcelView";
	}
}
