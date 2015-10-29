package lionsclubs.com.MM3.MM3_1.MM3_02;

import lionsclubs.com.MM3.MM3_1.COMM.LIST_VO;
import lionsclubs.com.MM3.MM3_1.COMM.ListController;
import lionsclubs.com.login.LoginVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_02Controller extends ListController {
	
	@RequestMapping("/MM3/MM3_1/MM3_02/MM3_02.do")
	public String MM3_02(ModelMap model, @ModelAttribute("LIST_VO") LIST_VO vo) throws Exception{
		if(vo.getOrgCode() == null) {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			vo.setOrgCode(user.getSearchDistrictCode());
			user.setSearchOrganCode(vo.getOrgCode());
		}
		vo.setAppKindCode("9000");
		vo.setAppDescCode("1000");
		vo.setList(super.selectList(vo));
		return "lionsclubs/com/MM3/MM3_1/MM3_02/MM3_02";
	}
}
