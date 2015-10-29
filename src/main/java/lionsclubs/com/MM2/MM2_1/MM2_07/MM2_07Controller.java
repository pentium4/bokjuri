package lionsclubs.com.MM2.MM2_1.MM2_07;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.MM1.MM1_1.MM1_01.MM1_01Service;
import lionsclubs.com.MM1.MM1_1.MM1_01.MM1_01VO;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM2_07Controller {
	@Resource private MM2_07Service service;
	@Resource private MM1_01Service mm101Service;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	@RequestMapping("/MM2/MM2_1/MM2_07/MM2_07.do")
	public String MM2_07(ModelMap model, @ModelAttribute("MM2_07VO") MM2_07VO vo) throws Exception{
		
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		String organCode = vo.getOrganCode();
		String memberNo = vo.getMemberNo();
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());

		if(StringUtils.isEmpty(memberNo)) {
			memberNo = user.getSearchId();
			vo.setMemberNo(memberNo);
		}
		
		if(StringUtils.isEmpty(organCode)) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		List<MM2_07VO> listVo = service.List(vo);
        model.addAttribute("totalCount", listVo.size());
        model.addAttribute("resultList", listVo);
        
		model.addAttribute("memberNo", vo.getMemberNo());
		
		return "lionsclubs/com/MM2/MM2_1/MM2_07/MM2_07";
	}	
	
	/**
	 * 프로필 기본사항 팝업수정
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_1/MM2_07/profileBasicPopup.do")
	public String profileBasicPopup(ModelMap model, HttpServletRequest request, @ModelAttribute("MM1_01VO") MM1_01VO vo) throws Exception{
		
		model.addAttribute("profileInfo", mm101Service.MM1_01(vo));

		return "lionsclubs/com/MM2/MM2_1/MM2_07/profileBasicPopup";
	}
}
