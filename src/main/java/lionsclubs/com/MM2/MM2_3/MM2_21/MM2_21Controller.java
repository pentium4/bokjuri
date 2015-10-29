package lionsclubs.com.MM2.MM2_3.MM2_21;

import javax.annotation.Resource;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM2_21Controller {
	@Resource
	private MM2_21Service service;
	
	@RequestMapping("/MM2/MM2_3/MM2_21/MM2_21.do")
	public String MM2_21(ModelMap model, @ModelAttribute("MM2_21VO") MM2_21VO vo) throws Exception{
		
		if(vo.getSessionYear() == null) {
			vo.setSessionYear(CommonUtil.thisSessionYear());
		}
		if(vo.getOrganCode() == null) {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			vo.setOrganCode(user.getSearchClubCode());
		}
		
        model.addAttribute("dataList", service.selectList(vo));
        model.addAttribute("dataListSum", service.selectListSum(vo));
        
		return "lionsclubs/com/MM2/MM2_3/MM2_21/MM2_21";
	}	
}
