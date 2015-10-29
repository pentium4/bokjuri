package lionsclubs.com.MM3.MM3_4.MM3_21;

import java.util.List;

import lionsclubs.com.MM3.MM3_4.MM3_21.MM3_21VO;
import lionsclubs.com.cmm.pagging.LionsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository
public class MM3_21DAO extends LionsAbstractDAO{
	private String commonId = "lionsclubs.com.MM3.MM3_4.MM3_21.";
	
	@SuppressWarnings("unchecked")
	public List<MM3_21VO> selectList(MM3_21VO vo) {
		return list(commonId + "selectList", vo);
	}

	public MM3_21VO expensesSum(MM3_21VO vo) throws Exception {
		return (MM3_21VO) selectByPk(commonId + "expensesSum", vo);
	}
	
	/**
	 * 클럽납부금 정산여부 상세
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public MM3_21VO objectPaymentSettle(MM3_21VO vo) throws Exception {
		return (MM3_21VO) selectByPk(commonId + "objectPaymentSettle", vo);
	}
	
	/**
	 * 클럽납부금 정산여부 입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Boolean insertPaymentSettleConfirm(MM3_21VO vo) throws Exception {
		insert(commonId + "insertPaymentSettleConfirm", vo);
		return true;
	}
	
	/**
	 * 클럽납부금 정산여부 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer updatePaymentSettleConfirm(MM3_21VO vo) throws Exception {
		return update(commonId + "updatePaymentSettleConfirm", vo);
	}

	/**
	 * 클럽납부금 정산확정 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer updatePaymentSettleConfirmLock(MM3_21VO vo) throws Exception {
		return update(commonId + "updatePaymentSettleConfirmLock", vo);
	}
	
	/**
	 * 지구하위 모든 클럽 미납금 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Integer deleteDistrictItemPaymentUnPaid(MM3_21VO vo) throws Exception {
		return delete(commonId + "deleteDistrictItemPaymentUnPaid", vo);
	}
	
	/**
	 * 지구하위 모든 클럽 미납금 입력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Boolean insertDistrictItemPaymentUnPaid(MM3_21VO vo) throws Exception {
		insert(commonId + "insertDistrictItemPaymentUnPaid", vo);
		return true;
	}
}
