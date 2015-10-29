package lionsclubs.com.SM1.SM1_2.SM1_07;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.SM1.SM1_2.SM1_06.SM1_06Service;
import lionsclubs.com.SM1.SM1_2.SM1_06.SM1_06VO;
import lionsclubs.com.login.LoginVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class SM1_07Controller {
	@Resource private SM1_07Service service;
	@Resource private SM1_06Service sm106Service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/SM1/SM1_2/SM1_07/SM1_07.do")
	public String SM1_07(ModelMap model, @ModelAttribute("SM1_07VO") SM1_07VO vo) throws Exception{
		
		SM1_06VO sm106vo = new SM1_06VO();
		sm106vo.setGroupCode(vo.getGroupCode());
		sm106vo = sm106Service.SM1_06_Object(sm106vo);
		model.addAttribute("sm106", sm106vo);
		
		vo.setGroupCode(sm106vo == null ? "" : sm106vo.getGroupCode());
		
		List<SM1_07VO> resultList = service.SM1_07(vo);
		// 그룹코드 리스트
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		
		model.addAttribute("selectGroupCode", service.selectGroupCode());
		
		return "lionsclubs/com/SM1/SM1_2/SM1_07/SM1_07";
	}
	
	/**
	 * 그룹코드 입력
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/SM1/SM1_2/SM1_07/insert.do")
	public ModelAndView SM1_07_InputInsert(HttpServletRequest request
			,@ModelAttribute("SM1_07VO") SM1_07VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		service.SM1_07_InputInsert(vo);
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
	@RequestMapping("/SM1/SM1_2/SM1_07/update.do")
	public ModelAndView SM1_07_EditUpdate(HttpServletRequest request
			,@ModelAttribute("SM1_07VO") SM1_07VO vo) throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		service.SM1_07_EditUpdate(vo);
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 그룹코드 삭제
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/SM1/SM1_2/SM1_07/delete.do")
	public ModelAndView SM1_07_Delete(HttpServletRequest request
			, @ModelAttribute("SM1_07VO") SM1_07VO vo) throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		service.SM1_07_Delete(vo);
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}	
			
}
