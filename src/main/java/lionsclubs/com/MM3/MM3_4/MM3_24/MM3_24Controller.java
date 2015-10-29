package lionsclubs.com.MM3.MM3_4.MM3_24;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.include.profile.ProfileService;
import lionsclubs.com.login.LoginVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM3_24Controller {
	@Resource private MM3_24Service service;
	@Resource private ProfileService serviceprofile;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	@RequestMapping("/MM3/MM3_4/MM3_24/MM3_24.do")
	public String MM3_24(ModelMap model, @ModelAttribute("MM3_24VO") MM3_24VO vo) throws Exception{
		/*
		 * 현재년월
		 */
		String thisyear = vo.getThisYear()==null ? CommonUtil.thisSessionYear() : vo.getThisYear(); //년도를 구한다
		String prevyear = vo.getPrevYear()==null ? Integer.toString(Integer.parseInt(thisyear)-1) : vo.getPrevYear();
		
		/*
		 * 리스트
		 */
		vo.setThisYear(thisyear);
		vo.setPrevYear(prevyear);
		List<MM3_24VO> resultList = service.List(vo);
		model.addAttribute("resultList", resultList);
		
		model.addAttribute("thisYear", vo.getThisYear());
		model.addAttribute("prevYear", vo.getPrevYear());
		return "lionsclubs/com/MM3/MM3_4/MM3_24/MM3_24";
	}	
	
	@RequestMapping("/MM3/MM3_4/MM3_24/MM3_24_Modify.do")
	public String MM3_24_Modify(ModelMap model, @ModelAttribute("MM3_24VO") MM3_24VO vo) throws Exception{
		/*
		 * 현재년월
		 */
		String thisyear = vo.getThisYear()==null ? CommonUtil.thisSessionYear() : vo.getThisYear(); //년도를 구한다
		String prevyear = vo.getPrevYear()==null ? Integer.toString(Integer.parseInt(thisyear)-1) : vo.getPrevYear();
		
		/*
		 * 리스트
		 */
		vo.setThisYear(thisyear);
		vo.setPrevYear(prevyear);
		List<MM3_24VO> resultList = service.List(vo);
		model.addAttribute("resultList", resultList);
		
		model.addAttribute("thisYear", vo.getThisYear());
		model.addAttribute("prevYear", vo.getPrevYear());
		return "lionsclubs/com/MM3/MM3_4/MM3_24/MM3_24_Modify";
	}	
	
	/**
	 * 환율 - 입력
	 */
	@RequestMapping("/MM3/MM3_4/MM3_24/MM3_24_Update.do")
	public ModelAndView update(HttpServletRequest request, @ModelAttribute("MM3_24VO") MM3_24VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		/*		
		 * 현재년월
		 */
		String tyear = (vo.getThisYear().trim()==null) ? CommonUtil.thisSessionYear() : vo.getThisYear(); //년도를 구한다
		String pyear = (vo.getPrevYear().trim()==null) ? Integer.toString(Integer.parseInt(tyear)-1) : vo.getPrevYear();
		//String month = df.format(calendar.get(Calendar.MONTH) + 1); //달을 구한다
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getName());
		vo.setUpdateName(user.getName());
		
		vo.setThisYear(tyear);
		vo.setPrevYear(pyear);
		service.Update(vo);
			
		model.put("result", true);			
		return new ModelAndView(ajaxMainView, model);
	}
}
