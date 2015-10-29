package lionsclubs.com.MM4.MM4_1.MM4_04;

import javax.annotation.Resource;

import lionsclubs.com.MM3.MM3_1.COMM.LIST_VO;
import lionsclubs.com.MM3.MM3_1.COMM.ListController;
import lionsclubs.com.cmm.web.organ.OrganService;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM4_04Controller extends ListController{
	@Resource private OrganService organService;

	@RequestMapping("/MM4/MM4_1/MM4_04/MM4_04.do")
	public String MM4_04(ModelMap model, @ModelAttribute("LIST_VO") LIST_VO vo) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrgCode())){
			String lvl = organService.getOrgLevel(user.getSearchOrganCode());
			if("1".equals(lvl) || "2".equals(lvl)){
				vo.setOrgCode(user.getSearchOrganCode());	
			} else {
				vo.setOrgCode(user.getSearchComplexCode());
			}
		}
		
		vo.setAppKindCode("9000");
		vo.setAppDescCode("1030"); //복합연합역대총장
		vo.setList(super.selectList(vo));
		return "lionsclubs/com/MM4/MM4_1/MM4_04/MM4_04";
	}	
}
