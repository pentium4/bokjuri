package lionsclubs.com.MM3.MM3_5.MM3_29;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.pagging.Page;
import lionsclubs.com.login.LoginVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_29Controller {
	@Resource private MM3_29Service service;
	
	@RequestMapping("/MM3/MM3_5/MM3_29/MM3_29.do")
	public String MM3_29(ModelMap model, @ModelAttribute("MM3_29VO") MM3_29VO vo) throws Exception{
		
		/** 현재년월 세팅 */
		vo.setRecordCountPerPage(30);
		String thisyear = vo.getThisYear()==null ? CommonUtil.thisSessionYear() : vo.getThisYear(); //년도를 구한다
		vo.setThisYear(thisyear);
		/** 현재년월 세팅 */


		/** 회원번호 및 조직 세션에서 가져오기 */
		String upperCode = vo.getUpperCode();		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		
		if(upperCode==null || "".equals(upperCode)) {
			vo.setUpperCode(user.getDistrictCode());
		}
		
		Page page = service.List(vo);
		
        model.addAttribute("resultList", page.getResultList());
        model.addAttribute("paginationInfo", page.getPaginationInfo());
        model.addAttribute("totalCount", page.getTotalCount());
        model.addAttribute("thisYear", thisyear);
		model.addAttribute("upperCode", upperCode);	
		
		return "lionsclubs/com/MM3/MM3_5/MM3_29/MM3_29";
	}	
}
