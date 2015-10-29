package lionsclubs.com.MM7.MM7_1.MM7_02;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM7_02Controller {
	@Resource private MM7_02Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	/**
	 * 문서템플릿 리스트
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM7/MM7_1/MM7_02/MM7_02.do")
	public String listDocTemplate(ModelMap model, @ModelAttribute("MM7_02VO") MM7_02VO vo) throws Exception{
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		if(StringUtils.isEmpty(vo.getSessionYear())) {
			vo.setSessionYear(CommonUtil.thisSessionYear());
		}
		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		List<MM7_02VO> resultList = service.MM7_02(vo);
		
        model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
        
		return "lionsclubs/com/MM7/MM7_1/MM7_02/MM7_02";
	}
	
	@RequestMapping("/MM7/MM7_1/MM7_02/docTemplate.do")
	public String docTemplate(ModelMap model, @ModelAttribute("MM7_02VO") MM7_02VO vo) throws Exception{
		
		if(vo.getIdnNo() != null){
			model.addAttribute("MM7_02VO", service.objectDocTemplate(vo));
		}
		
		return "lionsclubs/com/MM7/MM7_1/MM7_02/docTemplate";
	}	
	
	@RequestMapping("/MM7/MM7_1/MM7_02/detailDocTemplate.do")
	public String detailDocTemplate(ModelMap model, @ModelAttribute("MM7_02VO") MM7_02VO vo) throws Exception{
		
		model.addAttribute("result", service.objectDocTemplate(vo));
		
		return "lionsclubs/com/MM7/MM7_1/MM7_02/detailDocTemplate";
	}	
	
	/**
	 * 문서템플릿 저장
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM7/MM7_1/MM7_02/saveDocTemplate.do")
	public ModelAndView insertDocTemplate(HttpServletRequest request, @ModelAttribute("MM7_02VO") MM7_02VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("idnNo", service.saveDocTemplate(vo));
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM7/MM7_1/MM7_02/delDocTemplate.do")
	public ModelAndView delDocTemplate(HttpServletRequest request, @ModelAttribute("MM7_02VO") MM7_02VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("result", service.deleteDocTemplate(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}

	@RequestMapping("/MM7/MM7_1/MM7_02/docTemplatePopup.do")
	public String docTemplatePopup(ModelMap model, @ModelAttribute("MM7_02VO") MM7_02VO vo) throws Exception{
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		if(StringUtils.isEmpty(vo.getSessionYear())) {
			vo.setSessionYear(CommonUtil.thisSessionYear());
		}
		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		List<MM7_02VO> resultList = service.MM7_02(vo);
		
        model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
		
		return "lionsclubs/com/MM7/MM7_1/MM7_02/docTemplatePopup";
	}
	
	@RequestMapping("/MM7/MM7_1/MM7_02/objectDocTemplate.do")
	public ModelAndView objectDocTemplate(HttpServletRequest request, @ModelAttribute("MM7_02VO") MM7_02VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("object", service.objectDocTemplate(vo));
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}	
}
