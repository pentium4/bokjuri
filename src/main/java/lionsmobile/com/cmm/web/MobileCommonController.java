package lionsmobile.com.cmm.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.web.organ.OrganService;
import lionsclubs.com.login.LoginVO;

import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.site.SitePreference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MobileCommonController {
	
	@Resource private OrganService organService;
	@Resource MappingJacksonJsonView ajaxMainView;
	
    @RequestMapping(value = "/m/login.do", method = RequestMethod.GET)
    public String login(Model model, Device device, SitePreference sitePreference) throws Exception {
    	return "lionsmobile/login";
    }
    
    @RequestMapping(value = "/m/main/main.do", method = RequestMethod.GET)
    public String main(@ModelAttribute("main") ModelMap model) {
    	
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		model.put("sessionYear", user.getSearchSessionYear());
		model.put("districtCode", user.getSearchDistrictCode());
		model.put("clubCode", user.getSearchClubCode());
		
    	//로그인한사람의 해당조직을 선택한다. 
        return "lionsmobile/com/main/main";
    }

	@RequestMapping("/m/main/setSessionYear.do")
	public ModelAndView setYear(HttpServletRequest request, @ModelAttribute("sessionYear") String sessionYear) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		user.setSearchSessionYear(sessionYear);
		model.put("sessionYear", sessionYear);
		
		return new ModelAndView(ajaxMainView, model);
	}     
	
}
