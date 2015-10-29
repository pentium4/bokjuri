package lionsclubs.com.MM3.MM3_12.MM3_53;

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

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_53Controller {
	@Resource private MM3_53Service service;
	
	@RequestMapping("/MM3/MM3_12/MM3_53/MM3_53.do")
	public String MM3_53(ModelMap model, @ModelAttribute("MM3_53VO") MM3_53VO vo) throws Exception{
		
		/** 현재년월 세팅 */
		String sessionYear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		String month = vo.getMonth() == null ? CommonUtil.thisMonth() : vo.getMonth(); //이번달을 구한다
		vo.setSessionYear(sessionYear);
		vo.setMonth(month);
		/** 현재년월 세팅 */
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		List<Map<String, Object>> resultList = null;
		Map<String,Object> paySum = null;
		
		List<Map<String,Object>> headInfo = service.headInfo(vo);
		if(headInfo.size() > 0){
			resultList = service.List(vo);
			paySum = service.paymentSum(vo);
	        model.addAttribute("resultList", resultList);
	        model.addAttribute("paySum", paySum);
	        model.addAttribute("totalCount", resultList.size());
		}
		
        model.addAttribute("headList", headInfo);
        
		return "lionsclubs/com/MM3/MM3_12/MM3_53/MM3_53";
	}
}
