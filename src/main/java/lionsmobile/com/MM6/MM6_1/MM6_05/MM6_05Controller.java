package lionsmobile.com.MM6.MM6_1.MM6_05;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.web.organ.OrganService;
import lionsclubs.com.login.LoginVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM6_05Controller {
	
	@Resource private MM6_05Service service;
	@Resource private OrganService organService;

	@RequestMapping("/m/MM6/MM6_1/MM6_05/MM6_05.do")
	public String MM6_05(HttpServletRequest request, ModelMap model) throws Exception{
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String yearCode = user.getSearchSessionYear();
		
		
		MM6_05VO_PARAM vo = new MM6_05VO_PARAM();
	
		vo.setOrgCode(user.getSearchClubCode());
		vo.setYearCode(yearCode);
		
		vo.setDistrictCode(organService.getDistrictCode(user.getSearchClubCode()));
		
		List<MM6_05VO_MEMBER> memberList = service.selectClubChairManList(vo);
		model.addAttribute("memberList", memberList);
		model.addAttribute("yearTitle", String.valueOf(Integer.valueOf(yearCode) - 1) + "-" + yearCode);
		return "lionsmobile/com/MM6/MM6_1/MM6_05/MM6_05";
	}	
}
