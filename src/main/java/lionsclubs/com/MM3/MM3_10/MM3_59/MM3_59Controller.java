package lionsclubs.com.MM3.MM3_10.MM3_59;

import java.util.List;
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
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_59Controller {
	@Resource private MM3_59Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_10/MM3_59/MM3_59.do")
	public String MM3_59(ModelMap model, @ModelAttribute("MM3_59VO") MM3_59VO vo) throws Exception{
		/** 회기년도 세팅 */
		if(StringUtils.isEmpty(vo.getSessionYear())){
			vo.setSessionYear(CommonUtil.thisSessionYear());
		}
		/** 회기년도 세팅 */

		if(vo.getMonth() == null){
			vo.setMonth(CommonUtil.thisMonth());
		}
		
		/** 조직코드 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())){
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		List<MM3_59VO> resultList = service.MM3_59(vo);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		model.addAttribute("sum", service.sum(vo));
		
		return "lionsclubs/com/MM3/MM3_10/MM3_59/MM3_59";
	}
	
	@RequestMapping("/MM3/MM3_10/MM3_59/excelDownload.do")
	public String excelDownload(@RequestParam Map<String, String> params
			,Map<String, Object> modelMap
			,@ModelAttribute("MM3_59VO") MM3_59VO vo) throws Exception {

		service.excelDownload(vo, modelMap);
		
		return "jettMultipleSheetsExcelView";
	}
}
