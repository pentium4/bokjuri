package lionsclubs.com.MM4.MM4_2.MM4_08;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.web.organ.OrganService;
import lionsclubs.com.login.LoginVO;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM4_08Controller {
	@Resource
	private MM4_08Service service;
	@Resource
	private OrganService organService;
	
	@RequestMapping("/MM4/MM4_2/MM4_08/MM4_08.do")
	public String MM4_08(ModelMap model, @ModelAttribute("MM4_08VO_PARAM") MM4_08VO_PARAM vo) throws Exception{
		String message = "";
		List<MM4_08VO_PARAM> resultList = new ArrayList<MM4_08VO_PARAM>();
		
		if(vo.getYearCode() == null) {
			vo.setYearCode(CommonUtil.thisSessionYear());
		}
		
		if(vo.getOrgCode() == null) {
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			vo.setOrgCode(user.getSearchAssociationCode());
			user.setSearchOrganCode(vo.getOrgCode());
		}
		
		if(StringUtils.isNotEmpty(vo.getOrgCode())) {
			vo.setLvl(organService.getOrgLevel(vo.getOrgCode()));
			resultList = service.selectList(vo);
			message = "해당자료가 조회되었습니다.";
		}

        model.addAttribute("list", resultList);
        model.addAttribute("message", message);
		return "lionsclubs/com/MM4/MM4_2/MM4_08/MM4_08";
	}	
}
