package lionsclubs.com.MM3.MM3_3.MM3_11;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_11Controller {
	@Resource
	private MM3_11Service service;
	
	@RequestMapping("/MM3/MM3_3/MM3_11/MM3_11.do")
	public String MM3_11(ModelMap model, @ModelAttribute("MM3_11VO") MM3_11VO vo) throws Exception{
		String message = "";
		List<MM3_11VO> resultList = null;
		float AVG = 0;
		
		/* 현재년월 */
		String thisYear = vo.getThisYear() == null ? CommonUtil.thisSessionYear() : vo.getThisYear();
		vo.setThisYear(thisYear);
		
		//로그인한사람의 해당조직을 선택한다. 
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(vo.getOrgCode() == null) {
			vo.setOrgCode(user.getSearchDistrictCode());
			user.setSearchOrganCode(vo.getOrgCode());
		}
		
		if(vo.getOrgCode() != null) {
			HashMap<String,Object> resultA = service.selectList(vo);
			resultList = (List<MM3_11VO>)resultA.get("result");
			AVG = (Float)resultA.get("AVG");
			message = "해당자료가 조회되었습니다.";
		}else{
			message = "";
		}
		
        model.addAttribute("resultList", resultList);
        model.addAttribute("avg", AVG);
        model.addAttribute("message", message);
        model.addAttribute("vo", vo);
		return "lionsclubs/com/MM3/MM3_3/MM3_11/MM3_11";
	}	
}
