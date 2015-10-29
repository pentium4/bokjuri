package lionsclubs.com.SM1.SM1_3.SM1_09;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.login.LoginVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class SM1_09Controller {
	@Resource private SM1_09Service service;
	@Resource MappingJacksonJsonView ajaxMainView;	
	
	@RequestMapping("/SM1/SM1_3/SM1_09/selectList.do")
	public String selectList(ModelMap model, @ModelAttribute("SM1_09VO") SM1_09VO vo) throws Exception{
		
		List<SM1_09VO> resultList = service.selectList(vo);
        model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
        
		return "lionsclubs/com/SM1/SM1_3/SM1_09/SM1_09";
	}
	
	/**
	 * 그룹코드 입력
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/SM1/SM1_3/SM1_09/insert.do")
	public ModelAndView insert(HttpServletRequest request
			,@ModelAttribute("SM1_09VO") SM1_09VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		service.insert(vo);
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 그룹코드 수정
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/SM1/SM1_3/SM1_09/update.do")
	public ModelAndView update(HttpServletRequest request
			,@ModelAttribute("SM1_09VO") SM1_09VO vo) throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		if(service.update(vo) == 1){
			model.put("result", true);	
		} else {
			model.put("result", false);
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 그룹코드 삭제
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/SM1/SM1_3/SM1_09/delete.do")
	public ModelAndView delete(HttpServletRequest request
			, @ModelAttribute("SM1_09VO") SM1_09VO vo) throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		if(service.delete(vo) == 1){
			model.put("result", true);	
		} else {
			model.put("result", false);
		}
		
		return new ModelAndView(ajaxMainView, model);
	}	
}
