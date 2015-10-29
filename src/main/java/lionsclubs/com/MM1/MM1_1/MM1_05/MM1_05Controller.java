package lionsclubs.com.MM1.MM1_1.MM1_05;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.pagging.Page;
import lionsclubs.com.include.profile.ProfileService;
import lionsclubs.com.include.profile.ProfileVO;
import lionsclubs.com.login.LoginVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM1_05Controller {
	@Resource
	private MM1_05Service service;
	@Resource
	private ProfileService serviceprofile;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	@RequestMapping("/MM1/MM1_1/MM1_05/MM1_05.do")
	public String MM1_05(ModelMap model, @ModelAttribute("profileVO") ProfileVO pvo, @ModelAttribute("MM1_05VO") MM1_05VO vo) throws Exception{
		pvo.setRnum(vo.getRnum());		
		pvo = serviceprofile.profile(pvo);
		model.addAttribute("profile", pvo);
		
		vo.setOrganCode(pvo.getSectorClubCode());
		/*
		 * 리스트
		 */
		vo.setMemberNo(pvo.getMemberNo());
		Page page = service.List(vo);
        model.addAttribute("resultList", page.getResultList());
        model.addAttribute("paginationInfo", page.getPaginationInfo());
        model.addAttribute("totalCount", page.getTotalCount());
        model.addAttribute("total", service.total(vo));
        
		model.addAttribute("memberNo", pvo.getMemberNo());
		return "lionsclubs/com/MM1/MM1_1/MM1_05/MM1_05";
	}
	
	@RequestMapping("/MM1/MM1_1/MM1_05/MM1_05_Popup1.do")
	public String MM1_05_Popup1(ModelMap model, HttpServletRequest request, @ModelAttribute("MM1_05VO") MM1_05VO vo) throws Exception{
		
		vo.setMemberNo(request.getParameter("mno"));
		return "lionsclubs/com/MM1/MM1_1/MM1_05/MM1_05_Popup";
	}
	
	@RequestMapping("/MM1/MM1_1/MM1_05/MM1_05_Popup2.do")
	public String MM1_05_Popup2(ModelMap model, HttpServletRequest request, @ModelAttribute("MM1_05VO") MM1_05VO vo) throws Exception{
		
		vo.setMemberNo(request.getParameter("mno"));
		vo.setIdnNo(Integer.valueOf(request.getParameter("idn")));
		
		model.addAttribute("MM1_05VO", service.Select(vo));
		return "lionsclubs/com/MM1/MM1_1/MM1_05/MM1_05_Popup";
	}
	
	/**
	 * 경력 - 입력
	 */
	@RequestMapping("/MM1/MM1_1/MM1_05/MM1_05_Insert.do")
	public ModelAndView insert(HttpServletRequest request, @ModelAttribute("MM1_05VO") MM1_05VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getName());
		vo.setUpdateName(user.getName());
		
		service.Insert(vo);
		model.put("result", true);	
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 경력 - 수정
	 */
	@RequestMapping("/MM1/MM1_1/MM1_05/MM1_05_Update.do")
	public ModelAndView update(HttpServletRequest request, @ModelAttribute("MM1_05VO") MM1_05VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		//vo.setInsertName(user.getName());
		vo.setUpdateName(user.getName());
		
		if(service.Update(vo) == 1){
			model.put("result", true);	
		} else {
			model.put("result", false);
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 경력 - 삭제
	 */
	@RequestMapping("/MM1/MM1_1/MM1_05/MM1_05_Delete.do")
	public ModelAndView delete(HttpServletRequest request, @ModelAttribute("MM1_05VO") MM1_05VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		if(service.Delete(vo) == 1){
			model.put("result", true);	
		} else {
			model.put("result", false);
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
}
