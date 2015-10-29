package lionsmobile.com.MM6.MM6_1.MM6_03;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.web.organ.OrganService;
import lionsclubs.com.login.LoginVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM6_03Controller {
	@Resource private MM6_03Service service;
	@Resource private OrganService organService;

	@RequestMapping("/m/MM6/MM6_1/MM6_03/MM6_03.do")
	public String MM6_03(HttpServletRequest request, ModelMap model) throws Exception{
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String yearCode = user.getSearchSessionYear();
		
		MM6_03VO_PARAM vo = new MM6_03VO_PARAM();
		vo.setOrgCode(organService.getDistrictCode(user.getSearchClubCode()));
		vo.setYearCode(yearCode);
		
		
		List<MM6_03VO_MENU> menuList = service.selectMenuList(vo);
		model.addAttribute("menuList", menuList);
		return "lionsmobile/com/MM6/MM6_1/MM6_03/MM6_03";
	}
	
	@RequestMapping("/m/MM6/MM6_1/MM6_03/selectList.do")
	public String selectList(HttpServletRequest request, ModelMap model, @ModelAttribute("MM6_03VO_PARAM") MM6_03VO_PARAM vo) throws Exception{
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String yearCode = user.getSearchSessionYear();

		vo.setOrgCode(organService.getDistrictCode(user.getSearchClubCode()));
		vo.setYearCode(yearCode);
		
		
		List<MM6_03VO_MEMBER> memberList = service.selectMemberList(vo);
		model.addAttribute("memberList", memberList);
		return "lionsmobile/com/MM6/MM6_1/MM6_03/MM6_03_sub";
	}
}
