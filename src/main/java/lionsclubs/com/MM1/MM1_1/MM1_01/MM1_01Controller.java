package lionsclubs.com.MM1.MM1_1.MM1_01;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.SM1.SM1_2.SM1_04.SM1_04Service;
import lionsclubs.com.cmm.common.CommonUtil;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

@Controller
public class MM1_01Controller {
	@Resource private MM1_01Service service;
	@Resource private SM1_04Service sm104Service;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	/**
	 * 개인기본사항 조회
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_1/MM1_01/MM1_01.do")
	public String MM1_01(ModelMap model, @ModelAttribute("MM1_01VO") MM1_01VO vo) throws Exception{
		
		/** 회기년도 세팅 */
		String sessionyear = StringUtils.isEmpty(vo.getSessionYear()) ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		model.addAttribute("result", service.MM1_01(vo));
		
		// 이전/다음 memberNo
		model.addAttribute("memberNo", service.memberNo(vo));

		// 추천회원 리스트
		model.addAttribute("recommMemberList", service.recommMemberList(vo));
		return "lionsclubs/com/MM1/MM1_1/MM1_01/MM1_01";
	}
	
	/**
	 * 프로필 기본사항 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_1/MM1_01/profilePopup.do")
	public String profilePopup(ModelMap model, @ModelAttribute("MM1_01VO") MM1_01VO vo) throws Exception{
		return "lionsclubs/com/MM1/MM1_1/MM1_01/profilePopup";
	}
	
	/**
	 * 프로필 기본사항 팝업수정
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_1/MM1_01/profileEditPopup.do")
	public String profileEditPopup(ModelMap model, @ModelAttribute("MM1_01VO") MM1_01VO vo) throws Exception{
		
		model.addAttribute("MM1_01VO", service.MM1_01(vo));
		
		return "lionsclubs/com/MM1/MM1_1/MM1_01/profilePopup";
	}	
	
	/**
	 * 프로필 기본사항 입력
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_1/MM1_01/profileInsert.do")
	public ModelAndView profileInsert(HttpServletRequest request, @ModelAttribute("MM1_01VO") MM1_01VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("result", service.profileInsert(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM1/MM1_1/MM1_01/profileUpdate.do")
	public ModelAndView profileUpdate(HttpServletRequest request, @ModelAttribute("MM1_01VO") MM1_01VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("result", service.profileUpdate(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
		
	/**
	 * 생년월일 동일자 조회
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_1/MM1_01/birthPopup.do")
	public String birthPopup(ModelMap model, @ModelAttribute("MM1_01VO") MM1_01VO vo) throws Exception{
		
		model.addAttribute("resultList", service.birthPopup(vo));
		
		return "lionsclubs/com/MM1/MM1_1/MM1_01/birthPopup";
	}
	
	/**
	 * 중복체크
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_1/MM1_01/duplicateCheck.do")
	public ModelAndView duplicateCheck(HttpServletRequest request, @ModelAttribute("MM1_01VO") MM1_01VO vo) throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("result", service.duplicateCheck(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 인사기본 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_1/MM1_01/hrPopup.do")
	public String memberListPopup(ModelMap model, @ModelAttribute("MM1_01VO") MM1_01VO vo) throws Exception{
		
		model.addAttribute("MM1_01VO", service.MM1_01(vo));
		
		return "lionsclubs/com/MM1/MM1_1/MM1_01/hrPopup";
	}
		
	/**
	 * 인사기본 수정
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM1/MM1_1/MM1_01/hrUpdate.do")
	public ModelAndView hrUpdate(HttpServletRequest request, @ModelAttribute("MM1_01VO") MM1_01VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("result", service.hrUpdate(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
}
