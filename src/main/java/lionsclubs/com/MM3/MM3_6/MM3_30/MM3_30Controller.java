package lionsclubs.com.MM3.MM3_6.MM3_30;

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
public class MM3_30Controller {
	@Resource
	private MM3_30Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_6/MM3_30/MM3_30.do")
	public String MM3_30(ModelMap model, @ModelAttribute("MM3_30VO") MM3_30VO vo) throws Exception{
		/** 현재년월 세팅 */
		String thisyear = StringUtils.isEmpty(vo.getSessionYear()) ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(thisyear);
		/** 현재년월 세팅 */
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		String upperCode = vo.getUpperCode();
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		if(StringUtils.isEmpty(upperCode)) {
			vo.setUpperCode(user.getSearchDistrictCode());
		}
		
		List<MM3_30VO> resultList = service.List(vo);
        model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
		
		return "lionsclubs/com//MM3/MM3_6/MM3_30/MM3_30";
	}	
	
	@RequestMapping("/MM3/MM3_6/MM3_30/MM3_30_Update.do")
	public ModelAndView awardInsert(HttpServletRequest request, @ModelAttribute("MM3_30VO") MM3_30VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		service.Update(vo);
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	
	@RequestMapping("/MM3/MM3_6/MM3_30/detail.do")
	public ModelAndView detail(HttpServletRequest request, @ModelAttribute("MM3_30VO") MM3_30VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("detail", service.detail(vo));
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
}
