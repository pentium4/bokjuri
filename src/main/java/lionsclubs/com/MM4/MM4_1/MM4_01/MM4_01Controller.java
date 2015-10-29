package lionsclubs.com.MM4.MM4_1.MM4_01;

import javax.annotation.Resource;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.web.organ.OrganService;
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
public class MM4_01Controller {
	@Resource private MM4_01Service service;
	@Resource private OrganProfileService organProfileService;	
	@Resource private OrganService organService;
	
	@RequestMapping("/MM4/MM4_1/MM4_01/MM4_01.do")
	public String MM4_01(ModelMap model, @ModelAttribute("MM4_01VO") MM4_01VO vo) throws Exception{
		
		/** 현재년월 세팅 */
		String sessionYear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionYear);
		/** 현재년월 세팅 */
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())){
			String lvl = organService.getOrgLevel(user.getSearchOrganCode());
			if("1".equals(lvl) || "2".equals(lvl)){
				vo.setOrganCode(user.getSearchOrganCode());	
			} else {
				vo.setOrganCode(user.getSearchComplexCode());
			}
		}
		
		OrganProfileVO acpvo = new OrganProfileVO();
		acpvo.setYear(sessionYear);
		acpvo.setOrganCode(vo.getOrganCode());
		acpvo = organProfileService.complexProfile(acpvo);
		if(acpvo != null){
			model.addAttribute("complexProfile", acpvo);
			vo.setOrganCode(acpvo.getOrganCode());	/* 지구코드 */
			vo.setAssociationCode(acpvo.getAssociationCode());	/* 소속연합회코드 */
			vo.setOrganOfficerMemberNo(acpvo.getOrganOfficerMemberNo());	/* 복합의장 회원번호 */
		}
		
		// 지구기본
		model.addAttribute("baseInfo", service.basicInfo(vo));
		
		// 조직책임자 변경이력 리스트
		model.addAttribute("officerChangeHistoryList", service.officerChangeHistoryList(vo));
		
		// 복합/연합회 임원 리스트
		model.addAttribute("complexList", service.complexList(vo));
		
		return "lionsclubs/com/MM4/MM4_1/MM4_01/MM4_01";
	}	
}
