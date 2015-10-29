package lionsclubs.com.MM4.MM4_1.MM4_03;

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
public class MM4_03Controller extends ListController {

	@Resource
	private OrganService organService;

	@RequestMapping("/MM4/MM4_1/MM4_03/MM4_03.do")
	public String MM4_03(ModelMap model, @ModelAttribute("LIST_VO") LIST_VO vo) throws Exception{
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(vo.getOrgCode() == null) {
			if(StringUtils.isEmpty(user.getSearchOrganCode())){
				vo.setOrgCode(user.getSearchAssociationCode());
			}else{
				String lvl = organService.getOrgLevel(user.getSearchOrganCode());
				if("1".equals(lvl) || "2".equals(lvl)){
					vo.setOrgCode(user.getSearchOrganCode());
				}else{
					vo.setOrgCode(user.getSearchAssociationCode());
				}
			}
			//user.setSearchOrganCode(vo.getOrgCode());
		}
		user.setSearchOrganCode(vo.getOrgCode());

		vo.setAppKindCode("9000");
		vo.setAppDescCode("1020"); //복합연합 의장,이사역임조회
		vo.setList(super.selectList(vo));
		return "lionsclubs/com/MM4/MM4_1/MM4_03/MM4_03";
	}	
}
