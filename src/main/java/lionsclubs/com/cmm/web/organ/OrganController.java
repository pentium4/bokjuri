package lionsclubs.com.cmm.web.organ;

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
public class OrganController {
	@Resource private OrganService service;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	/**
	 * 조직트리
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/common/organ/organTreeList.do")
	public ModelAndView organTreeList(@ModelAttribute("organVO") OrganVO vo, HttpServletRequest request) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("organTreeList", service.organTreeList(vo));
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 조직팝업리스트
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/common/organ/organSearchPopup.do")
	public String organSearchPopup(ModelMap model, @ModelAttribute("organVO") OrganVO vo, HttpServletRequest request) throws Exception{
		
        model.addAttribute("resultList", service.organSearch(vo));
		
		return "lionsclubs/com/common/organ/organSearchPopup";
	}
	
	/**
	 * 검색유지 조직코드를 저장한다.
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/include/clubprofile/saveSearchOrganCode.do")
	public ModelAndView saveSearchClubCode(@ModelAttribute("organVO") OrganVO vo, HttpServletRequest request) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		service.saveSearchOrganCode(vo);
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}		
}
