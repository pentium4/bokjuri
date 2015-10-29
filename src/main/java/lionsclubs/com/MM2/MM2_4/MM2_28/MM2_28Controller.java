package lionsclubs.com.MM2.MM2_4.MM2_28;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import lionsclubs.com.MM2.MM2_2.MM2_17.MM2_17Service;
import lionsclubs.com.MM2.MM2_2.MM2_17.MM2_17VO;
import lionsclubs.com.MM2.MM2_2.MM2_17.MM2_17VO_INCOME;
import lionsclubs.com.MM2.MM2_2.MM2_17.MM2_17VO_PARAM;
import lionsclubs.com.MM2.MM2_2.MM2_18.MM2_18Service;
import lionsclubs.com.cmm.common.CommonUtil;
import lionsclubs.com.login.LoginVO;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

@Controller
public class MM2_28Controller {
	@Resource private MM2_28Service service;
	@Resource private MM2_17Service mm217Service;
	@Resource private MM2_18Service mm218Service;
	
	private void setPrevVo(MM2_17VO_PARAM vo, MM2_17VO_PARAM prevVo) throws Exception {
		Calendar calendar = Calendar.getInstance(Locale.KOREA);
		String realYm = CommonUtil.calcYearMonth(vo.getSessionYear(),vo.getMonth());
		calendar.set(Integer.parseInt(realYm.substring(0, 4)), Integer.parseInt(realYm.substring(4, 6)) - 1, 1);
		calendar.add(Calendar.MONTH, -1); 
		prevVo.setMonth(new SimpleDateFormat("MM").format(calendar.getTime()));
		String newYear = CommonUtil.dateToSessionYear(new SimpleDateFormat("yyyyMMdd").format(calendar.getTime()));
		prevVo.setSessionYear(newYear);
	}	
	
