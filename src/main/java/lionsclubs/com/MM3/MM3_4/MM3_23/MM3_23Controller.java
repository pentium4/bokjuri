package lionsclubs.com.MM3.MM3_4.MM3_23;

import java.util.List;

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
public class MM3_23Controller {
	@Resource private MM3_23Service service;
	
	@RequestMapping("/MM3/MM3_4/MM3_23/MM3_23.do")
	public String MM3_23(ModelMap model, @ModelAttribute("MM3_23VO") MM3_23VO vo) throws Exception{
		/** 현재년월 세팅 */
		if(vo.getThisYear() == null) {
			vo.setThisYear(CommonUtil.thisSessionYear());
		}
		/** 현재년월 세팅 */
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getThisOrganCode())){
			vo.setThisOrganCode(user.getSearchDistrictCode());
		}
		
		List<MM3_23VO> resultList = service.List(vo);
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		
		return "lionsclubs/com/MM3/MM3_4/MM3_23/MM3_23";
	}
	
}
