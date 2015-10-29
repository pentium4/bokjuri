package lionsclubs.com.MM3.MM3_5.MM3_26;

import javax.annotation.Resource;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import java.util.List;

@Controller
public class MM3_26Controller {
	@Resource
	private MM3_26Service service;
	
	@RequestMapping("/MM3/MM3_5/MM3_26/MM3_26.do")
	public String MM3_26(ModelMap model, @ModelAttribute("MM3_26VO") MM3_26VO vo) throws Exception{
		/** 현재년월 세팅 */
		String thisyear = vo.getThisYear()==null ? CommonUtil.thisSessionYear() : vo.getThisYear(); //년도를 구한다
		vo.setThisYear(thisyear);
		
		/** 개인정보 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(vo.getOrganCode()==null || "".equals(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		List<MM3_26VO> resultList = service.List(vo);
		model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());		
		return "lionsclubs/com/MM3/MM3_5/MM3_26/MM3_26";
	}	
}
