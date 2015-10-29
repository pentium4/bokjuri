package home.com.lions355d.other;

import java.util.List;

import javax.annotation.Resource;

import lionsclubs.com.MM2.MM2_5.MM2_31.MM2_31Service;
import lionsclubs.com.MM2.MM2_5.MM2_31.MM2_31VO;
import lionsclubs.com.cmm.common.CommonUtil;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OtherController {
	@Resource private MM2_31Service mm231Service;
	
    @RequestMapping("/home/355d/intro/intro1.do")
	public String intro1(ModelMap model) throws Exception {
    	
    	model.addAttribute("leftMenuTitle", "01");
    	model.addAttribute("top", "0101");
    	
    	return "home/355d/intro/intro1";
    }
    
    @RequestMapping("/home/355d/intro/intro2.do")
	public String intro2(ModelMap model) throws Exception {
    	
    	model.addAttribute("leftMenuTitle", "01");
    	model.addAttribute("top", "0102");
    	
    	return "home/355d/intro/intro2";
    }
    
    @RequestMapping("/home/355d/intro/intro3.do")
	public String intro3(ModelMap model) throws Exception {
    	
    	model.addAttribute("leftMenuTitle", "01");
    	model.addAttribute("top", "0103");
    	
    	return "home/355d/intro/intro3";
    }

    @RequestMapping("/home/355d/intro/intro4.do")
	public String intro4(ModelMap model) throws Exception {
    	
    	model.addAttribute("leftMenuTitle", "01");
    	model.addAttribute("top", "0104");
    	
    	return "home/355d/intro/intro4";
    }

    @RequestMapping("/home/355d/intro/intro5.do")
	public String intro5(ModelMap model) throws Exception {
    	
    	model.addAttribute("leftMenuTitle", "01");
    	model.addAttribute("top", "0105");
    	
    	return "home/355d/intro/intro5";
    }

    @RequestMapping("/home/355d/intro/intro6.do")
	public String intro6(ModelMap model) throws Exception {
    	
    	model.addAttribute("leftMenuTitle", "01");
    	model.addAttribute("top", "0106");
    	
    	return "home/355d/intro/intro6";
    }

    @RequestMapping("/home/355d/intro/intro7.do")
	public String intro7(ModelMap model) throws Exception {
    	
    	model.addAttribute("leftMenuTitle", "01");
    	model.addAttribute("top", "0107");
    	
    	return "home/355d/intro/intro7";
    }
    
    @RequestMapping("/home/355d/district/district1.do")
	public String district1(ModelMap model) throws Exception {
    	
    	model.addAttribute("leftMenuTitle", "02");
    	model.addAttribute("top", "0201");
    	
    	return "home/355d/district/district1";
    }
    
    @RequestMapping("/home/355d/district/governorsMsgHistory/{sessionYear}.do")
	public String district1(ModelMap model, @PathVariable("sessionYear") String sessionYear) throws Exception {
    	
    	model.addAttribute("leftMenuTitle", "02");
    	model.addAttribute("top", "0201");
    	
    	return "home/355d/district/governorsMsgHistory/" + sessionYear;
    }
    
    @RequestMapping("/home/355d/district/district2.do")
	public String district2(ModelMap model) throws Exception {
    	
    	model.addAttribute("leftMenuTitle", "02");
    	model.addAttribute("top", "0202");
    	
    	return "home/355d/district/district2";
    }

    @RequestMapping("/home/355d/district/district3.do")
	public String district3(ModelMap model) throws Exception {
    	
    	model.addAttribute("leftMenuTitle", "02");
    	model.addAttribute("top", "0203");
    	
    	return "home/355d/district/district3";
    }

    @RequestMapping("/home/355d/district/district4.do")
	public String district4(ModelMap model) throws Exception {
    	
    	model.addAttribute("leftMenuTitle", "02");
    	model.addAttribute("top", "0204");
    	
    	return "home/355d/district/district4";
    }

    @RequestMapping("/home/355d/district/district5.do")
	public String district5(ModelMap model) throws Exception {
    	
    	model.addAttribute("leftMenuTitle", "02");
    	model.addAttribute("top", "0205");
    	
    	return "home/355d/district/district5";
    }

    @RequestMapping("/home/355d/district/district6.do")
	public String district6(ModelMap model) throws Exception {
    	
    	model.addAttribute("leftMenuTitle", "02");
    	model.addAttribute("top", "0206");
    	
    	return "home/355d/district/district6";
    }

    @RequestMapping("/home/355d/join/join1.do")
	public String join1(ModelMap model) throws Exception {
    	
    	model.addAttribute("leftMenuTitle", "03");
    	model.addAttribute("top", "0301");
    	
    	return "home/355d/join/join1";
    }    

    @RequestMapping("/home/355d/join/join2.do")
	public String join2(ModelMap model) throws Exception {
    	
    	model.addAttribute("leftMenuTitle", "03");
    	model.addAttribute("top", "0302");
    	
    	return "home/355d/join/join2";
    }    

    @RequestMapping("/home/355d/join/join3.do")
	public String join3(ModelMap model) throws Exception {
    	
    	model.addAttribute("leftMenuTitle", "03");
    	model.addAttribute("top", "0303");
    	
    	return "home/355d/join/join3";
    }
    
    @RequestMapping("/home/355d/contact/contact.do")
	public String contact(ModelMap model) throws Exception {
    	
    	model.addAttribute("leftMenuTitle", "01");
    	model.addAttribute("top", "ptContact");
    	
    	return "home/355d/join/join3";
    }
}