	@RequestMapping("/MM2/MM2_4/MM2_28/MM2_28.do")
	public String MM2_28(ModelMap model, @ModelAttribute("MM2_17VO_PARAM") MM2_17VO_PARAM vo) throws Exception{
		try{
			/** 회원번호 및 조직 세션에서 가져오기 */
			LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
			vo.setInsertId(user.getId());
			vo.setUpdateId(user.getId());
	
			if(StringUtils.isEmpty(vo.getSessionYear())) {
				vo.setSessionYear(CommonUtil.thisSessionYear());
			}
			
			if(vo.getMonth() == null) {
				vo.setMonth(CommonUtil.thisMonth());
			}
			
			if(StringUtils.isEmpty(vo.getOrganCode())) {
				vo.setOrganCode(user.getSearchClubCode());
			}
			
			/* 클럽기본정보 조회 */
			Map<String,String> mapMemberData = mm217Service.getBaseMemberInfo(vo);
			if(mapMemberData == null) mapMemberData = new HashMap<String,String>();
			model.addAttribute("memberData", mapMemberData);
	
			/* 정산여부정보 조회 */
			Map<String,Object> mapBaseCalcData = mm217Service.getBaseCalcInfo(vo);
			if(mapBaseCalcData == null) mapBaseCalcData = new HashMap<String,Object>();
			model.addAttribute("calcData", mapBaseCalcData);
			
			/* 수입항목 총계 조회 */
			Long intIncomeTotal = mm217Service.getIncomeTotal(vo);
			model.addAttribute("incomeTotal",intIncomeTotal);
			
			/* 수입항목 리스트 조회 */
			List<MM2_17VO_INCOME> listIncomeList = mm217Service.selectIncomeList(vo);
			model.addAttribute("incomeList",listIncomeList);
	
			/* 지출항목 총계 조회 */
			Long intExpTotal = mm217Service.getExpTotal(vo);
			model.addAttribute("expTotal",intExpTotal);
			
			/* 지출항목 리스트 조회 */
			List<MM2_17VO_INCOME> listExpList = mm217Service.selectExpList(vo);
			model.addAttribute("expList",listExpList);
	
			/* 결손정보 조회 */
			Map<String,Double> mapDepTotalData = mm217Service.getDepTotalInfo(vo);
			model.addAttribute("depTotalData", mapDepTotalData);
			
			/* 예금 총계 조회 */
			Long intDepositTotal = mm217Service.getDepositTotal(vo);
			model.addAttribute("depositTotal",intDepositTotal);
	
			/* 회비미수금 조회 */
			Long intNotIncome1000Total = mm217Service.getNotIncome1000Total(vo);
			model.addAttribute("notIncome1000Total",intNotIncome1000Total);
	
			/* 기타미수금 조회 */
			Long intNotIncomeEtcTotal = mm217Service.getNotIncomeEtcTotal(vo);
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
			Map<String,Object> mapPrevCalcData = mm217Service.getBaseCalcInfo(prevVo);

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
		
		return "lionsclubs/com/MM2/MM2_4/MM2_28/MM2_28";
	}
	
	/**
	 * 수입항목
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_4/MM2_28/presentationIncome.do")
	public String presentationIncome(ModelMap model, @ModelAttribute("MM2_17VO") MM2_17VO mm217vo, @ModelAttribute("MM2_28VO") MM2_28VO vo) throws Exception{
		List<Map<String,Object>> headList = service.selectIncomeHead(vo);
		if(headList.size() > 0){
			model.addAttribute("headList", headList);
			
			List<Map<String, Object>> resultList = service.selectIncome(vo);
			Map<String,Object> paySum = service.selectIncomeSum(vo);
	        model.addAttribute("resultList", resultList);
	        model.addAttribute("paySum", paySum);
	        model.addAttribute("totalCount", resultList.size());
		}
		
		model.addAttribute("itemKind", "income");
		model.addAttribute("incomeList", mm217Service.IncomeDetailList(mm217vo));
		model.addAttribute("incomeSum", mm217Service.IncomeSum(mm217vo));        
        
        return "lionsclubs/com/MM2/MM2_4/MM2_28/presentationClassItem";
	}
	
	/**
	 * 지출항목
	 * @param model
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_4/MM2_28/presentationExpend.do")
	public String presentationExpend(ModelMap model, @ModelAttribute("MM2_17VO") MM2_17VO vo) throws Exception{
		model.addAttribute("resultList", mm217Service.ExpendDetailList(vo));
		model.addAttribute("sum", mm217Service.ExpendSum(vo));

		return "lionsclubs/com/MM2/MM2_4/MM2_28/presentationExpend";
	}	
	
	/**
	 * 결손항목
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_4/MM2_28/presentationDefect.do")
	public String presentationDefect(ModelMap model, @ModelAttribute("MM2_17VO") MM2_17VO mm217vo, @ModelAttribute("MM2_28VO") MM2_28VO vo) throws Exception{
		List<Map<String,Object>> headList = service.selectDefectHead(vo);
		if(headList.size() > 0){
			model.addAttribute("headList", headList);
			List<Map<String, Object>> resultList = service.selectDefect(vo);
			Map<String,Object> paySum = service.selectDefectSum(vo);
	        model.addAttribute("resultList", resultList);
	        model.addAttribute("paySum", paySum);
	        model.addAttribute("totalCount", resultList.size());
		}

		model.addAttribute("itemKind", "defect");
		model.addAttribute("defectList", mm217Service.DeficitList(mm217vo));
		model.addAttribute("defectSum", mm217Service.DeficitSum(mm217vo));
        
        return "lionsclubs/com/MM2/MM2_4/MM2_28/presentationClassItem";
	}	
	
	
	/**
	 * 예금현황
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_4/MM2_28/presentationDeposit.do")
	public String presentationDeposit(ModelMap model, @ModelAttribute("MM2_17VO") MM2_17VO vo) throws Exception{
		
		model.addAttribute("resultList", mm217Service.DepositList(vo));
		model.addAttribute("sum", mm217Service.DepositSum(vo));
		
		return "lionsclubs/com/MM2/MM2_4/MM2_28/presentationDeposit";
	}	
	
	/**
	 * 미수금
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/MM2/MM2_4/MM2_28/presentationDebt.do")
	public String presentationDebtDues(ModelMap model, @ModelAttribute("MM2_17VO") MM2_17VO mm217vo, @ModelAttribute("MM2_28VO") MM2_28VO vo) throws Exception{
		List<Map<String,Object>> headList = service.selectDebtHead(vo);
		if(headList.size() > 0){
			model.addAttribute("headList", headList);
			List<Map<String, Object>> resultList = service.selectDebt(vo);
			Map<String,Object> paySum = service.selectDebtSum(vo);
	        model.addAttribute("resultList", resultList);
	        model.addAttribute("paySum", paySum);
	        model.addAttribute("totalCount", resultList.size());
		}
		
		model.addAttribute("itemKind", "debt");
		model.addAttribute("debtList", mm217Service.NotGetList(mm217vo));
		model.addAttribute("debtSum", mm217Service.NotGetSum(mm217vo));
        
        return "lionsclubs/com/MM2/MM2_4/MM2_28/presentationClassItem";
	}
}