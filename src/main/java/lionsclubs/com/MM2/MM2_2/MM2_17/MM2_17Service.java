package lionsclubs.com.MM2.MM2_2.MM2_17;

import java.util.List;
import java.util.Map;

public interface MM2_17Service {
	/*
	 * 클럽직책자 조회(회장,총무,재무)
	 */
	public Map<String,String> getBaseMemberInfo(MM2_17VO_PARAM vo) throws Exception;

	/*
	 * 정산여부 조회(정산일자,정산여부,정산횟수)
	 */
	public Map<String,Object> getBaseCalcInfo(MM2_17VO_PARAM vo) throws Exception;
	
	/*
	 * 정산 및 정산 취소
	 */
	public boolean calculateConfirm(MM2_17VO_PARAM vo) throws Exception ;
	
	/*
	 * 정산확정
	 */
	public boolean calculateConfirmLock(MM2_17VO_PARAM vo) throws Exception ;
	
	/*
	 * 수입항목별 총액 리스트 조회
	 */
	public List<MM2_17VO_INCOME> selectIncomeList(MM2_17VO_PARAM vo) throws Exception;
	
	/*
	 * 수입 총액 조회
	 */
	public Long getIncomeTotal(MM2_17VO_PARAM vo) throws Exception ;
	
	/*
	 * 지출항목별 총액 리스트 조회
	 */
	public List<MM2_17VO_INCOME> selectExpList(MM2_17VO_PARAM vo) throws Exception ;

	/*
	 * 지출 총액 조회
	 */
	public Long getExpTotal(MM2_17VO_PARAM vo) throws Exception ;

	/*
	 * 결손금액 조회
	 */
	public Map<String,Double> getDepTotalInfo(MM2_17VO_PARAM vo) throws Exception;
	
	/*
	 * 정기예금 총액 조회
	 */
	public Long getDepositTotal(MM2_17VO_PARAM vo) throws Exception ;
	
	/*
	 * 회비 미수금 총액 조회
	 */
	public Long getNotIncome1000Total(MM2_17VO_PARAM vo) throws Exception ;
	
	/*
	 * 기타 미수금 총액 조회
	 */
	public Long getNotIncomeEtcTotal(MM2_17VO_PARAM vo) throws Exception ;
	
	/*
 	 * 이월 잔액 조회
	 */
	public Long getPrevMonthTotal(MM2_17VO_PARAM vo) throws Exception ;

	public List<MM2_17VO> IncomeList(MM2_17VO vo) throws Exception;
	
	public List<MM2_17VO> ExpendList(MM2_17VO vo) throws Exception;
	
	public MM2_17VO DepositSum(MM2_17VO vo) throws Exception;
	
	public List<MM2_17VO> DepositList(MM2_17VO vo) throws Exception;
	
	public MM2_17VO NotGetSum(MM2_17VO vo) throws Exception;
	
	public List<MM2_17VO> NotGetList(MM2_17VO vo) throws Exception;
	
	public MM2_17VO DeficitSum(MM2_17VO vo) throws Exception;
	
	public List<MM2_17VO> DeficitList(MM2_17VO vo) throws Exception;
	
	public MM2_17VO IncomeSum(MM2_17VO vo) throws Exception;
	
	public List<MM2_17VO> IncomeDetailList(MM2_17VO vo) throws Exception;
	
	public MM2_17VO ExpendSum(MM2_17VO vo) throws Exception;
	
	public List<MM2_17VO> ExpendDetailList(MM2_17VO vo) throws Exception;

}
