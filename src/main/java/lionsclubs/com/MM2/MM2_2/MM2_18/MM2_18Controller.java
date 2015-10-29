package lionsclubs.com.MM2.MM2_2.MM2_18;

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
public class MM2_18Controller {
	@Resource private MM2_18Service service;
	
	@RequestMapping("/MM2/MM2_2/MM2_18/MM2_18.do")
	public String MM2_18(ModelMap model, @ModelAttribute("MM2_18VO") MM2_18VO vo) throws Exception{
		
		/** 현재년월 세팅 */
		String sessionYear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		String month = vo.getMonth() == null ? CommonUtil.thisMonth() : vo.getMonth(); //이번달을 구한다
		vo.setSessionYear(sessionYear);
		vo.setMonth(month);
		/** 현재년월 세팅 */
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		String organCode = vo.getOrganCode();
		String memberNo = vo.getMemberNo();
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		if(StringUtils.isEmpty(memberNo)) {
			memberNo = user.getSearchId();
			vo.setMemberNo(memberNo);
		}
		
		if(StringUtils.isEmpty(organCode)) {
			vo.setOrganCode(user.getSearchClubCode());
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
        
		return "lionsclubs/com/MM2/MM2_2/MM2_18/MM2_18";
	}	
	
}
