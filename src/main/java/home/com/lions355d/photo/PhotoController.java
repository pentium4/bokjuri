package home.com.lions355d.photo;

import home.com.lions355d.schedule.ScheduleService;

import javax.annotation.Resource;

import lionsclubs.com.cmm.pagging.Page;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

@Controller
public class PhotoController {
    @Resource private PhotoService service;
    @Resource private ScheduleService scheduleService;
    @Resource MappingJacksonJsonView ajaxMainView;
    
    @RequestMapping("/home/355d/photo/photo1.do")
	public String photo1(ModelMap model, @ModelAttribute("PhotoVO") PhotoVO vo) throws Exception {
    	model.addAttribute("leftMenuTitle", "05");
    	model.addAttribute("top", "0501");		
    	
		Page resultList = service.listPhoto1(vo);
		
        model.addAttribute("resultList", resultList.getResultList());
        model.addAttribute("paginationInfo", resultList.getPaginationInfo());
        model.addAttribute("totalCount", resultList.getTotalCount());		
		
    	return "home/355d/photo/photo1";
    }
    
    @RequestMapping("/home/355d/photo/photo2.do")
	public String photo2(ModelMap model, @ModelAttribute("PhotoVO") PhotoVO vo) throws Exception {
    	model.addAttribute("leftMenuTitle", "05");
    	model.addAttribute("top", "0502");		
    	model.addAttribute("listClubCode", scheduleService.listClubCode());
    	
		Page resultList = service.listPhoto2(vo);
		
        model.addAttribute("resultList", resultList.getResultList());
        model.addAttribute("paginationInfo", resultList.getPaginationInfo());
        model.addAttribute("totalCount", resultList.getTotalCount());		
		
		
    	return "home/355d/photo/photo2";
    }
    
    @RequestMapping("/home/355d/photo/photo3.do")
	public String photo3(ModelMap model, @ModelAttribute("PhotoVO") PhotoVO vo) throws Exception {
    	model.addAttribute("leftMenuTitle", "05");
    	model.addAttribute("top", "0503");		
    	
		Page resultList = service.listPhoto3(vo);
		
        model.addAttribute("resultList", resultList.getResultList());
        model.addAttribute("paginationInfo", resultList.getPaginationInfo());
        model.addAttribute("totalCount", resultList.getTotalCount());		    	
    	
    	return "home/355d/photo/photo3";
    }
    
    @RequestMapping("/home/355d/photo/photo4.do")
	public String photo4(ModelMap model, @ModelAttribute("PhotoVO") PhotoVO vo) throws Exception {
    	model.addAttribute("leftMenuTitle", "05");
    	model.addAttribute("top", "0504");
    	model.addAttribute("listClubCode", scheduleService.listClubCode());
    	
		Page resultList = service.listPhoto4(vo);
		
        model.addAttribute("resultList", resultList.getResultList());
        model.addAttribute("paginationInfo", resultList.getPaginationInfo());
        model.addAttribute("totalCount", resultList.getTotalCount());    	
		
    	return "home/355d/photo/photo4";
    }    
}