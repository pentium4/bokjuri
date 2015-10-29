package lionsclubs.com.MM2.MM2_1.MM2_01;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.include.organprofile.OrganProfileService;
import lionsclubs.com.include.organprofile.OrganProfileVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

@Controller
public class MM2_01Controller {
	@Resource
	private MM2_01Service service;
	@Resource private OrganProfileService organProfileService;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM2/MM2_1/MM2_01/MM2_01.do")
	public String MM2_01(ModelMap model, @ModelAttribute("MM2_01VO") MM2_01VO vo, @ModelAttribute("organProfileVO") OrganProfileVO cpvo) throws Exception{
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear()==null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */

		/** 회원번호 및 조직 세션에서 가져오기 */
		cpvo.setYear(sessionyear);	
		cpvo.setOrganCode(vo.getOrganCode());
		cpvo = organProfileService.clubProfile(cpvo);
		if(cpvo != null){
			vo.setOrganCode(cpvo.getOrganCode());
			vo.setOrganOfficerMemberNo(cpvo.getOrganOfficerMemberNo());	/* 클럽회장 회원번호 */
			model.addAttribute("clubProfile", cpvo);
	        model.addAttribute("basicInfo", service.basicInfo(vo));
		}
        
        model.addAttribute("officerChangeHistoryList", service.officerChangeHistoryList(vo));	/* 임원변동 이력 리스트 */
        model.addAttribute("clubHistory", service.clubHistory(vo));	/* 클럽탄생 리스트 */
        model.addAttribute("clubOrgan", service.clubOrgan(vo));	/* 클럽조직구성 리스트 */
        model.addAttribute("clubCross", service.clubCross(vo));	/* 자매결연 리스트 */
        
		return "lionsclubs/com/MM2/MM2_1/MM2_01/MM2_01";
	}	
	@RequestMapping("/MM2/MM2_1/MM2_01/MM2_01_Popup1.do")
	public String MM2_01_Popup1(ModelMap model, HttpServletRequest request, @ModelAttribute("MM2_01VO") MM2_01VO vo) throws Exception{
		
		return "lionsclubs/com/MM2/MM2_1/MM2_01/MM2_01_Popup_Input";
	}
}
