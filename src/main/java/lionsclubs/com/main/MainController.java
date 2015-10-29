package lionsclubs.com.main;

import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MainController {
	@Autowired private MainService mainService;
	
	@RequestMapping("/main.do")
	public String main(ModelMap model) throws Exception{
		//로그인한사람의 해당조직을 선택한다. 
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		MainParamVO mainParamVO = new MainParamVO();
		mainParamVO.setOrganCode(user.getClubCode());
		mainParamVO.setYearCode(CommonUtil.thisSessionYear());
		model.addAttribute("anniversaryCountInfo", mainService.getAnniversaryCountInfo(mainParamVO)); // 기념일 종류별 건수
		model.addAttribute("shortDistrictName", mainService.getDistrictName(user.getDistrictCode())); // 지구명 약칭 조회
		
		EventVO eventVO = new EventVO();
		eventVO.setOrganCode(user.getClubCode());	/* 클럽 코드 */
		model.addAttribute("clubEventList", mainService.eventList(eventVO));
		
		eventVO.setOrganCode(user.getDistrictCode());	/* 지구 코드 */
		model.addAttribute("districtEventList", mainService.eventList(eventVO));
		
		eventVO.setOrganCode(user.getComplexCode());	/* 복합 코드 */
		model.addAttribute("complexEventList", mainService.eventList(eventVO));
		
		eventVO.setOrganCode(user.getAssociationCode());	/* 연합회 코드 */
		model.addAttribute("associationEventList", mainService.eventList(eventVO));
		
		return "lionsclubs/com/main/main";
	}
	
	@RequestMapping("/main/anniversaryInfoPopup.do")
	public String anniversaryInfoPopup(ModelMap model, @ModelAttribute("MainParamVO") MainParamVO vo, HttpServletRequest request) throws Exception{
		//로그인한사람의 해당조직을 선택한다. 
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setOrganCode(user.getClubCode());
		vo.setYearCode(CommonUtil.thisSessionYear());
		List<AnniversaryInfoDataVO> anniversaryInfo = mainService.getAnniversaryInfo(vo); // 기념일 종류별 목록
		model.addAttribute("anniversaryInfo", anniversaryInfo);
		vo.setCodeName(URLDecoder.decode(vo.getCodeName(), "UTF-8"));
		return "lionsclubs/com/main/anniversaryInfoPopup";
	}
}
