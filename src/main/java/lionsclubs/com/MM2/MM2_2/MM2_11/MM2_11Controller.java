package lionsclubs.com.MM2.MM2_2.MM2_11;

import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.include.organprofile.OrganProfileService;
import lionsclubs.com.include.organprofile.OrganProfileVO;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM2_11Controller {
	@Resource private MM2_11Service service;
	@Resource private OrganProfileService organProfileService;
	
	@RequestMapping("/MM2/MM2_2/MM2_11/MM2_11.do")
	public String MM2_11(ModelMap model, @ModelAttribute("MM2_11VO") MM2_11VO vo, @ModelAttribute("clubProfileVO") OrganProfileVO cpvo) throws Exception{
		
		String sessionYear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		String month = vo.getMonth() == null ? CommonUtil.thisMonth() : vo.getMonth(); //이번달을 구한다
		
		/** 조직코드 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		vo.setSessionYear(sessionYear);
		vo.setMonth(month);
		
		List<MM2_11VO> resultList = service.selectList(vo);
		model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
        model.addAttribute("sum", service.paymentSum(vo));
        model.addAttribute("cDate",service.cDate(vo));
		
		return "lionsclubs/com/MM2/MM2_2/MM2_11/MM2_11";
	}	
}
