package lionsclubs.com.MM1.MM1_3.MM1_14;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.MM1.MM1_1.MM1_01.MM1_01Service;
import lionsclubs.com.MM1.MM1_3.MM1_18.MM1_18Service;
import lionsclubs.com.MM1.MM1_3.MM1_18.MM1_18VO;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.pagging.Page;
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
public class MM1_14Controller {
	@Resource private MM1_14Service service;
	@Resource private MM1_01Service mm101Service;
	@Resource private MM1_18Service mm118Service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	/**
	 * 신입회원 입회
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_3/MM1_14/MM1_14.do")
	public String MM1_14(ModelMap model, @ModelAttribute("MM1_14VO") MM1_14VO vo) throws Exception{
		MM1_14VO registerNo = service.registerNo(vo);

		if(registerNo != null){
			if(StringUtils.isEmpty(vo.getRegisterNo())){
				vo.setRegisterNo(registerNo.getRegisterNo());	
			}
		}
		
		model.addAttribute("result", service.MM1_14(vo));
		
		// 이전/다음 registerNo
		model.addAttribute("registerNo", registerNo);		
		
		return "lionsclubs/com/MM1/MM1_3/MM1_14/MM1_14";
	}
	
	/**
	 * 프로필 기본사항 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_3/MM1_14/profilePopup.do")
	public String profilePopup(ModelMap model, @ModelAttribute("MM1_14VO") MM1_14VO vo) throws Exception{
		
		if(StringUtils.isNotEmpty(vo.getRegisterNo())){
			model.addAttribute("MM1_14VO", service.MM1_14(vo));
		}
		
		return "lionsclubs/com/MM1/MM1_3/MM1_14/profilePopup";
	}
	
	/**
	 * 프로필 기본사항 입력
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_3/MM1_14/insertProfile.do")
	public ModelAndView insertProfile(HttpServletRequest request, @ModelAttribute("MM1_14VO") MM1_14VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("result", service.insertProfile(vo));
		model.put("registerNo", vo.getRegisterNo());
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM1/MM1_3/MM1_14/updateProfile.do")
	public ModelAndView updateProfile(HttpServletRequest request, @ModelAttribute("MM1_14VO") MM1_14VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("result", service.updateProfile(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM1/MM1_3/MM1_14/listRegisterPopup.do")
	public String listRegisterPopup(ModelMap model, @ModelAttribute("MM1_14VO") MM1_14VO vo) throws Exception{
		
		Page page = service.listRegister(vo);
        model.addAttribute("resultList", page.getResultList());
        model.addAttribute("paginationInfo", page.getPaginationInfo());
        model.addAttribute("totalCount", page.getTotalCount());	
		
		return "lionsclubs/com/MM1/MM1_3/MM1_14/listRegisterPopup";
	}
	
	/**
	 * 인사기본 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_3/MM1_14/hrPopup.do")
	public String hrPopup(ModelMap model, @ModelAttribute("MM1_14VO") MM1_14VO vo) throws Exception{
		
		model.addAttribute("MM1_14VO", service.MM1_14(vo));
		
		return "lionsclubs/com/MM1/MM1_3/MM1_14/hrPopup";
	}
	
	
	/**
	 * 인사기본 수정
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_3/MM1_14/hrUpdate.do")
	public ModelAndView hrUpdate(HttpServletRequest request, @ModelAttribute("MM1_14VO") MM1_14VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("result", service.hrUpdate(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 신입회원 입회 삭제
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_3/MM1_14/delete.do")
	public ModelAndView delete(HttpServletRequest request, @ModelAttribute("MM1_14VO") MM1_14VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("result", service.delete(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 신입회원 입/출 승인 리스트
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_3/MM1_14/listNewMemberApprove.do")
	public String listNewMemberApprove(ModelMap model, @ModelAttribute("MM1_14VO") MM1_14VO vo) throws Exception{
		
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
		
		List<MM1_14VO> resultList = service.listNewMember(vo);
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		
		return "lionsclubs/com/MM1/MM1_3/MM1_14/listNewMemberApprove";
	}	
	
	/**
	 * 신입회원 입/출 처리 리스트
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_3/MM1_14/listNewMemberTreatment.do")
	public String listNewMemberTreatment(ModelMap model, @ModelAttribute("MM1_14VO") MM1_14VO vo) throws Exception{
		
		/** 회기년도 세팅 */
		String sessionyear = StringUtils.isEmpty(vo.getSessionYear()) ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		vo.setApproveYn("Y");	// 승인된 목록만 불러온다.
		List<MM1_14VO> resultList = service.listNewMember(vo);
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		
        MM1_18VO mm118vo = new MM1_18VO();
        mm118vo.setOrganCode(vo.getOrganCode());
        mm118vo.setSessionYear(vo.getSessionYear());
        model.addAttribute("countNotTreatment", mm118Service.countNotTreatment(mm118vo));
		
		return "lionsclubs/com/MM1/MM1_3/MM1_14/listNewMemberTreatment";
	}
	
	/**
	 * 승인
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_3/MM1_14/updateApprove.do")
	public ModelAndView updateApprove(HttpServletRequest request, @ModelAttribute("MM1_14VO") MM1_14VO vo) throws Exception{
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
	@RequestMapping("/MM1/MM1_3/MM1_14/updateApproveCancel.do")
	public ModelAndView updateApproveCancel(HttpServletRequest request, @ModelAttribute("MM1_14VO") MM1_14VO vo) throws Exception{
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
	@RequestMapping("/MM1/MM1_3/MM1_14/updateTreatment.do")
	public ModelAndView updateTreatment(HttpServletRequest request, @ModelAttribute("MM1_14VO") MM1_14VO vo) throws Exception{
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
	@RequestMapping("/MM1/MM1_3/MM1_14/updateTreatmentCancel.do")
	public ModelAndView updateTreatmentCancel(HttpServletRequest request, @ModelAttribute("MM1_14VO") MM1_14VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("result", service.updateTreatmentCancel(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}	
}
