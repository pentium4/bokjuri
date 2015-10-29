package lionsclubs.com.SM1.SM1_1.SM1_02_A;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.pagging.Page;
import lionsclubs.com.login.LoginVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class SM1_02_AController {
	@Resource private SM1_02_AService service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/SM1/SM1_1/SM1_02_A/SM1_02_A.do")
	public String SM1_02_A(ModelMap model, @ModelAttribute("SM1_02_AVO") SM1_02_AVO vo) throws Exception{
		
		Page page = service.selectList(vo);
		
        model.addAttribute("resultList", page.getResultList());
        model.addAttribute("paginationInfo", page.getPaginationInfo());
        model.addAttribute("totalCount", page.getTotalCount());
		
		return "lionsclubs/com/SM1/SM1_1/SM1_02_A/SM1_02_A";
	}
	
	@RequestMapping("/SM1/SM1_1/SM1_02_A/SM1_02_A_Popup.do")
	public String SM1_02_A_Popup(ModelMap model, @ModelAttribute("SM1_02_AVO") SM1_02_AVO vo) throws Exception{
		Page page = service.memerSearchList(vo);
		
        model.addAttribute("resultList", page.getResultList());
        model.addAttribute("paginationInfo", page.getPaginationInfo());
        model.addAttribute("totalCount", page.getTotalCount());
		
		return "lionsclubs/com/SM1/SM1_1/SM1_02_A/SM1_02_A_Popup";
	}	
	
	
	@RequestMapping("/SM1/SM1_1/SM1_02_A/insert.do")
	public ModelAndView insert(HttpServletRequest request, @ModelAttribute("SM1_02_AVO") SM1_02_AVO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getName());
		vo.setUpdateName(user.getName());
		
		service.insert(vo);
		
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/SM1/SM1_1/SM1_02_A/delete.do")
	public ModelAndView delete(HttpServletRequest request, @ModelAttribute("SM1_02_AVO") SM1_02_AVO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		service.delete(vo);
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
}
