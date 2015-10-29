package lionsclubs.com.MM1.MM1_4.MM1_20;

import java.util.Map;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM1_20Controller {
	@Resource private MM1_20Service service;
	
	@RequestMapping("/MM1/MM1_4/MM1_20/MM1_20.do")
	public String MM1_20(ModelMap model, @ModelAttribute("MM1_20VO") MM1_20VO vo) throws Exception{
		/** 회기년도 세팅 */
		if(StringUtils.isEmpty(vo.getStartDate())) {
			vo.setStartDate(String.valueOf(Integer.parseInt(CommonUtil.thisSessionYear()) - 1) + "0701");
		}
		
		if(StringUtils.isEmpty(vo.getEndDate())) {
			vo.setEndDate(String.valueOf(Integer.parseInt(CommonUtil.thisSessionYear())) + "0630");
		}
		/** 회기년도 세팅 */
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();	
		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}		
		
		return "lionsclubs/com/MM1/MM1_4/MM1_20/MM1_20";
	}
	
	@RequestMapping("/MM1/MM1_4/MM1_20/excelDownload.do")
	public String excelDownload(@RequestParam Map<String, String> params
			,Map<String, Object> modelMap
			,@ModelAttribute("MM1_20VO") MM1_20VO vo) throws Exception {

		service.excelDownload(vo, modelMap);

		return "genericExcelView";
	}
}
