package lionsclubs.com.MM2.MM2_2.MM2_13;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import lionsclubs.com.MM2.MM2_2.MM2_15.MM2_15Service;
import lionsclubs.com.MM2.MM2_2.MM2_15.MM2_15VO_CLOSE_PARAM;
import lionsclubs.com.SM1.SM1_2.SM1_04.SM1_04Service;
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
public class MM2_13Controller {
	@Resource private MM2_13Service service;
	@Resource private MM2_15Service _15service;
	@Resource MappingJacksonJsonView ajaxMainView;	
	@Resource private SM1_04Service sm104Service;
	
	@RequestMapping("/MM2/MM2_2/MM2_13/MM2_13.do")
	public String MM2_13(ModelMap model, @ModelAttribute("MM2_13VO") MM2_13VO vo) throws Exception{
		/** 회원번호 및 조직 세션에서 가져오기 */
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		if(vo.getThisYear() == null) {
			vo.setThisYear(CommonUtil.thisSessionYear());
		}
		
		if(vo.getThisMonth() == null) {
			vo.setThisMonth(CommonUtil.thisMonth());
		}
		
		if(vo.getMemberNo() == null) {
			vo.setMemberNo(user.getSearchId());
		}
		
		if(vo.getOrganCode() == null) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		/** 기타수입 그룹코드가져와서 세팅하기 */
		MM2_13HeadVO headVO = new MM2_13HeadVO();
		headVO.setGroupCode("4100");	//수입분류항목
		headVO.setCodeName("기타수입");
		MM2_13HeadVO codeVO = service.codeInfo(headVO);
        vo.setDetailGroupCode(codeVO.getGroupCode());	//수입분류항목의 기타수입 group code세팅하기
		
        /** 정보조회 */
		List<MM2_13VO> listVo = service.List(vo);
        model.addAttribute("totalCount", listVo.size());
        model.addAttribute("resultList", listVo);
        
        /** 합계 */
        MM2_13VO voSum = service.paymentSum(vo);
        if(voSum!=null) {
        	model.addAttribute("paymentSum", voSum);
        	String sumAmount = voSum.getAmount();
        	if(sumAmount != null && !"".equals(sumAmount)) {
        		model.addAttribute("sumAmount", sumAmount);
        	}
        }
        
        /** 정산일자 */
        voSum = service.paymentDate(vo);
        if(voSum!=null) {
        	model.addAttribute("paymentDate", voSum);
        	String sumDate = voSum.getConfirmDate();
        	if(sumDate != null && !"".equals(sumDate)) {
        		model.addAttribute("sumDate", sumDate);
        	}
        }
		
		return "lionsclubs/com/MM2/MM2_2/MM2_13/MM2_13";
	}	
	
	/**
	 * 기타사항 수정시 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_2/MM2_13/MM2_13_Popup.do")
	public String MM2_13_Popup(ModelMap model, HttpServletRequest request, @ModelAttribute("MM2_13VO") MM2_13VO vo) throws Exception{
		
		MM2_13HeadVO headVO = new MM2_13HeadVO();
		headVO.setGroupCode("4100");	//수입분류항목
		headVO.setCodeName("기타수입");
		MM2_13HeadVO codeVO = service.codeInfo(headVO);
        model.addAttribute("otherIncomeDetailGroupCode", codeVO.getGroupCode());
        model.addAttribute("otherIncomeDetailCode", codeVO.getCode());
        
        vo.setOrganCode(request.getParameter("organCode"));
        
        vo.setDetailGroupCode(codeVO.getGroupCode());	//수입분류항목의 기타수입 group code세팅하기
        vo.setMemberNo(request.getParameter("mno"));
        vo.setIdnNo(request.getParameter("idn"));
        
        MM2_13VO data = service.MM2_13(vo);
		model.addAttribute("dataExist", (data != null));
		model.addAttribute("MM2_13VO", data);
		return "lionsclubs/com/MM2/MM2_2/MM2_13/MM2_13_Popup_Modify";
	}
	

	/**
	 * 기타사항 생성시 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_2/MM2_13/MM2_13_Popup1.do")
	public String MM2_13_Popup1(ModelMap model, HttpServletRequest request, @ModelAttribute("MM2_13VO") MM2_13VO vo) throws Exception{
		
		
		MM2_13HeadVO headVO = new MM2_13HeadVO();
		headVO.setGroupCode("4100");	//수입분류항목
		headVO.setCodeName("기타수입");
		MM2_13HeadVO codeVO = service.codeInfo(headVO);
        model.addAttribute("otherIncomeDetailGroupCode", codeVO.getGroupCode());
        model.addAttribute("otherIncomeDetailCode", codeVO.getCode());
        
		vo.setOrganCode(request.getParameter("organCode"));
		
		model.addAttribute("organCode", request.getParameter("organCode"));
		return "lionsclubs/com/MM2/MM2_2/MM2_13/MM2_13_Popup_Input";
	}
	
	/**
	 * 기타수입 입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_2/MM2_13/otherIncomeInsert.do")
	public ModelAndView otherIncomeInsert(@ModelAttribute("MM2_13VO") MM2_13VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		vo.setInexCode("1000");	// 수입1000, 지출1010
		if(StringUtils.isNotEmpty(vo.getInexDate())) {
			vo.setCaYm(vo.getInexDate().substring(0,6));
		}
		
		if(checkClosedMonth(vo.getInexDate(),vo.getOrganCode())) {
			model.put("result", "CONFIRM");
		}else {
			service.calculateInsert(vo);
			service.otherIncomeInsert(vo);
			model.put("result", true);
		}
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 기타수입 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_2/MM2_13/otherIncomeUpdate.do")
	public ModelAndView otherIncomeUpdate(@ModelAttribute("MM2_13VO") MM2_13VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
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
	@RequestMapping("/MM2/MM2_2/MM2_13/otherIncomeDelete.do")
	public ModelAndView otherIncomeDelete(@ModelAttribute("MM2_13VO") MM2_13VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
        MM2_13VO data = service.MM2_13(vo);
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
		return _15service.selectClosedMonthFlag(closeVo);
	}
}
