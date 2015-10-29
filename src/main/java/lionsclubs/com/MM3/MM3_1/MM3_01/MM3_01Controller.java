package lionsclubs.com.MM3.MM3_1.MM3_01;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.include.organprofile.OrganProfileService;
import lionsclubs.com.include.organprofile.OrganProfileVO;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_01Controller {
	@Resource private MM3_01Service service;
	@Resource private OrganProfileService organProfileService;
	
	@RequestMapping("/MM3/MM3_1/MM3_01/MM3_01.do")
	public String MM3_01(ModelMap model, @ModelAttribute("MM3_01VO") MM3_01VO vo) throws Exception{
		/** 현재년월 세팅 */
		String sessionYear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionYear);
		/** 현재년월 세팅 */
		
		// 2014-09-11 : 조직코드 :
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}

		OrganProfileVO dpvo = new OrganProfileVO();
		dpvo.setYear(sessionYear);
		dpvo.setOrganCode(vo.getOrganCode());
		dpvo = organProfileService.districtProfile(dpvo);
		if(dpvo != null){
			model.addAttribute("districtProfile", dpvo);
			vo.setOrganCode(dpvo.getOrganCode());	/* 지구코드 */
			vo.setAssociationCode(dpvo.getAssociationCode());	/* 소속연합회코드 */
			vo.setOrganOfficerMemberNo(dpvo.getOrganOfficerMemberNo());	/* 지구총재 회원번호 */
		}
		
		user.setSearchOrganCode(vo.getOrganCode());
		
		// 지구기본
		model.addAttribute("baseInfo", service.basicInfo(vo));
		
		// 조직책임자 변경이력 리스트
		model.addAttribute("officerChangeHistoryList", service.officerChangeHistoryList(vo));
		
		// 지구임원조회
		model.addAttribute("districtMemberList", service.districtMemberList(vo));
		
		
		return "lionsclubs/com/MM3/MM3_1/MM3_01/MM3_01";
	}	
}
