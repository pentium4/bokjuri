package lionsclubs.com.login;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lionsclubs.com.cmm.common.CommonUtil;

import org.apache.commons.lang.StringUtils;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Caching;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.site.SitePreference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;

import egovframework.com.cmm.EgovComponentChecker;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.Globals;
import egovframework.com.cmm.util.EgovUserDetailsHelper;


@Controller
public class LoginController {
	/** EgovMessageSource */
    @Resource(name="egovMessageSource") EgovMessageSource egovMessageSource;
    @Resource private LoginService service;
    
	/** log */
    protected static final Log LOG = LogFactory.getLog(LoginController.class);
    
	/**
	 * 로그인 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
    @IncludedInfo(name="로그인", listUrl="/login/login.do", order = 10, gid = 10)
    @RequestMapping(value="/login/login.do")
	public String loginUsrView(@ModelAttribute("loginVO") LoginVO loginVO,
			SitePreference sitePreference,
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap model) 
			throws Exception {
    	if(EgovComponentChecker.hasComponent("mberManageService")){
    		model.addAttribute("useMemberManage", "true");
    	}
    	
    	if(EgovUserDetailsHelper.isAuthenticated()) {
    		return "forward:/login/actionMain.do";
    	} else {
    		if(sitePreference == sitePreference.MOBILE){
        		return "redirect:/m/login/login.do";
        	}else{
        		return "lionsclubs/login";
        	}
    	}
	}
    
    @RequestMapping("/login/pcLogin.do")
	public String pcLogin(Device device, SitePreference sitePreference) throws Exception {
    	if(EgovUserDetailsHelper.isAuthenticated()) {
    		return "forward:/login/actionMain.do";
    	}        
        
    	return "lionsclubs/login";
	}   
	
    @RequestMapping("/m/login/login.do")
	public String mobileLogin(Device device, SitePreference sitePreference) throws Exception {
    	if(EgovUserDetailsHelper.isAuthenticated()) {
    		return "forward:/login/actionMain.do";
    	}        
        
    	return "lionsmobile/login";
	}

    /**
	 * 로그인 후 메인화면으로 들어간다
	 * @param 
	 * @return 로그인 페이지
	 * @exception Exception
	 */
    @Caching(evict = { @CacheEvict(value = "menu", key="{T(egovframework.com.cmm.util.EgovUserDetailsHelper).getAuthenticatedUser()}")
            		  ,@CacheEvict(value = "menuAuthenticated", key="{T(egovframework.com.cmm.util.EgovUserDetailsHelper).getAuthenticatedUser()}")
			})
    @RequestMapping(value="/login/actionMain.do")
	public String actionMain(HttpServletRequest request, Device device, SitePreference sitePreference, ModelMap model) 
			throws Exception {
    	// 1. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "forward:/login/login.do";
    	}

		String main_page = Globals.MAIN_PAGE;
		
		if(sitePreference == sitePreference.MOBILE){
    		main_page = Globals.MOBILE_MAIN_PAGE;
    		//로그인한사람의 해당조직을 선택한다. 
    		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    		if(StringUtils.isEmpty(user.getSearchSessionYear())){
    			user.setSearchSessionYear(CommonUtil.thisSessionYear());
    		}
    		
    		if(StringUtils.isEmpty(user.getSearchDistrictCode())){
    			user.setSearchDistrictCode(user.getDistrictCode());
    		}
    		
    		if(StringUtils.isEmpty(user.getSearchClubCode())){
    			user.setSearchClubCode(user.getClubCode());
    		}
    	}
		
		if (main_page.startsWith("/")) {
		    return "forward:" + main_page;
		} else {
		    return main_page;
		}
	}
    
    /**
	 * 로그아웃한다.
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/login/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model, SitePreference sitePreference) 
			throws Exception {
    	
		// 1. Security 연동
		return "redirect:/j_spring_security_logout?site_preference=" + sitePreference;    	
    }
    
    @RequestMapping(value="/login/sessionChangeLogout.do")
	public String sessionChangeLogout(HttpServletRequest request, ModelMap model) 
			throws Exception {
    	
    	service.sessionChangeLogout();
    	return "redirect:/login/actionMain.do";
    }    
}