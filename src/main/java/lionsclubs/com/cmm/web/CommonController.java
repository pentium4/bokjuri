package lionsclubs.com.cmm.web;

import javax.annotation.Resource;

import lionsclubs.com.login.LoginVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class CommonController {
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/header.do")
	public String header(ModelMap model){
		return "layout/common/header";
	}
	
	@RequestMapping("/authenticatedUser.do")
	public ModelAndView setYear(ModelMap model, @ModelAttribute("sessionYear") String sessionYear) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		model.put("result", user);
		
		return new ModelAndView(ajaxMainView, model);
	}
}
