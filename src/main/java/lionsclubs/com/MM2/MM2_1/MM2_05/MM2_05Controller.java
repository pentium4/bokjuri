package lionsclubs.com.MM2.MM2_1.MM2_05;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.SM1.SM1_2.SM1_04.SM1_04Service;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM2_05Controller {
	@Resource private MM2_05Service service;
	@Resource MappingJacksonJsonView ajaxMainView;	
	@Resource private SM1_04Service sm104Service;

	
	@RequestMapping("/MM2/MM2_1/MM2_05/MM2_05.do")
	public String MM2_05(ModelMap model, @ModelAttribute("MM2_05VO") MM2_05VO vo) throws Exception{
		
		/** 현재년 세팅 */
		String sessionYear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionYear);
		/** 현재년 세팅 */
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getMemberNo())) {
			vo.setMemberNo(user.getSearchId());
		}
		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		List<MM2_05VO> listVo = service.List(vo);
        model.addAttribute("totalCount", listVo.size());
        model.addAttribute("resultList", listVo);
		
		return "lionsclubs/com/MM2/MM2_1/MM2_05/MM2_05";
	}	
	
	/**
	 * 포상 수정시 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_1/MM2_05/MM2_05_Popup.do")
	public String MM2_05_Popup(ModelMap model, HttpServletRequest request, @ModelAttribute("MM2_05VO") MM2_05VO vo) throws Exception{
		
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			model.addAttribute("MM2_05VO", service.MM2_05(vo));	
		}
		
		return "lionsclubs/com/MM2/MM2_1/MM2_05/MM2_05_Popup";
	}
	

	/*
	@RequestMapping("/MM2/MM2_1/MM2_05/MM2_05_Popup1.do")
	public String MM2_05_Popup1(ModelMap model, HttpServletRequest request, @ModelAttribute("MM2_05VO") MM2_05VO vo) throws Exception{
		vo.setOrganCode(request.getParameter("organCode"));
		
		model.addAttribute("organCode", request.getParameter("organCode"));
		return "lionsclubs/com/MM2/MM2_1/MM2_05/MM2_05_Popup";
	}
	*/
	
	/**
	 * 포상 입력
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_1/MM2_05/awardInsert.do")
	public ModelAndView awardInsert(HttpServletRequest request, @ModelAttribute("MM2_05VO") MM2_05VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		System.out.println();
		String awardDate = vo.getAwardDate();
		awardDate = awardDate.replaceAll("\\.", "");
		vo.setAwardDate(awardDate);
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		service.awardInsert(vo);
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 포상 수정
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_1/MM2_05/awardUpdate.do")
	public ModelAndView awardUpdate(HttpServletRequest request, @ModelAttribute("MM2_05VO") MM2_05VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		String awardDate = vo.getAwardDate();
		awardDate = awardDate.replaceAll("\\.", "");
		vo.setAwardDate(awardDate);

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		model.put("result", service.awardUpdate(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
		
	
	/**
	 * 삭제
	 */
	@RequestMapping("/MM2/MM2_1/MM2_05/awardDelete.do")
	public ModelAndView awardDelete(HttpServletRequest request, @ModelAttribute("MM2_05VO") MM2_05VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		if(service.awardDelete(vo) == 1){
			model.put("result", true);	
		} else {
			model.put("result", false);
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
	
}
