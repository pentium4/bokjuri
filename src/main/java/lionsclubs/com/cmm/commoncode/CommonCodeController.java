package lionsclubs.com.cmm.commoncode;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

@Controller
public class CommonCodeController {
	@Resource private CommonCodeService service;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	/**
	 * 옵션1코드 리스트
	 */
	@RequestMapping("/commonCode/codeOption1List.do")
	public ModelAndView codeOption1List(HttpServletRequest request, @ModelAttribute("CommonCodeVO") CommonCodeVO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("resultList", service.codeOption1List(vo));
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 옵션1을 읽어서 옵션2의 코드 리스트
	 */
	@RequestMapping("/commonCode/codeOption2List.do")
	public ModelAndView codeOption1ResultOption2List(HttpServletRequest request, @ModelAttribute("CommonCodeVO") CommonCodeVO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("resultList", service.codeOption2List(vo));
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/commonCode/codeOption.do")
	public ModelAndView codeOption(HttpServletRequest request, @ModelAttribute("CommonCodeVO") CommonCodeVO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("resultList", service.codeOption1List(vo));
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
}
