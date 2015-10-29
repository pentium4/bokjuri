package lionsclubs.com.cmm.web.jfile;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JfileController {
	@Resource private JfileService service;
	
	@RequestMapping("/jfile/filedownloadPopup.do")
	public String filedownload(ModelMap model) throws Exception{
		return "lionsclubs/com/common/jfile/filedownloadPopup";
	}
	
	@RequestMapping("/jfile/viewThumbnailPopup.do")
	public String viewThumbnailPopup(ModelMap model, @ModelAttribute("JfileVO") JfileVO vo) throws Exception{
		
		model.addAttribute("resultList", service.jfileList(vo));
		
		return "lionsclubs/com/common/jfile/viewThumbnailPopup";
	}
}
