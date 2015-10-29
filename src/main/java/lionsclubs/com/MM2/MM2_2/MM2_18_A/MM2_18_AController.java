package lionsclubs.com.MM2.MM2_2.MM2_18_A;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import lionsclubs.com.MM2.MM2_2.MM2_18.MM2_18Service;
import lionsclubs.com.MM2.MM2_2.MM2_18.MM2_18VO;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM2_18_AController {
	@Resource private MM2_18Service mm218Service;
	
	@RequestMapping("/MM2/MM2_2/MM2_18_A/MM2_18_A.do")
	public String MM2_18(ModelMap model, @ModelAttribute("MM2_18VO") MM2_18VO vo) throws Exception{
		
		/** 현재년월 세팅 */
		String sessionYear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		String month = vo.getMonth() == null ? CommonUtil.thisMonth() : vo.getMonth(); //이번달을 구한다
		vo.setSessionYear(sessionYear);
		vo.setMonth(month);
		/** 현재년월 세팅 */
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		vo.setPaymentDefect("Y");	/* 결손금 */
		List<Map<String,Object>> headInfo = mm218Service.headInfo(vo);
		if(headInfo.size() > 0){
			List<Map<String, Object>> resultList = mm218Service.List(vo);
			Map<String,Object> paySum = mm218Service.paymentSum(vo);
	        model.addAttribute("resultList", resultList);
	        model.addAttribute("paySum", paySum);
	        model.addAttribute("totalCount", resultList.size());
		}
		
        model.addAttribute("headList", headInfo);
        
		return "lionsclubs/com/MM2/MM2_2/MM2_18_A/MM2_18_A";
	}	
	
}
