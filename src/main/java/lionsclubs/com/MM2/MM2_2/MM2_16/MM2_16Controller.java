package lionsclubs.com.MM2.MM2_2.MM2_16;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.MM2.MM2_2.MM2_13.MM2_13Service;
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
public class MM2_16Controller {
	@Resource private MM2_16Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	@Resource private MM2_13Service mm213Service;
	
	@RequestMapping("/MM2/MM2_2/MM2_16/MM2_16.do")
	public String MM2_16(ModelMap model, @ModelAttribute("MM2_16VO") MM2_16VO vo) throws Exception{
		/** 회기년도 세팅 */
		String sessionyear = vo.getSessionYear() == null ? CommonUtil.thisSessionYear() : vo.getSessionYear(); //년도를 구한다
		vo.setSessionYear(sessionyear);
		/** 회기년도 세팅 */		
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(StringUtils.isEmpty(vo.getMemberNo())) {
			vo.setMemberNo(user.getSearchId());
		}
		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		List<MM2_16VO> listVo = service.List(vo);
        model.addAttribute("totalCount", listVo.size());
        model.addAttribute("resultList", listVo);
        
        MM2_16VO paySum = service.paymentSum(vo);
        if(paySum != null) {
        	model.addAttribute("paymentSum", paySum);
        	String sumAmount = paySum.getAmountSum();
        	String sumExpireAmount = paySum.getExpireAmountSum();
        	if(sumAmount!=null && !"".equals(sumAmount)) {
        		model.addAttribute("sumAmount", sumAmount);
        		model.addAttribute("sumExpireAmount", sumExpireAmount);
        	}
        }
 		
		return "lionsclubs/com/MM2/MM2_2/MM2_16/MM2_16";
	}	
	
	/**
	 * 예금현황 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_2/MM2_16/MM2_16_Popup.do")
	public String MM2_16_Popup(ModelMap model, HttpServletRequest request, @ModelAttribute("MM2_16VO") MM2_16VO vo) throws Exception{
		
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			model.addAttribute("MM2_16VO", service.MM2_16(vo));
		}
		
		return "lionsclubs/com/MM2/MM2_2/MM2_16/MM2_16_Popup";
	}
	
	/**
	 * 예금 입력
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_2/MM2_16/otherIncomeInsert.do")
	public ModelAndView otherIncomeInsert(HttpServletRequest request, @ModelAttribute("MM2_16VO") MM2_16VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		if(service.checkClosedMonth(vo.getOrganCode(),vo.getStartDate(),vo.getEndDate())) {
			model.put("result", "CONFIRM");
		}else {
			service.otherIncomeInsert(vo);
			model.put("result", true);
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM2/MM2_2/MM2_16/otherIncomeUpdate.do")
	public ModelAndView otherIncomeUpdate(HttpServletRequest request, @ModelAttribute("MM2_16VO") MM2_16VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		if(service.checkClosedMonth(vo.getOrganCode(),vo.getStartDate(),vo.getEndDate())) {
			model.put("result", "CONFIRM");
		}else {
			service.otherIncomeUpdate(vo);
			model.put("result", true);
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
		
	/**
	 * 삭제
	 */
	@RequestMapping("/MM2/MM2_2/MM2_16/otherIncomeDelete.do")
	public ModelAndView otherIncomeDelete(HttpServletRequest request, @ModelAttribute("MM2_16VO") MM2_16VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		MM2_16VO data = service.MM2_16(vo);
		if(data == null) {
			model.put("result", "DATANOTFOUND");
		}else {
			if(service.checkClosedMonth(data.getOrganCode(),data.getStartDate(),data.getEndDate())) {
				model.put("result", "CONFIRM");
			}else {
				service.otherIncomeDelete(vo);
				model.put("result", true);
			}
		}
		
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
	@RequestMapping("/MM2/MM2_2/MM2_16/withdrawPopup.do")
	public String withdrawPopup(ModelMap model, HttpServletRequest request, @ModelAttribute("MM2_16VO") MM2_16VO vo) throws Exception{
		
		model.addAttribute("MM2_16VO", service.MM2_16(vo));
		
		return "lionsclubs/com/MM2/MM2_2/MM2_16/withdrawPopup";
	}
	
	/**
	 * 출금
	 * @param model
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_2/MM2_16/withdraw.do")
	public ModelAndView withdraw(ModelMap model, HttpServletRequest request, @ModelAttribute("MM2_16VO") MM2_16VO vo) throws Exception{
		
		model.put("result", service.withdraw(vo));
		
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
	@RequestMapping("/MM2/MM2_2/MM2_16/withdrawCancel.do")
	public ModelAndView withdrawCancel(ModelMap model, HttpServletRequest request, @ModelAttribute("MM2_16VO") MM2_16VO vo) throws Exception{
		
		model.put("result", service.withdrawCancel(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
}
