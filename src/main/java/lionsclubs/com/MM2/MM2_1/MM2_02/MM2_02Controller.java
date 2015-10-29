package lionsclubs.com.MM2.MM2_1.MM2_02;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.pagging.Page;
import lionsclubs.com.include.organprofile.OrganProfileService;
import lionsclubs.com.include.organprofile.OrganProfileVO;
import lionsclubs.com.login.LoginVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM2_02Controller {
	@Resource private MM2_02Service service;
	@Resource private OrganProfileService organProfileService;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM2/MM2_1/MM2_02/MM2_02.do")
	public String MM2_02(ModelMap model, @ModelAttribute("MM2_02VO") MM2_02VO vo, @ModelAttribute("clubProfileVO") OrganProfileVO cpvo) throws Exception{
		cpvo = organProfileService.clubProfile(cpvo);
		model.addAttribute("clubProfile", cpvo);
		vo.setOrganCode(cpvo.getOrganCode());
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		user.setSearchClubCode(vo.getOrganCode());
		
		Page page = service.List(vo);
        model.addAttribute("resultList", page.getResultList());
        model.addAttribute("paginationInfo", page.getPaginationInfo());
        model.addAttribute("totalCount", page.getTotalCount());	
      
		return "lionsclubs/com/MM2/MM2_1/MM2_02/MM2_02";
	}	
	@RequestMapping("/MM2/MM2_1/MM2_02/MM2_02_Popup1.do")
	public String MM2_02_Popup1(ModelMap model, HttpServletRequest request, @ModelAttribute("MM2_02VO") MM2_02VO vo) throws Exception{
		
		return "lionsclubs/com/MM2/MM2_1/MM2_02/MM2_02_Popup_Input";
	}
	
	@RequestMapping("/MM2/MM2_1/MM2_02/MM2_02_Popup2.do")
	public String MM1_05_Popup2(ModelMap model, HttpServletRequest request, @ModelAttribute("MM2_02VO") MM2_02VO vo) throws Exception{
		
		
		vo.setIdnNo(Integer.valueOf(request.getParameter("idn")));
		model.addAttribute("MM2_02VO", service.Select(vo));
		return "lionsclubs/com/MM2/MM2_1/MM2_02/MM2_02_Popup_Modify";
	}
	
	/**
	 *  입력
	 */
	@RequestMapping("/MM2/MM2_1/MM2_02/MM2_02_Insert.do")
	public ModelAndView insert(ModelMap model,HttpServletRequest request, @ModelAttribute("MM2_02VO") MM2_02VO vo,@ModelAttribute("clubProfileVO") OrganProfileVO cpvo) throws Exception{
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());  
		
		service.Insert(vo);
		model.put("result", true);	
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 *  수정
	 */
	@RequestMapping("/MM2/MM2_1/MM2_02/MM2_02_Update.do")
	public ModelAndView update(HttpServletRequest request, @ModelAttribute("MM2_02VO") MM2_02VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		vo.setUpdateName(user.getId());		
		if(service.Update(vo) == 1){
			model.put("result", true);	
		} else {
			model.put("result", false);
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 삭제
	 */
	@RequestMapping("/MM2/MM2_1/MM2_02/MM2_02_Delete.do")
	public ModelAndView delete(HttpServletRequest request, @ModelAttribute("MM2_02VO") MM2_02VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		if(service.Delete(vo) == 1){
			model.put("result", true);	
		} else {
			model.put("result", false);
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	
}
