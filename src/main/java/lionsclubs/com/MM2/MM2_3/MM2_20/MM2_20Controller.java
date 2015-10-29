package lionsclubs.com.MM2.MM2_3.MM2_20;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import lionsclubs.com.MM2.MM2_2.MM2_13.MM2_13Service;
import lionsclubs.com.MM2.MM2_2.MM2_13.MM2_13VO;
import lionsclubs.com.SM1.SM1_2.SM1_04.SM1_04Service;
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
public class MM2_20Controller {
	@Resource private MM2_20Service service;
	@Resource MappingJacksonJsonView ajaxMainView;	
	@Resource private SM1_04Service sm104Service;
	@Resource private MM2_13Service service13;
	@Resource private CommonCodeService commonCodeService;
	
	@RequestMapping("/MM2/MM2_3/MM2_20/MM2_20.do")
	public String MM2_20(ModelMap model, @ModelAttribute("MM2_20VO") MM2_20VO vo) throws Exception{
		
		/** 현재년월 세팅 */
		vo.setRecordCountPerPage(30);
		String thisyear = vo.getThisYear()== null ? CommonUtil.thisSessionYear() : vo.getThisYear(); //년도를 구한다
		String thisMonth = vo.getThisMonth()== null ? CommonUtil.thisMonth() : vo.getThisMonth(); //이번달을 구한다
		vo.setThisYear(thisyear);
		vo.setThisMonth(thisMonth);
		/** 현재년월 세팅 */
		
		/** 회원번호 및 조직 세션에서 가져오기 */
		String organCode = vo.getOrganCode();
		String memberNo = vo.getMemberNo();
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		if(StringUtils.isEmpty(memberNo)) {
//			memberNo = user.getId();
			memberNo = user.getSearchId();
			vo.setMemberNo(memberNo);
		}
		
		if(StringUtils.isEmpty(organCode)) {
			vo.setOrganCode(user.getSearchClubCode());
		}
		
		List<MM2_20VO> listVo = service.List(vo);
        model.addAttribute("totalCount", listVo.size());
        model.addAttribute("resultList", listVo);
        
		return "lionsclubs/com/MM2/MM2_3/MM2_20/MM2_20";
	}	
	
	/**
	 * 연간수입예산 수정시 팝업
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_3/MM2_20/MM2_20_Popup.do")
	public String MM2_20_Popup(ModelMap model, HttpServletRequest request, @ModelAttribute("MM2_20VO") MM2_20VO vo) throws Exception{
		
		vo.setMemberNo(request.getParameter("mno"));
		vo.setIdnNo(request.getParameter("idn"));
		
		model.addAttribute("MM2_20VO", service.MM2_20(vo));
		model.addAttribute("codeList", commonCodeService.codelist("6000"));
		
		return "lionsclubs/com/MM2/MM2_3/MM2_20/MM2_20_Popup_Modify";
	}
	

	/**
	 * 연간수입예산 생성시 팝업
	 * @param model
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_3/MM2_20/MM2_20_Popup1.do")
	public String MM2_20_Popup1(ModelMap model, HttpServletRequest request, @ModelAttribute("MM2_20VO") MM2_20VO vo) throws Exception{
		
		String thisYear = request.getParameter("thisYear");
		vo.setOrganCode(request.getParameter("organCode"));
		vo.setThisYear(thisYear);

		/** 예산시작월 초기값 세팅 */
		int thisYearInt = 0;
		if(thisYear!=null) thisYearInt = Integer.parseInt(thisYear);
		String caYm = vo.getCaYm()==null ? Integer.toString(thisYearInt-1) + "07" : vo.getCaYm(); //예산시작월을 구한다
		vo.setCaYm(caYm);
		/** 예산시작월 초기값 세팅 */

		
		model.addAttribute("organCode", request.getParameter("organCode"));
		model.addAttribute("thisYear", thisYear);
		model.addAttribute("codeList", commonCodeService.codelist("6000"));
		
		return "lionsclubs/com/MM2/MM2_3/MM2_20/MM2_20_Popup_Input";
	}
	
	/**
	 * 연간지출 입력
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_3/MM2_20/otherIncomeInsert.do")
	public ModelAndView otherIncomeInsert(HttpServletRequest request, @ModelAttribute("MM2_20VO") MM2_20VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		String amount = vo.getAmount();
		String unit = vo.getUnit();
		String atandAmount = vo.getAtandAmount();
		unit = unit.replaceAll("\\,", "");
		atandAmount = atandAmount.replaceAll("\\,", "");
		if(unit!=null && !"".equals(unit) && atandAmount!=null && !"".equals(atandAmount) ) {
			amount = ""+Integer.parseInt(unit) * Integer.parseInt(atandAmount);
		}
		vo.setAmount(amount);
		vo.setUnit(unit);
		vo.setAtandAmount(atandAmount);
		vo.setInexCode("1000");	//수입1000, 지출1010
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setInsertName(user.getId());
		vo.setUpdateName(user.getId());
		
		String thisYearStr = vo.getThisYear();
		int thisYearInt = 0;
		if(thisYearStr!=null) thisYearInt = Integer.parseInt(thisYearStr);
		MM2_13VO vo13 = new MM2_13VO();
		vo13.setOrganCode(vo.getOrganCode());
		vo13.setInexDate((thisYearInt-1)+"07"); /* 회기년월=회기시작월(지난 년도의 07월) */
		vo13.setInsertName(user.getId());
		vo13.setUpdateName(user.getId());
		
		service13.calculateInsert(vo13);
		service.otherIncomeInsert(vo);
		model.put("result", true);
		
		return new ModelAndView(ajaxMainView, model);
	}
	
	@RequestMapping("/MM2/MM2_3/MM2_20/otherIncomeUpdate.do")
	public ModelAndView otherIncomeUpdate(HttpServletRequest request, @ModelAttribute("MM2_20VO") MM2_20VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		String amount = vo.getAmount();
		String unit = vo.getUnit();
		String atandAmount = vo.getAtandAmount();
		unit = unit.replaceAll("\\,", "");
		atandAmount = atandAmount.replaceAll("\\,", "");
		if(unit!=null && !"".equals(unit) && atandAmount!=null && !"".equals(atandAmount) ) {
			amount = ""+Integer.parseInt(unit) * Integer.parseInt(atandAmount);
		}
		vo.setAmount(amount);
		vo.setUnit(unit);
		vo.setAtandAmount(atandAmount);
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setUpdateName(user.getId());
		
		model.put("result", service.otherIncomeUpdate(vo));
		
		return new ModelAndView(ajaxMainView, model);
	}
		
	
	/**
	 * 삭제
	 */
	@RequestMapping("/MM2/MM2_3/MM2_20/otherIncomeDelete.do")
	public ModelAndView otherIncomeDelete(HttpServletRequest request, @ModelAttribute("MM2_20VO") MM2_20VO vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		
		if(service.otherIncomeDelete(vo) == 1){
			model.put("result", true);	
		} else {
			model.put("result", false);
		}
		
		return new ModelAndView(ajaxMainView, model);
	}

	@RequestMapping("/MM2/MM2_3/MM2_20/duplicateCheck.do")
	public ModelAndView duplicateCheck(HttpServletRequest request, @ModelAttribute("MM2_20VO") MM2_20VO vo) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		MM2_20VO dupliVO = service.duplicateCheck(vo);
		model.put("result", dupliVO.getIsExist());
		return new ModelAndView(ajaxMainView, model);
	}

}
