package lionsclubs.com.MM1.MM1_1.MM1_07;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.SM1.SM1_2.SM1_04.SM1_04Service;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.include.profile.ProfileService;
import lionsclubs.com.include.profile.ProfileVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

@Controller
public class MM1_07Controller {
	@Resource private MM1_07Service service;
	@Resource private ProfileService serviceprofile;
	@Resource MappingJacksonJsonView ajaxMainView;	
	@Resource private SM1_04Service sm104Service;
	
	@RequestMapping("/MM1/MM1_1/MM1_07/MM1_07.do")
	public String MM1_07(ModelMap model, @ModelAttribute("profileVO") ProfileVO pvo, @ModelAttribute("MM1_07VO") MM1_07VO vo) throws Exception{
		pvo = serviceprofile.profile(pvo);
		model.addAttribute("profile", pvo);
		
		/*
		 * 현재년월
		 */
		String sessionYear = StringUtils.isEmpty(vo.getSessionYear()) ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionYear);
		
		/*
		 * 리스트
		 */
		vo.setOrganCode(pvo.getSectorClubCode());
		vo.setMemberNo(pvo.getMemberNo());
		List<MM1_07VO> resultList = service.List(vo);
		model.addAttribute("resultList", resultList);
		
		return "lionsclubs/com/MM1/MM1_1/MM1_07/MM1_07";
	}	
	
	@RequestMapping("/MM1/MM1_1/MM1_07/MM1_07_Popup.do")
	public String MM1_07_popup(ModelMap model, HttpServletRequest request, @ModelAttribute("MM1_07VO") MM1_07VO vo) throws Exception{
		/*
		 * 리스트
		 */
		List<MM1_07VO> resultList = service.ListEvent(vo);	
		model.addAttribute("resultList", resultList);
		
		return "lionsclubs/com/MM1/MM1_1/MM1_07/MM1_07_Popup";
	}
	
	@RequestMapping("/MM1/MM1_1/MM1_07/MM1_07_Modify.do")
	public String MM1_07_Modify(ModelMap model, HttpServletRequest request, @ModelAttribute("profileVO") ProfileVO pvo, @ModelAttribute("MM1_07VO") MM1_07VO vo) throws Exception{
		/*
		 * 회원정보
		 */
		pvo = serviceprofile.profile(pvo);
		model.addAttribute("profile", pvo);
		
		/*
		 * 현재년월
		 */
		String sessionYear = StringUtils.isEmpty(vo.getSessionYear()) ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionYear);
		
		/*
		 * 리스트
		 */
		List<MM1_07VO> resultList = service.List(vo);
		model.addAttribute("resultList", resultList);
		
		return "lionsclubs/com/MM1/MM1_1/MM1_07/MM1_07_Modify";
	}	
	
	/**
	 * 행사명(클럽관리) - 입력&수정
	 */
	@RequestMapping("/MM1/MM1_1/MM1_07/MM1_07_Insert.do")
	public ModelAndView insert(ModelMap model, @ModelAttribute("MM1_07VO") MM1_07VO vo) throws Exception{
		service.Insert(vo);
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 행사출석(개인관리) - 입력&수정
	 */
	@RequestMapping("/MM1/MM1_1/MM1_07/MM1_07_Update.do")
	public ModelAndView update(ModelMap model, @ModelAttribute("MM1_07VO") MM1_07VO vo) throws Exception{
		service.Update(vo);
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
}
