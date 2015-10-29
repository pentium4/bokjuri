package lionsclubs.com.MM3.MM3_1.MM3_04;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_04Controller {
	@Resource private MM3_04Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_1/MM3_04/MM3_04.do")
	public String MM3_04(HttpServletRequest request, ModelMap model, @ModelAttribute("MM3_04VO") MM3_04VO vo) throws Exception{
		String message = "";
		List<MM3_04VO> resultList = null;
		
		/*
		 * 현재년월 
		 */
		String thisYear = vo.getThisYear() == null ? CommonUtil.thisSessionYear() : vo.getThisYear();
		vo.setThisYear(thisYear);
		
		/*
		 * ETC
		 */
		
		//로그인한사람의 해당조직을 선택한다. 
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(vo.getOrgCode() == null || "".equals(vo.getOrgCode())) {
			vo.setOrgCode(user.getSearchDistrictCode());
		}
		
		vo.setThisYear(thisYear);
		vo.setCurrThisYear(CommonUtil.thisSessionYear());

		if(vo.getChkbox_dstTitleOrClubTitle() == null) {
			vo.setChkbox_dstTitleOrClubTitle("d");  
		}
		
		if(vo.getOrgCode() != null) {
			resultList = service.selectList(vo);
			message = "해당자료가 조회되었습니다.";
		}else{
			message = "";
		}
		
        model.addAttribute("resultList", resultList);
        model.addAttribute("message", message);
        model.addAttribute("vo", vo);
		
		return "lionsclubs/com/MM3/MM3_1/MM3_04/MM3_04";
	}
}
