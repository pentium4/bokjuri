package lionsclubs.com.MM2.MM2_2.MM2_15;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import lionsclubs.com.MM2.MM2_2.MM2_13.MM2_13Service;
import lionsclubs.com.MM2.MM2_2.MM2_13.MM2_13VO;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.cmm.commoncode.CommonCodeService;
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
public class MM2_15Controller {
	@Resource private MM2_15Service service;
	@Resource MappingJacksonJsonView ajaxMainView;	
	@Resource private MM2_13Service service13;
	@Resource private CommonCodeService commonCodeService;
	
	@RequestMapping("/MM2/MM2_2/MM2_15/MM2_15.do")
	public String MM2_15(ModelMap model, @ModelAttribute("MM2_15VO") MM2_15VO vo) throws Exception{
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		if(StringUtils.isEmpty(vo.getSessionYear())) {
			vo.setSessionYear(CommonUtil.thisSessionYear());
		}
		
		if(vo.getMonth() == null) {
			vo.setMonth(CommonUtil.thisMonth());
		}
		
		if(StringUtils.isEmpty(vo.getMemberNo())) {
			vo.setMemberNo(user.getSearchId());
		}
		
		if(StringUtils.isEmpty(vo.getOrganCode())) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		List<MM2_15VO> listVo = service.List(vo);
        model.addAttribute("totalCount", listVo.size());
        model.addAttribute("resultList", listVo);
        
        MM2_15VO paySum = service.paymentSum(vo);
        if(paySum != null) {
        	model.addAttribute("paymentSum", paySum);
        	String sumAmount = paySum.getAmount();
        	if(sumAmount != null && !"".equals(sumAmount)) {
        		model.addAttribute("sumAmount", sumAmount);
        	}
        }
        
        MM2_13VO vo13 = new MM2_13VO();
        vo13.setOrganCode(vo.getOrganCode());
        vo13.setMemberNo(vo.getMemberNo());
        vo13.setThisYear(vo.getSessionYear());
        vo13.setThisMonth(vo.getMonth());
        
        /** 정산일자 */
        vo13 = service13.paymentDate(vo13);
        if(vo13 != null) {
        	model.addAttribute("paymentDate", vo13);
        	String sumDate = vo13.getConfirmDate();
        	if(sumDate != null && !"".equals(sumDate)) {
        		model.addAttribute("sumDate", sumDate);
        	}
        }
        
		return "lionsclubs/com/MM2/MM2_2/MM2_15/MM2_15";
	}	
	
	/**
	 * 연간수입예산 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_2/MM2_15/MM2_15_Popup.do")
	public String MM2_15_Popup(ModelMap model, @ModelAttribute("MM2_15VO") MM2_15VO vo) throws Exception{
		if(StringUtils.isNotEmpty(vo.getIdnNo())){
			model.addAttribute("MM2_15VO", service.MM2_15(vo));
		}
		
		model.addAttribute("codeList", commonCodeService.codelist("6000"));
		
		return "lionsclubs/com/MM2/MM2_2/MM2_15/MM2_15_Popup";
	}
	
	/**
	 * 지출 입력
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_2/MM2_15/otherIncomeInsert.do")
	public ModelAndView otherIncomeInsert(@ModelAttribute("MM2_15VO") MM2_15VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		String inexDate = vo.getInexDate();
		String amount = vo.getAmount();
		amount = amount.replaceAll("\\,", "");
		inexDate = inexDate.replaceAll("\\.", "");
		vo.setInexDate(inexDate);
		vo.setAmount(amount);
		vo.setInexCode("1000");	//수입1000, 지출1010
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		MM2_13VO vo13 = new MM2_13VO();
		vo13.setOrganCode(vo.getOrganCode());
		vo13.setInexDate(vo.getInexDate()); /* 회기년월=회기시작월(지난 년도의 07월) */
		vo13.setInsertName(user.getId());
		vo13.setUpdateName(user.getId());
		if(inexDate!=null && !"".equals(inexDate)) {
			vo13.setCaYm(inexDate.substring(0,6));
		}
		
		if(checkClosedMonth(vo.getInexDate(),vo.getOrganCode())) {
			model.put("result", "CONFIRM");
		}else {
			service13.calculateInsert(vo13);
			service.otherIncomeInsert(vo);
			model.put("result", true);
		}
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM2/MM2_2/MM2_15/otherIncomeUpdate.do")
	public ModelAndView otherIncomeUpdate(@ModelAttribute("MM2_15VO") MM2_15VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		String inexDate = vo.getInexDate();
		String amount = vo.getAmount();
		amount = amount.replaceAll("\\,", "");
		inexDate = inexDate.replaceAll("\\.", "");
		vo.setInexDate(inexDate);
		vo.setAmount(amount);
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		if(checkClosedMonth(vo.getInexDate(),vo.getOrganCode())) {
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
	@RequestMapping("/MM2/MM2_2/MM2_15/otherIncomeDelete.do")
	public ModelAndView otherIncomeDelete(@ModelAttribute("MM2_15VO") MM2_15VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		MM2_15VO data = service.MM2_15(vo);
		if(data == null) {
			model.put("result", "DATANOTFOUND");
		}else {
			
			if(checkClosedMonth(data.getInexDate(),data.getOrganCode())) {
				model.put("result", "CONFIRM");
			}else {
				service.otherIncomeDelete(vo);
				model.put("result", true);
			}
		}
		return new ModelAndView(ajaxMainView, model);
	}

	/* 월마감여부 확인 */
	private Boolean checkClosedMonth(String inexDate,String organCode) throws Exception {
		// 정산이 확정되면 LIONS_CALCULATE.CONFIRM_YN에 'Y'가 들어갑니다.
		// 정산이 확정되었으면 true, 미확정이면 false를 반환함.
		MM2_15VO_CLOSE_PARAM closeVo = new MM2_15VO_CLOSE_PARAM();
		closeVo.setStrDate(inexDate);
		closeVo.setOrganCode(organCode);
		return service.selectClosedMonthFlag(closeVo);
	}
}
