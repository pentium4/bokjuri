package lionsclubs.com.MM3.MM3_3.MM3_09;

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
public class MM3_09Controller {
	@Resource
	private MM3_09Service service;
	
	@RequestMapping("/MM3/MM3_3/MM3_09/MM3_09.do")
	public String MM3_09(ModelMap model, @ModelAttribute("MM3_09VO") MM3_09VO vo) throws Exception{
		String message = "";
		List<MM3_09VO> resultList = null;
		//MM3_10VO resultTotal = new MM3_09VO();
		
		
		/*
		 * 현재년월 
		 */

		String thisYear = vo.getThisYear() == null ? CommonUtil.thisSessionYear() : vo.getThisYear();
		
		/*
		 * ETC
		 */
		//로그인한사람의 해당조직을 선택한다. 
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(vo.getOrgCode() == null) {
			vo.setOrgCode(user.getSearchDistrictCode());
			user.setSearchOrganCode(vo.getOrgCode());
		}
		
		vo.setThisYear(thisYear);
		
		
		if(vo.getOrgCode() != null) {
			resultList = service.selectList(vo);
			message = "해당자료가 조회되었습니다.";
		}else{
			//resultList = new ArrayList<MM3_10VO>();
			//message = "";
		}
		
        model.addAttribute("resultList", resultList);
        //model.addAttribute("resultTotal", resultTotal);
        model.addAttribute("message", message);
        model.addAttribute("vo", vo);
        
		return "lionsclubs/com/MM3/MM3_3/MM3_09/MM3_09";
	}	
}
