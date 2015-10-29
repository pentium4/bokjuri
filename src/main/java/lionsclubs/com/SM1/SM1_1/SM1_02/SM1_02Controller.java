package lionsclubs.com.SM1.SM1_1.SM1_02;

import java.net.URLEncoder;
import java.util.List;

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
public class SM1_02Controller {
	@Resource private SM1_02Service service;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	@RequestMapping("/SM1/SM1_1/SM1_02.do")
	public String SM1_02(ModelMap model, @ModelAttribute("SM1_02VO") SM1_02VO vo) throws Exception{
		
		List<SM1_02VO> resultList = service.selectList(vo);
        model.addAttribute("resultList", resultList);
        
		return "lionsclubs/com/SM1/SM1_1/SM1_02/SM1_02";
	}	
	
	@RequestMapping("/SM1/SM1_1/SM1_02_SELECT.do")
	public ModelAndView SM1_02_SELECT(ModelMap model, @ModelAttribute("SM1_02VO") SM1_02VO vo) throws Exception{		
		model.put("resultUiAuthList", service.selectUiAuthList(vo));
		model.put("resultOrganList", service.selectOrganList(vo));
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}	
	
	@RequestMapping("/SM1/SM1_1/SM1_02_WRITE.do")
	public String SM1_02_WRITE(@ModelAttribute("SM1_02VO") SM1_02VO vo) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getName());
		vo.setUpdateName(user.getName());
		
		service.insert(vo);	 	
				
		return "redirect:/SM1/SM1_1/SM1_02.do?authGroupCode="+vo.getAuthGroupCode()+"&menuId="+URLEncoder.encode(vo.getMenuId());		
	}
	
	@RequestMapping("/SM1/SM1_1/SM1_02_UPDATE.do")
	public String SM1_02_UPDATE(@ModelAttribute("SM1_02VO") SM1_02VO vo) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getName());
		
		service.update(vo);		
				
		return "redirect:/SM1/SM1_1/SM1_02.do?authGroupCode="+vo.getAuthGroupCode()+"&menuId="+URLEncoder.encode(vo.getMenuId());		
	}
	
	@RequestMapping("/SM1/SM1_1/SM1_02_DELETE.do")
	public String SM1_02_DELETE(@ModelAttribute("SM1_02VO") SM1_02VO vo) throws Exception{
		
		service.delete(vo);		
				
		return "redirect:/SM1/SM1_1/SM1_02.do?menuId="+URLEncoder.encode(vo.getMenuId());		
	}
	
	@RequestMapping("/SM1/SM1_1/SM1_02_UPDATE_AUTH.do")
	public String SM1_02_UPDATE_AUTH(ModelMap model, @ModelAttribute("SM1_02VO") SM1_02VO vo) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getName());
		vo.setUpdateName(user.getName());
		
		service.updateAuth(vo);	
				
		return "redirect:/SM1/SM1_1/SM1_02.do?authGroupCode="+vo.getAuthGroupCode()+"&menuId="+URLEncoder.encode(vo.getMenuId());		
	}
	
	@RequestMapping("/SM1/SM1_1/SM1_02_LIMIT.do")
	public String SM1_02_LIMIT(ModelMap model, @ModelAttribute("SM1_02VO") SM1_02VO vo) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getName());
		
		service.limitupdate(vo);	
		model.addAttribute("auth_group_code", vo.getAuthGroupCode());
				
		return "redirect:/SM1/SM1_1/SM1_02.do?menuId="+URLEncoder.encode(vo.getMenuId());		
	}
	
	
}
