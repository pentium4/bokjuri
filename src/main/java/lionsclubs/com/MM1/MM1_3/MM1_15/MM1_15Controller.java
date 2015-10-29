package lionsclubs.com.MM1.MM1_3.MM1_15;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.MM1.MM1_3.MM1_14.MM1_14Service;
import lionsclubs.com.MM1.MM1_3.MM1_18.MM1_18Service;
import lionsclubs.com.MM1.MM1_3.MM1_18.MM1_18VO;
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
public class MM1_15Controller {
	@Resource private MM1_15Service service;
	@Resource private MM1_14Service mm114Service;
	@Resource private MM1_18Service mm118Service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	/**
	 * 퇴회회원 입력
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_3/MM1_15/MM1_15.do")
	public String MM1_14(ModelMap model, @ModelAttribute("MM1_15VO") MM1_15VO vo) throws Exception{
		
		/** 회기년도 세팅 */
		String sessionyear = StringUtils.isEmpty(vo.getSessionYear()) ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();		
		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		if(StringUtils.isEmpty(vo.getOrder())){
			vo.setOrder("1");
		}
		
		List<MM1_15VO> resultList = service.MM1_15(vo);
        model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
        
		return "lionsclubs/com/MM1/MM1_3/MM1_15/MM1_15";
	}
	
	/**
	 * 퇴회 회원 입력 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_3/MM1_15/listRetireMemberPopup.do")
	public String listRetireMemberPopup(ModelMap model, @ModelAttribute("MM1_15VO") MM1_15VO vo) throws Exception{
		
		List<MM1_15VO> resultList = service.listRetireMember(vo);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		
		return "lionsclubs/com/MM1/MM1_3/MM1_15/listRetireMemberPopup";
	}
	
	@RequestMapping("/MM1/MM1_3/MM1_15/insertRetireMember.do")
	public ModelAndView insertRetireMember(HttpServletRequest request, @ModelAttribute("MM1_15VO") MM1_15VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("result", service.insertRetireMember(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}	
	
	
	@RequestMapping("/MM1/MM1_3/MM1_15/deleteRetireMember.do")
	public ModelAndView deleteRetireMember(HttpServletRequest request, @ModelAttribute("MM1_15VO") MM1_15VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("result", service.deleteRetireMember(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 퇴회회원 입력 리스트
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_3/MM1_15/listRetireMemberTreatment.do")
	public String listRetireMemberTreatment(ModelMap model, @ModelAttribute("MM1_15VO") MM1_15VO vo) throws Exception{
		
		/** 회기년도 세팅 */
		String sessionyear = StringUtils.isNotEmpty(vo.getSessionYear()) ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(StringUtils.isNotEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		if(StringUtils.isEmpty(vo.getOrder())){
			vo.setOrder("3");
		}
		
		vo.setApproveYn("Y");	// 승인이된 목록만 불러온다.		
		List<MM1_15VO> resultList = service.MM1_15(vo);
        model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
        
        MM1_18VO mm118vo = new MM1_18VO();
        mm118vo.setOrganCode(vo.getOrganCode());
        mm118vo.setSessionYear(vo.getSessionYear());
        model.addAttribute("countNotTreatment", mm118Service.countNotTreatment(mm118vo));
        
		return "lionsclubs/com/MM1/MM1_3/MM1_15/listRetireMemberTreatment";
	}	
	
	/**
	 * 승인
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_3/MM1_15/updateApprove.do")
	public ModelAndView updateApprove(HttpServletRequest request, @ModelAttribute("MM1_15VO") MM1_15VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("result", service.updateApprove(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}	

	/**
	 * 승인취소
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_3/MM1_15/updateApproveCancel.do")
	public ModelAndView updateApproveCancel(HttpServletRequest request, @ModelAttribute("MM1_15VO") MM1_15VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("result", service.updateApproveCancel(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 처리
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_3/MM1_15/updateTreatment.do")
	public ModelAndView updateTreatment(HttpServletRequest request, @ModelAttribute("MM1_15VO") MM1_15VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("result", service.updateTreatment(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 처리취소
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_3/MM1_15/updateTreatmentCancel.do")
	public ModelAndView updateTreatmentCancel(HttpServletRequest request, @ModelAttribute("MM1_15VO") MM1_15VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("result", service.updateTreatmentCancel(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
}
