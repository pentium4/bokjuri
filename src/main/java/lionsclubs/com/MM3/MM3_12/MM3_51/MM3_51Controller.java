package lionsclubs.com.MM3.MM3_12.MM3_51;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.MM3.MM3_12.MM3_51.MM3_51VO;
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
public class MM3_51Controller {
	@Resource private MM3_51Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	@RequestMapping("/MM3/MM3_12/MM3_51/MM3_51.do")
	public String MM3_51(ModelMap model, @ModelAttribute("MM3_51VO") MM3_51VO vo) throws Exception{
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */		
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchDistrictCode());
		}
		
		List<MM3_51VO> resultList = service.listDeposit(vo);
        model.addAttribute("resultList", resultList);
        model.addAttribute("totalCount", resultList.size());
        model.addAttribute("sum", service.sumDeposit(vo));
        
		return "lionsclubs/com/MM3/MM3_12/MM3_51/MM3_51";
	}	
	
	/**
	 * 예금현황 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_12/MM3_51/depositPopup.do")
	public String depositPopup(ModelMap model, HttpServletRequest request, @ModelAttribute("MM3_51VO") MM3_51VO vo) throws Exception{
		
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			model.addAttribute("MM3_51VO", service.objectDeposit(vo));
		}
		
		return "lionsclubs/com/MM3/MM3_12/MM3_51/depositPopup";
	}
	
	/**
	 * 예금 입력/수정
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_12/MM3_51/saveDeposit.do")
	public ModelAndView saveDeposit(ModelMap model, @ModelAttribute("MM3_51VO") MM3_51VO vo) throws Exception{
		
		model.put("result", service.saveDeposit(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 삭제
	 */
	@RequestMapping("/MM3/MM3_12/MM3_51/deleteDeposit.do")
	public ModelAndView deleteDeposit(HttpServletRequest request, @ModelAttribute("MM3_51VO") MM3_51VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("result", service.deleteDeposit(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}

	/**
	 * 출금팝업
	 * @param model
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_12/MM3_51/withdrawPopup.do")
	public String withdrawPopup(ModelMap model, HttpServletRequest request, @ModelAttribute("MM3_51VO") MM3_51VO vo) throws Exception{
		
		model.addAttribute("MM3_51VO", service.objectDeposit(vo));
		
		return "lionsclubs/com/MM3/MM3_12/MM3_51/withdrawPopup";
	}
	
	/**
	 * 출금
	 * @param model
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_12/MM3_51/updateWithdraw.do")
	public ModelAndView withdraw(ModelMap model, HttpServletRequest request, @ModelAttribute("MM3_51VO") MM3_51VO vo) throws Exception{
		
		model.put("result", service.updateWithdraw(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 출금취소
	 * @param model
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM3/MM3_12/MM3_51/updateWithdrawCancel.do")
	public ModelAndView withdrawCancel(ModelMap model, HttpServletRequest request, @ModelAttribute("MM3_51VO") MM3_51VO vo) throws Exception{
		
		model.put("result", service.updateWithdrawCancel(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
}
