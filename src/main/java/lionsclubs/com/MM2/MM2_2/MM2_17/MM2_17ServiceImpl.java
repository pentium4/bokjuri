package lionsclubs.com.MM2.MM2_2.MM2_17;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class MM2_17ServiceImpl extends AbstractServiceImpl implements MM2_17Service{
	
	@Autowired private MM2_17DAO dao;

	/*
	 * 클럽직책자 조회(회장,총무,재무)
	 */
	@Override
	public Map<String,String> getBaseMemberInfo(MM2_17VO_PARAM vo) throws Exception{
		return dao.getBaseMemberInfo(vo);
	}

	/*
	 * 정산여부 조회(정산일자,정산여부,정산횟수)
	 */
	@Override
	public Map<String,Object> getBaseCalcInfo(MM2_17VO_PARAM vo) throws Exception{
		return dao.getBaseCalcInfo(vo);
	}

	/*
	 * 정산 및 정산 취소
	 */
	@Override
	public boolean calculateConfirm(MM2_17VO_PARAM vo) throws Exception {
		return dao.calculateConfirm(vo);
	}

	/*
	 * 정산 확정
	 */
	@Override
	public boolean calculateConfirmLock(MM2_17VO_PARAM vo) throws Exception {
		return dao.calculateConfirmLock(vo);
	}
	
	/*
	 * 수입항목별 총액 리스트 조회
	 */
	@Override
	public List<MM2_17VO_INCOME> selectIncomeList(MM2_17VO_PARAM vo) throws Exception {
		return dao.selectIncomeList(vo);
	}
	
	/*
	 * 수입 총액 조회
	 */
	@Override
	public Long getIncomeTotal(MM2_17VO_PARAM vo) throws Exception {
		return dao.getIncomeTotal(vo);
	}
	
	/*
	 * 지출항목별 총액 리스트 조회
	 */
	@Override
	public List<MM2_17VO_INCOME> selectExpList(MM2_17VO_PARAM vo) throws Exception {
		return dao.selectExpList(vo);
	}

	/*
	 * 지출 총액 조회
	 */
	@Override
	public Long getExpTotal(MM2_17VO_PARAM vo) throws Exception {
		return dao.getExpTotal(vo);
	}
	
	/*
	 * 결손금액 조회
	 */
	@Override

	public Map<String,Double> getDepTotalInfo(MM2_17VO_PARAM vo) throws Exception {
		return dao.getDepTotalInfo(vo);
	}

	/*
	 * 정기예금 총액 조회
	 */
	@Override
	public Long getDepositTotal(MM2_17VO_PARAM vo) throws Exception {
		return dao.getDepositTotal(vo);
	}

	/*
	 * 회비 미수금 총액 조회
	 */
	@Override
	public Long getNotIncome1000Total(MM2_17VO_PARAM vo) throws Exception {
		return dao.getNotIncome1000Total(vo);
	}
	
	/*
	 * 기타 미수금 총액 조회
	 */
	@Override
	public Long getNotIncomeEtcTotal(MM2_17VO_PARAM vo) throws Exception {
		return dao.getNotIncomeEtcTotal(vo);
	}

	/*
 	 * 이월 잔액 조회
	 */
	@Override
	public Long getPrevMonthTotal(MM2_17VO_PARAM vo) throws Exception {
		return dao.getPrevMonthTotal(vo);
	}

	@Override
	public List<MM2_17VO> IncomeList(MM2_17VO vo) throws Exception {
		return dao.IncomeList(vo);
	}

	@Override
	public List<MM2_17VO> ExpendList(MM2_17VO vo) throws Exception {
		return dao.ExpendList(vo);
	}	

	@Override
	public MM2_17VO DepositSum(MM2_17VO vo) throws Exception {
		return dao.DepositSum(vo);
	}
	
	@Override
	public List<MM2_17VO> DepositList(MM2_17VO vo) throws Exception {
		return dao.DepositList(vo);
	}	

	@Override
	public MM2_17VO NotGetSum(MM2_17VO vo) throws Exception {
		return dao.NotGetSum(vo);
	}
	
	@Override
	public List<MM2_17VO> NotGetList(MM2_17VO vo) throws Exception {
		return dao.NotGetList(vo);
	}	

	@Override
	public MM2_17VO DeficitSum(MM2_17VO vo) throws Exception {
		return dao.DeficitSum(vo);
	}
	
	@Override
	public List<MM2_17VO> DeficitList(MM2_17VO vo) throws Exception {
		return dao.DeficitList(vo);
	}	

	@Override
	public MM2_17VO IncomeSum(MM2_17VO vo) throws Exception {
		return dao.IncomeSum(vo);
	}
	
	@Override
	public List<MM2_17VO> IncomeDetailList(MM2_17VO vo) throws Exception {
		return dao.IncomeDetailList(vo);
	}	

	@Override
	public MM2_17VO ExpendSum(MM2_17VO vo) throws Exception {
		return dao.ExpendSum(vo);
	}
	
	@Override
	public List<MM2_17VO> ExpendDetailList(MM2_17VO vo) throws Exception {
		return dao.ExpendDetailList(vo);
	}
}