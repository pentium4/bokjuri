package home.com.lions355d.schedule;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheduleController {
    @Resource private ScheduleService service;
    
    @RequestMapping("/home/355d/schedule/schedule1.do")
	public String photo1(ModelMap model, @ModelAttribute("ScheduleVO") ScheduleVO vo) throws Exception {
    	model.addAttribute("leftMenuTitle", "04");
    	model.addAttribute("top", "0401");
    	
    	JSONArray jarray = JSONArray.fromObject(service.listSchedule1(vo));
    	model.addAttribute("listSchedule1", jarray);
    	
    	return "home/355d/schedule/schedule1";
    }

    @RequestMapping("/home/355d/schedule/schedule2.do")
	public String photo2(ModelMap model, @ModelAttribute("ScheduleVO") ScheduleVO vo) throws Exception {
    	model.addAttribute("leftMenuTitle", "04");
    	model.addAttribute("top", "0402");
    	model.addAttribute("listClubCode", service.listClubCode());
    	
    	JSONArray jarray = JSONArray.fromObject(service.listSchedule2(vo));
    	model.addAttribute("listSchedule2", jarray);
    	
    	return "home/355d/schedule/schedule2";
    }
}