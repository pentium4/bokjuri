package lionsclubs.com.MM2.MM2_2.MM2_17;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import lionsclubs.com.MM2.MM2_4.MM2_24.MM2_24VO_PARAM;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM2_17Controller {
	@Resource private MM2_17Service service;
	@Resource MappingJacksonJsonView ajaxMainView;	

	private void setPrevVo(MM2_17VO_PARAM vo, MM2_17VO_PARAM prevVo) throws Exception {
		Calendar calendar = Calendar.getInstance(Locale.KOREA);
		String realYm = CommonUtil.calcYearMonth(vo.getSessionYear(),vo.getMonth());
		calendar.set(Integer.parseInt(realYm.substring(0, 4)), Integer.parseInt(realYm.substring(4, 6)) - 1, 1);
		calendar.add(Calendar.MONTH, -1); 
		prevVo.setMonth(new SimpleDateFormat("MM").format(calendar.getTime()));
		String newYear = CommonUtil.dateToSessionYear(new SimpleDateFormat("yyyyMMdd").format(calendar.getTime()));
		prevVo.setSessionYear(newYear);
	}
	
	@RequestMapping("/MM2/MM2_2/MM2_17/MM2_17.do")
	public String MM2_17(ModelMap model, @ModelAttribute("MM2_17VO_PARAM") MM2_17VO_PARAM vo, @ModelAttribute("MM2_24VO_PARAM") MM2_24VO_PARAM linkVo) throws Exception{
		try{
			/** 회원번호 및 조직 세션에서 가져오기 */
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			vo.setInsertId(user.getId());
			vo.setUpdateId(user.getId());
	
			if(vo.getSessionYear() == null) {
				if(linkVo.getYearCode() != null) {
					vo.setSessionYear(linkVo.getYearCode());
				}else{
					vo.setSessionYear(CommonUtil.thisSessionYear());
				}
			}
			
			if(vo.getMonth() == null) {
				if(linkVo.getMonthCode() != null) {
					vo.setMonth(linkVo.getMonthCode());
				}else{
					vo.setMonth(CommonUtil.thisMonth());
				}
			}
			
			if(vo.getOrganCode() == null) {
				if(linkVo.getOrganCode() != null) {
					vo.setOrganCode(linkVo.getOrganCode());
				}else{
					vo.setOrganCode(user.getSearchClubCode());
				}
			}
			
			/* 클럽기본정보 조회 */
			Map<String,String> mapMemberData = service.getBaseMemberInfo(vo);
			if(mapMemberData == null) mapMemberData = new HashMap<String,String>();
			model.addAttribute("memberData", mapMemberData);
	
			/* 정산여부정보 조회 */
			Map<String,Object> mapBaseCalcData = service.getBaseCalcInfo(vo);
			if(mapBaseCalcData == null) mapBaseCalcData = new HashMap<String,Object>();
			model.addAttribute("calcData", mapBaseCalcData);
			
			/* 수입항목 총계 조회 */
			Long intIncomeTotal = service.getIncomeTotal(vo);
			model.addAttribute("incomeTotal",intIncomeTotal);
			
			/* 수입항목 리스트 조회 */
			List<MM2_17VO_INCOME> listIncomeList = service.selectIncomeList(vo);
			model.addAttribute("incomeList",listIncomeList);
	
			/* 지출항목 총계 조회 */
			Long intExpTotal = service.getExpTotal(vo);
			model.addAttribute("expTotal",intExpTotal);
			
			/* 지출항목 리스트 조회 */
			List<MM2_17VO_INCOME> listExpList = service.selectExpList(vo);
			model.addAttribute("expList",listExpList);
	
			/* 결손정보 조회 */
			Map<String,Double> mapDepTotalData = service.getDepTotalInfo(vo);
			model.addAttribute("depTotalData", mapDepTotalData);
			
			/* 예금 총계 조회 */
			Long intDepositTotal = service.getDepositTotal(vo);
			model.addAttribute("depositTotal",intDepositTotal);
	
			/* 회비미수금 조회 */
			Long intNotIncome1000Total = service.getNotIncome1000Total(vo);
			model.addAttribute("notIncome1000Total",intNotIncome1000Total);
	
			/* 기타미수금 조회 */
			Long intNotIncomeEtcTotal = service.getNotIncomeEtcTotal(vo);
			model.addAttribute("notIncomeEtcTotal",intNotIncomeEtcTotal);
	
			/* 미수금 총액 */
			Long intNotIncomeTotal = intNotIncome1000Total + intNotIncomeEtcTotal;
			model.addAttribute("notIncomeTotal", intNotIncomeTotal);
			
			MM2_17VO_PARAM prevVo = new MM2_17VO_PARAM();
			prevVo.setOrganCode(vo.getOrganCode());
			prevVo.setMonth(vo.getMonth());
			prevVo.setSessionYear(vo.getSessionYear());
			
			if(!"".equals(prevVo.getMonth())) {
				setPrevVo(vo,prevVo);
			}else{
				prevVo.setSessionYear(String.valueOf(Integer.parseInt(prevVo.getSessionYear()) -1));
			}
			
			/*전월의 이월잔액, 정기예금, 회비미수,기타미수 조회 */
			Map<String,Object> mapPrevCalcData = service.getBaseCalcInfo(prevVo);

			/* 전월잔액 */
			Long intPrevMonthTotal = (Long)mapPrevCalcData.get("MONTH_TOTAL");
			model.addAttribute("prevMonthTotal", intPrevMonthTotal);

			/* 전월잔액 */
			Long intPrevMonthRemain = (Long)mapPrevCalcData.get("MONTH_REMAIN");
			model.addAttribute("prevMonthRemain", intPrevMonthRemain);
	
			/* 전월예금 총계 조회 */
			Long intDepositTotalPrev = (Long)mapPrevCalcData.get("DEPOSIT_TOTAL");
			model.addAttribute("depositTotalPrev", intDepositTotalPrev);
	
			/* 전월회비미수금 조회 */
			Long intNotIncome1000TotalPrev = (Long)mapPrevCalcData.get("NOT_INCOME_1000_TOTAL");
			model.addAttribute("notIncome1000TotalPrev",intNotIncome1000TotalPrev);
	
			/* 전월기타미수금 조회 */
			Long intNotIncomeEtcTotalPrev = (Long)mapPrevCalcData.get("NOT_INCOME_ETC_TOTAL");
			model.addAttribute("notIncomeEtcTotalPrev",intNotIncomeEtcTotalPrev);
	
			/* 전월미수금 총액 */
			Long intNotIncomeTotalPrev = intNotIncome1000TotalPrev + intNotIncomeEtcTotalPrev;
			model.addAttribute("notIncomeTotalPrev", intNotIncomeTotalPrev);
	
			/* 당월총액 */
			Long intMonthTotal = (long)intPrevMonthTotal + (long)intIncomeTotal - (long)intExpTotal;
			model.addAttribute("monthTotal", intMonthTotal);
			
			/* 당월잔액 */
			Long intMonthRemain = (long)intMonthTotal + (long)intDepositTotal;
			model.addAttribute("monthRemain", intMonthRemain);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "lionsclubs/com/MM2/MM2_2/MM2_17/MM2_17";
	}
	
	/**
	 * 예금현황
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_2/MM2_17/MM2_17_Popup_Deposit.do")
	public String MM2_17_Popup_Deposit(ModelMap model, @ModelAttribute("MM2_17VO") MM2_17VO vo) throws Exception{
		model.addAttribute("DepositList", service.DepositList(vo));
		model.addAttribute("DepositSum", service.DepositSum(vo));
		return "lionsclubs/com/MM2/MM2_2/MM2_17/MM2_17_Popup_Deposit";
	}
	
	/**
	 * 미수금
	 * @param model
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_2/MM2_17/MM2_17_Popup_NotGet.do")
	public String MM2_17_Popup_NotGet(ModelMap model, @ModelAttribute("MM2_17VO") MM2_17VO vo) throws Exception{
		model.addAttribute("NotGetList", service.NotGetList(vo));
		model.addAttribute("NotGetSum", service.NotGetSum(vo));
		return "lionsclubs/com/MM2/MM2_2/MM2_17/MM2_17_Popup_NotGet";
	}
	
	/**
	 * 결손금
	 * @param model
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_2/MM2_17/MM2_17_Popup_Deficit.do")
	public String MM2_17_Popup_Deficit(ModelMap model, @ModelAttribute("MM2_17VO") MM2_17VO vo) throws Exception{
		model.addAttribute("DeficitList", service.DeficitList(vo));
		model.addAttribute("DeficitSum", service.DeficitSum(vo));
		return "lionsclubs/com/MM2/MM2_2/MM2_17/MM2_17_Popup_Deficit";
	}

	/**
	 * 수입항목
	 * @param model
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_2/MM2_17/MM2_17_Popup_Income.do")
	public String MM2_17_Popup_Income(ModelMap model, @ModelAttribute("MM2_17VO") MM2_17VO vo) throws Exception{
		model.addAttribute("IncomeList", service.IncomeDetailList(vo));
		model.addAttribute("IncomeSum", service.IncomeSum(vo));
		return "lionsclubs/com/MM2/MM2_2/MM2_17/MM2_17_Popup_Income";
	}

	/**
	 * 지출
	 * @param model
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_2/MM2_17/MM2_17_Popup_Expend.do")
	public String MM2_17_Popup_Expend(ModelMap model, @ModelAttribute("MM2_17VO") MM2_17VO vo) throws Exception{
		model.addAttribute("ExpendList", service.ExpendDetailList(vo));
		model.addAttribute("ExpendSum", service.ExpendSum(vo));

		return "lionsclubs/com/MM2/MM2_2/MM2_17/MM2_17_Popup_Expend";
	}

	/**
	 * 정산 처리
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_2/MM2_17/calculateConfirm.do")
	public ModelAndView calculateConfirm(@ModelAttribute("MM2_17VO_PARAM") MM2_17VO_PARAM vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();
		try{
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	
			MM2_17VO_PARAM prevVo = new MM2_17VO_PARAM();
			prevVo.setOrganCode(vo.getOrganCode());
			prevVo.setMonth(vo.getMonth());
			prevVo.setSessionYear(vo.getSessionYear());
			
			if(!"".equals(prevVo.getMonth())) {
				setPrevVo(vo,prevVo);
			}else{
				prevVo.setSessionYear(String.valueOf(Integer.parseInt(prevVo.getSessionYear()) -1));
			}
			
			/* 전월정산 확정여부정보 조회 */
			Map<String,Object> mapBaseCalcDataPrev = service.getBaseCalcInfo(prevVo);
		
			if(mapBaseCalcDataPrev != null){
				if(!"Y".equals((String)mapBaseCalcDataPrev.get("CONFIRM_LOCK_YN"))){ // 전월의 자료가 정산확정되어 있어야 정산확정할 수 있다.
					model.put("result", "CONFIRM");
					model.put("message", "전월의 정산확정이 되지 않아 정산처리를 할 수 없습니다.");
				}else{
					/* 정산여부정보 조회 */
					Map<String,Object> mapBaseCalcData = service.getBaseCalcInfo(vo);
					if("Y".equals((String)mapBaseCalcData.get("CONFIRM_YN"))){ // 이미 정산확정된 자료는 재정산 하지 않는다.
						model.put("result", "CONFIRM");
						model.put("message", "해당 회기의 월정산이 이미 확정되어 처리할 수 없습니다.");
					}else{
						vo.setCaYm(CommonUtil.calcYearMonth(vo.getSessionYear(), vo.getMonth()));
						vo.setConfirmYn("Y");
						vo.setInsertId(user.getId());
						vo.setUpdateId(user.getId());
		
						model.put("result", service.calculateConfirm(vo));
					}
				}
			} else {
				model.put("result", "CONFIRM");
				model.put("message", "전월의 정산확정이 되지 않아 정산처리를 할 수 없습니다.");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return new ModelAndView(ajaxMainView, model);
	}

	/**
	 * 정산 취소
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_2/MM2_17/calculateCancel.do")
	public ModelAndView calculateCancel(@ModelAttribute("MM2_17VO_PARAM") MM2_17VO_PARAM vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setCaYm(CommonUtil.calcYearMonth(vo.getSessionYear(), vo.getMonth()));
		vo.setConfirmYn("N");
		vo.setInsertId(user.getId());
		vo.setUpdateId(user.getId());

		
		/* 전월정산 확정여부정보 조회 */
		Map<String,Object> mapBaseCalcDataLock = service.getBaseCalcInfo(vo);
		if("Y".equals((String)mapBaseCalcDataLock.get("CONFIRM_LOCK_YN"))){ // 전월의 자료가 정산확정되어 있어야 정산확정할 수 있다.
			model.put("result", "CONFIRM");
			model.put("message", "해당 회기의 월정산이 확정되어 정산 취소처리를 할 수 없습니다.");
		}else{

		
			/* 정산여부정보 조회 */
			Map<String,Object> mapBaseCalcData = service.getBaseCalcInfo(vo);
			if(!"Y".equals((String)mapBaseCalcData.get("CONFIRM_YN"))){ // 정산처리된 자료인지 확인 -- 정산되지 않은 자료는 취소처리할 수 없다.
				model.put("result", "CONFIRM");
				model.put("message", "해당 회기의 월정산이 되지 않아서 취소 처리할 수 없습니다.");
			}else{
				model.put("result", service.calculateConfirm(vo));
			}		
		}
		return new ModelAndView(ajaxMainView, model);
	}
	
	/**
	 * 정산확정 처리
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_2/MM2_17/calculateConfirmLock.do")
	public ModelAndView calculateConfirmLock(@ModelAttribute("MM2_17VO_PARAM") MM2_17VO_PARAM vo) throws Exception{
		Map<String, Object> model = new HashMap<String, Object>();

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		vo.setCaYm(CommonUtil.calcYearMonth(vo.getSessionYear(), vo.getMonth()));
		vo.setInsertId(user.getId());
		vo.setUpdateId(user.getId());
	
		/* 정산여부정보 조회 */
		Map<String,Object> mapBaseCalcData = service.getBaseCalcInfo(vo);
		if("Y".equals((String)mapBaseCalcData.get("CONFIRM_LOCK_YN"))){ //이미 정산확정처리되었는지 확인 -- 정산확정처리된 자료는 재정산확정하지 않는다.
			model.put("result", "CONFIRM");
		}else{
			model.put("result", service.calculateConfirmLock(vo));
		}
		return new ModelAndView(ajaxMainView, model);
	}
}