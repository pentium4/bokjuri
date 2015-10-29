package lionsclubs.com.cmm.web.password;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

@Controller
public class PasswordController {
	@Resource private PasswordService service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	/**
	 * 패스워드 변경팝업
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/common/password/passwordPopup.do")
	public String organSearchPopup(ModelMap model, @ModelAttribute("passwordVO") PasswordVO vo, HttpServletRequest request) throws Exception{
		
		return "lionsclubs/com/common/password/passwordPopup";
	}
	
	/**
	 * 비밀번호 변경
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/common/password/pwUpdate.do")
	public ModelAndView pwUpdate(HttpServletRequest request, @ModelAttribute("passwordVO") PasswordVO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("result", service.pwUpdate(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
}
