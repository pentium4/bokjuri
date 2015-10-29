package lionsclubs.com.MM3.MM3_6.MM3_31;

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
public class MM3_31Controller {
	@Resource private MM3_31Service service;
	
	@RequestMapping("/MM3/MM3_6/MM3_31/MM3_31.do")
	public String MM3_31(ModelMap model, @ModelAttribute("MM3_31VO") MM3_31VO vo) throws Exception{
		
		/** 현재년월 세팅 */
		String sessionYear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionYear);
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		List<MM3_31VO> resultList = service.List(vo);
		
        model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
        
		return "lionsclubs/com/MM3/MM3_6/MM3_31/MM3_31";
	}
}
