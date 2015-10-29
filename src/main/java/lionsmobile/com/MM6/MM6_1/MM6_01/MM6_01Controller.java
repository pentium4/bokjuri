package lionsmobile.com.MM6.MM6_1.MM6_01;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import lionsclubs.com.login.LoginVO;

@Controller
public class MM6_01Controller {
	
	
	@Resource private MM6_01Service service;

	@RequestMapping("/m/MM6/MM6_1/MM6_01/MM6_01.do")
	public String MM6_01(HttpServletRequest request, ModelMap model) throws Exception{
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String yearCode = user.getSearchSessionYear();
		
		MM6_01VO_PARAM vo = new MM6_01VO_PARAM();
		vo.setOrgCode(user.getSearchClubCode());
		vo.setYearCode(yearCode);
		
		MM6_01VO_CLUB_INFO clubInfo = service.selectClubInfo(vo);
		if(clubInfo == null) clubInfo = new MM6_01VO_CLUB_INFO();
		
		List<MM6_01VO_MEMBER> memberList = service.selectList(vo);
		model.addAttribute("clubInfo", clubInfo);
		model.addAttribute("memberList", memberList);
		
		return "lionsmobile/com/MM6/MM6_1/MM6_01/MM6_01";
	}	
}
