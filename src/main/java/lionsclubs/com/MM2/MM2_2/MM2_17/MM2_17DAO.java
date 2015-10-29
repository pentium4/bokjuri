package lionsclubs.com.MM2.MM2_2.MM2_17;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lionsclubs.com.cmm.pagging.LionsAbstractDAO;
import org.springframework.stereotype.Repository;

@Repository
public class MM2_17DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM2.MM2_2.MM2_17.";

	/*
	 * 클럽직책자 조회(회장,총무,재무)
	 */
	@SuppressWarnings("unchecked")
	public Map<String,String> getBaseMemberInfo(MM2_17VO_PARAM vo) throws Exception {
		return (Map<String,String>)selectByPk(commonId + "getBaseMemberInfo", vo);
	}

	/*
	 * 정산여부 조회(정산일자,정산여부,정산횟수)
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> getBaseCalcInfo(MM2_17VO_PARAM vo) throws Exception {
		Map<String,Object> result = (Map<String,Object>)selectByPk(commonId + "getBaseCalcInfo", vo);
		if(result == null) {
			result = new HashMap<String,Object>();
			result.put("CONFIRM_YN", "");
			result.put("CONFIRM_COUNT", 0);
			result.put("CONFIRM_LOCK_DATE","");
			result.put("CONFIRM_LOCK_YN", "");
			result.put("CONFIRM_DATE", "");
			result.put("MONTH_REMAIN", 0L);
			result.put("DEPOSIT_TOTAL", 0L);
			result.put("NOT_INCOME_1000_TOTAL", 0L);
			result.put("NOT_INCOME_ETC_TOTAL", 0L);
		}
		return result;
	}

	/*
	 * 정산 및 정산 취소
	 */
	public boolean calculateConfirm(MM2_17VO_PARAM vo) throws Exception {
		return (update(commonId + "calculateConfirm", vo) == 1);
	}
	
	/*
	 * 정산확정
	 */
	public boolean calculateConfirmLock(MM2_17VO_PARAM vo) throws Exception {
		return (update(commonId + "calculateConfirmLock", vo) == 1);
	}
	
	/*
	 * 수입항목별 총액 리스트 조회
	 */
	@SuppressWarnings("unchecked")
	public List<MM2_17VO_INCOME> selectIncomeList(MM2_17VO_PARAM vo) throws Exception {
		return (List<MM2_17VO_INCOME>)this.list(commonId + "selectIncomeList", vo);
	}

	/*
	 * 수입 총액 조회
	 */
	public Long getIncomeTotal(MM2_17VO_PARAM vo) throws Exception {
		Long total = (Long)this.selectByPk(commonId + "getIncomeTotal", vo);
		return (total == null ? 0 : total);
	}
	
	/*
	 * 지출항목별 총액 리스트 조회
	 */
	@SuppressWarnings("unchecked")
	public List<MM2_17VO_INCOME> selectExpList(MM2_17VO_PARAM vo) throws Exception {
		return (List<MM2_17VO_INCOME>)this.list(commonId + "selectExpList", vo);
	}

	/*
	 * 지출 총액 조회
	 */
	public Long getExpTotal(MM2_17VO_PARAM vo) throws Exception {
		Long total = (Long)this.selectByPk(commonId + "getExpTotal", vo);
		return (total == null ? 0 : total);
	}

	/*
	 * 결손금액 조회
	 */
	public Map<String,Double> getDepTotalInfo(MM2_17VO_PARAM vo) throws Exception {
		@SuppressWarnings("unchecked")
		Map<String,Double> mapTotal = (Map<String,Double>)this.selectByPk(commonId + "getDepTotalInfo", vo);
		if(mapTotal == null) {
			mapTotal = new HashMap<String,Double>();
			mapTotal.put("TOTAL", (double) 0L);
			mapTotal.put("AMOUNT_1000", (double) 0L);
			mapTotal.put("AMOUNT_CLUB", (double) 0L);
			mapTotal.put("AMOUNT_ETC", (double) 0L);
			mapTotal.put("CNT", (double) 0L);
		}
		return mapTotal;
	}
	
	/*
	 * 정기예금 총액 조회
	 */
	public Long getDepositTotal(MM2_17VO_PARAM vo) throws Exception {
		Long total = (Long)this.selectByPk(commonId + "getDepositTotal", vo);
		return (total == null ? 0 : total);
	}
	
	/*
	 * 회비 미수금 총액 조회
	 */
	public Long getNotIncome1000Total(MM2_17VO_PARAM vo) throws Exception {
		Long total = (Long)this.selectByPk(commonId + "getNotIncome1000Total", vo);
		return (total == null ? 0 : total);
	}
	
	/*
	 * 기타 미수금 총액 조회
	 */
	public Long getNotIncomeEtcTotal(MM2_17VO_PARAM vo) throws Exception {
		Long total = (Long)this.selectByPk(commonId + "getNotIncomeEtcTotal", vo);
		return (total == null ? 0 : total);
	}
	
	/*
 	 * 이월 잔액 조회
	 */
	public Long getPrevMonthTotal(MM2_17VO_PARAM vo) throws Exception {
		Long total = (Long)this.selectByPk(commonId + "getPrevMonthTotal", vo);
		return (total == null ? 0 : total);
	}
	
	@SuppressWarnings("unchecked")
	public List<MM2_17VO> IncomeList(MM2_17VO vo) throws Exception {
		return (List<MM2_17VO>)list(commonId + "IncomeList", vo);
    }

	@SuppressWarnings("unchecked")
	public List<MM2_17VO> ExpendList(MM2_17VO vo) throws Exception {
		return (List<MM2_17VO>)list(commonId + "ExpendList", vo);
    }

	public MM2_17VO DepositSum(MM2_17VO vo) throws Exception {
		return (MM2_17VO)selectByPk(commonId + "DepositSum", vo);
    }
	
	@SuppressWarnings("unchecked")
	public List<MM2_17VO> DepositList(MM2_17VO vo) throws Exception {
		return (List<MM2_17VO>)list(commonId + "DepositList", vo);
    }

	public MM2_17VO NotGetSum(MM2_17VO vo) throws Exception {
		return (MM2_17VO)selectByPk(commonId + "NotGetSum", vo);
    }
	
	@SuppressWarnings("unchecked")
	public List<MM2_17VO> NotGetList(MM2_17VO vo) throws Exception {
		return (List<MM2_17VO>)list(commonId + "NotGetList", vo);
    }

	public MM2_17VO DeficitSum(MM2_17VO vo) throws Exception {
		return (MM2_17VO)selectByPk(commonId + "DeficitSum", vo);
    }
	
	@SuppressWarnings("unchecked")
	public List<MM2_17VO> DeficitList(MM2_17VO vo) throws Exception {
		return (List<MM2_17VO>)list(commonId + "DeficitList", vo);
    }

	public MM2_17VO IncomeSum(MM2_17VO vo) throws Exception {
		return (MM2_17VO)selectByPk(commonId + "IncomeSum", vo);
    }
	
	@SuppressWarnings("unchecked")
	public List<MM2_17VO> IncomeDetailList(MM2_17VO vo) throws Exception {
		return (List<MM2_17VO>)list(commonId + "IncomeDetailList", vo);
    }

	public MM2_17VO ExpendSum(MM2_17VO vo) throws Exception {
		return (MM2_17VO)selectByPk(commonId + "ExpendSum", vo);
    }
	
	@SuppressWarnings("unchecked")
	public List<MM2_17VO> ExpendDetailList(MM2_17VO vo) throws Exception {
		return (List<MM2_17VO>)list(commonId + "ExpendDetailList", vo);
    }
}