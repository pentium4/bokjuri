package lionsclubs.com.MM3.MM3_11.MM3_42;

import java.util.List;

import javax.annotation.Resource;

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
public class MM3_42Controller {
	@Resource private MM3_42Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_11/MM3_42/MM3_42.do")
	public String MM3_42(ModelMap model, @ModelAttribute("MM3_42VO") MM3_42VO vo) throws Exception{
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */
		
		/** 조직코드 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		List<MM3_42VO> resultList = service.MM3_42(vo);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("totalCount", resultList.size());
		model.addAttribute("sum", service.amountSum(vo));
		model.addAttribute("objectDistrictCalculate", service.objectDistrictCalculate(vo));
		
		return "lionsclubs/com/MM3/MM3_11/MM3_42/MM3_42";
	}
	
	@RequestMapping("/MM3/MM3_11/MM3_42/districtCalculateConfirm.do")
	public ModelAndView districtCalculateConfirm(ModelMap model, @ModelAttribute("MM3_42VO") MM3_42VO vo) throws Exception{
		
		model.put("result", service.districtCalculateConfirm(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM3/MM3_11/MM3_42/districtCalculateConfirmCancel.do")
	public ModelAndView districtCalculateConfirmCancel(ModelMap model, @ModelAttribute("MM3_42VO") MM3_42VO vo) throws Exception{
		
		model.put("result", service.districtCalculateConfirmCancel(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM3/MM3_11/MM3_42/districtCalculateConfirmLock.do")
	public ModelAndView districtCalculateConfirmLock(ModelMap model, @ModelAttribute("MM3_42VO") MM3_42VO vo) throws Exception{
		
		model.put("result", service.districtCalculateConfirmLock(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM3/MM3_11/MM3_42/districtCalculateConfirmLockCancel.do")
	public ModelAndView districtCalculateConfirmLockCancel(ModelMap model, @ModelAttribute("MM3_42VO") MM3_42VO vo) throws Exception{
		
		model.put("result", service.districtCalculateConfirmLockCancel(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
}
