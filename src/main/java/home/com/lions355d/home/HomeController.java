package home.com.lions355d.home;

import home.com.lions355d.photo.PhotoService;
import home.com.lions355d.photo.PhotoVO;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @Resource private HomeService service;
    @Resource private PhotoService photoService;
    
    @RequestMapping("/home/355d/home.do")
	public String home(ModelMap model, @ModelAttribute("HomeVO") HomeVO vo) throws Exception {
    	
    	PhotoVO photoVO = new PhotoVO();
		model.addAttribute("listPhoto3", photoService.listPhoto3(photoVO).getResultList());
    	model.addAttribute("listPhoto1", photoService.listPhoto1(photoVO).getResultList());
		model.addAttribute("listClubEvent", service.listClubEvent(vo));
		model.addAttribute("listClubEventPhoto", service.listClubEventPhoto(vo));
		
		model.addAttribute("governorsPictureFile", service.governorsPictureFile(vo));
		
    	return "home/355d/home";
    }
    
    
}