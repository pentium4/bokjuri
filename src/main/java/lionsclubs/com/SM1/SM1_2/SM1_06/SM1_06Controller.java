package lionsclubs.com.SM1.SM1_2.SM1_06;

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
public class SM1_06Controller {
	@Resource private SM1_06Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	/**
	 * 그룹코드 조회
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/SM1/SM1_2/SM1_06/SM1_06.do")
	public String SM1_06(ModelMap model, @ModelAttribute("SM1_06VO") SM1_06VO vo) throws Exception{
		
		List<SM1_06VO> resultList = service.SM1_06(vo);
		// 조직코드 이력
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		
		return "lionsclubs/com/SM1/SM1_2/SM1_06/SM1_06";
	}	
	
	/**
	 * 그룹코드 입력
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/SM1/SM1_2/SM1_06/SM1_06_InputInsert.do")
	public ModelAndView SM1_06_InputInsert(HttpServletRequest request
			,@ModelAttribute("SM1_06VO") SM1_06VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getName());
		vo.setUpdateName(user.getName());
		
		service.SM1_06_InputInsert(vo);
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
	@RequestMapping("/SM1/SM1_2/SM1_06/SM1_06_EditUpdate.do")
	public ModelAndView SM1_06_EditUpdate(HttpServletRequest request
			,@ModelAttribute("SM1_06VO") SM1_06VO vo) throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getName());
		
		service.SM1_06_EditUpdate(vo);
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
	@RequestMapping("/SM1/SM1_2/SM1_06/SM1_06_Delete.do")
	public ModelAndView SM1_06_Delete(HttpServletRequest request
			, @ModelAttribute("SM1_06VO") SM1_06VO vo) throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		service.SM1_06_Delete(vo);
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}	
		
}
